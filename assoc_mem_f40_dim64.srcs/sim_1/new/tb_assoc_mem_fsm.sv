`timescale 1ps / 1ps
`include "assoc_mem_fsm.sv"
`define CLK_PERIOD 100

module tb_assoc_mem_fsm();
    logic clk;
    logic nrst;
    logic en;
    logic start_querying;
    wire [3:0] query_ctr;
    wire comparing_query_hv_with_class_hv;
    wire inferring_class;
    wire query_done;   
  
    assoc_mem_fsm AM_FSM_1(
        .clk(clk),
        .nrst(nrst),
        .en(en),
        .start_querying(start_querying),
        .query_ctr(query_ctr),
        .comparing_query_hv_with_class_hv(comparing_query_hv_with_class_hv),
        .inferring_class(inferring_class),
        .query_done(query_done)
    );
    
    always begin
        #(`CLK_PERIOD/2) clk = ~clk;
    end
      
    initial begin
        clk = 0;
        nrst = 0;
        en = 0;
        start_querying = 0;          
              
        #(`CLK_PERIOD/2)
        nrst = 1;
        en = 1;
        start_querying = 1;
        
        #`CLK_PERIOD
        start_querying = 0;               
    
        #(`CLK_PERIOD*13)
        $finish;
    end
     
endmodule

