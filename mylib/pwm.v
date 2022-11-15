module pwm(clk, data_in, load, max, pwm_out); 
input clk;
input [9:0] data_in;
input load;
input [9:0] max; 
output pwm_out; 
reg  [9:0] count;  
reg [9:0] d; 
reg pwm_out; 
 
always @ (posedge clk) begin 
	if (load == 1'b1) d <= data_in;
	// ramp generator 
	if (count == max) count <= 10'b0;
	else count <= count + 1'b1;
	//comparator 
	if(count >= d) 
	pwm_out = 1'b0; 
	else pwm_out = 1'b1; 
	end 
	
endmodule 