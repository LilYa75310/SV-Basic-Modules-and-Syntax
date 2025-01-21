module test_nBitReg;
  
  bit reset,en, clk;
  bit [3:0] input1;
  logic [3:0] output1;
  
  nBitReg DUT(clk, reset, en, input1, output1);
  /*
  always
 	begin
      clk = 1; #5; clk = 0; #5;
 	end
  */
  initial 
    forever
      #5 clk = !clk;
  /*
  initial
    begin
      
      reset = 0;
      $display("%b", output1);
      #99;
      @(posedge clk);
      reset = 1;
      @(posedge clk);
      $display("%b", output1);
      reset = 0;
      @(posedge clk);
      input1 = 4'b0001;
	  en = 1;
      $display("%b", output1);
      @(posedge clk);
      input1 = 4'b1111;
	  en = 1;
      $display("%b", output1);
      @(posedge clk);
      input1 = 4'b1000;
	  en = 1;
      $display("%b", output1);
      @(posedge clk);
	  input1 = 4'b0001;
	  en = 0;
      $display("%b", output1);
      @(posedge clk);
      input1 = 4'b1111;
	  en = 1;
      $display("%b", output1);
      @(posedge clk);
      input1 = 4'b1111;
	  reset = 1;
      $display("%b", output1);
      @(posedge clk);
      end
endmodule
*/
  initial
    begin
      
      reset <= 0;
      #100;
      @(posedge clk);
      $display("%b", output1);
      reset <= 1;
      @(posedge clk);
      $display("%b", output1);
      reset <= 0;
      input1 <= 4'b0001;
	  en <= 1;
      @(posedge clk);
      $display("%b", output1);
      input1 <= 4'b1111;
	  en <= 1;
      @(posedge clk);
      $display("%b", output1);
      input1 <= 4'b1000;
	  en <= 1;
      @(posedge clk);
      $display("%b", output1);
	  input1 <= 4'b0001;
	  en <= 0;
      @(posedge clk);
      $display("%b", output1);
      input1 <= 4'b1111;
	  en <= 1;
      @(posedge clk);
      $display("%b", output1);
      input1 <= 4'b1111;
	  reset <= 1;
      @(posedge clk);
      $display("%b", output1);
      end
endmodule