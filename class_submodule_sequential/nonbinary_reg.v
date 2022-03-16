`timescale 1ns / 1ps
//TODO: SCALE DOWN BIT WIDTH TO STORE ONLY UNTIL THRESHOLD
module nonbinary_reg(enable, clk,nrst,class,state,to_save,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,nonbin_out
    );
    input enable, clk,nrst;
    input [4:0] class;
    input [3:0] state;
    input [39:0] to_save;
    output reg [399:0] a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z; //5k*8 in full-width application
    output reg [399:0] nonbin_out;
    
    always @(posedge clk or negedge nrst) begin
        if(!nrst) begin
            a <= 400'd0;
            b <= 400'd0;
            c <= 400'd0;
            d <= 400'd0;
            e <= 400'd0;
            f <= 400'd0;
            g <= 400'd0;
            h <= 400'd0;
            i <= 400'd0;
            j <= 400'd0;
            k <= 400'd0;
            l <= 400'd0;
            m <= 400'd0;
            n <= 400'd0;
            o <= 400'd0;
            p <= 400'd0;
            q <= 400'd0;
            r <= 400'd0;
            s <= 400'd0;
            t <= 400'd0;
            u <= 400'd0;
            v <= 400'd0;
            w <= 400'd0;
            x <= 400'd0;
            y <= 400'd0;
            z <= 400'd0;
        end
        else begin
            if(enable) begin
                case(state)
                    4'd0: begin
                        case(class)
                            5'd0: a[39:0] <= to_save;
                            5'd1: b[39:0] <= to_save;
                            5'd2: c[39:0] <= to_save;
                            5'd3: d[39:0] <= to_save;
                            5'd4: e[39:0] <= to_save;
                            5'd5: f[39:0] <= to_save;
                            5'd6: g[39:0] <= to_save;
                            5'd7: h[39:0] <= to_save;
                            5'd8: i[39:0] <= to_save;
                            5'd9: j[39:0] <= to_save;
                            5'd10: k[39:0] <= to_save;
                            5'd11: l[39:0] <= to_save;
                            5'd12: m[39:0] <= to_save;
                            5'd13: n[39:0] <= to_save;
                            5'd14: o[39:0] <= to_save;
                            5'd15: p[39:0] <= to_save;
                            5'd16: q[39:0] <= to_save;
                            5'd17: r[39:0] <= to_save;
                            5'd18: s[39:0] <= to_save;
                            5'd19: t[39:0] <= to_save;
                            5'd20: u[39:0] <= to_save;
                            5'd21: v[39:0] <= to_save;
                            5'd22: w[39:0] <= to_save;
                            5'd23: x[39:0] <= to_save;
                            5'd24: y[39:0] <= to_save;
                            5'd25: z[39:0] <= to_save;
                            default: begin end
                        endcase
                    end
                    4'd1: begin
                        case(class)
                            5'd0: a[79:40] <= to_save;
                            5'd1: b[79:40] <= to_save;
                            5'd2: c[79:40] <= to_save;
                            5'd3: d[79:40] <= to_save;
                            5'd4: e[79:40] <= to_save;
                            5'd5: f[79:40] <= to_save;
                            5'd6: g[79:40] <= to_save;
                            5'd7: h[79:40] <= to_save;
                            5'd8: i[79:40] <= to_save;
                            5'd9: j[79:40] <= to_save;
                            5'd10: k[79:40] <= to_save;
                            5'd11: l[79:40] <= to_save;
                            5'd12: m[79:40] <= to_save;
                            5'd13: n[79:40] <= to_save;
                            5'd14: o[79:40] <= to_save;
                            5'd15: p[79:40] <= to_save;
                            5'd16: q[79:40] <= to_save;
                            5'd17: r[79:40] <= to_save;
                            5'd18: s[79:40] <= to_save;
                            5'd19: t[79:40] <= to_save;
                            5'd20: u[79:40] <= to_save;
                            5'd21: v[79:40] <= to_save;
                            5'd22: w[79:40] <= to_save;
                            5'd23: x[79:40] <= to_save;
                            5'd24: y[79:40] <= to_save;
                            5'd25: z[79:40] <= to_save;
                            default: begin end
                        endcase
                    end
                    4'd2: begin
                        case(class)
                            5'd0: a[119:80] <= to_save;
                            5'd1: b[119:80] <= to_save;
                            5'd2: c[119:80] <= to_save;
                            5'd3: d[119:80] <= to_save;
                            5'd4: e[119:80] <= to_save;
                            5'd5: f[119:80] <= to_save;
                            5'd6: g[119:80] <= to_save;
                            5'd7: h[119:80] <= to_save;
                            5'd8: i[119:80] <= to_save;
                            5'd9: j[119:80] <= to_save;
                            5'd10: k[119:80] <= to_save;
                            5'd11: l[119:80] <= to_save;
                            5'd12: m[119:80] <= to_save;
                            5'd13: n[119:80] <= to_save;
                            5'd14: o[119:80] <= to_save;
                            5'd15: p[119:80] <= to_save;
                            5'd16: q[119:80] <= to_save;
                            5'd17: r[119:80] <= to_save;
                            5'd18: s[119:80] <= to_save;
                            5'd19: t[119:80] <= to_save;
                            5'd20: u[119:80] <= to_save;
                            5'd21: v[119:80] <= to_save;
                            5'd22: w[119:80] <= to_save;
                            5'd23: x[119:80] <= to_save;
                            5'd24: y[119:80] <= to_save;
                            5'd25: z[119:80] <= to_save;
                            default: begin end
                        endcase
                    end
                    4'd3: begin
                        case(class)
                            5'd0: a[159:120] <= to_save;
                            5'd1: b[159:120] <= to_save;
                            5'd2: c[159:120] <= to_save;
                            5'd3: d[159:120] <= to_save;
                            5'd4: e[159:120] <= to_save;
                            5'd5: f[159:120] <= to_save;
                            5'd6: g[159:120] <= to_save;
                            5'd7: h[159:120] <= to_save;
                            5'd8: i[159:120] <= to_save;
                            5'd9: j[159:120] <= to_save;
                            5'd10: k[159:120] <= to_save;
                            5'd11: l[159:120] <= to_save;
                            5'd12: m[159:120] <= to_save;
                            5'd13: n[159:120] <= to_save;
                            5'd14: o[159:120] <= to_save;
                            5'd15: p[159:120] <= to_save;
                            5'd16: q[159:120] <= to_save;
                            5'd17: r[159:120] <= to_save;
                            5'd18: s[159:120] <= to_save;
                            5'd19: t[159:120] <= to_save;
                            5'd20: u[159:120] <= to_save;
                            5'd21: v[159:120] <= to_save;
                            5'd22: w[159:120] <= to_save;
                            5'd23: x[159:120] <= to_save;
                            5'd24: y[159:120] <= to_save;
                            5'd25: z[159:120] <= to_save;
                            default: begin end
                        endcase
                    end
                    4'd4: begin
                        case(class)
                            5'd0: a[199:160] <= to_save;
                            5'd1: b[199:160] <= to_save;
                            5'd2: c[199:160] <= to_save;
                            5'd3: d[199:160] <= to_save;
                            5'd4: e[199:160] <= to_save;
                            5'd5: f[199:160] <= to_save;
                            5'd6: g[199:160] <= to_save;
                            5'd7: h[199:160] <= to_save;
                            5'd8: i[199:160] <= to_save;
                            5'd9: j[199:160] <= to_save;
                            5'd10: k[199:160] <= to_save;
                            5'd11: l[199:160] <= to_save;
                            5'd12: m[199:160] <= to_save;
                            5'd13: n[199:160] <= to_save;
                            5'd14: o[199:160] <= to_save;
                            5'd15: p[199:160] <= to_save;
                            5'd16: q[199:160] <= to_save;
                            5'd17: r[199:160] <= to_save;
                            5'd18: s[199:160] <= to_save;
                            5'd19: t[199:160] <= to_save;
                            5'd20: u[199:160] <= to_save;
                            5'd21: v[199:160] <= to_save;
                            5'd22: w[199:160] <= to_save;
                            5'd23: x[199:160] <= to_save;
                            5'd24: y[199:160] <= to_save;
                            5'd25: z[199:160] <= to_save;
                            default: begin end
                        endcase
                    end
                    4'd5: begin
                        case(class)
                            5'd0: a[239:200] <= to_save;
                            5'd1: b[239:200] <= to_save;
                            5'd2: c[239:200] <= to_save;
                            5'd3: d[239:200] <= to_save;
                            5'd4: e[239:200] <= to_save;
                            5'd5: f[239:200] <= to_save;
                            5'd6: g[239:200] <= to_save;
                            5'd7: h[239:200] <= to_save;
                            5'd8: i[239:200] <= to_save;
                            5'd9: j[239:200] <= to_save;
                            5'd10: k[239:200] <= to_save;
                            5'd11: l[239:200] <= to_save;
                            5'd12: m[239:200] <= to_save;
                            5'd13: n[239:200] <= to_save;
                            5'd14: o[239:200] <= to_save;
                            5'd15: p[239:200] <= to_save;
                            5'd16: q[239:200] <= to_save;
                            5'd17: r[239:200] <= to_save;
                            5'd18: s[239:200] <= to_save;
                            5'd19: t[239:200] <= to_save;
                            5'd20: u[239:200] <= to_save;
                            5'd21: v[239:200] <= to_save;
                            5'd22: w[239:200] <= to_save;
                            5'd23: x[239:200] <= to_save;
                            5'd24: y[239:200] <= to_save;
                            5'd25: z[239:200] <= to_save;
                            default: begin end
                        endcase
                    end
                    4'd6: begin
                        case(class)
                            5'd0: a[279:240] <= to_save;
                            5'd1: b[279:240] <= to_save;
                            5'd2: c[279:240] <= to_save;
                            5'd3: d[279:240] <= to_save;
                            5'd4: e[279:240] <= to_save;
                            5'd5: f[279:240] <= to_save;
                            5'd6: g[279:240] <= to_save;
                            5'd7: h[279:240] <= to_save;
                            5'd8: i[279:240] <= to_save;
                            5'd9: j[279:240] <= to_save;
                            5'd10: k[279:240] <= to_save;
                            5'd11: l[279:240] <= to_save;
                            5'd12: m[279:240] <= to_save;
                            5'd13: n[279:240] <= to_save;
                            5'd14: o[279:240] <= to_save;
                            5'd15: p[279:240] <= to_save;
                            5'd16: q[279:240] <= to_save;
                            5'd17: r[279:240] <= to_save;
                            5'd18: s[279:240] <= to_save;
                            5'd19: t[279:240] <= to_save;
                            5'd20: u[279:240] <= to_save;
                            5'd21: v[279:240] <= to_save;
                            5'd22: w[279:240] <= to_save;
                            5'd23: x[279:240] <= to_save;
                            5'd24: y[279:240] <= to_save;
                            5'd25: z[279:240] <= to_save;
                            default: begin end
                        endcase
                    end
                    4'd7: begin
                        case(class)
                            5'd0: a[319:280] <= to_save;
                            5'd1: b[319:280] <= to_save;
                            5'd2: c[319:280] <= to_save;
                            5'd3: d[319:280] <= to_save;
                            5'd4: e[319:280] <= to_save;
                            5'd5: f[319:280] <= to_save;
                            5'd6: g[319:280] <= to_save;
                            5'd7: h[319:280] <= to_save;
                            5'd8: i[319:280] <= to_save;
                            5'd9: j[319:280] <= to_save;
                            5'd10: k[319:280] <= to_save;
                            5'd11: l[319:280] <= to_save;
                            5'd12: m[319:280] <= to_save;
                            5'd13: n[319:280] <= to_save;
                            5'd14: o[319:280] <= to_save;
                            5'd15: p[319:280] <= to_save;
                            5'd16: q[319:280] <= to_save;
                            5'd17: r[319:280] <= to_save;
                            5'd18: s[319:280] <= to_save;
                            5'd19: t[319:280] <= to_save;
                            5'd20: u[319:280] <= to_save;
                            5'd21: v[319:280] <= to_save;
                            5'd22: w[319:280] <= to_save;
                            5'd23: x[319:280] <= to_save;
                            5'd24: y[319:280] <= to_save;
                            5'd25: z[319:280] <= to_save;
                            default: begin end
                        endcase
                    end
                    4'd8: begin
                        case(class)
                            5'd0: a[359:320] <= to_save;
                            5'd1: b[359:320] <= to_save;
                            5'd2: c[359:320] <= to_save;
                            5'd3: d[359:320] <= to_save;
                            5'd4: e[359:320] <= to_save;
                            5'd5: f[359:320] <= to_save;
                            5'd6: g[359:320] <= to_save;
                            5'd7: h[359:320] <= to_save;
                            5'd8: i[359:320] <= to_save;
                            5'd9: j[359:320] <= to_save;
                            5'd10: k[359:320] <= to_save;
                            5'd11: l[359:320] <= to_save;
                            5'd12: m[359:320] <= to_save;
                            5'd13: n[359:320] <= to_save;
                            5'd14: o[359:320] <= to_save;
                            5'd15: p[359:320] <= to_save;
                            5'd16: q[359:320] <= to_save;
                            5'd17: r[359:320] <= to_save;
                            5'd18: s[359:320] <= to_save;
                            5'd19: t[359:320] <= to_save;
                            5'd20: u[359:320] <= to_save;
                            5'd21: v[359:320] <= to_save;
                            5'd22: w[359:320] <= to_save;
                            5'd23: x[359:320] <= to_save;
                            5'd24: y[359:320] <= to_save;
                            5'd25: z[359:320] <= to_save;
                            default: begin end
                        endcase
                    end
                    4'd9: begin
                        case(class)
                            5'd0: a[399:360] <= to_save;
                            5'd1: b[399:360] <= to_save;
                            5'd2: c[399:360] <= to_save;
                            5'd3: d[399:360] <= to_save;
                            5'd4: e[399:360] <= to_save;
                            5'd5: f[399:360] <= to_save;
                            5'd6: g[399:360] <= to_save;
                            5'd7: h[399:360] <= to_save;
                            5'd8: i[399:360] <= to_save;
                            5'd9: j[399:360] <= to_save;
                            5'd10: k[399:360] <= to_save;
                            5'd11: l[399:360] <= to_save;
                            5'd12: m[399:360] <= to_save;
                            5'd13: n[399:360] <= to_save;
                            5'd14: o[399:360] <= to_save;
                            5'd15: p[399:360] <= to_save;
                            5'd16: q[399:360] <= to_save;
                            5'd17: r[399:360] <= to_save;
                            5'd18: s[399:360] <= to_save;
                            5'd19: t[399:360] <= to_save;
                            5'd20: u[399:360] <= to_save;
                            5'd21: v[399:360] <= to_save;
                            5'd22: w[399:360] <= to_save;
                            5'd23: x[399:360] <= to_save;
                            5'd24: y[399:360] <= to_save;
                            5'd25: z[399:360] <= to_save;
                            default: begin end
                        endcase
                    end
                    default: begin
                    
                    end
                endcase
            end
        end
    end
    
    always @ (*) begin
        if(!nrst) begin
            nonbin_out <= 400'd0;
        end
        else begin
            case(class)
                5'd0: nonbin_out <= a;
                5'd1: nonbin_out <= b;
                5'd2: nonbin_out <= c;
                5'd3: nonbin_out <= d;
                5'd4: nonbin_out <= e;
                5'd5: nonbin_out <= f;
                5'd6: nonbin_out <= g;
                5'd7: nonbin_out <= h;
                5'd8: nonbin_out <= i;
                5'd9: nonbin_out <= j;
                5'd10: nonbin_out <= k;
                5'd11: nonbin_out <= l;
                5'd12: nonbin_out <= m;
                5'd13: nonbin_out <= n;
                5'd14: nonbin_out <= o;
                5'd15: nonbin_out <= p;
                5'd16: nonbin_out <= q;
                5'd17: nonbin_out <= r;
                5'd18: nonbin_out <= s;
                5'd19: nonbin_out <= t;
                5'd20: nonbin_out <= u;
                5'd21: nonbin_out <= v;
                5'd22: nonbin_out <= w;
                5'd23: nonbin_out <= x;
                5'd24: nonbin_out <= y;
                5'd25: nonbin_out <= z;
            endcase
       end
    end
    
endmodule
