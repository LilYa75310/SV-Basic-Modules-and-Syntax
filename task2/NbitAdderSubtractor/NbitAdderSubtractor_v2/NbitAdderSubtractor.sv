module NbitAdderSubtractor2
  #(parameter NBIT = 10)
  (input logic [NBIT-1:0]firstByte_i, secondByte_i,
   input logic sub_i,
   output logic [NBIT-1:0] result_o); // without proccessing overflow of a two-bit number
  
  logic carryBit;
  logic [NBIT-1:0] secondByte_complement;
  
  assign carryBit = sub_i;
  
  always_comb
    if(sub_i)
      begin
       secondByte_complement = ~secondByte_i + carryBit;
       result_o = firstByte_i + secondByte_complement;
      end
    else
      result_o = firstByte_i + secondByte_i;
endmodule