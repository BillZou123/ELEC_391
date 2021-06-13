
`timescale 1 ps/ 1 ps
//(input clk, input chan_start, input signed [1:0] trans_out, input reset, output reg signed [11:0] chan_out, output reg chan_done)
module channel_tb ();

reg clk, reset;
reg signed [1:0] trans_out;
reg chan_start;

wire signed [13:0] chan_out;
wire chan_done;
wire [7:0] noise;

wire [2:0] state;
assign state = DUT.state;
assign noise = DUT.noise;
channel DUT (clk, chan_start, trans_out, reset, chan_out, chan_done);

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
