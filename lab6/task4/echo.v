//------------------------------
// Module name: allpass processor
// Function: Simply to pass input to output
// Creator:  Peter Cheung
// Version:  1.1
// Date:     24 Jan 2014
//------------------------------

module processor (sysclk, data_in, data_out, data_valid);

	input				sysclk;		// system clock
	input [9:0]		data_in;		// 10-bit input data
	input 			data_valid;	// asserted when sample data is ready for processing
	output [9:0] 	data_out;	// 10-bit output data

	wire				sysclk;
	wire [9:0]		data_in;
	reg [9:0] 		data_out;
	wire [9:0]		x,y;
   reg            fifo_state;
	wire  [9:0]    fifo_out;
	wire           full;
	wire           enable;
	parameter 		ADC_OFFSET = 10'd512;
	parameter 		DAC_OFFSET = 10'd512;
	parameter      first=1'b0;
	parameter      next=1'b1;
	reg state;
	initial state=first;
	assign x = data_in[9:0] - ADC_OFFSET;	// x is input in 2's complement
	
	pulse_gen  PULSE (enable, data_valid, sysclk);
	// This part should include your own processing hardware 
	// ... that takes x to produce y
	// ... In this case, it is ALL PASS.
fifo   delay(sysclk,x[9:0],fifo_state & enable,enable,full,fifo_out[9:0]);					
	
	
	
	always @(posedge sysclk) begin
			case (state)
	        first:
			 begin if(full==1'b1) begin
	              state <=next;
					   end
				      else begin
					  state <= first;
					    fifo_state <= 1'b0;
						 end
				end
				next:
				begin 
				if(full==1'b0) begin
						state <= first;
						end
						else begin fifo_state <= 1'b1;
						    state <= next;end
						end
			default: state <= first;
			endcase
		end	
 
assign y = x[9:0]+{fifo_out[9],fifo_out[9:1]};
	

	//  Now clock y output with system clock
	always @(posedge sysclk)
		if (enable == 1'b1)
			data_out <=  y + DAC_OFFSET;
		
endmodule
	