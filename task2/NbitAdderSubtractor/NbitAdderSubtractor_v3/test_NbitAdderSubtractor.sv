module test_NbitAdderSubtractor;
  
  bit [7:0] input1, input2;
  logic [7:0] output1;
  
  NbitAdderSubtractor3 #(8) eightBitAdderSub(input1, input2, output1);
  
  initial
    begin
      input1 = 8'b0;
      input2 = 8'b0;
      #99;
      $display(output1);
      input1 = 8'b0;
      input2 = 8'b1;
      #99;
      $display(output1);
      input1 = 8'b0;
      input2 = 8'b1111_1111;
      #99;
      $display(output1);
      input1 = 8'b0100_0010;
      input2 = 8'b1100_0000;
      #99;
      $display(output1);
      input1 = 8'b1111_1111;
      input2 = 8'b1111_1111;
      #99;
      
      input1 = 8'd145;
      input2 = 8'd100;
      #99;
      $display(output1);
      input1 = 8'b0011_0010; //50
      input2 = 8'b1001_1100; //-100
      #99;
      $display("%b", output1);
 
      end
endmodule