module bpsk_mod 
	//#(parameter N=11)
//modified to: take 1bit in, and outputs 2bit signed. 

(	input signal_in,	//input [N-1:0] signal_in, 
	output reg signed [1:0] signal_out,	//output reg [N-1:0] signal_out,
	input sychronizer,
	input significant_bit
										);
										
always @(posedge sychronizer) begin 
/*	
	//output of bpsk will be determined by this bit
	case(significant_bit)
	
		//inverse of input
		1'b0: signal_out <= ~signal_in;
		//equal to input
		1'b1: signal_out <= signal_in;
		//Default is input
		default: signal_out <= signal_in;
		
	endcase
*/
	case (signal_in)
	  1'b0: signal_out <= 2'b11; 	// if 0, maps to -1
	  1'b1: signal_out <= 2'b01; 	// if 1, maps to +1
          default: signal_out <= 2'b00; 
	endcase


end

endmodule 


module bpsk_mod_tb();


reg signal_in;	//input [N-1:0] signal_in, 
wire signed[1:0] signal_out;	//output reg [N-1:0] signal_out,
reg sychronizer;
reg significant_bit;

bpsk DUT 
(	signal_in,	//input [N-1:0] signal_in, 
	signal_out,	//output reg [N-1:0] signal_out,
	sychronizer,
	significant_bit
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

signal_in = 1;	#10;
signal_in = 0;	#10;
signal_in = 0;	#10;
signal_in = 0;	#10;
signal_in = 1;	#10;

$stop; 

end

endmodule