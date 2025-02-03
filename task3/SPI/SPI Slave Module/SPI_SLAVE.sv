module SPI_SLAVE #(parameter N = 8)
  				  (input logic 		  slk_c,
   				   input logic 		  reset_r,
                   input logic        mosi_i,
                   input logic        cs,
   				   output logic 		  miso_o,
                   output logic 		  receiveCompleted_o, 
                   output logic [N-1:0] fullDataFromMaster_o
                  );

  logic lastNumber_o;
  logic [N-1:0] transientMasterData; //to fullDataFromSlave_o when dataSentFlag = 1//
     
     SlaveShiftreg #(8) dataBuffer (
       .clk_c (slk_c),
       .reset_r (reset_r),
       .enable_i (cs),
       .load_i ('0),
       .sin_i (mosi_i),
       .data_i ('0),
       .q_o (transientMasterData),
       .sout_o (miso_o)
     );
     
  SlaveBitCounter #(4) dataControl (
    .clk_c (slk_c),
       .reset_r (reset_r),
    .enable_i (cs),
       .lastNumber_o (lastNumber_o)
     );
  assign receiveCompleted_o = (lastNumber_o=='1);
  assign fullDataFromMaster_o =  (lastNumber_o=='1) ? transientMasterData : 0;
endmodule