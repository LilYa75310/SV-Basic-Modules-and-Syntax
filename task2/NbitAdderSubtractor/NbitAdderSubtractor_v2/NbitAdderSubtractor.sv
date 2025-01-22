module NbitAdderSubtractor2
  #(parameter NBIT = 10)
  (input logic [NBIT-1:0]firstByte_i, secondByte_i,
   input logic sub_i,
   output logic [NBIT-1:0] result_o); // without proccessing overflow of a two-bit number
  
  logic carryBit;
  logic [NBIT-1:0] secondByte_complement;
  
  assign carryBit = sub_i;
  
  always_comb
  //  secondByte_complement = '0; Should be this line OR line 24
    if(sub_i)
      begin
        // I assume here will be latch insertion and its really big problem. 
        // Because we do not have default expression for secondByte_complement. 
        // In ELSE branch we do not have secondByte_complement assigment and Synth tool insert a storage element - latch
        // because from description point of view it looks like stay in the same value for all situation exept of sub_i = 1 --> latch
       secondByte_complement = ~secondByte_i + carryBit;
       result_o = firstByte_i + secondByte_complement;
      end
    else
    //  secondByte_complement = '0;
      result_o = firstByte_i + secondByte_i;
endmodule