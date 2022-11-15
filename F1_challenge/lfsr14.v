module lfsr14(sysclk, enable, data_out, data_2_dis); 
input sysclk; 
input enable;
output [14:1] data_out;  
reg [14:1] data_out; 

reg [14:1] sreg;
initial sreg = 14'b1;
reg [14:0] sreg_to_dis; 
output [14:0] data_2_dis;
reg [14:0] data_2_dis; 
//initial data_out = 14'b1;
	
	

  always @(posedge sysclk)begin 
	sreg_to_dis <=  sreg;
   sreg <= {sreg[13:1],sreg[1] ^ sreg[6] ^ sreg[10] ^ sreg[14]} ;
	end

	always @( posedge enable)begin
	 data_2_dis <= sreg_to_dis;  
	 data_out <= sreg;
	end 
endmodule	


