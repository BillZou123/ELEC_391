module modulator
	
//modified to: take 1bit in, and outputs 2bit signed. 

(	input [15:0] signal_in,	//input [N-1:0] signal_in, 
	input clk,
	input bpsk_start, // error encoding done, input sychronizer
	//input significant_bit,
	input reset,
	output reg bpsk_done,
	output reg signed [1:0] signal_out	//output reg [N-1:0] signal_out,

										);

reg [2:0] state;
reg [4:0] counter_data;
reg [5:0] counter_ON;
reg [4:0] counter_off;

parameter init = 3'b000;
parameter bpsk_on = 3'b001;
parameter bpsk_off = 3'b010;
parameter done = 3'b100;
 
										
//always @(posedge sychronizer) begin 
always @(posedge clk) begin
 if(!reset) state = init;
 else begin
	case(state)

	init: begin
		counter_data = 0;
		counter_ON = 0;
		counter_off = 0;
		if(bpsk_start) state = bpsk_on;
		else state = init;
	      end

	bpsk_on: begin
		if(counter_data < 16) begin

			if(counter_ON < 60)begin

				if(signal_in[counter_data]) begin
					signal_out = 2'b11;
					bpsk_done = 1;
					counter_ON = counter_ON + 1;
					state = bpsk_on;
				end

				else begin
					signal_out = 2'b01;
					bpsk_done = 1;
					counter_ON = counter_ON + 1;
					state = bpsk_on;
				end
			end

			else begin 
				counter_ON = 0;
				state = bpsk_off;
			end
		end

		else begin
		     state = done;
		end

		   end

	bpsk_off: begin
		if(counter_off < 10)begin
			signal_out = 0;
			bpsk_done = 0;
			counter_off = counter_off + 1;
			state = bpsk_off;
		end
		else begin
			counter_off = 0;
			counter_data = counter_data + 1;
			state = bpsk_on;			
		end
		end



	done: begin
		if(!bpsk_start) state = init;
		else state = done;
		end


	endcase
end
end

endmodule 



