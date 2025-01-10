module test_mux;
  bit input1, input2, select;
  logic output1;
  
  mux2_1 MUX1 (
    .a (input1),
    .b (input2),
    .sel (select),
    .y (output1)
  );
  initial
    begin
      input1 = 0;
      input2 = 1;
      select = 0;
      #99;
      $display(output1);
      input1 = 0;
      input2 = 1;
      select = 1;
      #99;
      $display(output1);
      input1 = 1;
      input2 = 0;
      select = 0;
      #99;
      $display(output1);
      input1 = 1;
      input2 = 0;
      select = 1;
      #99;
      $display(output1);
    end
endmodule