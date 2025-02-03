module test_SPI;
  
  bit clk, reset, start, cs;
  bit [7:0] inputData;
  logic completeTransmit, completeReceive, sck, mosi, miso;
  logic [7:0] dataFromSlave, dataFromMaster;
  
  SPI_MASTER #(8) DUT 
  				  (.clk_c (clk),
                   .reset_r (reset),
                   .start_i (start),
                   .miso_i (miso),
                   .inputData_i (inputData),
                   .mosi_o (mosi),
                   .transferCompleted_o (completeTransmit),
                   .fullDataFromSlave_o (dataFromSlave),
                   .sck                 (sck)
                  );
  SPI_SLAVE #(8) DUT2
  				  (.slk_c (sck),
                   .reset_r (reset),
                   .mosi_i (mosi),
                   .cs (cs),
                   .miso_o (miso),
                   .receiveCompleted_o (completeReceive), 
                   .fullDataFromMaster_o (dataFromMaster)
                  );

  initial 
    forever
      #5 clk = !clk;
  
  initial
    begin
      //reset
      reset <= 0;
      #100;
      @(posedge clk);
      reset <= 1;
      @(posedge clk);
      reset <= 0;
      cs <= 0;
      @(posedge clk);
      //start
      start <= 1;
      inputData =8'hEF;
      @(posedge clk);
      $display("%h", mosi);
      @(posedge clk);
      $display("%h", mosi);
      @(posedge clk);
      $display("%h", mosi);
      @(posedge clk);
      $display("%h", mosi);
      @(posedge clk);
      $display("%h", mosi);
      @(posedge clk);
      $display("%h", mosi);
      @(posedge clk);
      $display("%h", mosi);
      @(posedge clk);
      $display("%h", mosi);
      @(posedge clk);
      $display("%h", mosi);
      @(posedge clk);
      $display("%h", mosi);
      @(posedge clk);
      $display("%h", mosi);
      @(posedge clk);
      $display("%h", mosi);
            $display("%h", mosi);
      @(posedge clk);
      $display("%h", mosi);
      @(posedge clk);
      $display("%h", mosi);
      @(posedge clk);
      $display("%h", mosi);
      @(posedge clk);
      $display("%h", mosi);
      @(posedge clk);
      $display("%h", mosi);
      @(posedge clk);
      $display("%h", mosi);
      @(posedge clk);
      $display("%h", mosi);
      @(posedge clk);
      $display("%h", mosi);
      @(posedge clk);
      $display("%h", mosi);
      @(posedge clk);
      $display("%h", mosi);
      @(posedge clk);
      $display("%h", mosi);
            $display("%h", mosi);
      @(posedge clk);
      $display("%h", mosi);
      @(posedge clk);
      $display("%h", mosi);
      @(posedge clk);
      $display("%h", mosi);
      @(posedge clk);
      $display("%h", mosi);
      @(posedge clk);
      $display("%h", mosi);
      @(posedge clk);
      $display("%h", mosi);
      @(posedge clk);
      $display("%h", mosi);
      @(posedge clk);
      $display("%h", mosi);
      @(posedge clk);
      $display("%h", mosi);
      @(posedge clk);
      $display("%h", mosi);
      @(posedge clk);
      $display("%h", mosi);
    end
endmodule