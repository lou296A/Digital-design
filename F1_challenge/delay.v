
module delay(N_out,ledr,sysclk, trigger, N,time_out,state); 

parameter BIT_SZ = 14;
output [14:0]N_out;
reg [14:0]N_out;
output [4:0] ledr;
reg [4:0] ledr; 
input sysclk; 
input trigger;  
input [BIT_SZ-1:0] N; 
output time_out; 
reg [BIT_SZ-1:0] count; 
wire [13:0] random_delay; 
reg count_on; 
reg time_out; 
parameter IDLE = 2'b00;
parameter COUNTING = 2'b01;
parameter TIME_OUT = 2'b10; 
parameter WAIT_LOW = 2'b11; 

output [1:0] state; 
reg [1:0] state; 

initial state = IDLE; 
initial count = N-1'b1; 

always @ (posedge sysclk)
	case(state)
		IDLE: if(trigger==1'b1)
			state <= COUNTING;	
		COUNTING: 
		if (count ==0) begin 
				count <= N - 1'b1; 
				N_out <= count; 
				state <=  TIME_OUT;
				end
				else count <= count -1'b1; 
		TIME_OUT: 
		if (trigger == 1'b0) 
					state <= IDLE; 
					else 
					state <= WAIT_LOW; 
		WAIT_LOW: if( trigger == 1'b0)
					state <= IDLE; 
					
		default: ; 
endcase 
always @ (*)
case(state)
	IDLE:begin
	time_out <= 1'b0;
	//ledr <= 5'b00001;
	end 
	COUNTING: 
	begin
	time_out <= 1'b0; 
	//ledr  <= 5'b01000; 
	end
	TIME_OUT:
	begin
	time_out <= 1'b1;
	//ledr <= 5'b00100;
	end
	WAIT_LOW:begin
	time_out <= 1'b0;
	//ledr<= 5'b00010;
	end 
	default:;
endcase
endmodule 	 


				
				



 




