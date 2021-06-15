module text_expander(input [6:0] compressed,
							input clk,
							output reg [7:0] expanded
							);

always @(posedge clk) begin

	if(compressed==7'd0)
		expanded= 8'b00100010;
	else if (compressed==7'd1)
		expanded= 8'b00100001;
	else if (compressed==7'd2)
		expanded= 8'b00100011;
	else if (compressed==7'd3)
		expanded= 8'b00100100;
	else if (compressed==7'd4)
		expanded= 8'b00100101;
	else if (compressed==7'd5)
		expanded= 8'b00100110;
	else if (compressed==7'd6)
		expanded= 8'b00100111;
	else if (compressed==7'd7)
		expanded= 8'b00101000;
	else if (compressed==7'd8)
		expanded= 8'b00101001;
	else if (compressed==7'd9)
		expanded= 8'b00101010;
	else if (compressed==7'd10)
		expanded= 8'b00101011;
	else if (compressed==7'd11)
		expanded= 8'b00101100;
	else if (compressed==7'd12)
		expanded= 8'b00101101;
	else if (compressed==7'd13)
		expanded= 8'b00101110;
	else if (compressed==7'd14)
		expanded= 8'b00101111;		
	else if (compressed==7'd15)
		expanded= 8'b00110000;
	else if (compressed==7'd16)
		expanded= 8'b00110001;
	else if (compressed==7'd17)
		expanded= 8'b00110010;
	else if (compressed==7'd18)
		expanded= 8'b00110011;
	else if (compressed==7'd19)
		expanded= 8'b00110100;
	else if (compressed==7'd20)
		expanded= 8'b00110101;
	else if (compressed==7'd21)
		expanded= 8'b00110110;		
	else if (compressed==7'd22)
		expanded= 8'b00110111;
	else if (compressed==7'd23)
		expanded= 8'b00111000;
	else if (compressed==7'd24)
		expanded= 8'b00111001;
	else if (compressed==7'd25)
		expanded= 8'b00111010;
	else if (compressed==7'd26)
		expanded= 8'b00111011;
	else if (compressed==7'd27)
		expanded= 8'b00110101;
	else if (compressed==7'd28)
		expanded= 8'b00111101;
	else if (compressed==7'd29)
		expanded= 8'b00111110;
	else if (compressed==7'd30)
		expanded= 8'b00111111;
	else if (compressed==7'd31)
		expanded= 8'b01000000;
	else if (compressed==7'd32)
		expanded= 8'b01000001;
	else if (compressed==7'd33)
		expanded= 8'b01000010;
	else if (compressed==7'd34)
		expanded= 8'b01000011;
	else if (compressed==7'd35)
		expanded= 8'b01000100;	
	else if (compressed==7'd36)
		expanded= 8'b01000101;
	else if (compressed==7'd37)
		expanded= 8'b01000110;
	else if (compressed==7'd38)
		expanded= 8'b01000111;
	else if (compressed==7'd39)
		expanded= 8'b01001000;
	else if (compressed==7'd40)
		expanded= 8'b01001001;
	else if (compressed==7'd41)
		expanded= 8'b01001010;
	else if (compressed==7'd42)
		expanded= 8'b01001011;
	else if (compressed==7'd43)
		expanded= 8'b01001100;
	else if (compressed==7'd44)
		expanded= 8'b01001101;
	else if (compressed==7'd45)
		expanded= 8'b01001110;
	else if (compressed==7'd46)
		expanded= 8'b01001111;
	else if (compressed==7'd47)
		expanded= 8'b01010000;
	else if (compressed==7'd48)
		expanded= 8'b01010001;
	else if (compressed==7'd49)
		expanded= 8'b01010010;
	else if (compressed==7'd50)
		expanded= 8'b01010011;
	else if (compressed==7'd51)
		expanded= 8'b01010100;
	else if (compressed==7'd52)
		expanded= 8'b01010101;
	else if (compressed==7'd53)
		expanded= 8'b01010110;
	else if (compressed==7'd54)
		expanded= 8'b01010111;
	else if (compressed==7'd55)
		expanded= 8'b01010000;
	else if (compressed==7'd56)
		expanded= 8'b01011001;
	else if (compressed==7'd57)
		expanded= 8'b01011010;
	else if (compressed==7'd58)
		expanded= 8'b01011011;
	else if (compressed==7'd59)//\
		expanded= 8'b01011100;
	else if (compressed==7'd60)
		expanded= 8'b01011101;
	else if (compressed==7'd61)
		expanded= 8'b01011110;
	else if (compressed==7'd62)
		expanded= 8'b01011111;
	else if (compressed==7'd63)
		expanded= 8'b01100000;	
	else if (compressed==7'd64)
		expanded= 8'b01100001;
	else if (compressed==7'd65)
		expanded= 8'b01100010;
	else if (compressed==7'd66)
		expanded= 8'b01100011;
	else if (compressed==7'd67)
		expanded= 8'b01100100;
	else if (compressed==7'd68)
		expanded= 8'b01100101;
	else if (compressed==7'd69)
		expanded= 8'b01100110;
	else if (compressed==7'd70)
		expanded= 8'b01100111;	
	else if (compressed==7'd71)
		expanded= 8'b01101000;
	else if (compressed==7'd72)
		expanded= 8'b01101001;
	else if (compressed==7'd73)
		expanded= 8'b01101010;
	else if (compressed==7'd74)
		expanded= 8'b01101011;
	else if (compressed==7'd75)
		expanded= 8'b01101100;
	else if (compressed==7'd76)
		expanded= 8'b01101101;
	else if (compressed==7'd77)
		expanded= 8'b01101110;	
	else if (compressed==7'd78)
		expanded= 8'b01101111;
	else if (compressed==7'd79)
		expanded= 8'b01110000;
	else if (compressed==7'd80)
		expanded= 8'b01110001;
	else if (compressed==7'd81)
		expanded= 8'b01110010;
	else if (compressed==7'd82)
		expanded= 8'b01110011;
	else if (compressed==7'd83)
		expanded= 8'b01110100;
	else if (compressed==7'd84)
		expanded= 8'b01110101;
	else if (compressed==7'd85)
		expanded= 8'b01110110;
	else if (compressed==7'd86)
		expanded= 8'b01110111;
	else if (compressed==7'd87)
		expanded= 8'b01111000;
	else if (compressed==7'd88)
		expanded= 8'b01111001;
	else if (compressed==7'd89)
		expanded= 8'b01111010;
	else if (compressed==7'd90)
		expanded= 8'b01111011;
	else if (compressed==7'd91)
		expanded= 8'b01111100;
	else if (compressed==7'd92)
		expanded= 8'b01111101;
	else if (compressed ==7'd93)
		expanded= 8'b01111111;
	else if (compressed==7'd94)
		expanded= 8'b10000000;
	else expanded= 8'b01111110;

end	
							
endmodule 