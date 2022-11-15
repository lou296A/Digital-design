module task2 (
MAX10_CLK1_50,
HEX0,
HEX1,
HEX2,
HEX3,
HEX4,
SW,
data_valid,
ADC_DOUT,
ADC_CS,
ADC_CLK,
DAC_CS,
DAC_SDI,
DAC_SCK
);


input MAX10_CLK1_50, ADC_DOUT;
input [9:0] SW;

output [6:0] HEX0, HEX1, HEX2, HEX4;
output [7:0] HEX3;

output DAC_CS, DAC_SDI, DAC_SCK, data_valid, ADC_CS, ADC_CLK;



wire tick;
wire [9:0] data_out;
wire [3:0] BCD0, BCD1, BCD2, BCD3, BCD4;

clktick_16 CTK (
.clock(MAX10_CLK1_50),
.enable(1'b1),
.N(16'd999),
.tick(tick)
);

spi2dac DAC (
.sysclk(MAX10_CLK1_50),
.data_in(SW),
.load(tick),
.dac_sdi (DAC_SDI),
.dac_cs (DAC_CS),
.dac_sck (DAC_SCK)
);

spi2adc ADC (
.sysclk(MAX10_CLK1_50),
.start(tick),
.data_from_adc (data_out),
.data_valid (data_valid),
.adc_cs (ADC_CS),
.adc_sck (ADC_CLK),
.sdata_from_adc (ADC_DOUT)
);

bin2bcd_16 BCD (
.x(16'd33*{6'b0,data_out}/16'd10),
.BCD0(BCD0),
.BCD1(BCD1),
.BCD2(BCD2),
.BCD3(BCD3),
.BCD4(BCD4)
);

hex_to_7seg SEG0 (
.out(HEX0),
.in(BCD0)
);

hex_to_7seg SEG1 (
.out(HEX1),
.in(BCD1)
);

hex_to_7seg SEG2 (
.out(HEX2),
.in(BCD2)
);

hex_to_7seg SEG3 (
.out(HEX3[6:0]),
.in(BCD3)
);

hex_to_7seg SEG4 (
.out(HEX4),
.in(BCD4)
);

assign HEX3[7] = 1'b0;

endmodule