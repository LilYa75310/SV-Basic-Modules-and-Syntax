module array_multiplier_4x4 (
  input [3:0] a_i, // 4-bit input A
  input [3:0] b_i, // 4-bit input B
  output [7:0] product_o // 8-bit output Product
);
  genvar i, j;
  logic [3:0][3:0] pp;
  logic [3:0][7:0]eachProdOfBit;
  
  generate
    for(i=0; i<4;i++) begin: forGenPartProd_pp
      for(j=0; j<4;j++) begin: forGenPartProd_pp
        assign pp[i][j] = a_i[i] & b_i[j];
      end
    end
  endgenerate
  
  generate
    for(i=0; i<4;i++) begin: forGendigitForSum
      assign eachProdOfBit[i][7:0] = pp[i][3:0] << i;  
    end
  endgenerate
  
  assign product_o = eachProdOfBit[0][7:0] + eachProdOfBit[1][7:0] + eachProdOfBit[2][7:0]+ eachProdOfBit[3][7:0];

endmodule