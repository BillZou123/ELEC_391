`timescale 1 ps/ 1 ps
//module transmitter (clk,reset, bpsk_out, trans_out, trans_start,trans_done);
module transmitter_tb ();

reg clk, reset;
reg signed [1:0] bpsk_out;
reg trans_start;

wire signed [1:0] trans_out;
wire trans_done;
reg error;

wire [2:0] state;
assign state = DUT.state;
transmitter DUT (clk, reset, bpsk_out, trans_out, trans_start, trans_done);

initial begin
clk =1;
#5;

forever begin

clk = 0;
#5;
clk=1;
#5;
end
end

initial begin


reset = 0;
#30;
reset = 1;
trans_start = 0;
#20;

trans_start =1;
bpsk_out = 1;
#600;
trans_start = 0;
#650;
if(trans_out != 1) begin
error = 1;
end

else begin
error = 0;
end


bpsk_out = -1;
trans_start =1;
#700;
if(trans_out != -1) begin
error = 1;
end

else begin
error = 0;
end



if(error ==1) $display ("ERROR!");
else $display ("PASSED");
$stop;
end
endmodule


