module test_NBitCarryLookaheadAdder;
  
  bit [15:0] input1, input2;
  bit cinput;
  logic coutput;
  logic [15:0] sum;
  
  NBitCarryLookaheadAdder #(.NBIT(16), .NBITTOCELL(4)) DUT (.a (input1),
                                                            .b (input2),
                                                            .cin (cinput),
                                                            .s (sum),
                                                            .cout (coutput)
  );
  initial
    begin
      input1 = 16'hFFFF;
      input2 = 16'hFFFF;
      cinput = 1'b1;
      #99;
      $display("%h", sum);
      $display("%b", coutput);
      input1 = 16'h1;
      input2 = 16'h1;
      cinput = 1'b1;
      #99;
      $display("%h", sum);
      $display("%b", coutput);
      
      end
endmodule