`timescale 1ps / 1ps
`include "am_and_array.sv"
`define CLK_PERIOD 100

module tb_am_and_array();
    logic comparing_query_hv_with_class_hv;
    logic [3:0] query_ctr;  
    logic [DIMS_PER_CC-1:0] query_hv_segment;
    logic [SEQ_CYCLE_COUNT-1:0][DIMS_PER_CC-1:0] binary_class_hvs [0:25];
    wire [DIMS_PER_CC-1:0] and_array_out [0:25];

    am_and_array AM_AND1(
        .comparing_query_hv_with_class_hv(comparing_query_hv_with_class_hv),
        .query_ctr(query_ctr),
        .query_hv_segment(query_hv_segment),
        .binary_class_hvs(binary_class_hvs),
        .and_array_out(and_array_out)
    );
      
    initial begin
        comparing_query_hv_with_class_hv = 0;
        query_ctr = 0;
        query_hv_segment = 0;
        
        for(int j = 0; j < 26; j++) begin
            binary_class_hvs[j] = $random;
        end   
              
        #(`CLK_PERIOD/2)
        comparing_query_hv_with_class_hv = 1;
        
        for(int i = 0; i < SEQ_CYCLE_COUNT; i++) begin
            query_ctr = i;
            #(`CLK_PERIOD)
            query_hv_segment = $random;              
        end
               
        #`CLK_PERIOD
        comparing_query_hv_with_class_hv = 0;
    
        #(`CLK_PERIOD)
        $finish;
    end
     
endmodule

