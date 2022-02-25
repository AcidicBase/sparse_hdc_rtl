module IM_Fetch(im_hvs, qlevel, level_hv, en, nrst);
  input [9:0][9:0] im_hvs;
  input [3:0]qlevel;
  input en, nrst;
  output reg [9:0] level_hv;
  
  always@(*) begin
    if (!nrst)
      level_hv[9:0] = 10'b0000000000;
    else begin
      if(en) begin
        case(qlevel)
          4'b0000 : level_hv[9:0] = im_hvs[0][9:0];
          4'b0001 : level_hv[9:0] = im_hvs[1][9:0];
          4'b0010 : level_hv[9:0] = im_hvs[2][9:0];
          4'b0011 : level_hv[9:0] = im_hvs[3][9:0];
          4'b0100 : level_hv[9:0] = im_hvs[4][9:0];
          4'b0101 : level_hv[9:0] = im_hvs[5][9:0];
          4'b0110 : level_hv[9:0] = im_hvs[6][9:0];
          4'b0111 : level_hv[9:0] = im_hvs[7][9:0];
          4'b1000 : level_hv[9:0] = im_hvs[8][9:0];
          4'b1001 : level_hv[9:0] = im_hvs[9][9:0];
          default : level_hv[9:0] = 10'b0000000000;
        endcase
      end
    end
  end
endmodule