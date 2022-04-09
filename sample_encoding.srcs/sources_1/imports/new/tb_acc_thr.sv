`timescale 1ns / 1ps

module tb_hv_shifter();
    logic clk;
    logic nrst;
    logic en;
    logic [FEATURE_COUNT-1:0] HV_bits_per_dim;
    wire thresholded_bit;

    wire checker_bit;

    // initialize
    acc_thr ACC_THR_0(.clk(clk),
        .nrst(nrst),
        .en(en),
        .HV_bits_per_dim(HV_bits_per_dim),
        .thresholded_bit(thresholded_bit)
    );

    // clock toggle (100 ns period = 10 MHz freq)
    always begin
        #50 clk = ~clk;
    end

    // checker bit 
    assign checker_bit = ((HV_bits_per_dim[0] + HV_bits_per_dim[1] + HV_bits_per_dim[2] + HV_bits_per_dim[3]
        + HV_bits_per_dim[4] + HV_bits_per_dim[5] + HV_bits_per_dim[6] + HV_bits_per_dim[7])>> ENCODING_BIT_THR);

    initial begin
        clk = 1'b0;
        nrst = 1'b0;
        en = 1'b0;
        #25 //@25
        nrst = 1'b1;
        #75 //@100
        en = 1'b1;

        $display("ENCODING_BIT_THR = %d",ENCODING_BIT_THR);
        $monitor("@%g \b \t %d \t %d \t %b", $time, HV_bits_per_dim, thresholded_bit, checker_bit, thresholded_bit == checker_bit);


        HV_bits_per_dim = {1111_1111};

        #100 
        HV_bits_per_dim = HV_bits_per_dim >> 1;
        #100 
        HV_bits_per_dim = HV_bits_per_dim >> 1;
        #100 
        HV_bits_per_dim = HV_bits_per_dim >> 1;
        #100 
        HV_bits_per_dim = HV_bits_per_dim >> 1;
        #100 
        HV_bits_per_dim = HV_bits_per_dim >> 1;
        #100 
        HV_bits_per_dim = HV_bits_per_dim >> 1;
        #100 
        HV_bits_per_dim = HV_bits_per_dim >> 1;
        #100 
        HV_bits_per_dim = HV_bits_per_dim >> 1;
        #100 
        HV_bits_per_dim = HV_bits_per_dim >> 1;
        #100 
        HV_bits_per_dim = HV_bits_per_dim >> 1;   
        
        #100 
        $finish;  
    end
    
    

endmodule
