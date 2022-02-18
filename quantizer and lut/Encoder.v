`include "Quantizer.v"
`include "IM_Fetch.v"

module Encoder(input_value, hv, clk, en, nrst);
  input [31:0]input_value;
  input clk, en, nrst;
  output reg [9:0]hv;
  wire [3:0]quantized_value_level;
  wire [9:0]im_fetch_output;
  
  Quantizer qtz(
    .input_value(input_value),
    .nrst(nrst),
    .en(en),
    .quantized_value_level(quantized_value_level)
  );
  
  IM_Fetch im(
    .qlevel(quantized_value_level),
    .en(en),
    .nrst(nrst),
    .level_hv(im_fetch_output)
  );
  
  always@(posedge clk) begin
    if(!nrst)
      hv = 10'b0000000000;
    else
      if(en)
        hv = im_fetch_output;
  end
endmodule