//------------------------------
// Module name: allpass processor
// Function: Simply to pass input to output
// Creator:  Peter Cheung
// Version:  1.1
// Date:     24 Jan 2014
//------------------------------

module processor2 (sysclk, data_in, data_out, data_valid,SW);
	input [9:0]    SW;
	input				sysclk;		// system clock
	input [9:0]		data_in;		// 10-bit input data
	input 			data_valid;	// asserted when sample data is ready for processing
	output [9:0] 	data_out;	// 10-bit output data

	wire           enable;
	wire				sysclk;
	wire [9:0]		data_in;
	reg [9:0] 		data_out;
	wire [9:0]		x,y;
	wire  [9:0]    ram_out;
	wire  [12:0]   rdaddr;
	parameter 		ADC_OFFSET = 10'd512;
	parameter 		DAC_OFFSET = 10'd512;
	parameter      first=1'b0;
	parameter      next=1'b1;
	assign x = data_in[9:0] - ADC_OFFSET;	// x is input in 2's complement
	pulse_gen  PULSE (enable, data_valid, sysclk);
   address_gen gen(rdaddr, data_valid);
	RAM_2(sysclk,y[9:1],rdaddr[12:0],enable,rdaddr+{SW[9:0],1'b0,1'b0,1'b0},enable,ram_out[8:0]);
	assign y = x[9:0]-{ram_out[8],ram_out[8:0]};
	//  Now clock y output with system clock
	always @(posedge sysclk)
		if (enable == 1'b1)
			data_out <=  y + DAC_OFFSET;
		
endmodule
	