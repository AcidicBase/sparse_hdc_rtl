`timescale 1ns / 1ps

module tree_add_128bit(bit128_in, sum );

    input [127:0] bit128_in;
    output wire [7:0] sum;
    
    wire [4:0] sum_4_1, sum_4_2, sum_4_3, sum_4_4, sum_4_5,sum_4_6,sum_4_7,sum_4_8;
    wire  [5:0] sum_5_1, sum_5_2, sum_5_3, sum_5_4;
    wire [6:0] sum_6_1, sum_6_2;
    
    tree_add_16bit level_4_1(
    .sixteen_bit_in(bit128_in[15:0]),
    .sum(sum_4_1)
    );
    
    tree_add_16bit level_4_2(
    .sixteen_bit_in(bit128_in[31:16]),
    .sum(sum_4_2)
    );
    
    tree_add_16bit level_4_3(
    .sixteen_bit_in(bit128_in[47:32]),
    .sum(sum_4_3)
    );
    
    tree_add_16bit level_4_4(
    .sixteen_bit_in(bit128_in[63:48]),
    .sum(sum_4_4)
    );
    
    tree_add_16bit level_4_5(
    .sixteen_bit_in(bit128_in[79:64]),
    .sum(sum_4_5)
    );
    
    tree_add_16bit level_4_6(
    .sixteen_bit_in(bit128_in[95:80]),
    .sum(sum_4_6)
    );
    
    tree_add_16bit level_4_7(
    .sixteen_bit_in(bit128_in[111:96]),
    .sum(sum_4_7)
    );
    
    tree_add_16bit level_4_8(
    .sixteen_bit_in(bit128_in[127:112]),
    .sum(sum_4_8)
    );
    
    assign sum_5_1 = sum_4_1 + sum_4_2;
    assign sum_5_2 = sum_4_3 + sum_4_4;
    assign sum_5_3 = sum_4_5 + sum_4_6;
    assign sum_5_4 = sum_4_7 + sum_4_8;
    
    assign sum_6_1 = sum_5_1 + sum_5_2;
    assign sum_6_2 = sum_5_3 + sum_5_4;
    
    assign sum = sum_6_1 + sum_6_2;
endmodule
