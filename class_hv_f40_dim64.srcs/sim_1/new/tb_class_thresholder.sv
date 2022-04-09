`timescale 1ps / 1ps
`include "class_thresholder.sv"
`define CLK_PERIOD 1000



module tb_class_thresholder();
    logic clk;
    logic nrst;
    logic en;
    logic start_class_thresholding;
    logic [DIMS_PER_CC-1:0][7:0] nonbin_class_hv_segment;
    wire [DIMS_PER_CC-1:0] thresholded_hv;
    
    class_thresholder C_THR_1(
        .clk(clk),
        .nrst(nrst),
        .en(en),
        .start_class_thresholding(start_class_thresholding),
        .nonbin_class_hv_segment(nonbin_class_hv_segment),
        .thresholded_hv(thresholded_hv)
    );
    
    always begin
        #(`CLK_PERIOD/2) clk = ~clk;
    end
      
    initial begin
        clk = 0;
        nrst = 0;
        en = 0;
        start_class_thresholding = 0;
        nonbin_class_hv_segment = 0;
        
        #500
        nrst = 1;
        en = 1;
        start_class_thresholding = 1;
        
                     
        nonbin_class_hv_segment = 56'h02020202020202;
        
        #`CLK_PERIOD
        nonbin_class_hv_segment = 56'h01010606030303;
        
        #`CLK_PERIOD
        nonbin_class_hv_segment = 56'h09311505020505;
    
        #`CLK_PERIOD
        $finish;
    end
     
endmodule

