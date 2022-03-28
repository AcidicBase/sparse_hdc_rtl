`timescale 1ns / 1ps
`define CLK_PERIOD 1000
module tb_assoc_and_26pack();
    reg [49:0]query_hv,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z;
    wire [49:0] out_a,out_b,out_c,out_d,out_e,out_f,out_g,out_h,out_i,out_j,out_k,out_l,out_m,out_n,out_o,out_p,out_q,out_r,out_s,out_t,out_u,out_v,out_w,out_x,out_y,out_z;
    
    assoc_and_array UUT(query_hv,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,
    out_a,out_b,out_c,out_d,out_e,out_f,out_g,out_h,out_i,out_j,out_k,out_l,out_m,out_n,out_o,out_p,out_q,out_r,out_s,out_t,out_u,out_v,out_w,out_x,out_y,out_z);
    
    initial begin
        query_hv = 50'b11111;
        a = 50'b10001;
        b = 50'b01110;
    
    end
    
endmodule
