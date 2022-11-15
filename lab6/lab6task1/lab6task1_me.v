module lab6task1
(MAX10_CLK1_50,data_valid,DATA_IN,ADC_CLK,ADC_CS,ADC_DOUT,HEX0,HEX1,HEX2);
input MAX10_CLK1_50;
output data_valid;
output [9:0] DATA_IN;
output ADC_CLK;
output ADC_CS;
output [9:0] HEX0,HEX1,HEX2;
input ADC_DOUT; 
wire tick; 
wire [3:0] BCD0, BCD1, BCD2, BCD3, BCD4;



clktick_16 clicktick16_0(MAX10_CLK1_50,1'b1,tick); 
spi2adc spi2adc_0(.sysclk(MAX10_CLK1_50), .start (tick), .data_from_adc (DATA_IN), .data_valid (data_valid), .adc_cs (ADC_CS), .adc_sck (ADC_CLK), .sdata_from_adc (ADC_DOUT)); 
hex_to_7seg seg0(HEX0,BCD0);
hex_to_7seg seg1(HEX1,BCD1);
hex_to_7seg seg2(HEX2,BCD2);

endmodule 