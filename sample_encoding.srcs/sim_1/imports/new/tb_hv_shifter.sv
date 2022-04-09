`timescale 1ns / 1ps
`include "hv_shifter.sv"

module tb_hv_shifter();
    logic clk;
    logic nrst;
    logic en; 
    logic [HV_DIM-1:0] level_hv;
    wire [HV_DIM-1:0] shifted_hv; 
    wire [HV_DIM-1:0] checker_hv;
    
    // initialize
    hv_shifter #(.SHIFT(SHIFT_0))HV_SHIFTER_0(
        .clk(clk),
        .nrst(nrst),
        .en(en),
        .level_hv(level_hv),
        .shifted_hv(shifted_hv) 
    );
    
    // clock toggle (100 ns period = 10 MHz freq)
    always begin
        #50 clk = ~clk;
    end    
    
    // Ten 8-bit level_hvs 
    byte level_hvs [10] = '{123, 467, 34, 231, 76, 2, 42, 78, 103, 95};
      
    // checkher_hv 
    assign checker_hv = (level_hv >> SHIFT_0) + (level_hv << (HV_DIM - SHIFT_0));   
     
    initial begin
        clk = 1'b0;
        nrst = 1'b0;
        en = 1'b0;        
        #25 //@25
        nrst = 1'b1;
        #75 //@100
        en = 1'b1;            
         
        $display("Time \t shifted_hv \t checker_hv \t Working?");
        $display("@%g \t %d \t %d \t %b", $time, shifted_hv, checker_hv, shifted_hv==checker_hv);
        
        level_hv = level_hvs[0];        
        #100 level_hv = level_hvs[1];
        $display("@%g \t %d \t %d \t %b", $time, shifted_hv, checker_hv, shifted_hv==checker_hv);
        #100 level_hv = level_hvs[2];
        $display("@%g \t %d \t %d \t %b", $time, shifted_hv, checker_hv, shifted_hv==checker_hv);
        #100 level_hv = level_hvs[3];
        $display("@%g \t %d \t %d \t %b", $time, shifted_hv, checker_hv, shifted_hv==checker_hv);
        #100 level_hv = level_hvs[4];
        $display("@%g \t %d \t %d \t %b", $time, shifted_hv, checker_hv, shifted_hv==checker_hv);
        #100 level_hv = level_hvs[5];
        $display("@%g \t %d \t %d \t %b", $time, shifted_hv, checker_hv, shifted_hv==checker_hv);
        #100 level_hv = level_hvs[6];
        $display("@%g \t %d \t %d \t %b", $time, shifted_hv, checker_hv, shifted_hv==checker_hv);
        #100 level_hv = level_hvs[7];
        $display("@%g \t %d \t %d \t %b", $time, shifted_hv, checker_hv, shifted_hv==checker_hv);
        #100 level_hv = level_hvs[8];
        $display("@%g \t %d \t %d \t %b", $time, shifted_hv, checker_hv, shifted_hv==checker_hv);
        #100 level_hv = level_hvs[9];
        $display("@%g \t %d \t %d \t %b", $time, shifted_hv, checker_hv, shifted_hv==checker_hv);
                       
        #100
        $finish;    
    end
    
endmodule