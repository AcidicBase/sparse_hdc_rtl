module sample(clk);
  input clk;
  
  reg [9:0] im_hvs [9:0];
  
  initial begin
    $readmemb("im.txt", im_hvs);
    $display("%b", im_hvs[3]);
  end
  
endmodule