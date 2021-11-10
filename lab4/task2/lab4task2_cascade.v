module lab4task2_cascade(
KEY,
MAX10_CLK1_50,
HEX0,
HEX1,
HEX2,
HEX3,
SW,
HEX4
);

input [1:0] KEY;
input MAX10_CLK1_50;
input [0:0] SW;
output [6:0] HEX0;
output [6:0] HEX1;
output [6:0] HEX2;
output [6:0] HEX3;
output [6:0] HEX4;

wire [15:0] count;
wire [3:0] BCD0;
wire [3:0] BCD1;
wire [3:0] BCD2;
wire [3:0] BCD3;
wire [3:0] BCD4;
wire tick;

clktick(MAX10_CLK1_50,tick,50000,SW[0]);
counter_16 (MAX10_CLK1_50,~KEY[1] & tick,~KEY[0],count);
bin2bcd_16 bcd(count, BCD0,BCD1, BCD2, BCD3, BCD4);
hex_to_7seg SEG0(HEX0,BCD0);
hex_to_7seg SEG1(HEX1,BCD1);
hex_to_7seg SEG2(HEX2,BCD2);
hex_to_7seg SEG3(HEX3,BCD3);
hex_to_7seg SEG4(HEX4,BCD4);
endmodule
