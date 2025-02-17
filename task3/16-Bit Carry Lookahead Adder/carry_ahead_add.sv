module carry_ahead_add #(
  parameter N_BIT = 4
)(
  input logic [N_BIT-1:0] a,
  input logic [N_BIT-1:0] b,
  input logic             cin,
  output logic [N_BIT-1:0] s,
  output logic             cout);
  
  genvar i;
  logic [N_BIT-1:0] p, g, c;
  
// gen lookahead logic
  
  assign c[0] = cin;
  generate
    for(i = 1; i<(N_BIT); i++) begin: gen_c_logic
      assign c[i] = g[i-1] || (p[i-1] && c[i-1]);
    end
  endgenerate
  
// gen part adder and connect with lookahead logic
      
  generate
    for(i = 0; i<(N_BIT); i++) begin: gen_cell_digit
      if(i == 0) begin
        part_adder p_add 
        (
          .a     (a[i]),
          .b     (b[i]),
          .cin   (c[i]),
          .s     (s[i]),
          .p     (p[i]),
          .g     (g[i])
        );
      end else begin
        part_adder p_add 
        (
          .a     (a[i]),
          .b     (b[i]),
          .cin   (c[i]),
          .s     (s[i]),
          .p     (p[i]),
          .g     (g[i])
        );
      end
    end
  endgenerate
  
      assign cout = c[N_BIT-1];
endmodule