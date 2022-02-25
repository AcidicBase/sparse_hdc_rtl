`include "Quantizer.v"
`include "IM_Fetch.v"

module Encoder(input_value, hv, clk, en, nrst);
  input [616:0][31:0]input_value;
  input clk, en, nrst;
  output reg [616:0][9:0]hv;
  wire [616:0][3:0]quantized_value_level;
  wire [616:0][9:0]im_fetch_output;
  
  // Declare and initialize Item Memory
  reg [9:0][9:0] im_hvs;    
  
  generate
    genvar i;
    for (i=0; i<617; i=i+1) begin : qtzs
      Quantizer qtz(
        .input_value(input_value[i][31:0]),
        .nrst(nrst),
        .en(en),
        .quantized_value_level(quantized_value_level[i][3:0])
      );
    end
  endgenerate
  
  generate
    genvar j;
    for (j=0; j<617; j=j+1) begin : ims
      IM_Fetch im(
        .im_hvs(im_hvs),
        .qlevel(quantized_value_level[j][3:0]),
        .en(en),
        .nrst(nrst),
        .level_hv(im_fetch_output[j][9:0])
      );
    end
  endgenerate
  
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
      hv <= 0;
    else
      if(en) begin
        hv <= im_fetch_output;
      end
  end
endmodule