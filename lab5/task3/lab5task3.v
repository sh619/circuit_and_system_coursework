module lab5task3(MAX10_CLK1_50,HEX0,HEX1,HEX2,HEX3,HEX4,PWM_OUT,DAC_CS,DAC_SDI,DAC_SCK,SW);

input MAX10_CLK1_50;
input [9:0] SW;
output [6:0] HEX0;
output [6:0] HEX1;
output [6:0] HEX2;
output [6:0] HEX3;
output [6:0] HEX4;
output PWM_OUT;
output DAC_CS;
output DAC_SDI;
output DAC_SCK;

wire tick_50k;
wire [3:0]BCD0;
wire [3:0]BCD1;
wire [3:0]BCD2;
wire [3:0]BCD3;
wire [3:0]BCD4;
wire [9:0]count;



clktick divide(MAX10_CLK1_50,tick_50k,1000,1'b1);
ncounter con(MAX10_CLK1_50,tick_50k,0,SW[9:0],count[9:0]);
pwm task1(MAX10_CLK1_50,count[9:0],PWM_OUT,tick_50k,10'd999);
bin2bcd_16 bcd(count[9:0],BCD0,BCD1,BCD2,BCD3,BCD4);
hex_to_7seg SEG0(HEX0,BCD0);
hex_to_7seg SEG1(HEX1,BCD1);
hex_to_7seg SEG2(HEX2,BCD2);
hex_to_7seg SEG3(HEX3,BCD3);
hex_to_7seg SEG4(HEX4,BCD4);
spi2dac  dac(MAX10_CLK1_50,count[9:0],tick_50k, DAC_SDI, DAC_CS, DAC_SCK);






endmodule