
module decompression (input [10:0] dec_out, input reset,
			output reg [23:0] decompre_out,
			input clk, 
			input decompre_start,
			output reg decompre_done);

wire [15:0] compressed1;
wire [15:0] real_data;
wire sign;	
reg [23:0] b;	
reg [23:0] e, middle;		
reg [2:0] state;

parameter init = 3'b000;
parameter expanding = 3'b001;
parameter operation2 = 3'b011;
parameter done = 3'b010;		
		
assign real_data = {dec_out,{4{1'b0}}};				
//check negative
assign compressed1 = (real_data[15]==1'b0)? real_data: ((real_data^15'b111_1111_1111_1111)+1'd1);
//Assigns the same if positive, converts number from 2'complement if negative

//Assign variable for sign
assign sign= (real_data[15]==1'b0)? 1'b1: 1'b0;
//Assign 1 if positive, 0 if negative	

always @(posedge clk) begin 
	if(!reset) state = init;
	else begin
	case(state)

	init: begin
		decompre_done = 0;
		if(decompre_start) begin
			state = expanding;
			end
		else state = init;
	  end
	expanding: begin

//check bottom 7 bits
		if (compressed1[6:0]!=7'b0)begin
			 b = 24'd2**(compressed1[6:0]);
			 state = operation2;
			end
		else begin 
			b= 24'd2;
			state = operation2;
			end
		end
	operation2: begin		
			middle = (24'd16*24'd2**(compressed1[6:0]));
//check top 8 bits
			e= ((b*(compressed1[14:7] + 24'd1))+ middle);	
			state = done;
		    end

	done: begin 
//Convert if negative (2s complement) 
		 decompre_out = (sign== 1'b1)? (e): (((e)^24'b111111111111111111111111)+1'b1); 
//Assign write 1 to incidate via handshake protocal that the expander is expanding	 
		 decompre_done = 1;
	 	 state = init;
		end
	endcase
	end
  end

endmodule
