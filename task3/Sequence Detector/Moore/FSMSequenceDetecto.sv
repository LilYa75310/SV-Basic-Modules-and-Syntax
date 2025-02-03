module FSMSequenceDetector (input logic clk_c, reset_r, in_i,
  							output logic q_o);
  
  typedef enum logic [3:0] {detFirstDigit1, detSecondDigit0, detThirdDigit1, detFourthDigit1, SequenceDetect} stateType;
  
  stateType state, nextState;
  
  //next state logic
  always_comb
   begin
     case (state)
         detFirstDigit1: if (in_i) 
           			  begin
         			    nextState = detSecondDigit0;
       			      end
         			else
                      begin
                        nextState = detFirstDigit1;
                      end
         detSecondDigit0: if (in_i) 
           			  begin
         			    nextState = detSecondDigit0;
       			      end
         			else
                      begin
                        nextState = detThirdDigit1;
                      end
         detThirdDigit1: if (in_i) 
           			  begin
         			    nextState = detFourthDigit1;
       			      end
         			else
                      begin
                        nextState = detFirstDigit1;
                      end
         detFourthDigit1: if (in_i) 
           			  begin
         			    nextState = SequenceDetect;
       			      end
         			else
                      begin
                        nextState = detFirstDigit1;
                      end
         SequenceDetect: nextState = detFirstDigit1;
         
         default: 		 nextState = detFirstDigit1;
     endcase
   end  
  //current state register
  always_ff @(posedge clk_c, posedge reset_r) 
   begin
  	if(reset_r) begin
    	state <= detFirstDigit1;
  	end
  	else begin
   		state <= nextState;
  	end
   end
  //output logic
       assign q_o = (state == SequenceDetect);
endmodule