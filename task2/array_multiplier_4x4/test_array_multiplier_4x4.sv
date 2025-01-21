module test_NbitAdderSubtractor;
  
  bit [4:0] input1, input2;
  logic [7:0] output1;
  
  array_multiplier_4x4 DUT(input1, input2, output1);
  
  initial
    begin
      input1 = 4'b0;
      input2 = 4'b0;
      #99;
      $display("%b", output1);
      input1 = 4'b1111;
      input2 = 4'b1111;
      #99;
      $display("%b", output1);
      input1 = 4'b1110;
      input2 = 4'b0011;
      #99;
      $display("%b", output1);
 
      end
endmodule