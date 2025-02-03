module SPI_MASTER #(parameter N = 8)
  				  (input logic 		  clk_c,
   				   input logic 		  reset_r,
   				   input logic 		  start_i,
                   input logic        miso_i,
                   input logic [N-1:0] inputData_i,
   				   output logic 		  mosi_o,
                   output logic 		  transferCompleted_o, /*when dataSentFlag = 1*/
                   output logic [N-1:0] fullDataFromSlave_o,
                   output logic         sck
                  );

  logic peripheralEN, writeInputDataFlag, dataSentFlag,lastNumber_o;
  logic [N-1:0] transientSlaveData; //to fullDataFromSlave_o when dataSentFlag = 1//
     
     MASTER_SPI_FSM_Control controlSpiInterface (
       .clk_c   (clk_c    ),
       .reset_r (reset_r),
       .startTx (start_i),
       .transmittedAllBitsFlag (lastNumber_o),
       .peripheralEN (peripheralEN),
       .writeInputDataFlag (writeInputDataFlag),
       .dataSentFlag (dataSentFlag)
     );
     
     MasterShiftreg #(8) dataBuffer (
       .clk_c (clk_c),
       .reset_r (reset_r),
       .enable_i (peripheralEN),
       .load_i (writeInputDataFlag),
       .sin_i (miso_i),
       .data_i (inputData_i),
       .q_o (transientSlaveData),
       .sout_o (mosi_o)
     );
     
  MasterBitCounter #(3) dataControl (
       .clk_c (clk_c),
       .reset_r (reset_r),
       .enable_i (peripheralEN),
       .lastNumber_o (lastNumber_o)
     );
     
  assign transferCompleted_o = (dataSentFlag==1);
  assign fullDataFromSlave_o =  (dataSentFlag==1) ? transientSlaveData : 0;
  assign sck = (peripheralEN==1) ? clk_c : 1;   
endmodule