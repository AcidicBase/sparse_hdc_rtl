// Set to 1ns later; vivado limits simulation until 1ms
`timescale 1ps / 1ps
`include "hv_shifter.sv"

module tb_hv_shifter();
    logic clk;
    logic nrst;
    logic en; 
    logic start_shifting;
    logic [HV_DIM-1:0] level_hv;
    wire [HV_DIM-1:0] shifted_hv; 
    
    wire [HV_DIM-1:0] checker_hv;
    wire fully_functional;
    
    // Limit to 4 level HVs (4 features)
    logic [HV_DIM-1:0] level_hvs [0:3];
    
    // instantiate hv_shifter
    hv_shifter #(.SHIFT(SHIFTS[0]))HV_SHIFTER_0(
        .clk(clk),
        .nrst(nrst),
        .en(en),
        .start_shifting(start_shifting),
        .level_hv(level_hv),
        .shifted_hv(shifted_hv) 
    );
    
    // clock toggle (100 ns period = 10 MHz freq)
    always begin
        #50 clk = ~clk;
    end    
      
    // checker_hv 
    assign checker_hv = (level_hv >> SHIFTS[0]) + (level_hv << (HV_DIM - SHIFTS[0]));     
    assign fully_functional = (shifted_hv == checker_hv) ? 1'b1:1'b0;
                     
        
    initial begin
        clk = 1'b0;
        nrst = 1'b0;
        en = 1'b0; 
        start_shifting = 1'b0;
        level_hv = '0; 
         
        // Load the level hvs     
        $readmemb("C:/Users/User/Documents/Verilog Saves/sample_encoding/sample_encoding.srcs/sim_1/new/level_hvs.mem", level_hvs);
        $display(level_hvs);      
                     
        #25 //@25ns
        nrst = 1'b1;
        #75 //@100ns
        en = 1'b1;            
                
        // First input
        #50 level_hv = level_hvs[0];   
        start_shifting = 1'b1;
        #100 start_shifting = 1'b0;
        
        // Second input
        #100 level_hv = level_hvs[1];   
        start_shifting = 1'b1;
        #100 start_shifting = 1'b0;
        
        // Third input
        #100 level_hv = level_hvs[2];   
        start_shifting = 1'b1;
        #100 start_shifting = 1'b0;
        
        // Fourth input
        #100 level_hv = level_hvs[3];   
        start_shifting = 1'b1;
        #100 start_shifting = 1'b0;
                  
                       
        #100
        $finish;    
    end
    
endmodule
