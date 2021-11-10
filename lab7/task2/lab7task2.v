module lab7task2(MAX10_CLK1_50,HEX0,HEX1,HEX2,HEX3,KEY);

input MAX10_CLK1_50;
input [1:0]KEY;
output [6:0] HEX1,HEX2,HEX3;
output [7:0] HEX0;

wire sec_tick;
wire min_tick;
wire [16:0] min;
wire [3:0] BCD0,BCD1,BCD2,BCD4; 

sec_counter sec(MAX10_CLK1_50,sec_tick);

assign HEX0[7]=sec_tick;

min_counter minute(MAX10_CLK1_50,KEY[1],sec_tick,min_tick,min);
bin2bcd_16 seg(min,BCD0,BCD1,BCD2,BCD4);
hex_to_7seg  seg0(HEX0[6:0],BCD0);
hex_to_7seg  seg1(HEX1[6:0],BCD1);

endmodule 