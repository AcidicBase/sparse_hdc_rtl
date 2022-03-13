// Set to 1ns later; vivado limits simulation until 1ms
`timescale 1ps / 1ps
`include "bundler.sv" 

module tb_bundler();
    logic clk;
    logic nrst;
    logic en; 
    logic start_bundling;
    logic [FEATURE_COUNT-1:0] bits_to_bundle;
    wire bundling_done;
    wire thresholded_bit; 
    
    // instantiate bundler
    bundler BUNDLER_0(
        .clk(clk),
        .nrst(nrst),
        .en(en),
        .start_bundling(start_bundling),
        .bits_to_bundle(bits_to_bundle),  
        .bundling_done(bundling_done),    
        .thresholded_bit(thresholded_bit)
     );

    always begin
        #50 clk = ~clk;
    end
        
    initial begin
        clk = 1'b0;
        nrst = 1'b0;
        en = 1'b0; 
        start_bundling = 1'b0;
        bits_to_bundle = '0;
         
        // Load the level hvs       
//        $readmemb("C:/Users/User/Documents/Verilog Saves/sample_encoding/sample_encoding.srcs/sim_1/new/tb_bundler_inputs.mem", bits_to_bundles);              
        #25
        nrst = 1'b1;
        #75
        en = 1'b1;            
                
        // First input
        # 50 bits_to_bundle = 'hF5AC39B72F;
        start_bundling = 1'b1;
        #1000 start_bundling = 1'b0;
        
        
//        // Second input
//        #100 bits_to_bundle = 'hF4AC39B821;   
//        start_bundling = 1'b1;
//        #1000 start_bundling = 1'b0;
                      
        #100 en = 1'b0;               
        #50
        $finish;    
    end
    
endmodule
