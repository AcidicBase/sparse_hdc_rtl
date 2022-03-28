`timescale 1ns / 1ps
module tree_add_512bit(bit512_in, sum);

    input [511:0] bit512_in;
    output wire [9:0] sum;
    
    wire [7:0] sum_7_1, sum_7_2, sum_7_3, sum_7_4;
    wire [8:0] sum_8_1, sum_8_2;
    
    tree_add_128bit level_7_1(
    .bit128_in(bit512_in[127:0]),
    .sum(sum_7_1)
    );
    
    tree_add_128bit level_7_2(
    .bit128_in(bit512_in[255:128]),
    .sum(sum_7_2)
    );
    
    tree_add_128bit level_7_3(
    .bit128_in(bit512_in[383:256]),
    .sum(sum_7_3)
    );
    
    tree_add_128bit level_7_4(
    .bit128_in(bit512_in[511:384]),
    .sum(sum_7_4)
    );
    
    assign sum_8_1 = sum_7_1 + sum_7_2;
    assign sum_8_2 = sum_7_3 + sum_7_4;
    
    assign sum = sum_8_1 + sum_8_2;
    
endmodule
