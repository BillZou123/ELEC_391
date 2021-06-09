module aLawPart2_tb();

reg [23:0] sim_uncompressed1;
wire [14:0] sim_compressed;
reg sim_clk, sim_read;
wire sim_write;

aLawPart2 dut(.uncompressed1(sim_uncompressed1), 
	.compressed(sim_compressed), 
	.clk(sim_clk),
	.read(sim_read), 
	.write(sim_write)
	);

initial begin

//set read to positive
sim_read= 1'd1;

//Give sim_uncompressed1 a value
sim_uncompressed1= 24'b111000111000111000111000;
//001010000000000000000000
#40;
//Toggle the sim_uncompressed1 bit
sim_uncompressed1= 24'b010000111010111000101100;
//110110000000000000000000
#40;
sim_uncompressed1= 24'b010000111010111111111100;
//110110000000000000000000
#40;
sim_uncompressed1= 24'b010000100010011000101100;
//110110000000000000000000
#40;
sim_uncompressed1= 24'b010111111000001000101100;
//110110000000000000000000
#40;
sim_uncompressed1= 24'b111111000101010100111000;
//001010000000000000000000
#40;
sim_uncompressed1= 24'b100000000000000000111000;
//001010000000000000000000
#40;
sim_uncompressed1= 24'b111111100011111111111111;
//001010000000000000000000
#40;
sim_uncompressed1= 24'b111000100000111010000000;
//001010000000000000000000
#40;

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
