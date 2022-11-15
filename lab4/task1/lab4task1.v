module lab4task1(KEY,HEX0);
input  [1:0] KEY;
output [6:0] HEX0;

wire [3:0] count_out; 

counter_4 counter(~KEY[1], 1'b1, ~KEY[0], count_out);
hex_to_7seg output_seg(HEX0, count_out);

endmodule 