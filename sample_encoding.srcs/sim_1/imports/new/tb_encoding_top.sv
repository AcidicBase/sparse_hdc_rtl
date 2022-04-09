`timescale 1ns / 1ps

module tb_hv_shifter();
    logic clk;
    logic nrst;
    logic en;
    
    logic [HV_DIM-1:0] level_HV_0;
    logic [HV_DIM-1:0] level_HV_1;
    logic [HV_DIM-1:0] level_HV_2;
    
//    logic [HV_DIM-1:0] level_HVs [FEATURE_COUNT-1:0];                  // extend to 616
//    wire [HV_DIM-1:0] encoded_HV;   
    
//    // initialize 
//    encoding_top ENCODING_TOP_0(.clk(clk),
//        .nrst(nrst),
//        .en(en),
        
        
//        .level_HV_0(level_HV_0),
//        .level_HV_1(level_HV_1),
//        .level_HV_2(level_HV_2),
       
////        .level_HV_0(level_HVs[0]),
////        .level_HV_1(level_HVs[1]),
////        .level_HV_2(level_HVs[2]),
//        .encoded_HV(encoded_HV)
//    );
    
//    // clock toggle
//    always begin
//        #1 clk = ~clk;
//    end
    
//    initial begin
//        clk = 0;
//        nrst = 0;
//        en = 0;     
//        #2
//        nrst = 1;
        
//        level_HV_0 = 10'b1000000000; 
//        level_HV_1 = 10'b1000000000; 
//        level_HV_2 = 10'b1000000000;  
////        level_HVs[0] = 10'b1000000000; 
////        level_HVs[1] = 10'b1000000000; 
////        level_HVs[2] = 10'b1000000000;       
//        #2
//        en = 1; 
        
////        $display(level_HVs);
//        #10
//        $finish;    
//    end


endmodule
