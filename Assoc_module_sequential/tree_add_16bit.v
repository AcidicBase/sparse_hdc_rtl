`timescale 1ns / 1ps

module tree_add_16bit(sixteen_bit_in,sum);
    input [15:0] sixteen_bit_in;
    output wire [4:0] sum;
    
    wire [1:0] sum_1_1, sum_1_2, sum_1_3, sum_1_4, sum_1_5, sum_1_6, sum_1_7, sum_1_8;
    wire [2:0] sum_2_1, sum_2_2, sum_2_3, sum_2_4;
    wire [3:0] sum_3_1, sum_3_2;
    
    tree_add_2bit level_1_1(
    .two_bit_in(sixteen_bit_in[1:0]),
    .sum(sum_1_1)
    );
    
    tree_add_2bit level_1_2(
    .two_bit_in(sixteen_bit_in[3:2]),
    .sum(sum_1_2)
    );
    
    tree_add_2bit level_1_3(
    .two_bit_in(sixteen_bit_in[5:4]),
    .sum(sum_1_3)
    );
    
    tree_add_2bit level_1_4(
    .two_bit_in(sixteen_bit_in[7:6]),
    .sum(sum_1_4)
    );
    
    tree_add_2bit level_1_5(
    .two_bit_in(sixteen_bit_in[9:8]),
    .sum(sum_1_5)
    );
    
    tree_add_2bit level_1_6(
    .two_bit_in(sixteen_bit_in[11:10]),
    .sum(sum_1_6)
    );
    
    tree_add_2bit level_1_7(
    .two_bit_in(sixteen_bit_in[13:12]),
    .sum(sum_1_7)
    );
    
    tree_add_2bit level_1_8(
    .two_bit_in(sixteen_bit_in[15:14]),
    .sum(sum_1_8)
    );
    
    assign sum_2_1 = sum_1_1 + sum_1_2;
    assign sum_2_2 = sum_1_3 + sum_1_4;
    assign sum_2_3 = sum_1_5 + sum_1_6;
    assign sum_2_4 = sum_1_7 + sum_1_8;
    
    assign sum_3_1 = sum_2_1 + sum_2_2;
    assign sum_3_2 = sum_2_3 + sum_2_4;
    
    assign sum = sum_3_1 + sum_3_2;
endmodule
