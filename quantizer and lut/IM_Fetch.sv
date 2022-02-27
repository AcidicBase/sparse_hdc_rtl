module IM_Fetch(
  im1, im2, im3, im4, im5, im6, im7, im8, im9, im10,
  qlevel, level_hv, en, nrst);

  input [9:0] im1, im2, im3, im4, im5, im6, im7, im8, im9, im10;
  input [3:0]qlevel;
  input en, nrst;
  output reg [9:0] level_hv;
  
  always@(*) begin
    if (!nrst)
      level_hv[9:0] = 10'b0000000000;
    else begin
      if(en) begin
        case(qlevel)
          4'b0000 : level_hv[9:0] = im1;
          4'b0001 : level_hv[9:0] = im2;
          4'b0010 : level_hv[9:0] = im3;
          4'b0011 : level_hv[9:0] = im4;
          4'b0100 : level_hv[9:0] = im5;
          4'b0101 : level_hv[9:0] = im6;
          4'b0110 : level_hv[9:0] = im7;
          4'b0111 : level_hv[9:0] = im8;
          4'b1000 : level_hv[9:0] = im9;
          4'b1001 : level_hv[9:0] = im10;
          default : level_hv[9:0] = 10'b0000000000;
        endcase
      end
    end
  end
endmodule