// Limit of Vivado is 1000 ns (1ms).Change timescale to 1ps for testing. 
`timescale 1ps / 1ps
`include "encoding_top.sv"

module tb_encoding_top();
    logic clk;
    logic nrst;
    logic en;
    logic start_encoding;
    logic [HV_DIM-1:0] level_HVs [0:FEATURE_COUNT-1];
    wire [HV_DIM-1:0] encoded_HV;
     
    // instantiate
    encoding_top ENCODING_TOP(
        .clk(clk),
        .nrst(nrst),
        .en(en),
        .start_encoding(start_encoding),
        .level_HVs(level_HVs),    
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
        
        #25 //@25 assert nrst
        nrst = 1'b1;
        #75 //@100 assert enable
        en = 1'b1;
        #50 //@150 
        
        // Input 1
        $readmemb("first_617_5k_levelHVs.mem", level_HVs);      
        #50 start_encoding = 1'b1; // #50 if start_encoding were to be asserted at the negedge of the clk
        #100 start_encoding = 1'b0;

        // Input 2
        #250
        $readmemb("second_617_5k_levelHVs.mem", level_HVs);      
        #50 start_encoding = 1'b1; // #50 if start_encoding were to be asserted at the negedge of the clk
        #100 start_encoding = 1'b0;


        #100 
        $finish;
    end

endmodule
