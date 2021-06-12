// in channel, first attenuation then add noise
`timescale 1 ps / 1 ps
module channel (input clk, input chan_start, input signed [1:0] trans_out, input reset, output reg signed [11:0] chan_out, output reg chan_done);  /* use trans_start as the start signal for channel, so that transmitter and channel
are working with the same pace*/

wire [7:0] noise;
reg [6:0] counter = 0;
reg signed [25:0] trans_out_extend; 

//pulse with noise
reg signed [11:0] trans_out_ext_noise;
//pulse with attenuation
reg signed [11:0] trans_out_ext_atten;



//states
reg [2:0] state;

parameter init = 3'b000;
parameter signal_ext = 3'b001;
parameter attenuation = 3'b010;
parameter add_noise = 3'b011;
//parameter waiting = 3'b100;
parameter done = 3'b101;
 





// noise generator
noise_generator noise_adding (clk, chan_start, noise);







always@(posedge clk) 
begin
  if((!reset)) state = init;
  else begin
    case(state)
     
    init: 
     begin
       if(chan_start ==1) state = signal_ext;
       else state = init;
     end
       
    signal_ext:   //.................signal extension here
     begin
       trans_out_extend = trans_out * 10000000; // change the unit of pulse
       state = attenuation;
     end

    attenuation:  //.................attenuation here, assume 80dB 
     begin
       trans_out_ext_atten = trans_out_extend / 10000;
       state = add_noise;
     end

    add_noise:  //...................add noise here
     begin
       if(chan_start ==0) state = done;
       else begin
       chan_out = trans_out_ext_atten + noise;
       chan_done = 1;
       state = add_noise;
     end
     end

    /*waiting:  //.................wait for the transmitter to send the next signal
     begin
       if(chan_start ==0) state = done;
       else state = waiting;
     end*/

    done:  //................channel has done producing one signal
     begin
       state = init;
       chan_done = 0;
     end

endcase

       

       
 




end
end
endmodule


module noise_generator (clk, enable, Q);

input clk, enable;
output [7:0] Q;
reg [2:0] counter = 3'b0;
   always@(posedge clk) begin
	   if (enable) begin
		   counter = counter + 1'b1;
	   end
   end
   assign Q = {counter[1],{2{counter[2]}}, counter, 2'd0};

endmodule
