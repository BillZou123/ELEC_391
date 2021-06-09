// in channel, first attenuation then add noise
module channel (input clk, input trans_rdy, input signed trans_out, input reset, output reg signed [10:0] chan_out);

wire [5:0] noise;
reg [6:0] counter = 0;
wire signed [24:0] trans_out_extend; 

//pulse with noise
wire signed [10:0] trans_out_ext_noise;
//pulse with attenuation
wire signed [10:0] trans_out_ext_atten;


 

assign trans_out_extend = trans_out * 10000000;  // change the unit of pulse.



// add noise here
noise_generator add_noise (clk, trans_rdy, noise);

assign trans_out_ext_noise = trans_out_ext_atten + noise;


// attenuation here
assign trans_out_ext_atten = trans_out_extend / 10000;

// chan_out should be updated every 65 clk cycles

always@(posedge clk) 
begin
 if((!reset) && (trans_rdy ==1))
 begin
  
  if(counter < 64) 
     begin

        counter = counter +1;
     end

  else 
     begin
        chan_out = trans_out_ext_noise;
        counter = 0;
     end

 end

   
    
 


else begin

chan_out = 0;


end

end






endmodule


module noise_generator (clk, enable, Q);

input clk, enable;
output [5:0] Q;
reg [2:0] counter = 3'b0;
   always@(posedge clk) begin
	   if (enable) begin
		   counter = counter + 1'b1;
	   end
   end
   assign Q = {{2{counter[2]}}, counter, 1'd0};

endmodule
