`timescale 1ps / 1ps
`include "class_hv_gen_top.sv"
`define CLK_PERIOD 10

module tb_class_hv_gen_top();
    logic clk;
    logic nrst;
    logic en;
    logic start_class_gen;
    logic training_dataset_finished;      // assert (6,238*10) CCs after start_class_gen = 1
    logic [DIMS_PER_CC-1:0] input_hv_chunk;
    logic [5:0] class_select_bits;
    wire [SEQ_CYCLE_COUNT-1:0][DIMS_PER_CC-1:0] bin_class_hvs [0:25];
    wire class_gen_done;
    
    class_hv_gen_top CLASS_HV_GEN_TOP1(
        .clk(clk),
        .nrst(nrst),
        .en(en),
        .start_class_gen(start_class_gen),
        .training_dataset_finished(training_dataset_finished),
        .input_hv_chunk(input_hv_chunk),
        .class_select_bits(class_select_bits),
        .bin_class_hvs(bin_class_hvs),
        .class_gen_done(class_gen_done)
    );
    
    always begin
        #(`CLK_PERIOD/2) clk = ~clk;
    end
       
    initial begin
    
        clk = 0;
        nrst = 0;
        en = 0;
        start_class_gen = 0;
        training_dataset_finished = 0;
        input_hv_chunk = 0;
        class_select_bits = 0;     
              
        #(`CLK_PERIOD/2)
        nrst = 1;
        en = 1;
        start_class_gen = 1;
        class_select_bits = 0;                  // letter A (first class)
        input_hv_chunk = $random;               // first 7 bits of encoded hv

        #`CLK_PERIOD
        start_class_gen = 0;
        input_hv_chunk = $random;               // second 7 bits of encoded hv

        // iterate for (26 rows of ISOLET x 10 CCs - 2) ---> change this to (6038 x 10 - 2)
        for(int i = 0; i < (TRAINING_DATAPOINTS_COUNT*DIMS_PER_CC-2); i++) begin
            #`CLK_PERIOD
            input_hv_chunk = $random;
        end

        #`CLK_PERIOD
        training_dataset_finished = 1;

        #`CLK_PERIOD
        training_dataset_finished = 0;

        // binarization happens next (thes lasts for 260 CCs)   
        
        #(`CLK_PERIOD*30)                         
        $finish;
    end
    
    
endmodule