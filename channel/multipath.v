
`timescale 1 ps / 1 ps
module multipath (input clk, input multi_start, input signed [1:0] trans_out, input reset, output reg signed [13:0] multi_out);  

wire [7:0] noise;

reg signed [27:0] multi_out_extend; 

//pulse with noise
reg signed [13:0] multi_out_ext_noise;
//pulse with attenuation
reg signed [13:0] multi_out_ext_atten;

reg  [2:0] counter_delay = 0; // this is a counter counting the delay of signal (multipath effect),count to 5
reg  [3:0] counter_FIFO =0; // this is the counter for FIFO,count to 10.




//states
reg [2:0] state;

parameter init = 3'b000;
parameter signal_ext = 3'b001;
parameter attenuation = 3'b010;
parameter add_noise = 3'b011;
parameter waiting = 3'b100;
parameter done = 3'b101;
 





// noise generator
//module noise_generator (clk, enable, Q);
noise_generator noise_adding (clk, multi_start, noise);

// FIFO
//module FIFO (input clk, input FIFO_start, input [3:0] address, input signed [1:0] trans_out, input reset, output signed [1:0] FIFO_out );

reg [3:0] FIFO_addr;
wire signed [1:0] FIFO_out;

FIFO fifo_for_siganls (clk, multi_start, FIFO_addr, trans_out, reset, FIFO_out);










always@(posedge clk) 
begin
  if((!reset)) state = init;
  else begin
    case(state)
     
    init: 
     begin
       
       if(multi_start ==1)
            state = waiting;
          
       else state = init;
     end

    waiting:  // count 300 clk cycles here, which is 5 symbols (signals delayed by 5 symbols)
     begin
       if(multi_start ==0)
         begin 
           if(counter_delay < 5)  
             begin
                counter_delay = counter_delay + 1;
                state = init;
             end
      
           else 
             begin
                
                if(counter_FIFO<10) 
                   begin
                     FIFO_addr = counter_FIFO;
                     state = signal_ext;
                    end
                else  
                   begin
                     counter_FIFO = 0;
                     FIFO_addr = counter_FIFO;
                     state = signal_ext;
                   end
                
              end
          end
           
       
       
       else state = waiting;
    
           

     end
     
       
    signal_ext:   //.................signal extension here
     begin
       multi_out_extend = FIFO_out * 60000000; // change the unit of pulse
       state = attenuation;
     end

    attenuation:  //.................attenuation here, assume 80dB 
     begin
       multi_out_ext_atten = multi_out_extend / 100000;
       state = add_noise;
     end

    add_noise:  //...................add noise here
     begin
       if(multi_start ==0) state = done;
       else begin
       multi_out = multi_out_ext_atten + noise;
       state = add_noise;
     end
     end

    /*waiting:  //.................wait for the transmitter to send the next signal
     begin
       if(chan_start ==0) state = done;
       else state = waiting;
     end*/

    done:  //................channel has done producing one signal
     begin
       counter_FIFO = counter_FIFO+1'b1;
       state = init;
       
       
     end

endcase

       

       
 




end
end
endmodule



//...................................Noise generator


module noise_generator (clk, enable, Q);

input clk, enable;
output [7:0] Q;
reg [2:0] counter = 3'b0;
   always@(posedge clk) begin
	   if (enable) begin
		   counter = counter + 1'b1;
	   end
   end
   assign Q = {counter[1],{2{counter[2]}}, counter, 2'd0};

endmodule


//...........................FIFO



module FIFO (input clk, input FIFO_start, input [3:0] address, input signed [1:0] trans_out, input reset, output signed [1:0] FIFO_out );

reg [1:0] tmp [0:9];  // an array to store the trans_out signals when we are in the state "waiting"
reg [3:0] counter = 0;

reg [2:0] state;
parameter init = 3'b000;
parameter waiting = 3'b001;
parameter done = 3'b010;


assign FIFO_out = tmp [address];

always@(posedge clk) 
begin

  if((!reset)) 
    begin
     tmp [0] = 0;
     tmp [1] = 0;
     tmp [2] = 0;
     tmp [3] = 0;
     tmp [4] = 0;
     tmp [5] = 0;
     tmp [6] = 0;
     tmp [7] = 0;
     tmp [8] = 0;
     tmp [9] = 0;
     state = init;
     
     
    end
  else 
    begin
      case(state)
        init: begin
          if(FIFO_start ==1) state = waiting;  // FIFO_start is connected with trans_done, each time there is a signal from transmitter, we go to store it in FIFO
          else state = init;
        
         end

        waiting: begin

           tmp [counter] = trans_out; // store the 10 signals that are produced by the transmitter while we are waiting
           if(FIFO_start ==0)
             state = done;
           else  state = waiting;

       end

        done: begin    //if trans_done = 0, no signal from transmitter, we update the FIFO counter to store the next signal from transmitter.


         if(counter<10) 
              begin
                
                counter = counter+1;
                state = init;  // go to init to wait for the next signal from transmitter
              end
            else 
              begin
                counter = 0;
                state = init;
                
              end
            
         end
       
       endcase
end     
end
endmodule
