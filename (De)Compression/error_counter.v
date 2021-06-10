module error_counter(
input [23:0] pattern1,
input [23:0] pattern2,
input clock,
input reset,
input enable,		//enabled by the tx enable
input change,
output reg [15:0] errors,		// number of errors
output reg error_flag	//is set when errorcount is full
);


always @ (posedge change or posedge reset)
	begin
		if(reset)
			begin
				errors [15:0] = 16'b0;
				error_flag = 1'b0;
			end	
				else if (enable)
					begin
					 // because then the display shows FFFF when 2 edges later
						if(errors[15:0] == 16'b1-2'b10)
							begin
								error_flag = 1'b1;
							end	
						else
							begin 
								if (pattern1[0] != pattern2[0])
									errors[15:0] = errors[15:0] + 1'b1;
								
								if (pattern1[1] != pattern2[1])
									errors[15:0] = errors[15:0] + 1'b1;
								
								if (pattern1[2] != pattern2[2])
									errors[15:0] = errors[15:0] + 1'b1;
								
								if (pattern1[3] != pattern2[3])
									errors[15:0] = errors[15:0] + 1'b1;
									
								if (pattern1[4] != pattern2[4])
									errors[15:0] = errors[15:0] + 1'b1;
									
								if (pattern1[5] != pattern2[5])
									errors[15:0] = errors[15:0] + 1'b1;
									
								if (pattern1[6] != pattern2[6])
									errors[15:0] = errors[15:0] + 1'b1;
									
								if (pattern1[7] != pattern2[7])
									errors[15:0] = errors[15:0] + 1'b1;
								
								if (pattern1[8] != pattern2[8])
									errors[15:0] = errors[15:0] + 1'b1;
								
								if (pattern1[9] != pattern2[9])
									errors[15:0] = errors[15:0] + 1'b1;
								
								if (pattern1[10] != pattern2[10])
									errors[15:0] = errors[15:0] + 1'b1;
								
								if (pattern1[11] != pattern2[11])
									errors[15:0] = errors[15:0] + 1'b1;
									
								if (pattern1[12] != pattern2[12])
									errors[15:0] = errors[15:0] + 1'b1;
									
								if (pattern1[13] != pattern2[14])
									errors[15:0] = errors[15:0] + 1'b1;
									
								if (pattern1[15] != pattern2[15])
									errors[15:0] = errors[15:0] + 1'b1;
									
								if (pattern1[16] != pattern2[16])
									errors[15:0] = errors[15:0] + 1'b1;
								
								if (pattern1[17] != pattern2[17])
									errors[15:0] = errors[15:0] + 1'b1;
								
								if (pattern1[18] != pattern2[18])
									errors[15:0] = errors[15:0] + 1'b1;
								
								if (pattern1[19] != pattern2[19])
									errors[15:0] = errors[15:0] + 1'b1;
								
								if (pattern1[20] != pattern2[20])
									errors[15:0] = errors[15:0] + 1'b1;
									
								if (pattern1[21] != pattern2[21])
									errors[15:0] = errors[15:0] + 1'b1;
									
								if (pattern1[22] != pattern2[22])
									errors[15:0] = errors[15:0] + 1'b1;
									
								if (pattern1[23] != pattern2[23])
									errors[15:0] = errors[15:0] + 1'b1;

							end
					end
end

endmodule