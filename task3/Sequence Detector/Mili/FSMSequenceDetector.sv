module FSMSequenceDetector (input logic clk_c, reset_r, in_i,
  							output logic q_o);
  
  typedef enum logic [3:0] {detFirstDigit1, 
                            detSecondDigit0, 
                            detThirdDigit1, 
                            detFourthDigit1
                           } stateType;
  
  stateType state, nextState;
  logic qResult;
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
                        
         default: 		nextState = detFirstDigit1;
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
  assign qResult = (in_i & state == detFourthDigit1);
  //Additional register to have the same steps as Moore's FSM.
  always_ff @(posedge clk_c, posedge reset_r) 
   begin
  	if(reset_r) begin
    	q_o <= '0;
  	end
  	else begin
   		q_o <= qResult;
  	end
   end
  
endmodule