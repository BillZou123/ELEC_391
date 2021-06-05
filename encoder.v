module Hamming15_enc(	clk, reset, in, out, enc_ready	);

input clk, reset;
input [10:0] in; // 11 bit input

//output [15:0] out; //15 bit output (4 parity bits)
//output enc_ready; // to signal encoder is ready for next 11 bits data

output reg [15:0] out;
output reg enc_ready;

// some internal wires
wire p1, p2, p4, p8, p0; 

assign p1 = in[1] ^ in[4] ^ in[8] ^ in[0] ^ in[3] ^ in[6] ^ in[10]; // column 2 and 4
assign p2 = in[2] ^ in[5] ^ in[9] ^ in[0] ^ in[3] ^ in[6] ^ in[10]; // column 3 and 4

assign p4 = in[1] ^ in[2] ^ in[3] ^ in[7]^ in[8] ^ in[9] ^ in[10]; // row 2 & 4
assign p8 = in[4] ^ in[5] ^ in[6] ^ in[7]^ in[8] ^ in[9] ^ in[10];// row 3 & 4
assign p0 = in[0] ^ in[1] ^ in[2] ^ in[3] ^ in[4] ^ in[5] ^ in[6] ^ in[7] ^ in[8] ^ in[9] ^ in[10] ^  p1 ^ p2 ^ p4 ^ p8; 


always @(posedge clk) begin
  if (reset == 1) begin out = 0; enc_ready = 0; end
  else begin
	out[1] = p1; 
	out[2] = p2; 
 	out[3] = in[0];
	out[4] = p4; 
	out[5] = in[1];
	out[6] = in[2];
	out[7] = in[3];
	out[8] = p8; 
	out[9] = in[4];
	out[10] = in[5];
	out[11] = in[6];
	out[12] = in[7];
	out[13] = in[8];
	out[14] = in[9];
	out[15] = in[10];
	enc_ready = 1; 
  end // of else
end// of always


/*=================== with no clk   ==================================
assign out[1] = p1; 
assign out[2] = p2; 
assign out[3] = in[0];
assign out[4] = p4; 
assign out[5] = in[1];
assign out[6] = in[2];
assign out[7] = in[3];
assign out[8] = p8; 
assign out[9] = in[4];
assign out[10] = in[5];
assign out[11] = in[6];
assign out[12] = in[7];
assign out[13] = in[8];
assign out[14] = in[9];
assign out[15] = in[10];

assign out[0] = in[0] ^ in[1] ^ in[2] ^ in[3] ^ in[4] ^ in[5] ^ in[6] ^ in[7] ^ in[8] ^ in[9] ^ in[10] ^  p1 ^ p2 ^ p4 ^ p8; 
assign enc_ready = 0; 
*///============================== with no clk -end   ================

endmodule


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
