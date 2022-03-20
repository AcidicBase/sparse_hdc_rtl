`include "Quantizer.sv"
`include "IM_Fetch.sv"

module Encoder(input_value, hv, clk, en, nrst, S_ENC_START, S_QTZ);
  input [3:0][15:0]input_value;
  input clk, en, nrst;
  input S_QTZ;
  output reg [3:0][63:0]hv;
  output reg S_ENC_START;
  wire [3:0][3:0]quantized_value_level;
  wire [3:0][63:0]im_fetch_output;

  // Declare and initialize Item Memory
  reg [63:0] im_hvs [9:0];    

  generate
    genvar i;
    for (i=0; i<4; i=i+1) begin : qtzs
      Quantizer qtz(
        .input_value(input_value[i][15:0]),
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
    im_hvs[0] = 64'b00000000000000000000000000000000000000000000000000000000000000;
			im_hvs[1] = 64'b00000000000000000000000000000000000000000000000000000000000001;
			im_hvs[2] = 64'b00000000000000000000000000000000000000000000000000000000000010;
			im_hvs[3] = 64'b00000000000000000000000000000000000000000000000000000000000011;
			im_hvs[4] = 64'b00000000000000000000000000000000000000000000000000000000000100;
			im_hvs[5] = 64'b00000000000000000000000000000000000000000000000000000000000101;
			im_hvs[6] = 64'b00000000000000000000000000000000000000000000000000000000000110;
			im_hvs[7] = 64'b00000000000000000000000000000000000000000000000000000000000111;
			im_hvs[8] = 64'b00000000000000000000000000000000000000000000000000000000001000;
			im_hvs[9] = 64'b00000000000000000000000000000000000000000000000000000000001001;
  end

  integer ctr = 0;
  always@(posedge clk) begin
    if(!nrst) begin
      hv = 0;
      S_ENC_START = 0;
    end else
      if(en && S_QTZ) begin
        hv = im_fetch_output;

        case(ctr)
          10: begin
            S_ENC_START = 1;
            ctr = 0;
          end
          default: ctr = ctr + 1;
        endcase
      end
  end

  always@(negedge clk) begin
    S_ENC_START = 0;
  end
endmodule
  
