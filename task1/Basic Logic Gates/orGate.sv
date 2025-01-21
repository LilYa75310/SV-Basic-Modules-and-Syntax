module orGate(input logic in1, in2, 
              output logic out);
  assign out = in1 | in2;
endmodule