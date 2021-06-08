module aLawExpander2_tb();

reg [14:0] sim_compressed;
wire [23:0] sim_expanded;
reg sim_clk;

aLawExpander2 dut(.compressed(sim_compressed), 
	.expanded(sim_expanded), 
	.clk(sim_clk)
	);

initial begin

//Give sim_compressed a value
sim_compressed= 15'b110101111110001;
//-1864136
#40;
//Toggle the sim_compressed bit
sim_compressed= 15'b000100010010001;
#40;
//4435500
sim_compressed= 15'b000100010010001;
#40;
//4435964
sim_compressed= 15'b000100010010001;
#40;
//4335148
sim_compressed= 15'b000111110010001;
#40;
//6259244
sim_compressed= 15'b110101011110100;
#40;
//-240328
sim_compressed= 15'b110100001101111;
#40;
//-8388552
sim_compressed= 15'b110101111110101;
#40;
//-114689
sim_compressed= 15'b110101001110001;
#40;
//-1962368
sim_compressed= 15'b111100111110000;
#40;
//-1864136
sim_compressed= 15'b000000000010010;
#40;
//4435500
sim_compressed= 15'b000001110010010;
#40;
//6259244
sim_compressed= 15'b111100101110011;
#40;
//-240328
sim_compressed= 15'b111100001101110;
#40;
//-8388552
sim_compressed= 15'b111100111110100;
#40;
//-114689
sim_compressed= 15'b111100101110000;
#40;
//-1962368
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

