module NbitAdderSubtractor3
  #(parameter NBIT = 10)
  (input logic [NBIT-1:0]firstByte_i, secondByte_i,
   output logic [NBIT-1:0] result_o); // without proccessing overflow of a two-bit number
  
  logic [NBIT-1:0] firstByte_complement, secondByte_complement, result_complement;
  
  // Same story as for NbitAdderSubtractor2 with begin end
  // From latch point of view I think everything should be ok
  always_comb
    begin
    if(firstByte_i[NBIT-1]==1)
      firstByte_complement = ~firstByte_i + 1;
  	else
      firstByte_complement = firstByte_i;
  	if(secondByte_i[NBIT-1]==1)
      secondByte_complement = ~secondByte_i + 1;
  	else
      secondByte_complement = secondByte_i;
    end
  
 /* always_comb
    begin
    result_complement = firstByte_complement + secondByte_complement;
      if(result_complement[NBIT-1]==1)
        result_o = ~result_complement + 1;
      else
        result_o = result_complement;
        end
 */
  assign result_complement = firstByte_complement + secondByte_complement;
  assign result_o = result_complement;
    
endmodule
// In general looks cool