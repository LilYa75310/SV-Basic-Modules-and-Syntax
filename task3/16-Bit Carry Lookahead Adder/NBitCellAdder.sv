module NBitCellAdder #(parameter NBIT = 4)
                  (input logic [NBIT-1:0] a ,b,
                   input logic cin,
                   output logic [NBIT-1:0] s,
                   output logic cout);
  genvar i;
  logic [NBIT-1:0] carryBit, propagation, generation, propagationSignal, generationSignal;

  generate
    for(i = 0; i<NBIT; i++) begin: genPropagationAndGeneration_massive
      assign propagation[i] = a[i] |  b[i];
      assign generation[i] = a[i] &  b[i];
    end
  endgenerate

  //genGeneration_signals

  assign generationSignal[0] = generation[0];
  generate
    for(i = 1; i<NBIT; i++) begin: genGenerationSignals
      assign generationSignal[i] = generation[i] | propagation[i] & generationSignal[i-1];
    end
  endgenerate

  //genPropagation_signals

  assign propagationSignal[0] = propagation[0];
  generate
    for(i = 1; i<NBIT; i++) begin: genPropagationSignals
      assign propagationSignal[i] = propagation[i] & propagationSignal[i-1];
    end
  endgenerate
  
  
  //test logic for 4-bit adder
  /*
  assign generationSignal[NBIT-1] = generation[3] | propagation[3] & (generation[2] | propagation[2] & (generation[1] | propagation[1] & generation[0]));
  assign propagationSignal[NBIT-1] = propagation[0] & propagation[1] & propagation[2] & propagation[3];
  */
  
  //cout    
  assign cout = generationSignal[NBIT-1] | propagationSignal[NBIT-1] & cin;
      
  generate
    for(i = 0; i<NBIT; i++) begin: genOneBitAdders
    if(i == 0) begin
      oneBitAdder f(a[i], b[i], cin, s[i], carryBit[i]);
    end
    else begin
      oneBitAdder f(a[i], b[i], carryBit[i-1], s[i], carryBit[i]);
    end
  end 
  endgenerate
 // assign cout = carryBit[NBIT-1];
  
endmodule