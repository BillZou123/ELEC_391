

// we play the audio at 48kHz , the audio signal is 16 bits, then we have 65 clk cycles/ bit, 5 clk cycles/sample, 13 samples/ symbol(pulse)
module transmitter (clk, reset, bpsk_out, trans_out, trans_start);

input clk, reset;
input signed bpsk_out; // bpsk_out should be bit by bit
output reg signed trans_out; // trans_out should also be bit by bit

reg [6:0] counter = 0;  // this is the counter for

input trans_start;
//output reg [3:0] sample; // this is counting 13 samples / symbol(pulse)




always@(posedge clk) begin

if((!reset) && (trans_start ==1) && (counter == 0))
 begin

  trans_out = 1* bpsk_out;
  counter = counter +1;
  

 end

else if(counter < 64) 
  begin
    counter = counter + 1;
   
  end

   
    
 


else begin
counter = 0;

end

end


endmodule
