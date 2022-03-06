// Set to 1ns later; vivado limits simulation until 1ms
`timescale 1ps / 1ps
`include "acc_thr.sv"

module tb_acc_thr();
    logic clk;
    logic nrst;
    logic en; 
    logic start_acc_thr;
    logic [FEATURE_COUNT-1:0] HV_bits_per_dim;
    wire thresholded_bit; 
    
    logic [FEATURE_COUNT-1:0] HV_bits_per_dims [0:HV_DIM-1];  
    
    // instantiate acc_thr
    acc_thr ACC_THR_0(
        .clk(clk),
        .nrst(nrst),
        .en(en),
        .start_acc_thr(start_acc_thr),
        .HV_bits_per_dim(HV_bits_per_dim),           
        .thresholded_bit(thresholded_bit)
     );

    // clock toggle (100 ns period = 10 MHz freq)
    always begin
        #50 clk = ~clk;
    end
        
    initial begin
        clk = 1'b0;
        nrst = 1'b0;
        en = 1'b0; 
        start_acc_thr = 1'b0;
        HV_bits_per_dim = '0;
         
        // Load the level hvs       
        $readmemb("acc_thr_hv_bits_per_dim.mem", HV_bits_per_dims);              
        #25 //@25ns
        nrst = 1'b1;
        #75 //@100ns
        en = 1'b1;            
                
        // First input
        # 50 HV_bits_per_dim = HV_bits_per_dims[0];
        start_acc_thr = 1'b1;
        #100 start_acc_thr = 1'b0;
        
        // Second input
        #100 HV_bits_per_dim = HV_bits_per_dims[1];   
        start_acc_thr = 1'b1;
        #100 start_acc_thr = 1'b0;
        
        // Third input
        #100 HV_bits_per_dim = HV_bits_per_dims[2];   
        start_acc_thr = 1'b1;
        #100 start_acc_thr = 1'b0;
        
        // Fourth input
        #100 HV_bits_per_dim = HV_bits_per_dims[3];   
        start_acc_thr = 1'b1;
        #100 start_acc_thr = 1'b0;
                  
                       
        #100
        $finish;    
    end
    
endmodule
