module address_gen(rdaddr,clk);

input clk;
output [12:0] rdaddr;

reg [12:0] rdaddr;

initial rdaddr=13'd0;

always @(negedge clk)

if(rdaddr==13'd8191)
   rdaddr <= 13'd0;
else
	rdaddr <= rdaddr + 13'd1;
	
   	

endmodule 