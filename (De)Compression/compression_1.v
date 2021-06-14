module aLawPart2(input [23:0]  uncompressed1,
			input reset,
						output reg [14:0] compressed,
						input clk, 
						input compre_start, 
						output reg compre_done
						);
reg sign;
reg [23:0] out, f;
reg [23:0] uncompressed;
reg [23:0] intermediate, e; 
reg [2:0] state;

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
	if(compre_start) begin
		state = find_sign;
		compre_done = 0;
		end
	else state = init;
	end
find_sign: begin

//check sign
	if(uncompressed1[23] == 1'b0) begin
		uncompressed = uncompressed1;
		sign = 1;
		state = operation1;
		end
	else begin
		uncompressed = (uncompressed1^24'b111111111111111111111111)+24'b1;
		sign = 0;
		state = operation1;
		end//Assign 1 if positive, 0 if negative
	end
operation1: begin


//Find most significant 1 place

	out = (uncompressed<(24'd32*(24'd2**24'd0)))?24'd0: 
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
else if (intermediate< (f*(12'd64 +12'd1)))
	 e= 12'd64;	
else if (intermediate< (f*(12'd65 +12'd1)))
	 e= 12'd65;	
else if (intermediate< (f*(12'd66 +12'd1)))
	 e= 12'd66;	
else if (intermediate< (f*(12'd67 +12'd1)))
	 e= 12'd67;	
else if (intermediate< (f*(12'd68 +12'd1)))
	 e= 12'd68;	
else if (intermediate< (f*(12'd69 +12'd1)))
	 e= 12'd69;	
else if (intermediate< (f*(12'd70 +12'd1)))
	 e= 12'd70;	
else if (intermediate< (f*(12'd71 +12'd1)))
	 e= 12'd71;	
else if (intermediate< (f*(12'd72 +12'd1)))
	 e= 12'd72;	
else if (intermediate< (f*(12'd73 +12'd1)))
	 e= 12'd73;	
else if (intermediate< (f*(12'd74 +12'd1)))
	 e= 12'd74;	
else if (intermediate< (f*(12'd75 +12'd1)))
	 e= 12'd75;	
else if (intermediate< (f*(12'd76 +12'd1)))
	 e= 12'd76;	
else if (intermediate< (f*(12'd77 +12'd1)))
	 e= 12'd77;	
else if (intermediate< (f*(12'd78 +12'd1)))
	 e= 12'd78;	
else if (intermediate< (f*(12'd79 +12'd1)))
	 e= 12'd79;	
else if (intermediate< (f*(12'd80 +12'd1)))
	 e= 12'd80;	 
else if (intermediate< (f*(12'd81 +12'd1)))
	 e= 12'd81;	 
else if (intermediate< (f*(12'd82 +12'd1)))
	 e= 12'd82;	
else if (intermediate< (f*(12'd83 +12'd1)))
	 e= 12'd83;
else if (intermediate< (f*(12'd84 +12'd1)))
	 e= 12'd84;	 
else if (intermediate< (f*(12'd85 +12'd1)))
	 e= 12'd85;
else if (intermediate< (f*(12'd86 +12'd1)))
	 e= 12'd86;
else if (intermediate< (f*(12'd87 +12'd1)))
	 e= 12'd87;
else if (intermediate< (f*(12'd88 +12'd1)))
	 e= 12'd88;
else if (intermediate< (f*(12'd89 +12'd1)))
	 e= 12'd89;
else if (intermediate< (f*(12'd90 +12'd1)))
	 e= 12'd90;
else if (intermediate< (f*(12'd91 +12'd1)))
	 e= 12'd91;
else if (intermediate< (f*(12'd92 +12'd1)))
	 e= 12'd92;
else if (intermediate< (f*(12'd93 +12'd1)))
	 e= 12'd93;
else if (intermediate< (f*(12'd94 +12'd1)))
	 e= 12'd94;
else if (intermediate< (f*(12'd95 +12'd1)))
	 e= 12'd95;
else if (intermediate< (f*(12'd96 +12'd1)))
	 e= 12'd96;
else if (intermediate< (f*(12'd97 +12'd1)))
	 e= 12'd97;
else if (intermediate< (f*(12'd98 +12'd1)))
	 e= 12'd98;
else if (intermediate< (f*(12'd99 +12'd1)))
	 e= 12'd99;
else if (intermediate< (f*(12'd100 +12'd1)))
	 e= 12'd100; 
else if (intermediate< (f*(12'd101 +12'd1)))
	 e= 12'd101;
else if (intermediate< (f*(12'd102 +12'd1)))
	 e= 12'd102;
else if (intermediate< (f*(12'd103 +12'd1)))
	 e= 12'd103;
else if (intermediate< (f*(12'd104 +12'd1)))
	 e= 12'd104;
else if (intermediate< (f*(12'd105 +12'd1)))
	 e= 12'd105;
else if (intermediate< (f*(12'd106 +12'd1)))
	 e= 12'd106;
else if (intermediate< (f*(12'd107 +12'd1)))
	 e= 12'd107;
else if (intermediate< (f*(12'd108 +12'd1)))
	 e= 12'd108;
else if (intermediate< (f*(12'd109 +12'd1)))
	 e= 12'd109;
else if (intermediate< (f*(12'd110 +12'd1)))
	 e= 12'd110;
else if (intermediate< (f*(12'd111 +12'd1)))
	 e= 12'd111;
else if (intermediate< (f*(12'd112 +12'd1)))
	 e= 12'd112;
else if (intermediate< (f*(12'd113 +12'd1)))
	 e= 12'd113;
else if (intermediate< (f*(12'd114 +12'd1)))
	 e= 12'd114;
else if (intermediate< (f*(12'd115 +12'd1)))
	 e= 12'd115;
else if (intermediate< (f*(12'd116 +12'd1)))
	 e= 12'd116;
else if (intermediate< (f*(12'd117 +12'd1)))
	 e= 12'd117;
else if (intermediate< (f*(12'd118 +12'd1)))
	 e= 12'd118;
else if (intermediate< (f*(12'd119 +12'd1)))
	 e= 12'd119;
else if (intermediate< (f*(12'd120 +12'd1)))
	 e= 12'd120;
else if (intermediate< (f*(12'd121 +12'd1)))
	 e= 12'd121;
else if (intermediate< (f*(12'd122 +12'd1)))
	 e= 12'd122;
else if (intermediate< (f*(12'd123 +12'd1)))
	 e= 12'd123;
else if (intermediate< (f*(12'd124 +12'd1)))
	 e= 12'd124;
else if (intermediate< (f*(12'd125 +12'd1)))
	 e= 12'd125;
else if (intermediate< (f*(12'd126 +12'd1)))
	 e= 12'd126;
else if (intermediate< (f*(12'd127 +12'd1)))
	 e= 12'd127;
else if (intermediate< (f*(12'd128 +12'd1)))
	 e= 12'd128;
else if (intermediate< (f*(12'd129 +12'd1)))
	 e= 12'd129;
else if (intermediate< (f*(12'd130 +12'd1)))
	 e= 12'd130;
else if (intermediate< (f*(12'd131 +12'd1)))
	 e= 12'd131;
else if (intermediate< (f*(12'd132 +12'd1)))
	 e= 12'd132;
else if (intermediate< (f*(12'd133 +12'd1)))
	 e= 12'd133;
else if (intermediate< (f*(12'd134 +12'd1)))
	 e= 12'd134;
else if (intermediate< (f*(12'd135 +12'd1)))
	 e= 12'd135;
else if (intermediate< (f*(12'd136 +12'd1)))
	 e= 12'd136;
else if (intermediate< (f*(12'd137 +12'd1)))
	 e= 12'd137;
else if (intermediate< (f*(12'd138 +12'd1)))
	 e= 12'd138;
else if (intermediate< (f*(12'd139 +12'd1)))
	 e= 12'd139;
else if (intermediate< (f*(12'd140 +12'd1)))
	 e= 12'd140;	
else if (intermediate< (f*(12'd141 +12'd1)))
	 e= 12'd141;	
else if (intermediate< (f*(12'd142 +12'd1)))
	 e= 12'd142;	
else if (intermediate< (f*(12'd143 +12'd1)))
	 e= 12'd143;	
else if (intermediate< (f*(12'd144 +12'd1)))
	 e= 12'd144;	
else if (intermediate< (f*(12'd145 +12'd1)))
	 e= 12'd145;	
else if (intermediate< (f*(12'd146 +12'd1)))
	 e= 12'd146;	
else if (intermediate< (f*(12'd147 +12'd1)))
	 e= 12'd147;	
else if (intermediate< (f*(12'd148 +12'd1)))
	 e= 12'd148;	
else if (intermediate< (f*(12'd149 +12'd1)))
	 e= 12'd149;	
else if (intermediate< (f*(12'd150 +12'd1)))
	 e= 12'd150;	
else if (intermediate< (f*(12'd151 +12'd1)))
	 e= 12'd151;		
else if (intermediate< (f*(12'd152 +12'd1)))
	 e= 12'd152;	
else if (intermediate< (f*(12'd153 +12'd1)))
	 e= 12'd153;
else if (intermediate< (f*(12'd154 +12'd1)))
	 e= 12'd154;	
else if (intermediate< (f*(12'd155 +12'd1)))
	 e= 12'd155;	
else if (intermediate< (f*(12'd156 +12'd1)))
	 e= 12'd156;	
else if (intermediate< (f*(12'd157 +12'd1)))
	 e= 12'd157;	
else if (intermediate< (f*(12'd158 +12'd1)))
	 e= 12'd158;	
else if (intermediate< (f*(12'd159 +12'd1)))
	 e= 12'd159;	
else if (intermediate< (f*(12'd160 +12'd1)))
	 e= 12'd160;	
else if (intermediate< (f*(12'd161 +12'd1)))
	 e= 12'd161;	
else if (intermediate< (f*(12'd162 +12'd1)))
	 e= 12'd162;	
else if (intermediate< (f*(12'd163 +12'd1)))
	 e= 12'd163;	
else if (intermediate< (f*(12'd164 +12'd1)))
	 e= 12'd164;	
else if (intermediate< (f*(12'd165 +12'd1)))
	 e= 12'd165;	
else if (intermediate< (f*(12'd166 +12'd1)))
	 e= 12'd166;	
else if (intermediate< (f*(12'd167 +12'd1)))
	 e= 12'd167;	
else if (intermediate< (f*(12'd168 +12'd1)))
	 e= 12'd168;	
else if (intermediate< (f*(12'd169 +12'd1)))
	 e= 12'd169;	
else if (intermediate< (f*(12'd170 +12'd1)))
	 e= 12'd170;	
else if (intermediate< (f*(12'd171 +12'd1)))
	 e= 12'd171;	
else if (intermediate< (f*(12'd172 +12'd1)))
	 e= 12'd172;	
else if (intermediate< (f*(12'd173 +12'd1)))
	 e= 12'd173;	
else if (intermediate< (f*(12'd174 +12'd1)))
	 e= 12'd174;	
else if (intermediate< (f*(12'd175 +12'd1)))
	 e= 12'd175;	
else if (intermediate< (f*(12'd176 +12'd1)))
	 e= 12'd176;	
else if (intermediate< (f*(12'd177 +12'd1)))
	 e= 12'd177;	
else if (intermediate< (f*(12'd178 +12'd1)))
	 e= 12'd178;	
else if (intermediate< (f*(12'd179 +12'd1)))
	 e= 12'd179;	
else if (intermediate< (f*(12'd180 +12'd1)))
	 e= 12'd180;	 
else if (intermediate< (f*(12'd181 +12'd1)))
	 e= 12'd181;	 
else if (intermediate< (f*(12'd182 +12'd1)))
	 e= 12'd182;	
else if (intermediate< (f*(12'd183 +12'd1)))
	 e= 12'd183;
else if (intermediate< (f*(12'd184 +12'd1)))
	 e= 12'd184;	 
else if (intermediate< (f*(12'd185 +12'd1)))
	 e= 12'd185;
else if (intermediate< (f*(12'd186 +12'd1)))
	 e= 12'd186;
else if (intermediate< (f*(12'd187 +12'd1)))
	 e= 12'd187;
else if (intermediate< (f*(12'd188 +12'd1)))
	 e= 12'd188;
else if (intermediate< (f*(12'd189 +12'd1)))
	 e= 12'd189;
else if (intermediate< (f*(12'd190 +12'd1)))
	 e= 12'd190;
else if (intermediate< (f*(12'd191 +12'd1)))
	 e= 12'd191;
else if (intermediate< (f*(12'd192 +12'd1)))
	 e= 12'd192;
else if (intermediate< (f*(12'd193 +12'd1)))
	 e= 12'd193;
else if (intermediate< (f*(12'd194 +12'd1)))
	 e= 12'd194;
else if (intermediate< (f*(12'd195 +12'd1)))
	 e= 12'd195;
else if (intermediate< (f*(12'd196 +12'd1)))
	 e= 12'd196;
else if (intermediate< (f*(12'd197 +12'd1)))
	 e= 12'd197;
else if (intermediate< (f*(12'd198 +12'd1)))
	 e= 12'd198;
else if (intermediate< (f*(12'd199 +12'd1)))
	 e= 12'd199;
else if (intermediate< (f*(12'd200 +12'd1)))
	 e= 12'd200; 	 
else if (intermediate< (f*(12'd201 +12'd1)))
	 e= 12'd201;
else if (intermediate< (f*(12'd202 +12'd1)))
	 e= 12'd202;
else if (intermediate< (f*(12'd203 +12'd1)))
	 e= 12'd203;
else if (intermediate< (f*(12'd204 +12'd1)))
	 e= 12'd204;
else if (intermediate< (f*(12'd205 +12'd1)))
	 e= 12'd205;
else if (intermediate< (f*(12'd206 +12'd1)))
	 e= 12'd206;
else if (intermediate< (f*(12'd207 +12'd1)))
	 e= 12'd207;
else if (intermediate< (f*(12'd208 +12'd1)))
	 e= 12'd208;
else if (intermediate< (f*(12'd209 +12'd1)))
	 e= 12'd209;
else if (intermediate< (f*(12'd210 +12'd1)))
	 e= 12'd210;
else if (intermediate< (f*(12'd211 +12'd1)))
	 e= 12'd211;
else if (intermediate< (f*(12'd212 +12'd1)))
	 e= 12'd212;
else if (intermediate< (f*(12'd213 +12'd1)))
	 e= 12'd213;
else if (intermediate< (f*(12'd214 +12'd1)))
	 e= 12'd214;
else if (intermediate< (f*(12'd215 +12'd1)))
	 e= 12'd215;
else if (intermediate< (f*(12'd216 +12'd1)))
	 e= 12'd216;
else if (intermediate< (f*(12'd217 +12'd1)))
	 e= 12'd217;
else if (intermediate< (f*(12'd218 +12'd1)))
	 e= 12'd218;
else if (intermediate< (f*(12'd219 +12'd1)))
	 e= 12'd219;
else if (intermediate< (f*(12'd220 +12'd1)))
	 e= 12'd220;
else if (intermediate< (f*(12'd221 +12'd1)))
	 e= 12'd221;
else if (intermediate< (f*(12'd222 +12'd1)))
	 e= 12'd222;
else if (intermediate< (f*(12'd223 +12'd1)))
	 e= 12'd223;
else if (intermediate< (f*(12'd224 +12'd1)))
	 e= 12'd224;
else if (intermediate< (f*(12'd225 +12'd1)))
	 e= 12'd225;
else if (intermediate< (f*(12'd226 +12'd1)))
	 e= 12'd226;
else if (intermediate< (f*(12'd227 +12'd1)))
	 e= 12'd227;
else if (intermediate< (f*(12'd228 +12'd1)))
	 e= 12'd228;
else if (intermediate< (f*(12'd229 +12'd1)))
	 e= 12'd229;
else if (intermediate< (f*(12'd230 +12'd1)))
	 e= 12'd230;
else if (intermediate< (f*(12'd231 +12'd1)))
	 e= 12'd231;
else if (intermediate< (f*(12'd232 +12'd1)))
	 e= 12'd232;
else if (intermediate< (f*(12'd233 +12'd1)))
	 e= 12'd233;
else if (intermediate< (f*(12'd234 +12'd1)))
	 e= 12'd234;
else if (intermediate< (f*(12'd235 +12'd1)))
	 e= 12'd235;
else if (intermediate< (f*(12'd236 +12'd1)))
	 e= 12'd236;
else if (intermediate< (f*(12'd237 +12'd1)))
	 e= 12'd237;
else if (intermediate< (f*(12'd238 +12'd1)))
	 e= 12'd238;
else if (intermediate< (f*(12'd239 +12'd1)))
	 e= 12'd239;
else if (intermediate< (f*(12'd240 +12'd1)))
	 e= 12'd240;	
else if (intermediate< (f*(12'd241 +12'd1)))
	 e= 12'd241;	
else if (intermediate< (f*(12'd242 +12'd1)))
	 e= 12'd242;	
else if (intermediate< (f*(12'd243 +12'd1)))
	 e= 12'd243;	
else if (intermediate< (f*(12'd244 +12'd1)))
	 e= 12'd244;	
else if (intermediate< (f*(12'd245 +12'd1)))
	 e= 12'd245;	
else if (intermediate< (f*(12'd246 +12'd1)))
	 e= 12'd246;	
else if (intermediate< (f*(12'd247 +12'd1)))
	 e= 12'd247;	
else if (intermediate< (f*(12'd248 +12'd1)))
	 e= 12'd248;	
else if (intermediate< (f*(12'd249 +12'd1)))
	 e= 12'd249;	
else if (intermediate< (f*(12'd250 +12'd1)))
	 e= 12'd250;	
else if (intermediate< (f*(12'd251 +12'd1)))
	 e= 12'd251;		
else if (intermediate< (f*(12'd252 +12'd1)))
	 e= 12'd252;	
else if (intermediate< (f*(12'd253 +12'd1)))
	 e= 12'd253;
else if (intermediate< (f*(12'd254 +12'd1)))
	 e= 12'd254;	
else if (intermediate< (f*(12'd255 +12'd1)))
	 e= 12'd255;	
else 
	 e=12'b0; //should never reach this case because intermediate cannot have a value large enough
	
	state = done;
end

done: begin

//assign output 
//Convert if negative (2s complement) 
compressed = (sign == 1'b1)? ({e[7:0],out[6:0]}): ((({e[7:0],out[6:0]})^15'b111111111111111)+15'b1); 

//Assign write 1 to incidate via handshake protocal that the compressor is compressing	 
compre_done = 1;
state = init;
end
endcase
end
end
	
endmodule
