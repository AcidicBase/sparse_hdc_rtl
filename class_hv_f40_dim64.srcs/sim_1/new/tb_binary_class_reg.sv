`timescale 1ps / 1ps
`include "binary_class_reg.sv"
`define CLK_PERIOD 100

  
module tb_binary_class_reg();
    logic clk;
    logic nrst;
    logic en;
    logic binarizing_class_hvs;
    logic [5:0] class_select_bits;
    logic [3:0] bin_ctr;    
    logic[DIMS_PER_CC-1:0][BITWIDTH_PER_DIM-1:0] bin_class_reg_in;
    wire [SEQ_CYCLE_COUNT-1:0][DIMS_PER_CC-1:0][BITWIDTH_PER_DIM-1:0] bin_class_hvs [0:25];

    binary_class_reg BIN_CLASS_1(
        .clk(clk),
        .nrst(nrst),
        .en(en),
        .binarizing_class_hvs(binarizing_class_hvs),
        .class_select_bits(class_select_bits),
        .bin_ctr(bin_ctr),
        .bin_class_reg_in(bin_class_reg_in),
        .bin_class_hvs(bin_class_hvs)
    );
    
    always begin
        #(`CLK_PERIOD/2) clk = ~clk;
    end
      
    initial begin
        clk = 0;
        nrst = 0;
        en = 0;
        binarizing_class_hvs = 0;
        class_select_bits = 0;
        bin_ctr = 0;
        bin_class_reg_in = 0;      
              
        #(`CLK_PERIOD/2)
        nrst = 1;
        en = 1;
        binarizing_class_hvs = 1;


        for(int j = 0; j < SEQ_CYCLE_COUNT; j++) begin
            bin_ctr = j;
            #(`CLK_PERIOD)
            class_select_bits = 0;            
            bin_class_reg_in = $random;
        end
       


                
        #(`CLK_PERIOD*10)
        binarizing_class_hvs = 0;
    
        #(`CLK_PERIOD)
        $finish;
    end

endmodule
