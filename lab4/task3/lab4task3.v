module lab4task3
(
KEY,
HEX0,
HEX1
);
input [1:1] KEY;
output [6:0] HEX0;
output [6:0] HEX1;
wire [7:1] data_out;



LFSR_7   lfsr(data_out,~KEY[1]);
hex_to_7seg SEG0(HEX0, data_out[4:1]);
hex_to_7seg SEG1(HEX1, data_out[7:5]);

endmodule