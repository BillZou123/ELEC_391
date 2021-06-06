
module transmitter (clk, reset, bpsk_out, trans_out, trans_start, trans_rdy);

input clk, reset;
input signed [15:0] bpsk_out;
output reg signed [15:0] trans_out;

input trans_start;
output reg trans_rdy;


always@(posedge clk) begin

if((!reset) && (trans_start ==1))begin
trans_out = bpsk_out; // we are using a square pulse with 100% duty cycle here
trans_rdy = 1;
end

else begin
trans_rdy = 0;
trans_out = 0;
end

end


endmodule
