module lab6task4 (
	MAX10_CLK1_50,		// system clock at 50MHz
	ADC_CS,		// ADC chip select - low active
	ADC_CLK,		// Serial symmetical clock at 1MHz 		
	ADC_DOUT,	// Serial data from ADC
	DAC_CS,		// DAC chip select - low active
	DAC_SCK,		// Serial symmetical clock at 1MHz 		
	DAC_SDI,		// Serial data input to DAC
	HEX0, HEX1, HEX2, HEX3
);

	input MAX10_CLK1_50;
	input ADC_DOUT;
	output ADC_CS, ADC_CLK;
	output DAC_CS, DAC_SCK, DAC_SDI;
	output [6:0]  HEX0, HEX1, HEX2; 
	output [7:0]  HEX3;
	
	wire  tick;					//  1 tick per sampling period
	wire [9:0] data_in; 		// data from ADC
	wire [9:0] data_out; 	// data to DAC and PWM
	wire	data_valid;			// high when converted data is available
	wire [3:0]	bcd0, bcd1, bcd2, bcd3, bcd4;
 	
	clktick_16  GEN_10K (MAX10_CLK1_50, 1'b1, 16'd999, tick); // sampling at 50kHz
	
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
			
	processor	echo_synthetiser(MAX10_CLK1_50, data_in, data_out, data_valid);   // do some processing on the data
	
endmodule
