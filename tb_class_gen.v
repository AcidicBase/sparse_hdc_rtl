`timescale 1ns / 1ps
`define CLK_PERIOD 1000
module tb_class_gen();
    reg clk;
    reg nrst;
    reg [4:0] class;
    reg [9:0] hypervector;
    wire [9:0] a;
    wire [9:0] b;
    wire [9:0] c;
    wire [9:0] d;
    wire [9:0] e;
    wire [9:0] f;
    wire [9:0] g;
    wire [9:0] h;
    wire [9:0] i;
    wire [9:0] j;
    wire [9:0] k;
    wire [9:0] l;
    wire [9:0] m;
    wire [9:0] n;
    wire [9:0] o;
    wire [9:0] p;
    wire [9:0] q;
    wire [9:0] r;
    wire [9:0] s;
    wire [9:0] t;
    wire [9:0] u;
    wire [9:0] v;
    wire [9:0] w;
    wire [9:0] x;
    wire [9:0] y;
    wire [9:0] z;
    
    class_gen UUT(
    .clk(clk),
    .nrst(nrst),
    .class(class),
    .hypervector(hypervector),
    .a(a),.b(b),.c(c),.d(d),.e(e),.f(f),.g(g),.h(h),.i(i),.j(j),.k(k),.l(l),.m(m),.n(n),.o(o),.p(p),.q(q),.r(r),.s(s),.t(t),.u(u),.v(v),.w(w),.x(x),.y(y),.z(z)
    );
    
    always begin
        #(`CLK_PERIOD/2) clk = ~clk;
    end
    
    initial begin
        clk = 1'b1;
        nrst = 1'b0;
        #(`CLK_PERIOD);
        nrst = 1'b1;
        #(`CLK_PERIOD);
        hypervector = 10'b1111001111;
        #(5*`CLK_PERIOD);
        class = 5'd0;
        hypervector = 10'b1111001111;
        #(15*`CLK_PERIOD);
        hypervector = 10'b0000000001;
        #(20*`CLK_PERIOD);
        hypervector = 10'b0000111000;
        #(35*`CLK_PERIOD);
        class = 5'd1;
        hypervector = 10'b1111111111;
        #(35*`CLK_PERIOD);
    end
endmodule
