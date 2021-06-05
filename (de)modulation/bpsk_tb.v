module bpsk_tb();

reg [11:0] sim_signal_in;
wire [11:0] sim_signal_out;
reg sim_sychronizer, sim_significant_bit;

bpsk #(12) dut(.signal_in(sim_signal_in), 
	.signal_out(sim_signal_out), 
	.sychronizer(sim_sychronizer), 
	.significant_bit(sim_significant_bit)
	);

initial begin

//Give dds_in a value
sim_signal_in = 12'b111111000000;

//Toggle the lfsr bit
sim_significant_bit= 1'b1;
#10;
sim_significant_bit= 1'b0;
#10;
sim_significant_bit= 1'b1;
#10;
sim_significant_bit= 1'b0;
#10;
sim_significant_bit= 1'b1;
#10;
sim_significant_bit= 1'b0;
#10;
sim_significant_bit= 1'b1;
#10;
sim_significant_bit= 1'b0;
#10;

end 

always
begin

//Sychronized_sample is the clock 

sim_sychronizer= 1'b0;
#5;
sim_sychronizer= 1'b1;
#5;

end 

endmodule 
