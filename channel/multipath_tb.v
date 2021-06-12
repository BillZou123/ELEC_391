

`timescale 1 ps/ 1 ps
//module multipath (input clk, input multi_start, input signed [1:0] trans_out, input reset, output reg signed [13:0] multi_out);  


module multipath_tb ();

reg clk, reset;
reg signed [1:0] trans_out;
reg multi_start;

wire signed [13:0] multi_out;
wire [7:0] noise;

wire [2:0] state;
assign state = DUT.state;
assign noise = DUT.noise;
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
trans_out = -1;
#100;
multi_start = 0;
#10;

multi_start =1;
trans_out = -1;
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
trans_out = 1;
#100;
multi_start = 0;
#10;

multi_start =1;
trans_out = 1;
#100;
multi_start = 0;
#10;









$stop;
end

endmodule
