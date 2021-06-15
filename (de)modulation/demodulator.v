

`timescale 1 ps/ 1 ps
module demodulator (input signed [1:0] receiver_out, input clk, input reset, input demod_start, output reg demod_done, output reg [15:0] demod_out);

reg [2:0] state;
reg [4:0] counter_data=0; //count for 16 bits of data
reg [15:0] demod_signal = 0;
//reg [5:0] counter_on;
//reg [4:0] counter_off;


parameter init = 3'b000;
parameter demodulating = 3'b001;
parameter out_or_not = 3'b011;
parameter done = 3'b010;


always@(posedge clk) begin

  if(!reset) state = init;
  else begin
      case(state)
      
      init: begin
       
        if(demod_start) state = demodulating;
        else state = init;
       end

      demodulating: 
      begin
     
         if(receiver_out < 0) begin // -1
            
             demod_signal[counter_data] = 1;
              if(demod_start ==0) begin
             counter_data = counter_data + 1;
             state = out_or_not;
              end
    
              else state = demodulating;
          end
     

         else begin  //  1
             demod_signal[counter_data] = 0;
              if(demod_start ==0) begin
             counter_data = counter_data + 1;
             state = out_or_not;
              end
    
              else state = demodulating;

            
              end
      end

      out_or_not: begin
        if(counter_data == 16) begin
          
        demod_out = demod_signal;
        demod_done = 1;
        counter_data = 0;
        state = done;
          end

        else state = init;
      end
         

    done: begin
          demod_done =0;
          state = init;
      end

   endcase

end
end
     



endmodule
