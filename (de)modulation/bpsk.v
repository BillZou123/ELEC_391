module bpsk #(parameter N=11)(
										input [N-1:0] signal_in, 
										output reg [N-1:0] signal_out,
										input sychronizer,
										input significant_bit
										);
										
always @(posedge sychronizer) begin 
	
	//output of bpsk will be determined by this bit
	case(significant_bit)
	
		//inverse of input
		1'b0: signal_out <= ~signal_in;
		//equal to input
		1'b1: signal_out <= signal_in;
		//Default is input
		default: signal_out <= signal_in;
		
	endcase
	

end

endmodule 