`timescale 1ps / 1ps
`include "am_tree_adder.sv"
`define CLK_PERIOD 100

module tb_am_tree_adder();
    logic clk;
    logic nrst;
    logic comparing_query_hv_with_class_hv; 
    logic inferring_class;
    logic [DIMS_PER_CC-1:0] and_array_out;
    wire [12:0] similarity_value;

    am_tree_adder AM_TREE_ADD1(
        .clk(clk),
        .nrst(nrst),
        .comparing_query_hv_with_class_hv(comparing_query_hv_with_class_hv),
        .inferring_class(inferring_class),
        .and_array_out(and_array_out),
        .similarity_value(similarity_value)
    );
      
    always begin
        #(`CLK_PERIOD/2) clk = ~clk;
    end
  
      
    initial begin
        clk = 0;
        nrst = 0;
        comparing_query_hv_with_class_hv = 0;  
        inferring_class = 0;
        and_array_out = 0;        
              
        #(`CLK_PERIOD/2)
        nrst = 1;
        comparing_query_hv_with_class_hv = 1;
        and_array_out = $random;              
    
        for(int i = 0; i < DIMS_PER_CC-1; i++) begin
            #`CLK_PERIOD
            and_array_out = $random;
        end
        
        #`CLK_PERIOD
        #`CLK_PERIOD
        and_array_out = 0;
        comparing_query_hv_with_class_hv = 0; 
        inferring_class = 1; 
        
        #`CLK_PERIOD
        inferring_class = 0; 
    
        #(`CLK_PERIOD)
        $finish;
    end
     
endmodule