module test_orGate;
  bit input1, input2;
  logic output1;
  
  orGate ORgate1 (
    .in1 (input1),
    .in2 (input2),
    .out (output1)
  );
  initial
    begin
      input1 = 0;
      input2 = 0;
      #99;
      $display(output1);
      input1 = 1;
      input2 = 0;
      #99;
      $display(output1);
      input1 = 0;
      input2 = 1;
      #99;
      $display(output1);
      input1 = 1;
      input2 = 1;
      #99;
      $display(output1);
      end
endmodule