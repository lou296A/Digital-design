module F1_FSM(sysclk,tick, trigger, time_out, en_lfsr, start_delay, ledr,state); 
input sysclk;
input tick; 
input trigger; 
input time_out; 
output en_lfsr, start_delay; 
output [9:0] ledr; 

reg start_delay; 
reg  en_lfsr;
reg [9:0] ledr;
output [2:0] state;
reg [2:0] state;  
parameter IDLE = 3'b000;
parameter LED0 = 3'b001; 
parameter LED1 = 3'b010; 
parameter LED2 = 3'b011; 
parameter LED3 = 3'b100; 
parameter LED4 = 3'b101; 
initial state = IDLE; 
initial start_delay = 1'b0; 
always @(posedge sysclk)
case(state)
	IDLE: if(trigger == 1'b1) state <= LED0;
	LED0: if(tick == 1'b1) state <= LED1;
	LED1: if(tick == 1'b1) state <= LED2; 
	LED2: if(tick == 1'b1) state <= LED3;
	LED3:
	
	if(tick == 1'b1)begin 
			
		state <= LED4;
	end
	LED4: 
	 
	if(time_out == 1'b1) begin 
	state <= IDLE; 
	start_delay<= 0; 
	end
	default:;
endcase 
always @(*)
case(state)
	IDLE: begin 
		ledr <= 10'b0000000000; 
		en_lfsr <= 1'b0;
	
		end
	LED0: 
		ledr = 10'b0000000001; 
	LED1: 
		ledr = 10'b0000000011;
	LED2: 
		ledr <= 10'b0000000111; 
	LED3: begin
	en_lfsr = 1'b1;
	ledr <= 10'b0000001111;
	end 
	LED4:begin 
		en_lfsr <= 1'b0;
		ledr <= 10'b0000011111; 
		end
	default:; 
	endcase
endmodule 	
	


		

	
	
		
	
