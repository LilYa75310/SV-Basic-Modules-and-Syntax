module test_mux;
  bit input1, input2, input3, input4;
  bit [1:0] select;
  logic output1;
  
  mux4_1 MUX1 (
    .a (input1),
    .b (input2),
    .c (input3),
    .d (input4),
    .sel (select),
    .y (output1)
  );
  initial
    begin
      input1 = 1;
      input2 = 0;
      input3 = 0;
      input4 = 0;
      select = 2'b00;
      #99;
      $display(output1);
      input1 = 0;
      input2 = 1;
      input3 = 0;
      input4 = 0;
      select = 2'b01;
      #99;
      $display(output1);
      input1 = 0;
      input2 = 0;
      input3 = 1;
      input4 = 0;
      select = 2'b10;
      #99;
      $display(output1);
      input1 = 0;
      input2 = 0;
      input3 = 0;
      input4 = 1;
      select = 2'b11;
      #99;
      $display(output1);
    end
endmodule