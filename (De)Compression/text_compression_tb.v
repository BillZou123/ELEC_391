module text_compression_tb();

reg [7:0] sim_binary_byte;
wire [7:0] sim_expanded;
wire [6:0] sim_compressed_byte;
reg sim_clk;
reg sim_reset, sim_change;
wire [15:0] sim_errors;
wire sim_error_flag;

text_compressor dut(.binary_byte(sim_binary_byte),
						.clk(sim_clk),
						.compressed_byte(sim_compressed_byte)
						);
						
text_expander dut1(.compressed(sim_compressed_byte),
					.clk(sim_clk),
					.expanded(sim_expanded)
					);
					
error_counter dut2(.pattern1({sim_binary_byte,16'b0}), 
					.pattern2({sim_expanded,16'b0}),
					.clock(sim_clk),
					.reset(sim_reset),
					.enable(1'b1),		//enabled by the tx enable
					.change(sim_change),
					.errors(sim_errors),		// number of errors
					.error_flag(sim_error_flag)	//is set when errorcount is full
					);
						
initial begin

sim_reset= 1'b1;
sim_change=1'b0;
#10;
sim_reset=1'b0;
#10;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_binary_byte= 8'b01001000;
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_binary_byte= 8'b01101001;
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_binary_byte= 8'b00100010;
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_binary_byte= 8'b01001101;
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_binary_byte= 8'b01100001;
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_binary_byte= 8'b01111001;
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_binary_byte= 8'b01100001;
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;

end 

always
begin

//Clock
sim_clk= 1'b0;
#5;
sim_clk= 1'b1;
#5;

end 

endmodule 