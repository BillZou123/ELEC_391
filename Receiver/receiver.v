
module receiver (input clk, input reset, input trans_rdy, input signed [10:0] chan_out, output reg signed receiver_out );

always@(posedge clk) begin
if((!reset) && (trans_rdy ==1)) begin

  if(chan_out > 0) begin
    receiver_out = 1;
  end

  else if (chan_out <0)begin
    receiver_out = -1;
  end
  else begin
    receiver_out = 0;
  end
end

else begin


receiver_out = 0;

end
end



endmodule
