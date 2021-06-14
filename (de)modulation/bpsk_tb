`timescale 1 ps/ 1 ps
//module transmitter (clk,reset, bpsk_out, trans_out, bpsk_start,trans_done);
/*module bpsk 
	
//modified to: take 1bit in, and outputs 2bit signed. 

(	input [15:0] signal_in,	//input [N-1:0] signal_in, 
	input clk,
	input bpsk_start, // error encoding done, input sychronizer
	input reset,
	output reg bpsk_done,
	output reg signed [1:0] signal_out	//output reg [N-1:0] signal_out,

										);*/

module transmitter_tb ();

reg clk, reset;
wire signed [1:0] bpsk_out;
//reg trans_start;

wire signed [1:0] trans_out;
wire trans_done;
reg error;

reg [15:0] signal_in;
reg bpsk_start;
wire bpsk_done;
//wire signed [1:0] bpsk_out;

wire [2:0] state_trans;
wire [2:0] state_bpsk;

assign state_trans = DUT.state;
assign state_bpsk = DUT2.state;

transmitter DUT (clk, reset, bpsk_out, trans_out, bpsk_done, trans_done);
bpsk DUT2(signal_in, clk, bpsk_start, reset, bpsk_done, bpsk_out);

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
bpsk_start = 0;
#20;

signal_in = 15'b101_0101_0101_0101;

bpsk_start =1;
//bpsk_out = 1;
#18000;
bpsk_start = 0;
#200;

signal_in = 15'b010_1010_1010_1010;
//bpsk_out = -1;
bpsk_start =1;
#18000;
bpsk_start = 0;
#200;

$stop;
end
endmodule


