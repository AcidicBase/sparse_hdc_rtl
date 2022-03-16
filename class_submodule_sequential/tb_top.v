`timescale 1ns / 1ps
`define CLK_PERIOD 1000
module tb_top();
    reg nrst, clk, input_ready; 
    reg [4:0] input_class;
    reg [49:0] input_hv;
    
    wire [49:0] hv_pipe;
    wire [4:0] class_pipe;
    wire enable;
    wire [3:0] state;
    wire accept_en;
    wire [399:0] nb_a,nb_b,nb_c,nb_d,nb_e,nb_f,nb_g,nb_h,nb_i,nb_j,nb_k,nb_l,nb_m,nb_n,nb_o,nb_p,nb_q,nb_r,nb_s,nb_t,nb_u,nb_v,nb_w,nb_x,nb_y,nb_z;
    wire [399:0] nb_reg_out;
    wire [49:0] a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z;
    
    mux_and_top UUT(
    .clk(clk),
    .nrst(nrst),
    .input_ready(input_ready),
    .input_class(input_class),
    .input_hv(input_hv),
    .hv_pipe(hv_pipe),
    .class_pipe(class_pipe),
    .enable(enable),
    .state(state),
    .accept_en(accept_en),
    .nb_a(nb_a),.nb_b(nb_b),.nb_c(nb_c),.nb_d(nb_d),.nb_e(nb_e),.nb_f(nb_f),.nb_g(nb_g),.nb_h(nb_h),.nb_i(nb_i),.nb_j(nb_j),.nb_k(nb_k),.nb_l(nb_l),.nb_m(nb_m),.nb_n(nb_n),.nb_o(nb_o),.nb_p(nb_p),.nb_q(nb_q),.nb_r(nb_r),.nb_s(nb_s),.nb_t(nb_t),.nb_u(nb_u),.nb_v(nb_v),.nb_w(nb_w),.nb_x(nb_x),.nb_y(nb_y),.nb_z(nb_z),
    .nb_reg_out(nb_reg_out),
    .a(a),.b(b),.c(c),.d(d),.e(e),.f(f),.g(g),.h(h),.i(i),.j(j),.k(k),.l(l),.m(m),.n(n),.o(o),.p(p),.q(q),.r(r),.s(s),.t(t),.u(u),.v(v),.w(w),.x(x),.y(y),.z(z)
    );

     always begin
        #(`CLK_PERIOD/2) clk = ~clk;
    end
    initial begin
        clk <= 1;
        nrst <= 0;
        input_ready <= 1'd0;
        input_hv <= 50'd0;
        input_class <= 5'd0;
        #(`CLK_PERIOD);
        nrst <= 1;
        #(`CLK_PERIOD);
        #(`CLK_PERIOD);
        input_hv <= 50'd255;
        input_class <= 5'd3;
        input_ready <= 1'd1;
        #(300*`CLK_PERIOD);
        //input_ready <= 1'd0;
        //input_hv <= 50'd5;
        //input_class <= 5'd5;
        //#(`CLK_PERIOD);
        //input_ready <= 1'd1;
        //#(20*`CLK_PERIOD);
        //input_ready <= 1'd0;
        //#(20*`CLK_PERIOD);
     end
endmodule
