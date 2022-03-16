`timescale 1ns / 1ps
`define CLK_PERIOD 1000

module tb_adder();
    reg nrst;
    reg clk;
    reg [4:0] input_hv_chunk;
    reg [39:0] stored_hv_chunk;
    wire [39:0] sum;
    
    adder_block UUT (
    .input_hv_chunk(input_hv_chunk),
    .stored_hv_chunk(stored_hv_chunk),
    .sum(sum)
    );
    always begin
        #(`CLK_PERIOD/2) clk = ~clk;
    end
    initial begin
        clk = 1;
        nrst=0;
        #(`CLK_PERIOD);
        nrst = 1;
        #(`CLK_PERIOD);
        input_hv_chunk = 5'b00000;
        stored_hv_chunk = 40'h0202020202;
        #(`CLK_PERIOD);
        input_hv_chunk = 5'b11111;
        stored_hv_chunk = 40'h0202020202;
        #(`CLK_PERIOD);
        stored_hv_chunk = 40'h0404040404;
        #(`CLK_PERIOD);
        input_hv_chunk = 5'b11111;
        #(`CLK_PERIOD);
        stored_hv_chunk = 40'h0505050505;
        input_hv_chunk = 5'b11111;
        #(`CLK_PERIOD);
        input_hv_chunk = 5'b10101;
        #(`CLK_PERIOD);
    end
     
endmodule
