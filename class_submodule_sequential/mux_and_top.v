//hv,class,state chosen by mux-> adder -> nonbinary reg || encoder -> binary reg

`timescale 1ns / 1ps

module mux_and_top(clk,nrst,input_class,input_hv,input_ready, hv_pipe, class_pipe, enable, state, accept_en,
     nb_a,nb_b,nb_c,nb_d,nb_e,nb_f,nb_g,nb_h,nb_i,nb_j,nb_k,nb_l,nb_m,nb_n,nb_o,nb_p,nb_q,nb_r,nb_s,nb_t,nb_u,nb_v,nb_w,nb_x,nb_y,nb_z,
     a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,
     nb_reg_out);
    input clk,nrst,input_ready;
    input [4:0] input_class;
    input [49:0] input_hv; //5k in full-width
    
    output reg [49:0] hv_pipe;
    output reg [4:0] class_pipe;
    output reg enable;
    output reg [3:0] state;
    output reg accept_en;
    
    reg [4:0] class_to_adder;
    reg [4:0] hv_to_adder;
    wire [39:0] adder_out;
    wire [4:0] threshold_out;
    output wire [399:0] nb_reg_out;
    reg [39:0] nb_hv_to_adder;
    
    output wire [399:0] nb_a,nb_b,nb_c,nb_d,nb_e,nb_f,nb_g,nb_h,nb_i,nb_j,nb_k,nb_l,nb_m,nb_n,nb_o,nb_p,nb_q,nb_r,nb_s,nb_t,nb_u,nb_v,nb_w,nb_x,nb_y,nb_z;
    output wire [49:0] a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z;
    
    reg module_en;
    
    nonbinary_reg nonbinary_reg(
    .enable(module_en),
    .clk(clk),
    .nrst(nrst),
    .state(state),
    .class(class_to_adder),
    .to_save(adder_out),
    .a(nb_a),.b(nb_b),.c(nb_c),.d(nb_d),.e(nb_e),.f(nb_f),.g(nb_g),.h(nb_h),.i(nb_i),.j(nb_j),.k(nb_k),.l(nb_l),.m(nb_m),.n(nb_n),.o(nb_o),.p(nb_p),.q(nb_q),.r(nb_r),.s(nb_s),.t(nb_t),.u(nb_u),.v(nb_v),.w(nb_w),.x(nb_x),.y(nb_y),.z(nb_z),
    .nonbin_out(nb_reg_out)
    );
    
    binary_reg binary_reg(
    .enable(module_en),
    .clk(clk),
    .nrst(nrst),
    .state(state),
    .class(class_to_adder),
    .to_save(threshold_out),
    .a(a),.b(b),.c(c),.d(d),.e(e),.f(f),.g(g),.h(h),.i(i),.j(j),.k(k),.l(l),.m(m),.n(n),.o(o),.p(p),.q(q),.r(r),.s(s),.t(t),.u(u),.v(v),.w(w),.x(x),.y(y),.z(z)
    );
    
    adder_block adder(
    .input_hv_chunk(hv_to_adder),
    .stored_hv_chunk(nb_hv_to_adder),
    .sum(adder_out)
    );
    
    thresholder thresholder(
    .adder_output(adder_out),
    .thresholded_hv(threshold_out)
    );
    
    //MUX FOR NONBINARY REG ADDER INPUT
    always @ (*) begin
     if(!nrst) begin
        nb_hv_to_adder <= 50'd0;
     end
     else begin
        case(state)
            4'd0: nb_hv_to_adder <= nb_reg_out[39:0];
            4'd1: nb_hv_to_adder <= nb_reg_out[79:40];
            4'd2: nb_hv_to_adder <= nb_reg_out[119:80];
            4'd3: nb_hv_to_adder <= nb_reg_out[159:120];
            4'd4: nb_hv_to_adder <= nb_reg_out[199:160];
            4'd5: nb_hv_to_adder <= nb_reg_out[239:200];
            4'd6: nb_hv_to_adder <= nb_reg_out[279:240];
            4'd7: nb_hv_to_adder <= nb_reg_out[319:280];
            4'd8: nb_hv_to_adder <= nb_reg_out[359:320];
            4'd9: nb_hv_to_adder <= nb_reg_out[399:360];
            default: nb_hv_to_adder <=50'd0;
        endcase
     end
    end
    
    //MUX TO DECIDE IF YOU SHOULD USE STORED PIPELINE VALUE OR DIRECT INPUT & what chunk of input hv to use
    always @ (*) begin
     if(!nrst) begin
        class_to_adder <= 5'b11111;
        hv_to_adder <= 5'd0;
     end
     else begin
        case(state)
            4'd0: begin
                class_to_adder <= input_class;
                hv_to_adder <= input_hv[4:0];
            end
            4'd1: begin
                class_to_adder <= class_pipe;
                hv_to_adder <= hv_pipe[9:5];
            end
            4'd2: begin
                class_to_adder <= class_pipe;
                hv_to_adder <= hv_pipe[14:10];
            end
            4'd3: begin
                class_to_adder <= class_pipe;
                hv_to_adder <= hv_pipe[19:15];
            end
            4'd4: begin
                class_to_adder <= class_pipe;
                hv_to_adder <= hv_pipe[24:20];
            end
            4'd5: begin
                class_to_adder <= class_pipe;
                hv_to_adder <= hv_pipe[29:25];
            end
            4'd6: begin
                class_to_adder <= class_pipe;
                hv_to_adder <= hv_pipe[34:30];
            end
            4'd7: begin
                class_to_adder <= class_pipe;
                hv_to_adder <= hv_pipe[39:35];
            end
            4'd8: begin
                class_to_adder <= class_pipe;
                hv_to_adder <= hv_pipe[44:40];
            end
            4'd9: begin
                class_to_adder <= class_pipe;
                hv_to_adder <= hv_pipe[49:45];
            end
            default: begin 
                class_to_adder <= 5'b11111;
                hv_to_adder <= 5'd0;
            end
        endcase
        end
     end
     
     always @ (*) begin
        if(!nrst) begin
            module_en <=1'd0;
        end
        else begin
            if(state == 4'd0) begin
                module_en <= 1'd1;
            end
            else if (enable) begin
                module_en <=1'd1;
            end
            else module_en <= 1'd0;
        end
     end
    
    always@(posedge clk or negedge nrst) begin
        if(!nrst) begin
            hv_pipe = 50'd0;
            class_pipe = 5'b11111;
            state = 4'd0;
            enable = 1'd0;
            accept_en = 1'd0;
        end
        else begin
            if(enable || input_ready) begin
                if(state == 4'd0) begin
                    hv_pipe = input_hv;
                    class_pipe = input_class;
                    enable = 1'd1;
                    state = state+4'd1;
                    accept_en = 1'd0;
                end
                else if(state < 4'd9) begin
                    state = state+4'd1;
                    accept_en = 1'd0;
                end
                else begin
                    state = 4'd0;
                    accept_en = 1'd1;
                    if(!input_ready) begin
                        enable = 1'd0;
                        accept_en = 1'd1;
                    end
                end
            end
            else begin
                if(state == 4'd0) begin
                    hv_pipe = input_hv;
                    class_pipe = input_class;
                end
            end
        end
    end
    
    

endmodule