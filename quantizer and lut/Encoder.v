`include "Quantizer.v"
`include "IM_Fetch.v"

module Encoder(input_value, hv, clk, en, nrst);
  input [31:0]input_value;
  input clk, en, nrst;
  output reg [9:0]hv;
  wire [3:0]quantized_value_level;
  wire [9:0]im_fetch_output;
  
  // Declare and initialize Item Memory
  reg [9:0][9:0] im_hvs;    
  
  Quantizer qtz(
    .input_value(input_value),
    .nrst(nrst),
    .en(en),
    .quantized_value_level(quantized_value_level)
  );
  
  IM_Fetch im(
    .im_hvs(im_hvs),
    .qlevel(quantized_value_level),
    .en(en),
    .nrst(nrst),
    .level_hv(im_fetch_output)
  );
  
  initial begin
    im_hvs[0][9:0] = 10'b0000000000;
    im_hvs[1][9:0] = 10'b0000000001;
    im_hvs[2][9:0] = 10'b0000000010;
    im_hvs[3][9:0] = 10'b0000000011;
    im_hvs[4][9:0] = 10'b0000000100;
    im_hvs[5][9:0] = 10'b0000000101;
    im_hvs[6][9:0] = 10'b0000000110;
    im_hvs[7][9:0] = 10'b0000000111;
    im_hvs[8][9:0] = 10'b0000001000;
    im_hvs[9][9:0] = 10'b0000001001;
  end
  
  always@(posedge clk) begin
    if(!nrst)
      hv = 10'b0000000000;
    else
      if(en)
        hv = im_fetch_output;
  end
endmodule