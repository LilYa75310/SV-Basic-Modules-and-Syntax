module test_nBitCounter;
  
  bit reset,en, clk;
  logic [2:0] output1;
  
  nBitCounter DUT(clk, reset, en, output1);
  /*
  always
 	begin
      clk = 1; #5; clk = 0; #5;
 	end
  */
  initial 
    forever
      #5 clk = !clk;
  
  initial
    begin
      
      reset <= 0;
      en <= 1;
      #100;
      @(posedge clk);
      $display("%b", output1);
      reset <= 1;
      @(posedge clk);
      $display("%b", output1);
      reset <= 0;
      @(posedge clk);
      $display("%b", output1);
            @(posedge clk);
      $display("%b", output1);
            @(posedge clk);
      $display("%b", output1);
            @(posedge clk);
      $display("%b", output1);
            @(posedge clk);
      $display("%b", output1);
            @(posedge clk);
      $display("%b", output1);
            @(posedge clk);
      $display("%b", output1);
            @(posedge clk);
      $display("%b", output1);
            @(posedge clk);
      $display("%b", output1);
            @(posedge clk);
      $display("%b", output1);
            @(posedge clk);
      $display("%b", output1);
            @(posedge clk);
      $display("%b", output1);
      end
endmodule