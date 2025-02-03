module MASTER_SPI_FSM_Control (input logic clk_c, 
                        input logic reset_r,
                        input logic startTx,
                        input logic transmittedAllBitsFlag,
                        output logic peripheralEN,
                        output logic writeInputDataFlag,
                        output logic dataSentFlag
                       );
  
  typedef enum logic [2:0] {preparingData, transmitData, complete} stateType;
  
  stateType state, nextState;
  
  //next state logic
  always_comb
   begin
     case (state)
         preparingData: if (startTx) 
           			  begin
         			    nextState = transmitData;
       			      end
         			else
                      begin
                        nextState = preparingData;
                      end
         transmitData: if (transmittedAllBitsFlag) 
           			  begin
         			    nextState = complete;
       			      end
         			else
                      begin
                        nextState = transmitData;
                      end
         complete:	nextState = preparingData;

         default: 		nextState = preparingData;
     endcase
   end  
  //current state register
  always_ff @(posedge clk_c, posedge reset_r) 
   begin
  	if(reset_r) begin
    	state <= preparingData;
  	end
  	else begin
   		state <= nextState;
  	end
   end
  //output logic
  assign peripheralEN = (state == transmitData);
  assign dataSentFlag = (state == complete);
  assign writeInputDataFlag = (state == preparingData);
  
endmodule