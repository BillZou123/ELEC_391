



`timescale 1 ps/ 1 ps

//module receiver (input clk, input reset, input receiver_start, input signed [13:0] chan_out, output reg signed [1:0] receiver_out , output reg receiver_done);
module receiver_tb ();

reg clk, reset;
reg signed [1:0] trans_out;
reg chan_start;

wire signed [13:0] chan_out;
wire chan_done;
wire signed [1:0] receiver_out;
wire receiver_done;
wire [7:0] noise;

wire [2:0] state_chan;
wire [2:0] state_receiver;
assign state_chan = DUT.state;
assign state_receiver = DUT2.state;
assign noise = DUT.noise;
channel DUT (clk, chan_start, trans_out, reset, chan_out, chan_done);
receiver DUT2 (clk, reset, chan_done,chan_out,receiver_out, receiver_done);

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
chan_start = 0;
#20;

chan_start =1;
trans_out = 1;
#600;
chan_start = 0;
#100;

chan_start =1;
trans_out = -1;
#600;
chan_start = 0;
#100;

chan_start =1;
trans_out = 1;
#600;
chan_start = 0;
#100;

chan_start =1;
trans_out = -1;
#600;
chan_start = 0;
#100;


chan_start =1;
trans_out = 1;
#600;
chan_start = 0;
#100;


chan_start =1;
trans_out = -1;
#600;
chan_start = 0;
#100;


chan_start =1;
trans_out = 1;
#600;
chan_start = 0;
#100;

chan_start =1;
trans_out = -1;
#600;
chan_start = 0;
#100;

chan_start =1;
trans_out = 1;
#600;
chan_start = 0;
#100;

chan_start =1;
trans_out = -1;
#600;
chan_start = 0;
#100;


chan_start =1;
trans_out = 1;
#600;
chan_start = 0;
#100;


chan_start =1;
trans_out = -1;
#600;
chan_start = 0;
#100;


chan_start =1;
trans_out = 1;
#600;
chan_start = 0;
#100;

chan_start =1;
trans_out = -1;
#600;
chan_start = 0;
#100;

chan_start =1;
trans_out = 1;
#600;
chan_start = 0;
#100;

chan_start =1;
trans_out = -1;
#600;
chan_start = 0;
#100;







$stop;
end

endmodule
