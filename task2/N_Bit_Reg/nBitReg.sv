module nBitReg #(parameter N=4)
  (input logic clk_i, reset_i, en_i,
   input logic [N-1:0]d_i,
   output logic [N-1:0]q_o);
  
  always_ff @(posedge clk_i)
    begin
      if(reset_i) q_o <= 0; // Here we also could write '0 -> its 100% fills all bits with 0; if(reset_i) q_o <= '0;
      // Same issue as in Counter
      else if(en_i) q_o <= d_i;
    end
  
endmodule
