module bpsk_demod 


(	input signed [1:0]signal_in,	//input [N-1:0] signal_in, 
	output reg signal_out,	//output reg [N-1:0] signal_out,
	input sychronizer
);
										
always @(posedge sychronizer) begin 

	case (signal_in)
	  2'b01: signal_out <= 1'b1; 	// if +1, maps to 1
	  2'b11: signal_out <= 1'b0; 	// if -1, maps to 0
          default: signal_out <= 2'b00; 
	endcase

end

endmodule 


module bpsk_demod_tb();


reg signed [1:0]signal_in;	//input [N-1:0] signal_in, 
wire  signal_out;	//output reg [N-1:0] signal_out,
reg sychronizer;

bpsk_demod DUT 
(	signal_in,	//input [N-1:0] signal_in, 
	signal_out,	//output reg [N-1:0] signal_out,
	sychronizer
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

signal_in = 2'b11;	#10;
signal_in = 2'b11;	#10;
signal_in = 2'b01;	#10;
signal_in = 2'b11;	#10;
signal_in = 2'b01;	#10;

$stop; 

end

endmodule
