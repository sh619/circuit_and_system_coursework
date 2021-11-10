`timescale 1ns/100ps//the syetem has a time resolution of 100ps and use 1ns as the unit time step
module ncounter(

clock,
enable,
reset,
n,
count
);

parameter BIT_SZ=10;
input clock;
input enable;
input reset;
input [9:0]n;
output [BIT_SZ-1:0] count;

reg [BIT_SZ-1:0] count;

initial count=0;


always @(posedge clock)
if(enable==1'b1)
   count <= count +n;
else if (reset==1'b1)
   count <= 0;
	
endmodule
