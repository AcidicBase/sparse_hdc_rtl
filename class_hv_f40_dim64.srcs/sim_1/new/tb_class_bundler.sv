`timescale 1ps / 1ps
`include "class_bundler.sv"
`define CLK_PERIOD 1000

module tb_class_bundler();
    logic [DIMS_PER_CC-1:0] input_hv_chunk;
    logic [DIMS_PER_CC-1:0][7:0] stored_hv_chunk;
    logic [DIMS_PER_CC-1:0][7:0] sum;
    
    class_bundler C_BUNDLE_1(
        .input_hv_chunk(input_hv_chunk),
        .stored_hv_chunk(stored_hv_chunk),
        .sum(sum)
    );
    

    initial begin

        input_hv_chunk = 7'b0000000;
        stored_hv_chunk = 56'h02020202020202;
        
        #`CLK_PERIOD
        input_hv_chunk = 7'b1111111;
        stored_hv_chunk = 56'h02020202020202;
        
        #`CLK_PERIOD
        stored_hv_chunk = 56'h04040404040404;
               
        #`CLK_PERIOD
        stored_hv_chunk = 56'h05050505050505;
        
        #`CLK_PERIOD
        input_hv_chunk = 7'b1010101;
        #10
        $finish;
    end
     
endmodule