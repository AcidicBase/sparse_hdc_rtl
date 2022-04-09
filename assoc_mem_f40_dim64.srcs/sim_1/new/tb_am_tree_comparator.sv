`timescale 1ps / 1ps
`include "am_tree_comparator.sv"
`define CLK_PERIOD 100

module tb_am_tree_comparator();
    logic [12:0] similarity_values [0:25];
    logic [4:0] class_inference;

    am_tree_comparator AM_COMP1(
        .similarity_values(similarity_values),
        .class_inference(class_inference)
    );
      
    initial begin
        inferring_class = 0;
        for(int i = 0; i < 26; i++) begin
            similarity_values[i] = 0;
        end
                    
        #(`CLK_PERIOD/2)
        inferring_class = 1;
        for(int i = 0; i < 26; i++) begin
            similarity_values[i] = $urandom;
        end       
               
        #`CLK_PERIOD
        inferring_class = 0;
    
        #(`CLK_PERIOD)
        $finish;
    end
     
endmodule

