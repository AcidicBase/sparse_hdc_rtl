`timescale 1ns / 1ps

module tree_add_2bit(two_bit_in, sum);
    input [1:0] two_bit_in;
    output wire [1:0] sum;
    
    assign sum = two_bit_in[0] + two_bit_in[1];

endmodule
