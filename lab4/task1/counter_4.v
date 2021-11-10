`timescale 1ns/100ps//the syetem has a time resolution of 100ps and use 1ns as the unit time step
module counter_4(

clock,
enable,
reset,
count
);

parameter BIT_SZ=4;
input clock;
input enable;
input reset;
output [BIT_SZ-1:0] count;

reg [BIT_SZ-1:0] count;

initial count=0;


always @(posedge clock)

if (reset==1'b1)
   count <= 0;
else if(enable==1'b1)
   count <= count +1'b1;

	
endmodule
