`timescale 1ps / 1ps
`include "class_fsm.sv"
`define CLK_PERIOD 100


module tb_class_fsm();
    logic clk;
    logic nrst;
    logic en;
    logic start_class_gen;
    logic training_dataset_finished;  
    wire [3:0] nonbin_ctr;   
    wire [3:0] bin_ctr;
    wire adjusting_nonbin_class_hvs;
    wire binarizing_class_hvs;
    wire class_gen_done;   
  
    class_fsm C_FSM_1(
        .clk(clk),
        .nrst(nrst),
        .en(en),
        .start_class_gen(start_class_gen),
        .training_dataset_finished(training_dataset_finished),
        .nonbin_ctr(nonbin_ctr),
        .bin_ctr(bin_ctr),
        .adjusting_nonbin_class_hvs(adjusting_nonbin_class_hvs),
        .binarizing_class_hvs(binarizing_class_hvs),
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
              
              
        #(`CLK_PERIOD/2)
        nrst = 1;
        en = 1;
        start_class_gen = 1;
        
        #`CLK_PERIOD
        start_class_gen = 0;
                     
        #((TRAINING_DATAPOINTS_COUNT*SEQ_CYCLE_COUNT*`CLK_PERIOD)-`CLK_PERIOD)  //  assert (3*10) CCs after start_class_gen = 1
        training_dataset_finished = 1;
    
        #`CLK_PERIOD
        training_dataset_finished = 0;  
    
        #(`CLK_PERIOD*30)
        $finish;
    end
     
endmodule

