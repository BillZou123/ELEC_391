

`timescale 1 ps/ 1 ps
//module multipath (input clk, input multi_start, input signed [1:0] trans_out, input reset, output reg signed [13:0] multi_out);  


module multipath_tb ();

reg clk, reset;
reg signed [1:0] trans_out;
reg multi_start;

wire signed [13:0] multi_out;
wire [7:0] noise;
wire signed [1:0] FIFO_out;
wire [2:0] counter_delay;
wire [3:0] counter_FIFO;
wire  [3:0] FIFO_addr;
wire [2:0] state;
wire signed [13:0] multi_out_ext_atten;
assign state = DUT.state;
assign noise = DUT.noise;
assign FIFO_out = DUT.FIFO_out;
assign counter_delay= DUT.counter_delay;
assign counter_FIFO = DUT.counter_FIFO;
assign FIFO_addr = DUT.FIFO_addr;
assign multi_out_ext_atten = DUT.multi_out_ext_atten;
multipath DUT (clk, multi_start, trans_out, reset, multi_out);

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
multi_start = 0;
#20;

multi_start =1;
trans_out = 1;
#100;
multi_start = 0;
#10;

multi_start =1;
trans_out = -1;
#100;
multi_start = 0;
#10;

multi_start =1;
trans_out = 1;
#100;
multi_start = 0;
#10;

multi_start =1;
trans_out = -1;
#100;
multi_start = 0;
#10;


multi_start =1;
trans_out = 1;
#100;
multi_start = 0;
#10;


multi_start =1;
trans_out = -1;
#100;
multi_start = 0;
#10;


multi_start =1;
trans_out = 1;
#100;
multi_start = 0;
#10;

multi_start =1;
trans_out = -1;
#100;
multi_start = 0;
#10;

multi_start =1;
trans_out = 1;
#100;
multi_start = 0;
#10;

multi_start =1;
trans_out = -1;
#100;
multi_start = 0;
#10;


multi_start =1;
trans_out = 1;
#100;
multi_start = 0;
#10;


multi_start =1;
trans_out = -1;
#100;
multi_start = 0;
#10;


multi_start =1;
trans_out = 1;
#100;
multi_start = 0;
#10;

multi_start =1;
trans_out = -1;
#100;
multi_start = 0;
#10;

multi_start =1;
trans_out = 1;
#100;
multi_start = 0;
#10;

multi_start =1;
trans_out = -1;
#100;
multi_start = 0;
#10;









$stop;
end

endmodule
