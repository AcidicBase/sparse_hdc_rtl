`timescale 1ns / 1ps

module assoc_top_short(clk,nrst,input_ready,query_hv,query_class,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,inference,inference_reg,
hv_pipe,class_pipe,enable,state,infer_done
);
    input clk,nrst,input_ready;
    input [4:0] query_class;
    input [49:0] query_hv,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z;
    
    output wire [4:0] inference;
    output reg [4:0] inference_reg;
    
    output reg [49:0] hv_pipe;
    output reg [4:0] class_pipe;
    output reg enable;
    output reg [3:0] state;
    output reg infer_done;
    
    reg [4:0] toArrayQuery,toArrayA,toArrayB,toArrayC,toArrayD,toArrayE,toArrayF,toArrayG,toArrayH,toArrayI,toArrayJ,toArrayK,toArrayL,toArrayM,toArrayN,toArrayO,toArrayP,toArrayQ,toArrayR,
    toArrayS,toArrayT,toArrayU,toArrayV,toArrayW,toArrayX,toArrayY,toArrayZ;
    reg module_en;
    
    wire [4:0] arrayToAddA,arrayToAddB,arrayToAddC,arrayToAddD,arrayToAddE,arrayToAddF,arrayToAddG,arrayToAddH,arrayToAddI,arrayToAddJ,arrayToAddK,arrayToAddL,arrayToAddM,arrayToAddN,arrayToAddO,arrayToAddP,arrayToAddQ,arrayToAddR,
    arrayToAddS,arrayToAddT,arrayToAddU,arrayToAddV,arrayToAddW,arrayToAddX,arrayToAddY,arrayToAddZ;
    
    wire [4:0] addToAccA,addToAccB,addToAccC,addToAccD,addToAccE,addToAccF,addToAccG,addToAccH,addToAccI,addToAccJ,addToAccK,addToAccL,addToAccM,addToAccN,addToAccO,addToAccP,addToAccQ,addToAccR,
    addToAccS,addToAccT,addToAccU,addToAccV,addToAccW,addToAccX,addToAccY,addToAccZ;
    
    wire [6:0] accToCompA,accToCompB,accToCompC,accToCompD,accToCompE,accToCompF,accToCompG,accToCompH,accToCompI,accToCompJ,accToCompK,accToCompL,accToCompM,accToCompN,accToCompO,accToCompP,accToCompQ,accToCompR,
    accToCompS,accToCompT,accToCompU,accToCompV,accToCompW,accToCompX,accToCompY,accToCompZ;
    
    assoc_and_array array(
    .query_hv(toArrayQuery),
    .a(toArrayA),
    .b(toArrayB),
    .c(toArrayC),
    .d(toArrayD),
    .e(toArrayE),
    .f(toArrayF),
    .g(toArrayG),
    .h(toArrayH),
    .i(toArrayI),
    .j(toArrayJ),
    .k(toArrayK),
    .l(toArrayL),
    .m(toArrayM),
    .n(toArrayN),
    .o(toArrayO),
    .p(toArrayP),
    .q(toArrayQ),
    .r(toArrayR),
    .s(toArrayS),
    .t(toArrayT),
    .u(toArrayU),
    .v(toArrayV),
    .w(toArrayW),
    .x(toArrayX),
    .y(toArrayY),
    .z(toArrayZ),
    .out_a(arrayToAddA),
    .out_b(arrayToAddB),
    .out_c(arrayToAddC),
    .out_d(arrayToAddD),
    .out_e(arrayToAddE),
    .out_f(arrayToAddF),
    .out_g(arrayToAddG),
    .out_h(arrayToAddH),
    .out_i(arrayToAddI),
    .out_j(arrayToAddJ),
    .out_k(arrayToAddK),
    .out_l(arrayToAddL),
    .out_m(arrayToAddM),
    .out_n(arrayToAddN),
    .out_o(arrayToAddO),
    .out_p(arrayToAddP),
    .out_q(arrayToAddQ),
    .out_r(arrayToAddR),
    .out_s(arrayToAddS),
    .out_t(arrayToAddT),
    .out_u(arrayToAddU),
    .out_v(arrayToAddV),
    .out_w(arrayToAddW),
    .out_x(arrayToAddX),
    .out_y(arrayToAddY),
    .out_z(arrayToAddZ)
    );
    
    tree_add_16bit_26p adder(
    .a(arrayToAddA),
    .b(arrayToAddB),
    .c(arrayToAddC),
    .d(arrayToAddD),
    .e(arrayToAddE),
    .f(arrayToAddF),
    .g(arrayToAddG),
    .h(arrayToAddH),
    .i(arrayToAddI),
    .j(arrayToAddJ),
    .k(arrayToAddK),
    .l(arrayToAddL),
    .m(arrayToAddM),
    .n(arrayToAddN),
    .o(arrayToAddO),
    .p(arrayToAddP),
    .q(arrayToAddQ),
    .r(arrayToAddR),
    .s(arrayToAddS),
    .t(arrayToAddT),
    .u(arrayToAddU),
    .v(arrayToAddV),
    .w(arrayToAddW),
    .x(arrayToAddX),
    .y(arrayToAddY),
    .z(arrayToAddZ),
    .out_a(addToAccA),
    .out_b(addToAccB),
    .out_c(addToAccC),
    .out_d(addToAccD),
    .out_e(addToAccE),
    .out_f(addToAccF),
    .out_g(addToAccG),
    .out_h(addToAccH),
    .out_i(addToAccI),
    .out_j(addToAccJ),
    .out_k(addToAccK),
    .out_l(addToAccL),
    .out_m(addToAccM),
    .out_n(addToAccN),
    .out_o(addToAccO),
    .out_p(addToAccP),
    .out_q(addToAccQ),
    .out_r(addToAccR),
    .out_s(addToAccS),
    .out_t(addToAccT),
    .out_u(addToAccU),
    .out_v(addToAccV),
    .out_w(addToAccW),
    .out_x(addToAccX),
    .out_y(addToAccY),
    .out_z(addToAccZ)
    );
    
    assoc_acc_26p accumulator(
    .clk(clk),
    .nrst(nrst),
    .acc_en(module_en),
    .state(state),
    .score_a(addToAccA[2:0]),
    .score_b(addToAccB[2:0]),
    .score_c(addToAccC[2:0]),
    .score_d(addToAccD[2:0]),
    .score_e(addToAccE[2:0]),
    .score_f(addToAccF[2:0]),
    .score_g(addToAccG[2:0]),
    .score_h(addToAccH[2:0]),
    .score_i(addToAccI[2:0]),
    .score_j(addToAccJ[2:0]),
    .score_k(addToAccK[2:0]),
    .score_l(addToAccL[2:0]),
    .score_m(addToAccM[2:0]),
    .score_n(addToAccN[2:0]),
    .score_o(addToAccO[2:0]),
    .score_p(addToAccP[2:0]),
    .score_q(addToAccQ[2:0]),
    .score_r(addToAccR[2:0]),
    .score_s(addToAccS[2:0]),
    .score_t(addToAccT[2:0]),
    .score_u(addToAccU[2:0]),
    .score_v(addToAccV[2:0]),
    .score_w(addToAccW[2:0]),
    .score_x(addToAccX[2:0]),
    .score_y(addToAccY[2:0]),
    .score_z(addToAccZ[2:0]),
    .output_score_a(accToCompA),
    .output_score_b(accToCompB),
    .output_score_c(accToCompC),
    .output_score_d(accToCompD),
    .output_score_e(accToCompE),
    .output_score_f(accToCompF),
    .output_score_g(accToCompG),
    .output_score_h(accToCompH),
    .output_score_i(accToCompI),
    .output_score_j(accToCompJ),
    .output_score_k(accToCompK),
    .output_score_l(accToCompL),
    .output_score_m(accToCompM),
    .output_score_n(accToCompN),
    .output_score_o(accToCompO),
    .output_score_p(accToCompP),
    .output_score_q(accToCompQ),
    .output_score_r(accToCompR),
    .output_score_s(accToCompS),
    .output_score_t(accToCompT),
    .output_score_u(accToCompU),
    .output_score_v(accToCompV),
    .output_score_w(accToCompW),
    .output_score_x(accToCompX),
    .output_score_y(accToCompY),
    .output_score_z(accToCompZ)
    );
    
    assoc_comparator compare(
    .score_a({6'd0,accToCompA}),
    .score_b({6'd0,accToCompB}),
    .score_c({6'd0,accToCompC}),
    .score_d({6'd0,accToCompD}),
    .score_e({6'd0,accToCompE}),
    .score_f({6'd0,accToCompF}),
    .score_g({6'd0,accToCompG}),
    .score_h({6'd0,accToCompH}),
    .score_i({6'd0,accToCompI}),
    .score_j({6'd0,accToCompJ}),
    .score_k({6'd0,accToCompK}),
    .score_l({6'd0,accToCompL}),
    .score_m({6'd0,accToCompM}),
    .score_n({6'd0,accToCompN}),
    .score_o({6'd0,accToCompO}),
    .score_p({6'd0,accToCompP}),
    .score_q({6'd0,accToCompQ}),
    .score_r({6'd0,accToCompR}),
    .score_s({6'd0,accToCompS}),
    .score_t({6'd0,accToCompT}),
    .score_u({6'd0,accToCompU}),
    .score_v({6'd0,accToCompV}),
    .score_w({6'd0,accToCompW}),
    .score_x({6'd0,accToCompX}),
    .score_y({6'd0,accToCompY}),
    .score_z({6'd0,accToCompZ}),
    .inference(inference)
    );
    
    //MUX TO DECIDE IF YOU SHOULD USE STORED PIPELINE VALUE OR DIRECT INPUT & what chunk of input hv to use
    always @ (*) begin
     if(!nrst) begin
        toArrayQuery <= 5'd0;
        toArrayA <= 5'd0;
        toArrayB <= 5'd0;
        toArrayC <= 5'd0;
        toArrayD <= 5'd0;
        toArrayE <= 5'd0;
        toArrayF <= 5'd0;
        toArrayG <= 5'd0;
        toArrayH <= 5'd0;
        toArrayI <= 5'd0;
        toArrayJ <= 5'd0;
        toArrayK <= 5'd0;
        toArrayL <= 5'd0;
        toArrayM <= 5'd0;
        toArrayN <= 5'd0;
        toArrayO <= 5'd0;
        toArrayP <= 5'd0;
        toArrayQ <= 5'd0;
        toArrayR <= 5'd0;
        toArrayS <= 5'd0;
        toArrayT <= 5'd0;
        toArrayU <= 5'd0;
        toArrayV <= 5'd0;
        toArrayW <= 5'd0;
        toArrayX <= 5'd0;
        toArrayY <= 5'd0;
        toArrayZ <= 5'd0;
     end
     else begin
        case(state)
            4'd0: begin
                toArrayQuery <= query_hv[4:0];
                toArrayA <= a[4:0];
                toArrayB <= b[4:0];
                toArrayC <= c[4:0];
                toArrayD <= d[4:0];
                toArrayE <= e[4:0];
                toArrayF <= f[4:0];
                toArrayG <= g[4:0];
                toArrayH <= h[4:0];
                toArrayI <= i[4:0];
                toArrayJ <= j[4:0];
                toArrayK <= k[4:0];
                toArrayL <= l[4:0];
                toArrayM <= m[4:0];
                toArrayN <= n[4:0];
                toArrayO <= o[4:0];
                toArrayP <= p[4:0];
                toArrayQ <= q[4:0];
                toArrayR <= r[4:0];
                toArrayS <= s[4:0];
                toArrayT <= t[4:0];
                toArrayU <= u[4:0];
                toArrayV <= v[4:0];
                toArrayW <= w[4:0];
                toArrayX <= x[4:0];
                toArrayY <= y[4:0];
                toArrayZ <= z[4:0];
            end
            4'd1: begin
                toArrayQuery <= hv_pipe[9:5];
                toArrayA <= a[9:5];
                toArrayB <= b[9:5];
                toArrayC <= c[9:5];
                toArrayD <= d[9:5];
                toArrayE <= e[9:5];
                toArrayF <= f[9:5];
                toArrayG <= g[9:5];
                toArrayH <= h[9:5];
                toArrayI <= i[9:5];
                toArrayJ <= j[9:5];
                toArrayK <= k[9:5];
                toArrayL <= l[9:5];
                toArrayM <= m[9:5];
                toArrayN <= n[9:5];
                toArrayO <= o[9:5];
                toArrayP <= p[9:5];
                toArrayQ <= q[9:5];
                toArrayR <= r[9:5];
                toArrayS <= s[9:5];
                toArrayT <= t[9:5];
                toArrayU <= u[9:5];
                toArrayV <= v[9:5];
                toArrayW <= w[9:5];
                toArrayX <= x[9:5];
                toArrayY <= y[9:5];
                toArrayZ <= z[9:5];
            end
            4'd2: begin
                toArrayQuery <= hv_pipe[14:10];
                toArrayA <= a[14:10];
                toArrayB <= b[14:10];
                toArrayC <= c[14:10];
                toArrayD <= d[14:10];
                toArrayE <= e[14:10];
                toArrayF <= f[14:10];
                toArrayG <= g[14:10];
                toArrayH <= h[14:10];
                toArrayI <= i[14:10];
                toArrayJ <= j[14:10];
                toArrayK <= k[14:10];
                toArrayL <= l[14:10];
                toArrayM <= m[14:10];
                toArrayN <= n[14:10];
                toArrayO <= o[14:10];
                toArrayP <= p[14:10];
                toArrayQ <= q[14:10];
                toArrayR <= r[14:10];
                toArrayS <= s[14:10];
                toArrayT <= t[14:10];
                toArrayU <= u[14:10];
                toArrayV <= v[14:10];
                toArrayW <= w[14:10];
                toArrayX <= x[14:10];
                toArrayY <= y[14:10];
                toArrayZ <= z[14:10];
            end
            4'd3: begin
                toArrayQuery <= hv_pipe[19:15];
                toArrayA <= a[19:15];
                toArrayB <= b[19:15];
                toArrayC <= c[19:15];
                toArrayD <= d[19:15];
                toArrayE <= e[19:15];
                toArrayF <= f[19:15];
                toArrayG <= g[19:15];
                toArrayH <= h[19:15];
                toArrayI <= i[19:15];
                toArrayJ <= j[19:15];
                toArrayK <= k[19:15];
                toArrayL <= l[19:15];
                toArrayM <= m[19:15];
                toArrayN <= n[19:15];
                toArrayO <= o[19:15];
                toArrayP <= p[19:15];
                toArrayQ <= q[19:15];
                toArrayR <= r[19:15];
                toArrayS <= s[19:15];
                toArrayT <= t[19:15];
                toArrayU <= u[19:15];
                toArrayV <= v[19:15];
                toArrayW <= w[19:15];
                toArrayX <= x[19:15];
                toArrayY <= y[19:15];
                toArrayZ <= z[19:15];
            end
            4'd4: begin
                toArrayQuery <= hv_pipe[24:20];
                toArrayA <= a[24:20];
                toArrayB <= b[24:20];
                toArrayC <= c[24:20];
                toArrayD <= d[24:20];
                toArrayE <= e[24:20];
                toArrayF <= f[24:20];
                toArrayG <= g[24:20];
                toArrayH <= h[24:20];
                toArrayI <= i[24:20];
                toArrayJ <= j[24:20];
                toArrayK <= k[24:20];
                toArrayL <= l[24:20];
                toArrayM <= m[24:20];
                toArrayN <= n[24:20];
                toArrayO <= o[24:20];
                toArrayP <= p[24:20];
                toArrayQ <= q[24:20];
                toArrayR <= r[24:20];
                toArrayS <= s[24:20];
                toArrayT <= t[24:20];
                toArrayU <= u[24:20];
                toArrayV <= v[24:20];
                toArrayW <= w[24:20];
                toArrayX <= x[24:20];
                toArrayY <= y[24:20];
                toArrayZ <= z[24:20];
            end
            4'd5: begin
                toArrayQuery <= hv_pipe[29:25];
                toArrayA <= a[29:25];
                toArrayB <= b[29:25];
                toArrayC <= c[29:25];
                toArrayD <= d[29:25];
                toArrayE <= e[29:25];
                toArrayF <= f[29:25];
                toArrayG <= g[29:25];
                toArrayH <= h[29:25];
                toArrayI <= i[29:25];
                toArrayJ <= j[29:25];
                toArrayK <= k[29:25];
                toArrayL <= l[29:25];
                toArrayM <= m[29:25];
                toArrayN <= n[29:25];
                toArrayO <= o[29:25];
                toArrayP <= p[29:25];
                toArrayQ <= q[29:25];
                toArrayR <= r[29:25];
                toArrayS <= s[29:25];
                toArrayT <= t[29:25];
                toArrayU <= u[29:25];
                toArrayV <= v[29:25];
                toArrayW <= w[29:25];
                toArrayX <= x[29:25];
                toArrayY <= y[29:25];
                toArrayZ <= z[29:25];
            end
            4'd6: begin
                toArrayQuery <= hv_pipe[34:30];
                toArrayA <= a[34:30];
                toArrayB <= b[34:30];
                toArrayC <= c[34:30];
                toArrayD <= d[34:30];
                toArrayE <= e[34:30];
                toArrayF <= f[34:30];
                toArrayG <= g[34:30];
                toArrayH <= h[34:30];
                toArrayI <= i[34:30];
                toArrayJ <= j[34:30];
                toArrayK <= k[34:30];
                toArrayL <= l[34:30];
                toArrayM <= m[34:30];
                toArrayN <= n[34:30];
                toArrayO <= o[34:30];
                toArrayP <= p[34:30];
                toArrayQ <= q[34:30];
                toArrayR <= r[34:30];
                toArrayS <= s[34:30];
                toArrayT <= t[34:30];
                toArrayU <= u[34:30];
                toArrayV <= v[34:30];
                toArrayW <= w[34:30];
                toArrayX <= x[34:30];
                toArrayY <= y[34:30];
                toArrayZ <= z[34:30];
            end
            4'd7: begin
                toArrayQuery <= hv_pipe[39:35];
                toArrayA <= a[39:35];
                toArrayB <= b[39:35];
                toArrayC <= c[39:35];
                toArrayD <= d[39:35];
                toArrayE <= e[39:35];
                toArrayF <= f[39:35];
                toArrayG <= g[39:35];
                toArrayH <= h[39:35];
                toArrayI <= i[39:35];
                toArrayJ <= j[39:35];
                toArrayK <= k[39:35];
                toArrayL <= l[39:35];
                toArrayM <= m[39:35];
                toArrayN <= n[39:35];
                toArrayO <= o[39:35];
                toArrayP <= p[39:35];
                toArrayQ <= q[39:35];
                toArrayR <= r[39:35];
                toArrayS <= s[39:35];
                toArrayT <= t[39:35];
                toArrayU <= u[39:35];
                toArrayV <= v[39:35];
                toArrayW <= w[39:35];
                toArrayX <= x[39:35];
                toArrayY <= y[39:35];
                toArrayZ <= z[39:35];
            end
            4'd8: begin
                toArrayQuery <= hv_pipe[44:40];
                toArrayA <= a[44:40];
                toArrayB <= b[44:40];
                toArrayC <= c[44:40];
                toArrayD <= d[44:40];
                toArrayE <= e[44:40];
                toArrayF <= f[44:40];
                toArrayG <= g[44:40];
                toArrayH <= h[44:40];
                toArrayI <= i[44:40];
                toArrayJ <= j[44:40];
                toArrayK <= k[44:40];
                toArrayL <= l[44:40];
                toArrayM <= m[44:40];
                toArrayN <= n[44:40];
                toArrayO <= o[44:40];
                toArrayP <= p[44:40];
                toArrayQ <= q[44:40];
                toArrayR <= r[44:40];
                toArrayS <= s[44:40];
                toArrayT <= t[44:40];
                toArrayU <= u[44:40];
                toArrayV <= v[44:40];
                toArrayW <= w[44:40];
                toArrayX <= x[44:40];
                toArrayY <= y[44:40];
                toArrayZ <= z[44:40];
            end
            4'd9: begin
                toArrayQuery <= hv_pipe[49:45];
                toArrayA <= a[49:45];
                toArrayB <= b[49:45];
                toArrayC <= c[49:45];
                toArrayD <= d[49:45];
                toArrayE <= e[49:45];
                toArrayF <= f[49:45];
                toArrayG <= g[49:45];
                toArrayH <= h[49:45];
                toArrayI <= i[49:45];
                toArrayJ <= j[49:45];
                toArrayK <= k[49:45];
                toArrayL <= l[49:45];
                toArrayM <= m[49:45];
                toArrayN <= n[49:45];
                toArrayO <= o[49:45];
                toArrayP <= p[49:45];
                toArrayQ <= q[49:45];
                toArrayR <= r[49:45];
                toArrayS <= s[49:45];
                toArrayT <= t[49:45];
                toArrayU <= u[49:45];
                toArrayV <= v[49:45];
                toArrayW <= w[49:45];
                toArrayX <= x[49:45];
                toArrayY <= y[49:45];
                toArrayZ <= z[49:45];
            end
            default: begin 
                toArrayQuery <= 5'd0;
                toArrayA <= 5'd0;
                toArrayB <= 5'd0;
                toArrayC <= 5'd0;
                toArrayD <= 5'd0;
                toArrayE <= 5'd0;
                toArrayF <= 5'd0;
                toArrayG <= 5'd0;
                toArrayH <= 5'd0;
                toArrayI <= 5'd0;
                toArrayJ <= 5'd0;
                toArrayK <= 5'd0;
                toArrayL <= 5'd0;
                toArrayM <= 5'd0;
                toArrayN <= 5'd0;
                toArrayO <= 5'd0;
                toArrayP <= 5'd0;
                toArrayQ <= 5'd0;
                toArrayR <= 5'd0;
                toArrayS <= 5'd0;
                toArrayT <= 5'd0;
                toArrayU <= 5'd0;
                toArrayV <= 5'd0;
                toArrayW <= 5'd0;
                toArrayX <= 5'd0;
                toArrayY <= 5'd0;
                toArrayZ <= 5'd0;
            end
        endcase
        end
     end
     
     //ENABLE SIGNAL FOR THE ACCUMULATOR
     always @ (*) begin
        if(!nrst) begin
            module_en <=1'd0;
        end
        else begin
            if(state == 4'd0 && input_ready) begin
                module_en <= 1'd1;
            end
            else if (enable) begin
                module_en <=1'd1;
            end
            else module_en <= 1'd0;
        end
     end
     
     //FSM AND PIPELINE MANAGER
     always@(posedge clk or negedge nrst) begin
        if(!nrst) begin
            hv_pipe = 50'd0;
            class_pipe = 5'b11111;
            state = 4'd0;
            enable = 1'd0;
            infer_done = 1'd0;
        end
        else begin
            if(enable || input_ready) begin
                if(state == 4'd0) begin
                    hv_pipe = query_hv;
                    class_pipe = query_class;
                    enable = 1'd1;
                    state = state+4'd1;
                    infer_done = 1'd0;
                end
                else if(state < 4'd9) begin
                    state = state+4'd1;
                    infer_done = 1'd0;
                end
                else begin
                    state = 4'd0;
                    infer_done = 1'd1;
                    if(!input_ready) begin
                        enable = 1'd0;
                        infer_done = 1'd1;
                    end
                end
            end
            else begin
                if(state == 4'd0) begin
                    hv_pipe = query_hv;
                    class_pipe = query_class;
                end
            end
        end
    end
    
    always @(posedge infer_done) begin
        inference_reg <=inference;
    end
endmodule
