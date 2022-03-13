// Limit of Vivado is 1000 ns (1ms).Change timescale to 1ps for testing. 
`timescale 1ps / 1ps
`include "encoding_top.sv"

module tb_encoding_top();
    logic clk;
    logic nrst;
    logic en;
    logic start_encoding;
    logic [HV_DIM-1:0] level_HVs [0:FEATURE_COUNT-1];
    wire encoding_done;
    wire [HV_DIM-1:0] encoded_HV;
     
    // instantiate
    encoding_top ENCODING_TOP(
        .clk(clk),
        .nrst(nrst),
        .en(en),
        .start_encoding(start_encoding),
        .level_HVs(level_HVs),
        .encoding_done(encoding_done),    
        .encoded_HV(encoded_HV)   
    );   
     

    always begin
        #50 clk = ~clk;
    end

    initial begin                    
        clk = 1'b0;
        nrst = 1'b0;
        en = 1'b0;
        start_encoding = 1'b0;
        
        for (int i = 0; i < FEATURE_COUNT; i++) begin
            level_HVs[i] = 0;
        end
        
        $display(ENCODING_BIT_THR);
        
        #25  nrst = 1'b1;
        #75  en = 1'b1;
        #50
            
        // Input 1
        $readmemb("C:/Users/User/Documents/Verilog Saves/sample_encoding/sample_encoding.srcs/sim_1/new/tb_encoding_top_f40_d64.mem", level_HVs);     
        start_encoding = 1'b1;
        #100 start_encoding = 1'b0;

        #1250 en = 1'b0;
        
        #50 
        $finish;
    end

endmodule
