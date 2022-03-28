`timescale 1ns / 1ps
 //COMPARATOR: TREE BRACKET OF 13X2 THEN 6X2 +1 THEN 3X2 +1 THEN 2 THEN 1.
 //TWO THINGS ADVANCE IN THIS BRACKET: THE SCORE AND THE CLASS IDENTIFIER
 //SCORE IS A 13-BIT VALUE FROM THE ACCUMULATOR
module assoc_comparator (score_a,score_b,score_c,score_d,score_e,score_f,score_g,score_h,score_i,score_j,score_k,score_l,score_m,score_n,score_o,score_p,score_q,score_r,score_s,score_t,score_u,score_v,score_w,score_x,score_y,score_z,
inference
);
    input [12:0] score_a,score_b,score_c,score_d,score_e,score_f,score_g,score_h,score_i,score_j,score_k,score_l,score_m,score_n,score_o,score_p,score_q,score_r,score_s,score_t,score_u,score_v,score_w,score_x,score_y,score_z; 
    output wire [4:0] inference;
    
    wire [12:0] bracket_1_1_winner, bracket_1_2_winner, bracket_1_3_winner, bracket_1_4_winner, bracket_1_5_winner, bracket_1_6_winner;
    wire [12:0] bracket_1_7_winner, bracket_1_8_winner, bracket_1_9_winner, bracket_1_10_winner, bracket_1_11_winner, bracket_1_12_winner, bracket_1_13_winner;
    
    wire [12:0] bracket_2_1_winner, bracket_2_2_winner, bracket_2_3_winner, bracket_2_4_winner, bracket_2_5_winner, bracket_2_6_winner;
    
    wire [12:0] bracket_3_1_winner, bracket_3_2_winner, bracket_3_3_winner;
    
    wire[12:0] bracket_4_1_winner, bracket_4_2_winner;
    
    
    wire [4:0] bracket_1_1_class, bracket_1_2_class, bracket_1_3_class, bracket_1_4_class, bracket_1_5_class, bracket_1_6_class;
    wire [4:0] bracket_1_7_class, bracket_1_8_class, bracket_1_9_class, bracket_1_10_class, bracket_1_11_class, bracket_1_12_class, bracket_1_13_class;
    
    wire [4:0] bracket_2_1_class, bracket_2_2_class, bracket_2_3_class, bracket_2_4_class, bracket_2_5_class, bracket_2_6_class;
    
    wire [4:0] bracket_3_1_class, bracket_3_2_class, bracket_3_3_class, bracket_3_4_class, bracket_3_5_class, bracket_3_6_class;
    
    wire[4:0] bracket_4_1_class, bracket_4_2_class;
    
    assign bracket_1_1_winner  = (score_a >= score_b) ? score_a:score_b; 
    assign bracket_1_2_winner = (score_c >= score_d) ? score_c:score_d; 
    assign bracket_1_3_winner  = (score_e >= score_f) ? score_e:score_f; 
    assign bracket_1_4_winner = (score_g >= score_h) ? score_g:score_h; 
    assign bracket_1_5_winner  = (score_i >= score_j) ? score_i:score_j; 
    assign bracket_1_6_winner = (score_k >= score_l) ? score_k:score_l; 
    assign bracket_1_7_winner  = (score_m >= score_n) ? score_m:score_n; 
    assign bracket_1_8_winner = (score_o >= score_p) ? score_o:score_p; 
    assign bracket_1_9_winner  = (score_q >= score_r) ? score_q:score_r; 
    assign bracket_1_10_winner = (score_s >= score_t) ? score_s:score_t; 
    assign bracket_1_11_winner  = (score_u >= score_v) ? score_u:score_v; 
    assign bracket_1_12_winner = (score_w >= score_x) ? score_w:score_x; 
    assign bracket_1_13_winner = (score_y >= score_z) ? score_y:score_z; 
    
    assign bracket_1_1_class  = (score_a >= score_b) ? 5'd0:5'd1; 
    assign bracket_1_2_class = (score_c >= score_d) ? 5'd2:5'd3; 
    assign bracket_1_3_class  = (score_e >= score_f) ? 5'd4:5'd5; 
    assign bracket_1_4_class = (score_g >= score_h) ? 5'd6:5'd7; 
    assign bracket_1_5_class  = (score_i >= score_j) ? 5'd8:5'd9; 
    assign bracket_1_6_class = (score_k >= score_l) ? 5'd10:5'd11; 
    assign bracket_1_7_class  = (score_m >= score_n) ? 5'd12:5'd13; 
    assign bracket_1_8_class = (score_o >= score_p) ? 5'd14:5'd15; 
    assign bracket_1_9_class  = (score_q >= score_r) ? 5'd16:5'd17; 
    assign bracket_1_10_class = (score_s >= score_t) ? 5'd18:5'd19; 
    assign bracket_1_11_class  = (score_u >= score_v) ? 5'd20:5'd21; 
    assign bracket_1_12_class = (score_w >= score_x) ? 5'd22:5'd23; 
    assign bracket_1_13_class = (score_y >= score_z) ? 5'd24:5'd25;
    
    assign bracket_2_1_winner = (bracket_1_1_winner >= bracket_1_2_winner) ? bracket_1_1_winner:bracket_1_2_winner;
    assign bracket_2_2_winner = (bracket_1_3_winner >= bracket_1_4_winner) ? bracket_1_3_winner:bracket_1_4_winner;
    assign bracket_2_3_winner = (bracket_1_5_winner >= bracket_1_6_winner) ? bracket_1_5_winner:bracket_1_6_winner;
    assign bracket_2_4_winner = (bracket_1_7_winner >= bracket_1_8_winner) ? bracket_1_7_winner:bracket_1_8_winner;
    assign bracket_2_5_winner = (bracket_1_9_winner >= bracket_1_10_winner) ? bracket_1_9_winner:bracket_1_10_winner;
    assign bracket_2_6_winner = (bracket_1_11_winner >= bracket_1_12_winner) ? bracket_1_11_winner:bracket_1_12_winner;
    
    assign bracket_2_1_class = (bracket_1_1_winner >= bracket_1_2_winner) ? bracket_1_1_class:bracket_1_2_class;
    assign bracket_2_2_class = (bracket_1_3_winner >= bracket_1_4_winner) ? bracket_1_3_class:bracket_1_4_class;
    assign bracket_2_3_class = (bracket_1_5_winner >= bracket_1_6_winner) ? bracket_1_5_class:bracket_1_6_class;
    assign bracket_2_4_class = (bracket_1_7_winner >= bracket_1_8_winner) ? bracket_1_7_class:bracket_1_8_class;
    assign bracket_2_5_class = (bracket_1_9_winner >= bracket_1_10_winner) ? bracket_1_9_class:bracket_1_10_class;
    assign bracket_2_6_class = (bracket_1_11_winner >= bracket_1_12_winner) ? bracket_1_11_class:bracket_1_12_class;
    
    assign bracket_3_1_winner = (bracket_2_1_winner >= bracket_2_2_winner) ? bracket_2_1_winner:bracket_2_2_winner;
    assign bracket_3_2_winner = (bracket_2_3_winner >= bracket_2_4_winner) ? bracket_2_3_winner:bracket_2_4_winner;
    assign bracket_3_3_winner = (bracket_2_5_winner >= bracket_2_6_winner) ? bracket_2_5_winner:bracket_2_6_winner;
    
    assign bracket_3_1_class = (bracket_2_1_winner >= bracket_2_2_winner) ? bracket_2_1_class:bracket_2_2_class;
    assign bracket_3_2_class = (bracket_2_3_winner >= bracket_2_4_winner) ? bracket_2_3_class:bracket_2_4_class;
    assign bracket_3_3_class = (bracket_2_5_winner >= bracket_2_6_winner) ? bracket_2_5_class:bracket_2_6_class;
    
    assign bracket_4_1_winner = (bracket_3_1_winner >= bracket_3_2_winner) ? bracket_3_1_winner:bracket_3_2_winner;
    assign bracket_4_2_winner = (bracket_3_3_winner >= bracket_1_13_winner) ? bracket_3_3_winner:bracket_1_13_winner;
    
    assign bracket_4_1_class = (bracket_3_1_winner >= bracket_3_2_winner) ? bracket_3_1_class:bracket_3_2_class;
    assign bracket_4_2_class = (bracket_3_3_winner >= bracket_1_13_winner) ? bracket_3_3_class:bracket_1_13_class;
    
    assign inference = (bracket_4_1_winner >= bracket_4_2_winner) ? bracket_4_1_class:bracket_4_2_class;
    
endmodule