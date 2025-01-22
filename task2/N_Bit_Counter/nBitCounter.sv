module nBitCounter #(parameter N = 3)
  				(input logic clk_i, reset_i, en_i,
  				 output logic [N-1:0] q_o);
  
  always_ff @(posedge clk_i, posedge reset_i)
    begin
      if(reset_i) q_o <= 0;
      // Here should be regular ELSE without IF
      // we should separate asynch and synch part of Sequential logic
      else if (en_i) q_o <= q_o + 1;
    end
  
endmodule
// Looks realy good