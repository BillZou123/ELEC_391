
module Hamming15_enc_tb();

reg clk, reset;
reg [10:0] in; // 11 bit input

wire [15:0] out; //15 bit output (4 parity bits)
wire enc_ready; // to signal encoder is ready for next 11 bits data

Hamming15_enc DUT(	clk, reset, in, out, enc_ready	);

// intitate the clock
initial begin
   clk=1;
   #5;

 forever begin
   clk=0;
   #5;
   clk=1;
   #5;
 end
end //of initial clock

initial begin

reset = 1; 
#20;
reset = 0; 
in = 11'b0001_110_100_1; 
#10;
in = 11'b1111_000_001_0; 
#10;
in = 11'b1001_001_010_1; 
#10;

$stop; 
end



endmodule
