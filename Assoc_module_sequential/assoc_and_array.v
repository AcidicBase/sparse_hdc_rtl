`timescale 1ns / 1ps
 //BASIC GIST FOR THIS AND ARRAY: SINCE WE'RE DOING SEQUENTIAL ACCUMULATION, WE ONLY NEED TO COMPARE THE NECESSARY BITS TO ACCUMULATE PER CC.
 //AT FULL-WIDTH, WE ACCEPT CHUNKS OF 500 BITS PER CC.
 //JUST CHANGE BITWIDTH PARAMETER IF YOU WANT TO CHANGE BITWIDTH TO FULL/SHORT WIDTH
module assoc_and_array 
#(parameter BITWIDTH = 5)
(query_hv,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,
out_a,out_b,out_c,out_d,out_e,out_f,out_g,out_h,out_i,out_j,out_k,out_l,out_m,out_n,out_o,out_p,out_q,out_r,out_s,out_t,out_u,out_v,out_w,out_x,out_y,out_z
);
    
    input [(BITWIDTH-1):0] query_hv,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z; //500 in full width (500 per CC)
    output wire [(BITWIDTH-1):0] out_a,out_b,out_c,out_d,out_e,out_f,out_g,out_h,out_i,out_j,out_k,out_l,out_m,out_n,out_o,out_p,out_q,out_r,out_s,out_t,out_u,out_v,out_w,out_x,out_y,out_z; //500 in full width application
    
    assign out_a = query_hv&a;
    assign out_b = query_hv&b;
    assign out_c = query_hv&c;
    assign out_d = query_hv&d;
    assign out_e = query_hv&e;
    assign out_f = query_hv&f;
    assign out_g = query_hv&g;
    assign out_h = query_hv&h;
    assign out_i = query_hv&i;
    assign out_j = query_hv&j;
    assign out_k = query_hv&k;
    assign out_l = query_hv&l;
    assign out_m = query_hv&m;
    assign out_n = query_hv&n;
    assign out_o = query_hv&o;
    assign out_p = query_hv&p;
    assign out_q = query_hv&q;
    assign out_r = query_hv&r;
    assign out_s = query_hv&s;
    assign out_t = query_hv&t;
    assign out_u = query_hv&u;
    assign out_v = query_hv&v;
    assign out_w = query_hv&w;
    assign out_x = query_hv&x;
    assign out_y = query_hv&y;
    assign out_z = query_hv&z;
    
endmodule