module NBitCarryLookaheadAdder #(parameter NBIT = 16, NBITTOCELL = 4)
                               (input logic [NBIT-1:0] a ,b,
                                input logic cin,
                                output logic [NBIT-1:0] s,
                                output logic cout);
  
  //localparam NUMOFCELL = NBIT/NBITOFCELL;
  genvar i;
  logic [NBIT/NBITTOCELL-1:0] carryBit;
  generate
    for(i = 0; i<(NBIT/NBITTOCELL); i++) begin: genNCellBitAdders
    if(i == 0) begin
      NBitCellAdder #(NBITTOCELL) f(a[NBITTOCELL-1:0], b[NBITTOCELL-1:0], cin, s[NBITTOCELL-1:0], carryBit[i]);
    end
    else begin
      NBitCellAdder #(NBITTOCELL) f(a[NBITTOCELL*(i+1)-1:NBITTOCELL*i], b[NBITTOCELL*(i+1)-1:NBITTOCELL*i], carryBit[i-1], s[NBITTOCELL*(i+1)-1:NBITTOCELL*i], carryBit[i]);
    end
  end 
  endgenerate
  
  assign cout = carryBit[NBIT/NBITTOCELL-1];
endmodule