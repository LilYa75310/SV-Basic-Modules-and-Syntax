module fourBitAdder(input logic [3:0] a ,b,
                    input logic cin,
                    output logic [3:0] s,
                    output logic cout);

  logic cout1, cout2, cout3,;
  oneBitAdder Adder1(a[0], b[0], cin, s[0], cout1);
  oneBitAdder Adder2(a[1], b[1], cout1, s[1], cout2);
  oneBitAdder Adder3(a[2], b[2], cout2, s[2], cout3);
  oneBitAdder Adder4(a[3], b[3], cout3, s[3], cout);
endmodule
