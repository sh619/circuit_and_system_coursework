module LFSR_10 (data_out,clk,enable);

  output [9:0] data_out;
  input clk,enable;
  reg [9:0] sreg;
  initial sreg=10'b1;
  always @(posedge clk)
         if(enable==1)
			sreg <= {sreg[8:0], sreg[2]^sreg[9]};
	assign data_out= sreg;
endmodule
	