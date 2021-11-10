module lab4task1(
KEY,
HEX0,
);

input [1:0] KEY;
output [6:0] HEX0;
wire [3:0] count;
counter_4 co(~KEY[1],1'b1,~KEY[0],count[3:0]);
hex_to_7seg seg0(HEX0,count[3:0]);

endmodule
