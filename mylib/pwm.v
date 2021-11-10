module pwm(clk,data_in,pwm_out,load,max);

input clk;
input [9:0]data_in;
input load;
input [9:0]max;
output pwm_out;

reg [9:0] d;
reg [9:0] count;
reg pwm_out;


always @(posedge clk) begin
if(load==1'b1)
d <= data_in ;

if(count==max) 
count <= 10'b0;
else
count <= count +1'b1;

if (count >= d)
pwm_out <=1'b0;
else 
pwm_out <=1'b1; 
end




endmodule
