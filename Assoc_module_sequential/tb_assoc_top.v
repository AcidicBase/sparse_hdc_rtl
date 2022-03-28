`timescale 1ns / 1ps
`define CLK_PERIOD 1000

module tb_assoc_top(

    );
    reg [49:0] query_hv,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z;
    reg clk,nrst,input_ready;
    reg [4:0]query_class;
    
    wire [4:0] inference,inference_reg;
    
    wire infer_done;
    wire enable;
    wire [4:0] class_pipe;
    wire [49:0] hv_pipe;
    wire [3:0] state;
    always begin
        #(`CLK_PERIOD/2) clk = ~clk;
    end
    
    assoc_top_short UUT(clk,nrst,input_ready,query_hv,query_class,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,inference,inference_reg,
hv_pipe,class_pipe,enable,state,infer_done);
    
    initial begin
        clk <= 0;
        nrst <= 0;
        input_ready <= 1'd0;
        query_hv <= 50'd0;
        query_class <= 5'd0;
        a <= 50'hFFFF; //16
        b <= 50'hFF; //8
        c <= 50'hF0000; //4
        d <= 50'hFFFFF; //20
        e <= 50'hFFF00; //12
        f <= 50'hF000F; //8
        g <= 50'hFFFFFF; //24
        h <= 50'hFFF00F; //16
        i <= 50'hFFFFFFF; //28
        j <= 50'hFFFFFFFFF; //36
        k <= 50'h11; //2
        l <= 50'h12; //3
        m <= 50'h100001;//2
        n <= 50'hF; //4
        o <= 50'h5; //2
        p <= 50'h56; //4
        q <= 50'hFFFFFFFF; //32
        r <= 50'h65; //4
        s <= 50'h8; //1
        t <= 50'h2; //1
        u <= 50'h756; //7
        v <= 50'hFFF; //12
        w <= 50'h777; //9
        x <= 50'hF000000001; //3
        y <= 50'hF000000001; //3
        z <= 50'hF000000000;
        #(`CLK_PERIOD);
        nrst <= 1;
        #(`CLK_PERIOD);
        #(`CLK_PERIOD);
        query_hv <= 50'hFFFFFFFFFF;
        query_class <= 5'd3;
        input_ready <= 1'd1;
        #(35*`CLK_PERIOD);
        input_ready <= 1'd0;
        query_hv <= 50'hF000000001;
        query_class <= 5'd5;
        #(`CLK_PERIOD);
        input_ready <= 1'd1;
        #(40*`CLK_PERIOD);
        input_ready <= 1'd0;
        #(20*`CLK_PERIOD);
     end
endmodule
