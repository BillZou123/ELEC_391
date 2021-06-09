module aLawExpander2(input [14:0] compressed,
							output [23:0] expanded,
							input clk, 
							input read, 
							output write
							);

wire [14:0] compressed1;
wire sign;	
reg [23:0] b;	
reg [23:0] e, middle;					
							
//check negative
assign compressed1= (compressed[14]==1'b0)? compressed: ((compressed^15'b111111111111111)+15'd1);
//Assigns the same if positive, converts number from 2'complement if negative

//Assign variable for sign
assign sign= (compressed[14]==1'b0)? 1'b1: 1'b0;
//Assign 1 if positive, 0 if negative	

always @(posedge clk) begin 

//check bottom 7 bits
if (compressed1[6:0]!=7'b0)begin
			 b= 24'd2**(compressed1[6:0]);
end
else  b= 24'd2;

middle= (24'd16*24'd2**(compressed1[6:0]));
//check top 8 bits
e= ((b*(compressed1[14:7] + 24'd1))+ middle);	

end

//Convert if negative (2s complement) 
assign expanded= (sign== 1'b1)? (e): (((e)^24'b111111111111111111111111)+24'b1); 

//Assign write 1 to incidate via handshake protocal that the expander is expanding	 
assign write = (read)? 1'b1: 1'b0;

endmodule 
