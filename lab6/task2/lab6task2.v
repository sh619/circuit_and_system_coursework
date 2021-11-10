module lab6task2(MAX10_CLK1_50,SW,HEX0,HEX1,HEX2,HEX3,DAC_CS,DAC_SDI,DAC_SCK,ADC_CS,ADC_CLK,	ADC_DOUT);

input MAX10_CLK1_50;
input  [9:0] SW;
output [6:0] HEX0;
output [6:0] HEX1;
output [6:0] HEX2;
output [6:0] HEX3;
output DAC_CS;
output DAC_SDI;
output DAC_SCK;
input ADC_DOUT;
output ADC_CS, ADC_CLK;
wire  tick;				// sampling signal, 1 cycle of 20ns per sampling period
wire [9:0] data_in; 		// converted data from ADC
wire	data_valid;			// high when converted data is available
wire [3:0]	bcd0, bcd1, bcd2, bcd3,bcd4;



clktick divide(MAX10_CLK1_50,tick,16'd999,1'b1);
spi2dac  dac(MAX10_CLK1_50, SW[9:0],tick, DAC_SDI, DAC_CS, DAC_SCK);
spi2adc SPI_ADC_INTERFACE (	
			.sysclk (MAX10_CLK1_50),
			.start (tick),
			.data_from_adc (data_in),
			.data_valid (data_valid),
			.adc_cs (ADC_CS),
			.adc_sck (ADC_CLK),
			.sdata_from_adc (ADC_DOUT));
bin2bcd_16 BCD_CONVERTER ({6'b0,data_in}, bcd0, bcd1, bcd2, bcd3,bcd4);
hex_to_7seg SEG0(HEX0,bcd0);
hex_to_7seg SEG1(HEX1,bcd1);
hex_to_7seg SEG2(HEX2,bcd2);
hex_to_7seg SEG3(HEX3,bcd3);
endmodule 