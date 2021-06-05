module Hamming15_dec(	clk, reset, in, out, dec_ready	);

input clk, reset;
input [15:0] in;

output reg [10:0] out;
output reg dec_ready; 

// local wires
wire p1, p2, p4, p8, p0;
wire [3:0] err_pos; 
reg [15:0] t; 

//t = in; // copy input



assign p1 = in[5] ^ in[9]  ^ in[13] ^ in[3] ^ in[7] ^ in[11] ^ in[15]; // column 2 and 4
assign p2 = in[6] ^ in[10] ^ in[14] ^ in[3] ^ in[7] ^ in[11] ^ in[15]; // column 3 and 4

assign p4 = in[5] ^ in[6]  ^ in[7]  ^ in[12]^ in[13] ^ in[14] ^ in[15]; // row 2 & 4
assign p8 = in[9] ^ in[10] ^ in[11] ^ in[12]^ in[13] ^ in[14] ^ in[15];// row 3 & 4

assign p0 = in[3] ^ in[5] ^ in[6] ^ in[7] ^ in[9] ^ in[10] ^ in[11] ^ in[12] ^ in[13] ^ in[14] ^ in[15] ^  p1 ^ p2 ^ p4 ^ p8; 

// find the error position
assign err_pos = ( (p1 ~^ in[1]) ? 4'b0000 : 4'b0001 ) + ( (p2 ~^ in[2]) ? 4'b0000 : 4'b0010 ) + ( (p4 ~^ in[4]) ? 4'b0000 : 4'b0100 ) + ( (p8 ~^ in[8]) ? 4'b0000 : 4'b1000 );

/*//debugging
wire c1, c2, c4, c8; 
wire [3:0] s1, s2, s4, s8; 
assign c1 = p1 ~^ in[1]; assign s1 = c1 ? 0 : 1;
assign c2 = p2 ~^ in[2]; assign s2 = c1 ? 0 : 2;
assign c4 = p4 ~^ in[4]; assign s4 = c1 ? 0 : 4;
assign c8 = p8 ~^ in[8]; assign s8 = c1 ? 0 : 8;
assign err_pos = s1+s2+s4+s8; 
*/

always @ (posedge clk) begin
 // t = in; 
  if (reset == 1) begin out = 0; dec_ready = 0; end
  else begin
	//t[err_pos] = !(in[err_pos]); //flip the error bit
	case (err_pos)
	   4'b0011: begin//3
		out [0] = !in[3]; out [1] = in[5];   out [2] = in[6];   out [3] = in[7];
		out [4] = in[9];  out [5] = in[10];  out [6] = in[11];	out [7] = in[12];
		out [8] = in[13]; out [9] = in[14];  out [10] = in[15];
	   end
	   4'b0101: begin//5
		out [0] = in[3];  out [1] = !in[5];  out [2] = in[6];   out [3] = in[7];
		out [4] = in[9];  out [5] = in[10];  out [6] = in[11];	out [7] = in[12];
		out [8] = in[13]; out [9] = in[14];  out [10] = in[15];
	   end
	   4'b0110: begin//6
		out [0] = in[3];  out [1] = in[5];   out [2] = !in[6];  out [3] = in[7];
		out [4] = in[9];  out [5] = in[10];  out [6] = in[11];	out [7] = in[12];
		out [8] = in[13]; out [9] = in[14];  out [10] = in[15];
	   end
	   4'b0111: begin//7
		out [0] = in[3];  out [1] = in[5];   out [2] = in[6];   out [3] = !in[7];
		out [4] = in[9];  out [5] = in[10];  out [6] = in[11];  out [7] = in[12];
		out [8] = in[13]; out [9] = in[14];  out [10] = in[15];
	   end
	   4'b1001: begin//9
		out [0] = in[3];  out [1] = in[5];   out [2] = in[6];   out [3] = in[7];
		out [4] = !in[9]; out [5] = in[10];  out [6] = in[11];	out [7] = in[12];
		out [8] = in[13]; out [9] = in[14];  out [10] = in[15];
	   end
	   4'b1010: begin//10
		out [0] = in[3];  out [1] = in[5];    out [2] = in[6];   out [3] = in[7];
		out [4] = in[9];  out [5] = !in[10];  out [6] = in[11];	 out [7] = in[12];
		out [8] = in[13]; out [9] = in[14];   out [10] = in[15];
	   end
	   4'b1011: begin//11
		out [0] = in[3];  out [1] = in[5];   out [2] = in[6];   out [3] = in[7];
		out [4] = in[9];  out [5] = in[10];  out [6] = !in[11];	out [7] = in[12];
		out [8] = in[13]; out [9] = in[14];  out [10] = in[15];
	   end
	   4'b1100: begin//12
		out [0] = in[3];  out [1] = in[5];   out [2] = in[6];   out [3] = in[7];
		out [4] = in[9];  out [5] = in[10];  out [6] = in[11];	out [7] = !in[12];
		out [8] = in[13]; out [9] = in[14];  out [10] = in[15];
	   end
	   4'b1101: begin//13
		out [0] = in[3];  out [1] = in[5];   out [2] = in[6];   out [3] = in[7];
		out [4] = in[9];  out [5] = in[10];  out [6] = in[11];	out [7] = in[12];
		out [8] = !in[13];out [9] = in[14];  out [10] = in[15];
	   end
	   4'b1110: begin//14
		out [0] = in[3];  out [1] = in[5];   out [2] = in[6];   out [3] = in[7];
		out [4] = in[9];  out [5] = in[10];  out [6] = in[11];	out [7] = in[12];
		out [8] = in[13]; out [9] = !in[14]; out [10] = in[15];
	   end
	   4'b1111: begin//15
		out [0] = in[3];  out [1] = in[5];   out [2] = in[6];   out [3] = in[7];
		out [4] = in[9];  out [5] = in[10];  out [6] = in[11];	out [7] = in[12];
		out [8] = in[13]; out [9] = in[14];  out [10] = !in[15];
	   end
	  default: begin
		out [0] = in[3];  out [1] = in[5];   out [2] = in[6];   out [3] = in[7];
		out [4] = in[9];  out [5] = in[10];  out [6] = in[11];	out [7] = in[12];
		out [8] = in[13]; out [9] = in[14];  out [10] = in[15];
	   end
	endcase

 end // of else

end // of always block

/*
	out [0] = !in[3];
	out [1] = t[5];
	out [2] = t[6];
	out [3] = t[7];
	out [4] = t[9];
	out [5] = t[10];
	out [6] = t[11];
	out [7] = t[12];
	out [8] = t[13];
	out [9] = t[14];
	out [10] = t[15];
*/



endmodule


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
