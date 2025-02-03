module MasterBitCounter #(parameter N = 3)
  				   (input logic clk_c,
                    input logic reset_r, 
                    input logic enable_i, 
                 	output logic lastNumber_o
                   );
  
  logic [N-1:0]d, q;
  
  always_ff @(posedge clk_c, posedge reset_r)
    begin
      if(reset_r) begin
        q <= 0;
      end
      else begin
        if (enable_i) begin
          q <= d;
        end
        else begin
          q <= 0;
        end
      end
    end
  always_comb
    begin
      d = q + 1;
      if(q == '1) begin
        lastNumber_o = '1;
      end
      else begin
        lastNumber_o = '0;
      end
    end
  
endmodule