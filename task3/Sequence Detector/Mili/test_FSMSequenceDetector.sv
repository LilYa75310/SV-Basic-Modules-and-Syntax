module test_FSMSequenceDetector;
  
  bit clk, reset, inData;
  logic DetectSequence;
  
  FSMSequenceDetector DUT(.clk_c   (clk)           ,
                          .reset_r (reset)         , 
                          .in_i    (inData)        ,
                          .q_o     (DetectSequence)
                         );

  initial 
    forever
      #5 clk = !clk;
  
  initial
    begin
      //reset
      reset <= 0;
      #100;
      @(posedge clk);
      reset <= 1;
      @(posedge clk);
      reset <= 0;
      @(posedge clk);
      //1011
      inData <= 1;
      @(posedge clk);
      $display("%b", DetectSequence);
      inData = 0;
      @(posedge clk);
      $display("%b", DetectSequence);
      inData = 1;
      @(posedge clk);
      $display("%b", DetectSequence);
      inData = 1;
      @(posedge clk);
      $display("%b", DetectSequence);
      @(posedge clk);
      $display("%b", DetectSequence);
    end
endmodule