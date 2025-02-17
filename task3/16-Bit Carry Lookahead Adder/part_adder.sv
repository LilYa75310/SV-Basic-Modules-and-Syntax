module part_adder (
  input logic a,
  input logic b,
  input logic cin,
  output logic s,
  output logic p,
  output logic g);

  assign p = a ^ b;
  assign g = a & b;
  assign s = p ^ cin;
endmodule