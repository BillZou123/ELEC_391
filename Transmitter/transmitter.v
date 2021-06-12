

// we play the audio at 48kHz , the audio signal is 16 bits, then we have 65 clk cycles/ bit, 5 clk cycles/sample, 12 samples/ symbol(pulse)
module transmitter (clk,reset, bpsk_out, trans_out, trans_start,trans_done);

input reset,clk;
input signed [1:0] bpsk_out; // bpsk_out should be bit by bit
output reg signed [1:0]trans_out; // trans_out should also be bit by bit



input trans_start;
output reg trans_done;

reg [2:0] sample_clk = 0;
reg [3:0] sample_counter = 0;

reg [2:0] state;
parameter initial_state = 3'b000 ;
parameter transmitting = 3'b001 ;
parameter counting = 3'b010;
parameter done = 3'b100;

//assign trans_done = state [2];



always@(posedge clk) begin

if((!reset))  state = initial_state;
  
  else begin
   case(state)

     initial_state: begin               //.......................
        trans_out = trans_out;
        trans_done = 0;
        if(trans_start == 1) state = transmitting;
        else state = initial_state;
     end

    transmitting: begin          //..................................
       trans_out = 1* bpsk_out;
       trans_done = 1;
       state = counting;
    end

    counting: begin 
                    //......................................
	if (sample_clk < 3) begin 
		 sample_clk = sample_clk + 1;
                 
		 state = counting;
		 end
        
	else begin
			sample_clk = 0;
			if(sample_counter < 11) begin
				sample_counter = sample_counter + 1;
				state = transmitting;
				end
			else begin 
				sample_counter = 0;
				state = done;
                                trans_out = 0;
                                trans_done = 0;
				end
	end
end


     done: begin    //...........................
         state = initial_state;
     end
        
      
   endcase
  end
end
        

    


endmodule
