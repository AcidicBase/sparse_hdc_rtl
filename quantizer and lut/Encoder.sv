`include "Quantizer.sv"
`include "IM_Fetch.sv"

module Encoder(input_value, hv, clk, en, nrst);
  input [10:0][31:0]input_value;
  input clk, en, nrst;
  output reg [10:0][4999:0]hv;
  wire [10:0][3:0]quantized_value_level;
  wire [10:0][4999:0]im_fetch_output;
  
  // Declare and initialize Item Memory
  reg [4999:0] im_hvs [9:0];    
  
  generate
    genvar i;
    for (i=0; i<10; i=i+1) begin : qtzs
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
    for (j=0; j<10; j=j+1) begin : ims
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
        .level_hv(im_fetch_output[j][4999:0])
      );
    end
  endgenerate
  
  initial begin
    $readmemb("im.txt", im_hvs);
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