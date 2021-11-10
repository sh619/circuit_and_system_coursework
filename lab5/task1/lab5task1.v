module lab5task1(MAX10_CLK1_50,SW,HEX0,HEX1,HEX2,HEX3,HEX4,PWM_OUT);

input MAX10_CLK1_50;
input [9:0] SW;
output [6:0] HEX0;
output [6:0] HEX1;
output [6:0] HEX2;
output [6:0] HEX3;
output [6:0] HEX4;
output PWM_OUT;

wire tick_50k;
wire [3:0]BCD0;
wire [3:0]BCD1;
wire [3:0]BCD2;
wire [3:0]BCD3;
wire [3:0]BCD4;

clktick divide(MAX10_CLK1_50,tick_50k,1000,1'b1);
pwm task1(MAX10_CLK1_50,SW[9:0],PWM_OUT,tick_50k,10'd999);
bin2bcd_16 bcd(SW[9:0],BCD0,BCD1,BCD2,BCD3,BCD4);
hex_to_7seg SEG0(HEX0,BCD0);
hex_to_7seg SEG1(HEX1,BCD1);
hex_to_7seg SEG2(HEX2,BCD2);
hex_to_7seg SEG3(HEX3,BCD3);
hex_to_7seg SEG4(HEX4,BCD4);

endmodule
