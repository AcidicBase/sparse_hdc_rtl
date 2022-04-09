`timescale 1ns / 1ps
`include "acc_thr.sv"

module tb_hv_shifter();
    logic clk;
    logic nrst;
    logic en;
    logic [FEATURE_COUNT-1:0] HV_bits_per_dim;
    wire thresholded_bit;

    // initialize
    acc_thr ACC_THR_0(.clk(clk),
        .nrst(nrst),
        .en(en),
        .HV_bits_per_dim(HV_bits_per_dim),
        .thresholded_bit(thresholded_bit)
    );

    // clk
    always begin
        #50 clk = ~clk;
    end


    initial begin
        clk = 1'b0;
        nrst = 1'b0;
        en = 1'b0;
        #25 //@25
        nrst = 1'b1;
        #75 //@100
        en = 1'b1;

        $display("ENCODING_BIT_THR = %d",ENCODING_BIT_THR);
        $display("Time \t HV_bits_per_dim \t thresholded_bit");
        $monitor("@%g \t \t %b \t \t %b", $time, HV_bits_per_dim, thresholded_bit);

        HV_bits_per_dim = 'b1111_1111;

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
    end

endmodule
