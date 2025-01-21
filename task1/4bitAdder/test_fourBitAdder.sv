module test_fourBitAdder;
  
  bit [3:0] input1, input2;
  bit cinput;
  logic coutput;
  logic [3:0] sum;
  
  fourBitAdder fourBitAdder1 (
    .a (input1),
    .b (input2),
    .cin (cinput),
    .s (sum),
    .cout (coutput)
  );
  initial
    begin
      input1 = 4'b0;
      input2 = 4'b0;
      cinput = 1'b1;
      #99;
      $display(sum);
      $display(coutput);
      input1 = 4'b1111;
      input2 = 4'b1;
      cinput = 1'b0;
      #99;
      $display(sum);
      $display(coutput);
      
      end
endmodule