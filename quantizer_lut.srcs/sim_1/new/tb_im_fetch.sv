// Set to 1ns later; vivado limits simulation until 1ms
`timescale 1ps / 1ps
//`include "im_fetch.sv"

module tb_im_fetch();
    logic nrst;
    logic en;
    logic [3:0] qlevel;
    logic [HV_DIM-1:0] im1;
    logic [HV_DIM-1:0] im2;
    logic [HV_DIM-1:0] im3;
    logic [HV_DIM-1:0] im4;
    logic [HV_DIM-1:0] im5;
    logic [HV_DIM-1:0] im6;
    logic [HV_DIM-1:0] im7;
    logic [HV_DIM-1:0] im8;
    logic [HV_DIM-1:0] im9;
    logic [HV_DIM-1:0] im10;
    wire [HV_DIM-1:0] level_hv;
  
  im_fetch IM1(
    .im1(im1),
    .im2(im2),
    .im3(im3),
    .im4(im4),
    .im5(im5),
    .im6(im6),
    .im7(im7),
    .im8(im8),
    .im9(im9),
    .im10(im10),
    .qlevel(qlevel),
    .en(en),
    .nrst(nrst),
    .level_hv(level_hv)
  );
  
  initial begin
    
    im1 = 1;
    im2 = 2;
    im3 = 3;
    im4 = 4;
    im5 = 5;
    im6 = 6;
    im7 = 7;
    im8 = 8;
    im9 = 9;
    im10 = 10;
    
    qlevel = 0;
    en = 1;
    nrst = 0;
    #5
    
    // Scenario : When qlevel is in range
    nrst = 1;
    qlevel = 4'b0001;
    
    #5
    $display("Expected : %b \t  Actual : %b", 10'b1111111111, level_hv);
 
    qlevel = 4'b0101;
    
    #5
    $display("Expected : %b \t  Actual : %b",  10'b1000000101, level_hv);
    
    #5
    $finish;
  end
endmodule
  
  