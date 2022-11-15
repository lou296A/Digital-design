module clkdiv( 
clkin, 
enable, 
K,
clkout);  
parameter K_BIT = 16; 

input clkin; 
input enable ;
input [K_BIT-1:0] K ;
output clkout; 

reg [K_BIT-1:0] count; 
reg clkout; 
always @ (posedge clkin)
	if (enable == 1'b0)
	 if (count == 10'b0) begin 
	 clkout <= clkout; 
	 count <= K;
	 end 
	 else 
		count <= count -1'b1;
endmodule 