module Hamming15_dec_tb();

reg clk, reset;
reg [15:0] in; // 11 bit input

wire [10:0] out; //15 bit output (4 parity bits)
wire dec_ready; // to signal encoder is ready for next 11 bits data

// local wire for tb
reg error; 

Hamming15_dec DUT(	clk, reset, in, out, dec_ready	);

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
in = 16'b0001_1101_1000_101x; 	#10;
if (out != 11'b0001_110_100_1) error = 1; else error = 0;
#10;
in = 16'b1111_0000_0011_001x;  	#10;
if (out != 11'b1111_000_001_0) error = 1; else error = 0;
#10;
in = 16'b1001_0011_0101_111x;  	#10;
if (out != 11'b1001_001_010_1) error = 1; else error = 0;
#10;

// to see if error gets corrected
in = 16'b1001_1011_0101_111x;  	#10;
if (out != 11'b1001_001_010_1) error = 1; else error = 0;
#10;
in = 16'b1111_0000_1011_001x;  	#10;
if (out != 11'b1111_000_001_0) error = 1; else error = 0;
#10;
in = 16'b0000_0000_0000_100x;  	#10;
if (out != 11'b0000_000_000_0) error = 1; else error = 0;
#10;
in = 16'b0000_0000_0010_000x;  	#10;
if (out != 11'b0000_000_000_0) error = 1; else error = 0;
#10;
in = 16'b0000_0000_0100_000x;  	#10;
if (out != 11'b0000_000_000_0) error = 1; else error = 0;
#10;
in = 16'b0000_0000_1000_000x;  	#10;
if (out != 11'b0000_000_000_0) error = 1; else error = 0;
#10;
in = 16'b0000_0010_0000_000x;  	#10;
if (out != 11'b0000_000_000_0) error = 1; else error = 0;
#10;
in = 16'b0000_0100_0000_000x;  	#10;
if (out != 11'b0000_000_000_0) error = 1; else error = 0;
#10;
in = 16'b0000_1000_0000_000x;  	#10;
if (out != 11'b0000_000_000_0) error = 1; else error = 0;
#10;
in = 16'b0001_0000_0000_000x;  	#10;
if (out != 11'b0000_000_000_0) error = 1; else error = 0;
#10;
in = 16'b0010_0000_0000_000x;  	#10;
if (out != 11'b0000_000_000_0) error = 1; else error = 0;
#10;
in = 16'b0100_0000_0000_000x;  	#10;
if (out != 11'b0000_000_000_0) error = 1; else error = 0;
#10;
in = 16'b1000_0000_0000_000x;  	#10;
if (out != 11'b0000_000_000_0) error = 1; else error = 0;
#10;




if (error == 1)  $display("Error!");
else $display("All good!");
$stop; 
end



endmodule
