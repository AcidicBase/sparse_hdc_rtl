module tb_IM_Fetch();
  reg [9:0][9:0] im_hvs;
  reg [3:0]qlevel;
  reg en, nrst;
  wire [9:0] level_hv;
  
  IM_Fetch UUT(
    .im_hvs(im_hvs),
    .qlevel(qlevel),
    .en(en),
    .nrst(nrst),
    .level_hv(level_hv)
  );
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    im_hvs[0][9:0] = 10'b1111111111;
    im_hvs[1][9:0] = 10'b1000000001;
    im_hvs[2][9:0] = 10'b1000000010;
    im_hvs[3][9:0] = 10'b1000000011;
    im_hvs[4][9:0] = 10'b1000000100;
    im_hvs[5][9:0] = 10'b1000000101;
    im_hvs[6][9:0] = 10'b1000000110;
    im_hvs[7][9:0] = 10'b1000000111;
    im_hvs[8][9:0] = 10'b1000001000;
    im_hvs[9][9:0] = 10'b1000001001;
    
    en = 1;
    nrst = 0;
    #5
    
    // Scenario : When qlevel is in range
    nrst = 1;
    qlevel = 4'b0000;
    
    #5
    $display("Extpected : %b \t  Actual : %b", 10'b1111111111, level_hv[9:0]);
 
    qlevel = 4'b0101;
    
    #5
    $display("Expected : %b \t  Actual : %b",  10'b1000000101, level_hv[9:0]);
    
    
    $finish;
  end
endmodule
  
  