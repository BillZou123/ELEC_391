module transmitter_tb ();

reg clk, reset;
reg signed [15:0] bpsk_out;
reg trans_start;

wire signed [15:0] trans_out;
wire trans_rdy;
reg error;

transmitter DUT (clk, reset, bpsk_out, trans_out, trans_start, trans_rdy);

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


reset = 1;
#30;
reset = 0;
trans_start = 0;
#20;

trans_start =1;
bpsk_out = 16'b11111111_00000000;
#20;
if(trans_out != 16'b11111111_00000000) begin
error = 1;
end

else begin
error = 0;
end


bpsk_out = 16'b00000000_11111111;
#20;
if(trans_out != 16'b00000000_11111111) begin
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



