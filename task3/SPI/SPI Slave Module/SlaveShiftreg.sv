module SlaveShiftreg #(parameter N = 8)
  				 (input logic 		  clk_c,
   				  input logic 		  reset_r,
                  input logic 		  enable_i,
   				  input logic 		  load_i,
   				  input logic 		  sin_i,
                  input logic [N-1:0] data_i,
                  output logic [N-1:0] q_o,
   				  output logic 		  sout_o
                 );
  always_ff @(posedge clk_c, posedge reset_r)
    begin
      if(reset_r) begin
        q_o <= 0;
      end
      else begin
        if(load_i) begin
          q_o <= data_i;
        end
        if(!enable_i) begin
          q_o <= {q_o[N-2:0], sin_i};
        end
      end
    end
  
  assign sout_o = q_o[N-1];
  
endmodule