module IM_Fetch(
  im1, im2, im3, im4, im5, im6, im7, im8, im9, im10,
  qlevel, level_hv, en, nrst);

  input [63:0] im1, im2, im3, im4, im5, im6, im7, im8, im9, im10;
  input [3:0]qlevel;
  input en, nrst;
  output reg [63:0] level_hv;
  
  always@(*) begin
    if (!nrst)
      level_hv = 0;
    else begin
      if(en) begin
        case(qlevel)
          1 : level_hv = im1;
          2 : level_hv = im2;
          3 : level_hv = im3;
          4 : level_hv = im4;
          5 : level_hv = im5;
          6 : level_hv = im6;
          7 : level_hv = im7;
          8 : level_hv = im8;
          9 : level_hv = im9;
          10 : level_hv = im10;
          default : level_hv = 0;
        endcase
      end
    end
  end
  endmodule
