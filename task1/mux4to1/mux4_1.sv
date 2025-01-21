module mux4_1(input logic a, b, c, d,
              input logic [1:0] sel,
              output logic y);
  assign y = sel[1] ? (sel[0] ? d : c) 
    				: ((sel[0] ? b : a));
endmodule