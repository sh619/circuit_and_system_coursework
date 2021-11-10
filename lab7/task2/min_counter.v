module min_counter(MAX10_CLK1_50,KEY,enable,min_tick,min);

input KEY;
input MAX10_CLK1_50;
input enable;

output min_tick;
output [15:0]min;
reg [15:0] N;
reg [15:0] min;
reg min_tick;
initial N=16'd59;




always @(posedge MAX10_CLK1_50) begin
if (enable==1 & N==0) begin
    if(min==16'd60) begin
		min= 16'b0;
		min_tick <=1'b1; end
		else begin
     min_tick <=1'b1;
     min <=min+16'd1; 
	  end
end

else if(KEY==1'b1) begin
	if(min==16'd59) 
		min <= 16'b0; 
		else 
   min <= min +16'b1; 
	end
	
else
 N <=N-1'b1; 
 end
 endmodule 