module bpsk_mod_tb();


reg signal_in;
wire final_signal;	//input [N-1:0] signal_in, 
wire signed [1:0] signal_out;	//output reg [N-1:0] signal_out,
reg sychronizer, sim_reset, sim_change;
reg significant_bit;
wire [15:0] sim_errors;
wire sim_error_flag;

bpsk_mod DUT 
(	.signal_in(signal_in),	//input [N-1:0] signal_in, 
	.signal_out(signal_out),	//output reg [N-1:0] signal_out,
	.sychronizer(sychronizer),
	.significant_bit(significant_bit)
);

bpsk_demod dut1_1(
	.signal_in(signal_out),
	.signal_out(final_signal),
	.sychronizer(sychronizer)
);

error_counter dut1_0(
.pattern1({signal_in, 23'b0}),
.pattern2({final_signal,23'b0}),
.clock(sychronizer),
.reset(sim_reset),
.enable(1'b1),		//enabled by the tx enable
.change(sim_change),
.errors(sim_errors),		// number of errors
.error_flag(sim_error_flag)	//is set when errorcount is full
);

initial begin
   sychronizer=1;
   #5;

 forever begin
   sychronizer=0;
   #5;
   sychronizer=1;
   #5;
 end
end //of initial clock

initial begin
sim_reset= 1'b1;
sim_change=1'b0;
#10;
sim_reset=1'b0;
#10;
sim_change=1'b1;
#40;
sim_change=1'b0;

signal_in = 1;	#10;
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
signal_in = 0;	#10;
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
signal_in = 0;	#10;
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
signal_in = 0;	#10;
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
signal_in = 1;	#10;
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;

$stop; 

end

endmodule
