
`timescale 1 ps/ 1 ps


//module demodulator (input signed [1:0] receiver_out, input clk, input reset, input demod_start, output reg demod_done, output reg [15:0] demod_out);

/*reg clk, reset;
reg signed [1:0] trans_out;
reg chan_start;

wire signed [13:0] chan_out;
wire chan_done;
wire signed [1:0] receiver_out;
wire receiver_done;
wire [7:0] noise;

wire [2:0] state_chan;
wire [2:0] state_receiver;
assign state_chan = DUT.state;
assign state_receiver = DUT2.state;
assign noise = DUT.noise;
channel DUT (clk, chan_start, trans_out, reset, chan_out, chan_done);
receiver DUT2 (clk, reset, chan_done,chan_out,receiver_out, receiver_done);*/
module decompression_tb ();


//inputs
reg clk, reset;

reg  [23:0] signal_in;
reg comp_start;


//outputs
//compressor outputs /*input [23:0]  uncompressed1,input reset,output reg [10:0] compressed, input clk, input compre_start, output reg compre_done*/

wire [10:0] comp_out;
wire comp_done;

//error_encoder outputs  /*clk, reset,  in, out, enc_start, enc_done*/

wire [15:0] enc_out;
wire enc_done;



//mod outputs

wire bpsk_done;
wire signed [1:0] bpsk_out;

//trans outputs

wire signed [1:0] trans_out;
wire trans_done;

// channel outputs
wire chan_done;
wire signed [13:0] chan_out;

//receiver outputs

wire signed [1:0] receiver_out;
wire receiver_done;

//demod outputs

wire demod_done;
wire [15:0] demod_out;

//error decoder outputs   clk, reset, in, dec_out, dec_start, dec_done

wire dec_done;
wire [10:0] dec_out;


//decompressor outputs

wire decomp_done;
wire [23:0] decomp_out;








compression DUT0(signal_in, reset, comp_out, clk, comp_start, comp_done);  /*input [23:0]  uncompressed1,input reset,output reg [10:0] compressed, input clk, input compre_start, output reg compre_done*/
error_encoder DUT1(clk, reset, comp_out, enc_out, comp_done, enc_done);    /*clk, reset,  in, out, enc_start, enc_done*/

modulator DUT2 (enc_out, clk, enc_done, reset, bpsk_done, bpsk_out);
transmitter DUT3 (clk, reset, bpsk_out, trans_out, bpsk_done, trans_done);
channel DUT4 (clk, trans_done, trans_out, reset, chan_out, chan_done);
receiver DUT5 (clk, reset, chan_done,chan_out,receiver_out, receiver_done);
demodulator DUT6(receiver_out, clk, reset, receiver_done, demod_done, demod_out);    //input signed [1:0] receiver_out, input clk, input reset, input demod_start, output reg demod_done, output reg [15:0] demod_out
error_decoder DUT7(clk,reset, demod_out, dec_out, demod_done, dec_done);
decompression DUT8(dec_out, reset, decomp_out, clk, dec_done, decomp_done);  /*input [10:0] dec_out, input reset,
			output reg [23:0] decompre_out,
			input clk, 
			input decompre_start,
			output reg decompre_done*/
initial begin
clk =1;
#5;

forever begin

clk = 0;
#5;
clk=1;
#5;
end
end

initial begin


reset = 0;
#30;
reset = 1;
comp_start = 0;
#20;

signal_in = 24'b0101_0101_0101_0101_0101_0101;

comp_start =1;
//bpsk_out = 1;
#10;
comp_start = 0;
#20000;

signal_in = 24'b10101010_10101010_10101010;
//bpsk_out = -1;
comp_start =1;
#10;
comp_start = 0;
#20000;

$stop;
end
endmodule

