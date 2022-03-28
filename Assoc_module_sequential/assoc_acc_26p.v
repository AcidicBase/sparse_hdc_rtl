`timescale 1ns / 1ps

module assoc_acc_26p (clk, nrst, acc_en,state,score_a,score_b,score_c,score_d,score_e,score_f,score_g,score_h,score_i,score_j,score_k,score_l,score_m,score_n,score_o,score_p,score_q,score_r,score_s,score_t,score_u,score_v,score_w,score_x,score_y,score_z,
output_score_a,output_score_b,output_score_c,output_score_d,output_score_e,output_score_f,output_score_g,output_score_h,output_score_i,output_score_j,output_score_k,output_score_l,output_score_m,output_score_n,output_score_o,output_score_p,output_score_q,output_score_r,output_score_s,output_score_t,output_score_u,output_score_v,output_score_w,output_score_x,output_score_y,output_score_z
);
    input clk,nrst,acc_en;
    input[3:0] state;
    input [2:0] score_a,score_b,score_c,score_d,score_e,score_f,score_g,score_h,score_i,score_j,score_k,score_l,score_m,score_n,score_o,score_p,score_q,score_r,score_s,score_t,score_u,score_v,score_w,score_x,score_y,score_z;
    output wire [6:0] output_score_a,output_score_b,output_score_c,output_score_d,output_score_e,output_score_f,output_score_g,output_score_h,output_score_i,output_score_j,output_score_k,output_score_l,output_score_m,output_score_n,output_score_o,output_score_p,output_score_q,output_score_r,output_score_s,output_score_t,output_score_u,output_score_v,output_score_w,output_score_x,output_score_y,output_score_z;
    //for full width, change input width to 10 bits, output width to 13 bits change the assoc_accumulator_short module to assoc_accumulator
    
    assoc_accumulator_short a(
    .clk(clk),
    .nrst(nrst),
    .acc_en(acc_en),
    .state(state),
    .sum_input(score_a),
    .stored_score(output_score_a)
    );
    assoc_accumulator_short b(
    .clk(clk),
    .nrst(nrst),
    .acc_en(acc_en),
    .state(state),
    .sum_input(score_b),
    .stored_score(output_score_b)
    );
    assoc_accumulator_short c(
    .clk(clk),
    .nrst(nrst),
    .acc_en(acc_en),
    .state(state),
    .sum_input(score_c),
    .stored_score(output_score_c)
    );
    assoc_accumulator_short d(
    .clk(clk),
    .nrst(nrst),
    .acc_en(acc_en),
    .state(state),
    .sum_input(score_d),
    .stored_score(output_score_d)
    );
    assoc_accumulator_short e(
    .clk(clk),
    .nrst(nrst),
    .acc_en(acc_en),
    .state(state),
    .sum_input(score_e),
    .stored_score(output_score_e)
    );
    assoc_accumulator_short f(
    .clk(clk),
    .nrst(nrst),
    .acc_en(acc_en),
    .state(state),
    .sum_input(score_f),
    .stored_score(output_score_f)
    );
    assoc_accumulator_short g(
    .clk(clk),
    .nrst(nrst),
    .acc_en(acc_en),
    .state(state),
    .sum_input(score_g),
    .stored_score(output_score_g)
    );
    assoc_accumulator_short h(
    .clk(clk),
    .nrst(nrst),
    .acc_en(acc_en),
    .state(state),
    .sum_input(score_h),
    .stored_score(output_score_h)
    );
    assoc_accumulator_short i(
    .clk(clk),
    .nrst(nrst),
    .acc_en(acc_en),
    .state(state),
    .sum_input(score_i),
    .stored_score(output_score_i)
    );
    assoc_accumulator_short j(
    .clk(clk),
    .nrst(nrst),
    .acc_en(acc_en),
    .state(state),
    .sum_input(score_j),
    .stored_score(output_score_j)
    );
    assoc_accumulator_short k(
    .clk(clk),
    .nrst(nrst),
    .acc_en(acc_en),
    .state(state),
    .sum_input(score_k),
    .stored_score(output_score_k)
    );
    assoc_accumulator_short l(
    .clk(clk),
    .nrst(nrst),
    .acc_en(acc_en),
    .state(state),
    .sum_input(score_l),
    .stored_score(output_score_l)
    );
    assoc_accumulator_short m(
    .clk(clk),
    .nrst(nrst),
    .acc_en(acc_en),
    .state(state),
    .sum_input(score_m),
    .stored_score(output_score_m)
    );
    assoc_accumulator_short n(
    .clk(clk),
    .nrst(nrst),
    .acc_en(acc_en),
    .state(state),
    .sum_input(score_n),
    .stored_score(output_score_n)
    );
    assoc_accumulator_short o(
    .clk(clk),
    .nrst(nrst),
    .acc_en(acc_en),
    .state(state),
    .sum_input(score_o),
    .stored_score(output_score_o)
    );
    assoc_accumulator_short p(
    .clk(clk),
    .nrst(nrst),
    .acc_en(acc_en),
    .state(state),
    .sum_input(score_p),
    .stored_score(output_score_p)
    );
    assoc_accumulator_short q(
    .clk(clk),
    .nrst(nrst),
    .acc_en(acc_en),
    .state(state),
    .sum_input(score_q),
    .stored_score(output_score_q)
    );
    assoc_accumulator_short r(
    .clk(clk),
    .nrst(nrst),
    .acc_en(acc_en),
    .state(state),
    .sum_input(score_r),
    .stored_score(output_score_r)
    );
    assoc_accumulator_short s(
    .clk(clk),
    .nrst(nrst),
    .acc_en(acc_en),
    .state(state),
    .sum_input(score_s),
    .stored_score(output_score_s)
    );
    assoc_accumulator_short t(
    .clk(clk),
    .nrst(nrst),
    .acc_en(acc_en),
    .state(state),
    .sum_input(score_t),
    .stored_score(output_score_t)
    );
    assoc_accumulator_short u(
    .clk(clk),
    .nrst(nrst),
    .acc_en(acc_en),
    .state(state),
    .sum_input(score_u),
    .stored_score(output_score_u)
    );
    assoc_accumulator_short v(
    .clk(clk),
    .nrst(nrst),
    .acc_en(acc_en),
    .state(state),
    .sum_input(score_v),
    .stored_score(output_score_v)
    );
    assoc_accumulator_short w(
    .clk(clk),
    .nrst(nrst),
    .acc_en(acc_en),
    .state(state),
    .sum_input(score_w),
    .stored_score(output_score_w)
    );
    assoc_accumulator_short x(
    .clk(clk),
    .nrst(nrst),
    .acc_en(acc_en),
    .state(state),
    .sum_input(score_x),
    .stored_score(output_score_x)
    );
    assoc_accumulator_short y(
    .clk(clk),
    .nrst(nrst),
    .acc_en(acc_en),
    .state(state),
    .sum_input(score_y),
    .stored_score(output_score_y)
    );
    assoc_accumulator_short z(
    .clk(clk),
    .nrst(nrst),
    .acc_en(acc_en),
    .state(state),
    .sum_input(score_z),
    .stored_score(output_score_z)
    );
endmodule
