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
          4'b0000 : level_hv = im1;
          4'b0001 : level_hv = im2;
          4'b0010 : level_hv = im3;
          4'b0011 : level_hv = im4;
          4'b0100 : level_hv = im5;
          4'b0101 : level_hv = im6;
          4'b0110 : level_hv = im7;
          4'b0111 : level_hv = im8;
          4'b1000 : level_hv = im9;
          4'b1001 : level_hv = im10;
          default : level_hv = 0;
        endcase
      end
    end
  end
endmodule