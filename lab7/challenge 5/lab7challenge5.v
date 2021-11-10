//------------------------------
// Module name: lab6task4
// Function: 	Sample ADC at 10kHz and pass sample straight to ADC 
// Creator:  Peter Cheung
// Version:  1.0
// Date:     26 Nov 2020
//------------------------------
module lab7challenge5 (
	SW,
	MAX10_CLK1_50,		// system clock at 50MHz
	ADC_CS,		// ADC chip select - low active
	ADC_CLK,		// Serial symmetical clock at 1MHz 		
	ADC_DOUT,	// Serial data from ADC
	DAC_CS,		// DAC chip select - low active
	DAC_SCK,		// Serial symmetical clock at 1MHz 		
	DAC_SDI,		// Serial data input to DAC
	HEX0, HEX1, HEX2
);
	input  [9:0] SW;
	input MAX10_CLK1_50;
	input ADC_DOUT;
	output ADC_CS, ADC_CLK;
	output DAC_CS, DAC_SCK, DAC_SDI;
	output [6:0]  HEX0, HEX1, HEX2; 
	
	wire  tick;					//  1 tick per sampling period
	wire [9:0] data_in; 		// data from ADC
	wire [9:0] data_out; 	// data to DAC and PWM
	wire	data_valid;			// high when converted data is available
	wire [3:0]	bcd0, bcd1, bcd2, bcd3, bcd4;
	wire [19:0]delay;
	
	clktick  GEN_10K (MAX10_CLK1_50,tick,16'd5000,1'b1); // sampling at 10kHz
	
	spi2dac	SPI_DAC_INTERFACE (MAX10_CLK1_50, data_out, tick, 
									DAC_SDI, DAC_CS, DAC_SCK);	
	spi2adc SPI_ADC_INTERFACE (
			.sysclk (MAX10_CLK1_50),
			.start (tick),
			.data_from_adc (data_in),
			.data_valid (data_valid),
			.adc_cs (ADC_CS),
			.adc_sck (ADC_CLK),
			.sdata_from_adc (ADC_DOUT));
			
	processor2	echo(MAX10_CLK1_50, data_in, data_out, data_valid,SW[9:0]);   // do some processing on the data
	assign delay=SW[9:0] * 10'd819;
	bin2bcd_16 delay_sec(delay[19:10],bcd0,bcd1,bcd2,bcd3);
	hex_to_7seg SEG0(HEX0[6:0],bcd0);
	hex_to_7seg SEG1(HEX1[6:0],bcd1);
	hex_to_7seg SEG2(HEX2[6:0],bcd2);
endmodule
