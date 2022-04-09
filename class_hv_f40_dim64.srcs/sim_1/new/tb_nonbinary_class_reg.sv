`timescale 1ps / 1ps
`include "nonbinary_class_reg.sv"
`define CLK_PERIOD 100

module tb_nonbinary_class_reg();
    logic clk;
    logic nrst;
    logic en;
    logic adjusting_nonbin_class_hvs;
    logic [5:0] class_select_bits;
    logic [3:0] nonbin_ctr;    
    logic[DIMS_PER_CC-1:0][BITWIDTH_PER_DIM-1:0] nonbin_class_reg_in;
    wire [DIMS_PER_CC-1:0][BITWIDTH_PER_DIM-1:0] nonbin_class_reg_out;

    nonbinary_class_reg NONBIN_CLASS_1(
        .clk(clk),
        .nrst(nrst),
        .en(en),
        .adjusting_nonbin_class_hvs(adjusting_nonbin_class_hvs),
        .class_select_bits(class_select_bits),
        .nonbin_ctr(nonbin_ctr),
        .nonbin_class_reg_in(nonbin_class_reg_in),
        .nonbin_class_reg_out(nonbin_class_reg_out)
    );
    
    always begin
        #(`CLK_PERIOD/2) clk = ~clk;
    end
      
    initial begin
        clk = 0;
        nrst = 0;
        en = 0;
        adjusting_nonbin_class_hvs = 0;
        class_select_bits = 0;
        nonbin_ctr = 0;
        nonbin_class_reg_in = 0;      
              
        #(`CLK_PERIOD/2)
        nrst = 1;
        en = 1;
        adjusting_nonbin_class_hvs = 1;

        for (int i = 0; i < 2; i++) begin
            for(int j = 0; j < SEQ_CYCLE_COUNT; j++) begin
                nonbin_ctr = 0; //j
                #(`CLK_PERIOD)
                class_select_bits = 0; //i              
                nonbin_class_reg_in = $random;
            end
        end

                
        #`CLK_PERIOD
        adjusting_nonbin_class_hvs = 0;
    
        #(`CLK_PERIOD)
        $finish;
    end
     
endmodule

