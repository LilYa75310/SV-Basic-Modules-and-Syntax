module NbitAdderSubtractor #(parameter NBIT = 10)
  							(input logic [NBIT-1:0]firstByte_i, secondByte_i,
   							 input logic sub_i,
   							 output logic [NBIT:0] result_o); // to proccess overflow of a two-bit number

  // Just minor comment regarding begin else for ALWAYS block
  //Better always write 'begin end' for such a BLOCK --> less chance to receive unconsistent behavior
  // Personally, I write 'begin end' for each IF but its my own coding style I does not push to make like me
  always_comb 
    if(sub_i)      //or if(sub==1)
      result_o = firstByte_i - secondByte_i;
    else
      result_o = firstByte_i + secondByte_i;
endmodule