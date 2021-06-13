module receiver (input clk, input reset, input receiver_start, input signed [13:0] chan_out, output reg signed [1:0] receiver_out , output reg receiver_done);


//reg sign_flag; // 1 bit signal showing the sign of the received signal, 1 for positive and 0 for negative
reg signed [13:0] chan_out_adjusted;
reg [2:0] state;
parameter init = 3'b000;
parameter signal_adjust = 3'b100; // do a -100 for the received signals, to make sure the amplitude if "-1" signal is <0 and amplitude of "1" signal is >0
parameter find_sign = 3'b001;
parameter recover = 3'b010;
parameter done = 3'b011;







always@(posedge clk) 
begin
  if((!reset)) state = init;
 else begin
   case(state)

    init: begin
     if(receiver_start) state = signal_adjust;
     else state = init;
    end


    signal_adjust: begin
     chan_out_adjusted = chan_out - 100;
     state = find_sign;
    end


    find_sign: begin
     if(receiver_start ==0) state = done;
     else 
       begin
         if(chan_out_adjusted[13] == 1) 
           begin // chan_out is negative, so we make it -1
             receiver_out = -1;
             receiver_done = 1;
             state = find_sign;
           end

         else 
           begin // chan_out is positive, so we make it 1
            receiver_out = 1;
            receiver_done =1;
            state = find_sign;
          end
        end
     end

    done: begin
      receiver_done = 0;
      state = init;
    end
      
       
       
      

  endcase
  end
end



endmodule
