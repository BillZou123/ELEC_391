module compression(input [23:0]  uncompressed1,
			input reset,
						output reg [10:0] compressed,
						input clk, 
						input compre_start, 
						output reg compre_done
						);
reg sign;
reg [23:0] out, f;
reg [23:0] uncompressed;
reg [23:0] intermediate, e; 
reg [2:0] state;
wire [23:0] real_data;

assign real_data = {uncompressed1[7:0],uncompressed1[23:8]};

parameter init = 3'b000;
parameter find_sign = 3'b001;
parameter operation1 = 3'b010;
parameter operation2 = 3'b011;
parameter operation3 = 3'b100;
parameter done = 3'b101;

always @(posedge clk) begin

if(!reset) state = init;

else begin

case(state)

init: begin
	compre_done = 0;
	if(compre_start) begin
		state = find_sign;
		end
	else state = init;
	end
find_sign: begin

//check sign
	if(real_data[23] == 1'b0) begin
		uncompressed = real_data;
		sign = 1;
		state = operation1;
		end
	else begin
		uncompressed = (real_data^24'b111111111111111111111111)+24'b1;
		sign = 0;
		state = operation1;
		end//Assign 1 if positive, 0 if negative
	end
operation1: begin


//Find most significant 1 place

	out= (uncompressed<(24'd32*(24'd2**24'd0)))?24'd0: 
		(uncompressed<(24'd32*(24'd2**24'd1)))?24'd1:
		(uncompressed<(24'd32*(24'd2**24'd2)))?24'd2:
		(uncompressed<(24'd32*(24'd2**24'd3)))?24'd3:
		(uncompressed<(24'd32*(24'd2**24'd4)))?24'd4:
		(uncompressed<(24'd32*(24'd2**24'd5)))?24'd5:
		(uncompressed<(24'd32*(24'd2**24'd6)))?24'd6:
		(uncompressed<(24'd32*(24'd2**24'd7)))?24'd7:
		(uncompressed<(24'd32*(24'd2**24'd8)))?24'd8:
		(uncompressed<(24'd32*(24'd2**24'd9)))?24'd9:
		(uncompressed<(24'd32*(24'd2**24'd10)))?24'd10:
		(uncompressed<(24'd32*(24'd2**24'd11)))?24'd11:
		(uncompressed<(24'd32*(24'd2**24'd12)))?24'd12:
		(uncompressed<(24'd32*(24'd2**24'd13)))?24'd13:
		(uncompressed<(24'd32*(24'd2**24'd14)))?24'd14:
		(uncompressed<(24'd32*(24'd2**24'd15)))?24'd15:
		(uncompressed<(24'd32*(24'd2**24'd16)))?24'd16:
		(uncompressed<(24'd32*(24'd2**24'd17)))?24'd17:
		(uncompressed<(24'd32*(24'd2**24'd18)))?24'd18:24'd0;


	state = operation2;

end

operation2:begin

//Subtraction
	intermediate = uncompressed - 24'd16*(24'd2**out);
	state = operation3;
	end

operation3: begin


//Check f
if (out==24'd0)
	f=24'd2;
else 
	f=(24'd2**out);		

if (intermediate< (f*(12'd0 +12'd1)))
	 e= 12'd0;
else if (intermediate< (f*(12'd1 +12'd1)))
	 e= 12'd1;
else if (intermediate< (f*(12'd2 +12'd1)))
	 e= 12'd2;
else if (intermediate< (f*(12'd3 +12'd1)))
	 e= 12'd3;
else if (intermediate< (f*(12'd4 +12'd1)))
	 e= 12'd4;
else if (intermediate< (f*(12'd5 +12'd1)))
	 e= 12'd5;
else if (intermediate< (f*(12'd6 +12'd1)))
	 e= 12'd6;
else if (intermediate< (f*(12'd7 +12'd1)))
	 e= 12'd7;
else if (intermediate< (f*(12'd8 +12'd1)))
	 e= 12'd8;
else if (intermediate< (f*(12'd9 +12'd1)))
	 e= 12'd9;
else if (intermediate< (f*(12'd10 +12'd1)))
	 e= 12'd10;
else if (intermediate< (f*(12'd11 +12'd1)))
	 e= 12'd11;
else if (intermediate< (f*(12'd12 +12'd1)))
	 e= 12'd12;
else if (intermediate< (f*(12'd13 +12'd1)))
	 e= 12'd13;
else if (intermediate< (f*(12'd14 +12'd1)))
	 e= 12'd14;
else if (intermediate< (f*(12'd15 +12'd1)))
	 e= 12'd15;
else if (intermediate< (f*(12'd16 +12'd1)))
	 e= 12'd16;
else if (intermediate< (f*(12'd17 +12'd1)))
	 e= 12'd17;
else if (intermediate< (f*(12'd18 +12'd1)))
	 e= 12'd18;
else if (intermediate< (f*(12'd19 +12'd1)))
	 e= 12'd19;
else if (intermediate< (f*(12'd20 +12'd1)))
	 e= 12'd20;
else if (intermediate< (f*(12'd21 +12'd1)))
	 e= 12'd21;
else if (intermediate< (f*(12'd22 +12'd1)))
	 e= 12'd22;
else if (intermediate< (f*(12'd23 +12'd1)))
	 e= 12'd23;
else if (intermediate< (f*(12'd24 +12'd1)))
	 e= 12'd24;
else if (intermediate< (f*(12'd25 +12'd1)))
	 e= 12'd25;
else if (intermediate< (f*(12'd26 +12'd1)))
	 e= 12'd26;
else if (intermediate< (f*(12'd27 +12'd1)))
	 e= 12'd27;
else if (intermediate< (f*(12'd28 +12'd1)))
	 e= 12'd28;
else if (intermediate< (f*(12'd29 +12'd1)))
	 e= 12'd29;
else if (intermediate< (f*(12'd30 +12'd1)))
	 e= 12'd30;
else if (intermediate< (f*(12'd31 +12'd1)))
	 e= 12'd31;
else if (intermediate< (f*(12'd32 +12'd1)))
	 e= 12'd32;
else if (intermediate< (f*(12'd33 +12'd1)))
	 e= 12'd33;
else if (intermediate< (f*(12'd34 +12'd1)))
	 e= 12'd34;
else if (intermediate< (f*(12'd35 +12'd1)))
	 e= 12'd35;
else if (intermediate< (f*(12'd36 +12'd1)))
	 e= 12'd36;
else if (intermediate< (f*(12'd37 +12'd1)))
	 e= 12'd37;
else if (intermediate< (f*(12'd38 +12'd1)))
	 e= 12'd38;
else if (intermediate< (f*(12'd39 +12'd1)))
	 e= 12'd39;
else if (intermediate< (f*(12'd40 +12'd1)))
	 e= 12'd40;	
else if (intermediate< (f*(12'd41 +12'd1)))
	 e= 12'd41;	
else if (intermediate< (f*(12'd42 +12'd1)))
	 e= 12'd42;	
else if (intermediate< (f*(12'd43 +12'd1)))
	 e= 12'd43;	
else if (intermediate< (f*(12'd44 +12'd1)))
	 e= 12'd44;	
else if (intermediate< (f*(12'd45 +12'd1)))
	 e= 12'd45;	
else if (intermediate< (f*(12'd46 +12'd1)))
	 e= 12'd46;	
else if (intermediate< (f*(12'd47 +12'd1)))
	 e= 12'd47;	
else if (intermediate< (f*(12'd48 +12'd1)))
	 e= 12'd48;	
else if (intermediate< (f*(12'd49 +12'd1)))
	 e= 12'd49;	
else if (intermediate< (f*(12'd50 +12'd1)))
	 e= 12'd50;	
else if (intermediate< (f*(12'd51 +12'd1)))
	 e= 12'd51;		
else if (intermediate< (f*(12'd52 +12'd1)))
	 e= 12'd52;	
else if (intermediate< (f*(12'd53 +12'd1)))
	 e= 12'd53;
else if (intermediate< (f*(12'd54 +12'd1)))
	 e= 12'd54;	
else if (intermediate< (f*(12'd55 +12'd1)))
	 e= 12'd55;	
else if (intermediate< (f*(12'd56 +12'd1)))
	 e= 12'd56;	
else if (intermediate< (f*(12'd57 +12'd1)))
	 e= 12'd57;	
else if (intermediate< (f*(12'd58 +12'd1)))
	 e= 12'd58;	
else if (intermediate< (f*(12'd59 +12'd1)))
	 e= 12'd59;	
else if (intermediate< (f*(12'd60 +12'd1)))
	 e= 12'd60;	
else if (intermediate< (f*(12'd61 +12'd1)))
	 e= 12'd61;	
else if (intermediate< (f*(12'd62 +12'd1)))
	 e= 12'd62;	
else if (intermediate< (f*(12'd63 +12'd1)))
	 e= 12'd63;	
else
	 e=12'b0; //should never reach this case because intermediate cannot have a value large enough
	
	state = done;
end

done: begin
//assign output 
//Convert if negative (2s complement) 
	compressed = (sign == 1'b1)? ({e[5:0],out[4:0]}): ((({e[5:0],out[4:0]})^11'b11111111111)+1'b1); 

//Assign write 1 to incidate via handshake protocal that the compressor is compressing	 
	compre_done = 1;
	state = init;
      end
    endcase
  end
end
	
endmodule
