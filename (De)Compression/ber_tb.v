module ber_tb();

reg [23:0] sim_uncompressed1;
wire [23:0] sim_expanded;
wire [14:0] sim_compressed;
reg sim_clk, sim_read, sim_read2, sim_reset, sim_change;
wire [15:0] sim_errors;
			
wire sim_write, sim_write2, sim_error_flag;


error_counter dut1_0(
.pattern1(sim_uncompressed1),
.pattern2(sim_expanded),
.clock(sim_clk),
.reset(sim_reset),
.enable(1'b1),		//enabled by the tx enable
.change(sim_change),
.errors(sim_errors),		// number of errors
.error_flag(sim_error_flag)	//is set when errorcount is full
);

aLawPart2 dut(.uncompressed1(sim_uncompressed1), 
	.compressed(sim_compressed), 
	.clk(sim_clk),
	.read(sim_read), 
	.write(sim_write)
	);
	
aLawExpander2 dut2(.compressed(sim_compressed), 
	.expanded(sim_expanded), 
	.clk(sim_clk),
	.read(sim_read), 
	.write(sim_write)
	);

initial begin

//set read to positive
sim_read= 1'd1;
sim_read2= 1'b1;
sim_reset= 1'b1;
sim_change=1'b0;
#10;
sim_reset=1'b0;
#10;

//Give sim_uncompressed1 a value
#20;

sim_uncompressed1= 24'b111000111000111000111000;
//001010000000000000000000
#10;
sim_change=1'b1;
#30;
sim_change=1'b0;
//Toggle the sim_uncompressed1 bit
sim_uncompressed1= 24'b010000111010111000101100;
//110110000000000000000000
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_uncompressed1= 24'b010111111000001000101100;
//110110000000000000000000
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_uncompressed1= 24'b111111000101010100111000;
//001010000000000000000000
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_uncompressed1= 24'b100000000000000000111000;
//001010000000000000000000
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_uncompressed1= 24'b111111100011111111111111;
//001010000000000000000000
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_uncompressed1= 24'b111000100000111010000000;
//001010000000000000000000
#20;
sim_change=1'b1;
#40;

sim_change=1'b0;
//Toggle the sim_uncompressed1 bit
sim_uncompressed1= 24'd4;
//110110000000000000000000
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_uncompressed1= 24'd234;
//110110000000000000000000
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_uncompressed1= 24'd124845;
//001010000000000000000000
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_uncompressed1= 24'd0;
//001010000000000000000000
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_uncompressed1= 24'd234568;
//001010000000000000000000
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_uncompressed1= 24'd444;
//001010000000000000000000
#20;
sim_change=1'b1;
#40;

sim_change=1'b0;
//Toggle the sim_uncompressed1 bit
sim_uncompressed1= 24'd9999;
//110110000000000000000000
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_uncompressed1= 24'd2345;
//110110000000000000000000
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_uncompressed1= 24'd7777664;
//001010000000000000000000
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_uncompressed1= 24'd33;
//001010000000000000000000
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_uncompressed1= 24'd3;
//001010000000000000000000
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_uncompressed1= 24'd800;
//001010000000000000000000
#20;
sim_change=1'b1;
#40;

//19

sim_change=1'b0;
//Toggle the sim_uncompressed1 bit
sim_uncompressed1= 24'd99;
//110110000000000000000000
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_uncompressed1= 24'd233445;
//110110000000000000000000
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_uncompressed1= 24'd7764;
//001010000000000000000000
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_uncompressed1= 24'd66;
//001010000000000000000000
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_uncompressed1= 24'd4356;
//001010000000000000000000
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_uncompressed1= 24'd80;
//001010000000000000000000
#20;
sim_change=1'b1;
#40;

sim_change=1'b0;
//Toggle the sim_uncompressed1 bit
sim_uncompressed1= 24'd9239;
//110110000000000000000000
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_uncompressed1= 24'd25;
//110110000000000000000000
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_uncompressed1= 24'd77;
//001010000000000000000000
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_uncompressed1= 24'd330000;
//001010000000000000000000
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_uncompressed1= 24'd3;
//001010000000000000000000
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_uncompressed1= 24'd8066;
//001010000000000000000000
#20;
sim_change=1'b1;
#40;

//31

sim_change=1'b0;
//Toggle the sim_uncompressed1 bit
sim_uncompressed1= 24'd999009;
//110110000000000000000000
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_uncompressed1= 24'd345;
//110110000000000000000000
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_uncompressed1= 24'd8887;
//001010000000000000000000
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_uncompressed1= 24'd2345634;
//001010000000000000000000
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_uncompressed1= 24'd35;
//001010000000000000000000
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_uncompressed1= 24'd850;
//001010000000000000000000
#20;
sim_change=1'b1;
#40;

sim_change=1'b0;
//Toggle the sim_uncompressed1 bit
sim_uncompressed1= 24'd239;
//110110000000000000000000
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_uncompressed1= 24'd24;
//110110000000000000000000
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_uncompressed1= 24'd5964;
//001010000000000000000000
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_uncompressed1= 24'd113;
//001010000000000000000000
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_uncompressed1= 24'd31;
//001010000000000000000000
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_uncompressed1= 24'd8345;
//001010000000000000000000
#20;
sim_change=1'b1;
#40;

//43

sim_change=1'b0;
//Toggle the sim_uncompressed1 bit
sim_uncompressed1= 24'd999449;
//110110000000000000000000
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_uncompressed1= 24'd2;
//110110000000000000000000
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_uncompressed1= 24'd77008;
//001010000000000000000000
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_uncompressed1= 24'd305;
//001010000000000000000000
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_uncompressed1= 24'd1;
//001010000000000000000000
#20;
sim_change=1'b1;
#40;
sim_change=1'b0;
sim_uncompressed1= 24'd0;
//001010000000000000000000
#20;
sim_change=1'b1;
#40;

sim_change=1'b1;
#40;
sim_change=1'b0;
sim_uncompressed1= 24'd40;
//001010000000000000000000
#20;
sim_change=1'b1;
#40;

//50 tests
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
