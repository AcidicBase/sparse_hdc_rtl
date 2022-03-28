`timescale 1ns / 1ps

module tree_add_16bit_26p(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,
out_a,out_b,out_c,out_d,out_e,out_f,out_g,out_h,out_i,out_j,out_k,out_l,out_m,out_n,out_o,out_p,out_q,out_r,out_s,out_t,out_u,out_v,out_w,out_x,out_y,out_z);

    input [4:0] a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z;
    output wire [4:0] out_a,out_b,out_c,out_d,out_e,out_f,out_g,out_h,out_i,out_j,out_k,out_l,out_m,out_n,out_o,out_p,out_q,out_r,out_s,out_t,out_u,out_v,out_w,out_x,out_y,out_z;
    
    tree_add_16bit a_add(
    .sixteen_bit_in({11'd0,a}),
    .sum(out_a)
    );
    tree_add_16bit b_add(
    .sixteen_bit_in({11'd0,b}),
    .sum(out_b)
    );
    tree_add_16bit c_add(
    .sixteen_bit_in({11'd0,c}),
    .sum(out_c)
    );
    tree_add_16bit d_add(
    .sixteen_bit_in({11'd0,d}),
    .sum(out_d)
    );
    tree_add_16bit e_add(
    .sixteen_bit_in({11'd0,e}),
    .sum(out_e)
    );
    tree_add_16bit f_add(
    .sixteen_bit_in({11'd0,f}),
    .sum(out_f)
    );
    tree_add_16bit g_add(
    .sixteen_bit_in({11'd0,g}),
    .sum(out_g)
    );
    tree_add_16bit h_add(
    .sixteen_bit_in({11'd0,h}),
    .sum(out_h)
    );
    tree_add_16bit i_add(
    .sixteen_bit_in({11'd0,i}),
    .sum(out_i)
    );
    tree_add_16bit j_add(
    .sixteen_bit_in({11'd0,j}),
    .sum(out_j)
    );
    tree_add_16bit k_add(
    .sixteen_bit_in({11'd0,k}),
    .sum(out_k)
    );
    tree_add_16bit l_add(
    .sixteen_bit_in({11'd0,l}),
    .sum(out_l)
    );
    tree_add_16bit m_add(
    .sixteen_bit_in({11'd0,m}),
    .sum(out_m)
    );
    tree_add_16bit n_add(
    .sixteen_bit_in({11'd0,n}),
    .sum(out_n)
    );
    tree_add_16bit o_add(
    .sixteen_bit_in({11'd0,o}),
    .sum(out_o)
    );
    tree_add_16bit p_add(
    .sixteen_bit_in({11'd0,p}),
    .sum(out_p)
    );
    tree_add_16bit q_add(
    .sixteen_bit_in({11'd0,q}),
    .sum(out_q)
    );
    tree_add_16bit r_add(
    .sixteen_bit_in({11'd0,r}),
    .sum(out_r)
    );
    tree_add_16bit s_add(
    .sixteen_bit_in({11'd0,s}),
    .sum(out_s)
    );
    tree_add_16bit t_add(
    .sixteen_bit_in({11'd0,t}),
    .sum(out_t)
    );
    tree_add_16bit u_add(
    .sixteen_bit_in({11'd0,u}),
    .sum(out_u)
    );
    tree_add_16bit v_add(
    .sixteen_bit_in({11'd0,v}),
    .sum(out_v)
    );
    tree_add_16bit w_add(
    .sixteen_bit_in({11'd0,w}),
    .sum(out_w)
    );
    tree_add_16bit x_add(
    .sixteen_bit_in({11'd0,x}),
    .sum(out_x)
    );
    tree_add_16bit y_add(
    .sixteen_bit_in({11'd0,y}),
    .sum(out_y)
    );
    tree_add_16bit z_add(
    .sixteen_bit_in({11'd0,z}),
    .sum(out_z)
    );
    

endmodule
