`timescale 1ns/100ps//the syetem has a time resolution of 100ps and use 1ns as the unit time step
module counter_16(

clock,
enable,
reset,
count
);

parameter BIT_SZ=16;
input clock;
input enable;
input reset;
output [BIT_SZ-1:0] count;

reg [BIT_SZ-1:0] count;

initial count=16'd0;
always @(posedge clock)
if(enable==1'b1)
	if(count==16'd59)
		count <= 16'b0;
		else begin
   count <= count +16'b1; end
else if (reset==1'b1)
   count <= 0;
	
endmodule
