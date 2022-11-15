module lab6task2( 
			MAX_CLK1_50, 
			SW,
			DAC_SDI,
			DAC_CS,		// ADC chip select - low active
			DAC_SCK, 
			ADC_DOUT,
			ADC_CS,		// ADC chip select - low active
         ADC_CLK,		// Serial symmetical clock at 1MHz 		
			HEX0, HEX1, HEX2, HEX3 ); 
input MAX_CLK1_50; 
input [9:0] SW; 
output  DAC_SDI,DAC_CS ,DAC_SCK; //digital to analog 
output ADC_CS, ADC_CLK; //analog to digita 
input ADC_DOUT; //bit stream 
wire [9:0] data_in ; // final data 
wire	data_valid;
output [6:0] HEX0, HEX1, HEX2, HEX3; 
wire tick; 
wire [15:0]  V2display;
wire [3:0] BCD0, BCD1, BCD2, BCD3, BCD4;
clktick_16  clktick(.clock(MAX10_CLK1_50),.enable(1'b1), .N(16'd1000),.tick(tick)); 
spi2dac spi0(
.sysclk(MAX10_CLK1_50),
.data_in(SW),
.load(tick),
.dac_sdi(DAC_SDI), 
.dac_cs(DAC_CS), 
.dac_sck(DAC_SCK) );

spi2adc SPI_ADC_INTERFACE (	
					 .sysclk (MAX10_CLK1_50),
                .start (tick),
                .data_from_adc (data_in),
                .data_valid (data_valid),
                .adc_cs (ADC_CS),
                .adc_sck (ADC_CLK),
                .sdata_from_adc (ADC_DOUT));
assign V2display = 6'd33*data_in;
bin2bcd_16 BCD_CONVERTER (V2display, bcd0, bcd1, bcd2, bcd3, bcd4);
  hex_to_7seg DISP0 (HEX0, bcd1);
        hex_to_7seg DISP1 (HEX1,bcd2);
        hex_to_7seg DISP2 (HEX2, bcd3);
        hex_to_7seg DISP3 (HEX3, bcd4);

endmodule 