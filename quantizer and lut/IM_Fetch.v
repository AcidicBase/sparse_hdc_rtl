module IM_Fetch(qlevel, level_hv, en, nrst);
  input [3:0]qlevel;
  input en, nrst;
  output reg [9:0]level_hv;
  
  // Item Memory
  reg [9:0]hv0 = 10'b0000000000;
  reg [9:0]hv1 = 10'b0000000001;
  reg [9:0]hv2 = 10'b0000000010;
  reg [9:0]hv3 = 10'b0000000011;
  reg [9:0]hv4 = 10'b0000000100;
  reg [9:0]hv5 = 10'b0000000101;
  reg [9:0]hv6 = 10'b0000000110;
  reg [9:0]hv7 = 10'b0000000111;
  reg [9:0]hv8 = 10'b0000001000;
  reg [9:0]hv9 = 10'b0000001001;
  
  always@(*) begin
    if (!nrst)
      level_hv = 10'b0000000000;
    else begin
      if(en) begin
        case(qlevel)
          4'b0000 : level_hv = hv0;
          4'b0001 : level_hv = hv1;
          4'b0010 : level_hv = hv2;
          4'b0011 : level_hv = hv3;
          4'b0100 : level_hv = hv4;
          4'b0101 : level_hv = hv5;
          4'b0110 : level_hv = hv6;
          4'b0111 : level_hv = hv7;
          4'b1000 : level_hv = hv8;
          4'b1001 : level_hv = hv9;
          default : level_hv = 10'b0000000000;
        endcase
      end
    end
  end
endmodule