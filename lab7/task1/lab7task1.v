module lab7task1(MAX10_CLK1_50,
   DAC_CS,		
	DAC_SCK,		
	DAC_SDI);
	input MAX10_CLK1_50;				
	output DAC_CS, DAC_SCK, DAC_SDI;
	wire tick;
	wire [9:0]  data_in; 
	clktick  GEN_10K (MAX10_CLK1_50,tick,16'd999,1'b1);
	LFSR_10  psrb(data_in,MAX10_CLK1_50,tick);
	spi2dac  dac(MAX10_CLK1_50,data_in,tick,DAC_SDI,DAC_CS, DAC_SCK );
	endmodule
	