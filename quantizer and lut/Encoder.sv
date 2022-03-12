`include "Quantizer.sv"
`include "IM_Fetch.sv"

module Encoder(input_value, hv, clk, en, nrst);
  input [3:0][31:0]input_value;
  input clk, en, nrst;
  output reg [3:0][63:0]hv;
  wire [3:0][3:0]quantized_value_level;
  wire [3:0][63:0]im_fetch_output;
  
  // Declare and initialize Item Memory
  reg [63:0] im_hvs [9:0];    
  
  generate
    genvar i;
    for (i=0; i<4; i=i+1) begin : qtzs
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
    for (j=0; j<4; j=j+1) begin : ims
      IM_Fetch im(
        .im1(im_hvs[0]),
        .im2(im_hvs[1]),
        .im3(im_hvs[2]),
        .im4(im_hvs[3]),
        .im5(im_hvs[4]),
        .im6(im_hvs[5]),
        .im7(im_hvs[6]),
        .im8(im_hvs[7]),
        .im9(im_hvs[8]),
        .im10(im_hvs[9]),
        .qlevel(quantized_value_level[j][3:0]),
        .en(en),
        .nrst(nrst),
        .level_hv(im_fetch_output[j][63:0])
      );
    end
  endgenerate
  
  initial begin
    im_hvs[0] = 64'b1111111111111111000000000000000011111111111111110000000000000000;
    im_hvs[1] = 64'b0000111111111111110000000000000100001111111111111100000000000001;
    im_hvs[2] = 64'b0111111111000000000000000000001001111111110000000000000000000010;
    im_hvs[3] = 64'b0000000000111111111111000000001100000000001111111111110000000011;
    im_hvs[4] = 64'b0011111111110000000000000000010000111111111100000000000000000100;
    im_hvs[5] = 64'b0000000000000111111000000000010100000000000001111110000000000101;
    im_hvs[6] = 64'b0111111111000000000000000000011001111111110000000000000000000110;
    im_hvs[7] = 64'b0000000000011111110000000000011100000000000111111100000000000111;
    im_hvs[8] = 64'b0000001111111000000000000000100000000011111110000000000000001000;
    im_hvs[9] = 64'b0000000000000011110000000000100100000000000000111100000000001001;
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