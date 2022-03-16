`timescale 1ns / 1ps

module binary_reg(enable, clk,nrst,class,state,to_save,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z
    );
    input enable, clk,nrst;
    input [4:0] class;
    input [3:0] state;
    input [4:0] to_save;
    output reg [49:0] a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z; //5k in full-width application
    
    always @(posedge clk or negedge nrst) begin
        if(!nrst) begin
            a <= 50'd0;
            b <= 50'd0;
            c <= 50'd0;
            d <= 50'd0;
            e <= 50'd0;
            f <= 50'd0;
            g <= 50'd0;
            h <= 50'd0;
            i <= 50'd0;
            j <= 50'd0;
            k <= 50'd0;
            l <= 50'd0;
            m <= 50'd0;
            n <= 50'd0;
            o <= 50'd0;
            p <= 50'd0;
            q <= 50'd0;
            r <= 50'd0;
            s <= 50'd0;
            t <= 50'd0;
            u <= 50'd0;
            v <= 50'd0;
            w <= 50'd0;
            x <= 50'd0;
            y <= 50'd0;
            z <= 50'd0;
        end
        else begin
            if(enable) begin
                case(state)
                    4'd0: begin
                        case(class)
                            5'd0: a[4:0] <= to_save;
                            5'd1: b[4:0] <= to_save;
                            5'd2: c[4:0] <= to_save;
                            5'd3: d[4:0] <= to_save;
                            5'd4: e[4:0] <= to_save;
                            5'd5: f[4:0] <= to_save;
                            5'd6: g[4:0] <= to_save;
                            5'd7: h[4:0] <= to_save;
                            5'd8: i[4:0] <= to_save;
                            5'd9: j[4:0] <= to_save;
                            5'd10: k[4:0] <= to_save;
                            5'd11: l[4:0] <= to_save;
                            5'd12: m[4:0] <= to_save;
                            5'd13: n[4:0] <= to_save;
                            5'd14: o[4:0] <= to_save;
                            5'd15: p[4:0] <= to_save;
                            5'd16: q[4:0] <= to_save;
                            5'd17: r[4:0] <= to_save;
                            5'd18: s[4:0] <= to_save;
                            5'd19: t[4:0] <= to_save;
                            5'd20: u[4:0] <= to_save;
                            5'd21: v[4:0] <= to_save;
                            5'd22: w[4:0] <= to_save;
                            5'd23: x[4:0] <= to_save;
                            5'd24: y[4:0] <= to_save;
                            5'd25: z[4:0] <= to_save;
                            default: begin end
                        endcase
                    end
                    4'd1: begin
                        case(class)
                            5'd0: a[9:5] <= to_save;
                            5'd1: b[9:5] <= to_save;
                            5'd2: c[9:5] <= to_save;
                            5'd3: d[9:5] <= to_save;
                            5'd4: e[9:5] <= to_save;
                            5'd5: f[9:5] <= to_save;
                            5'd6: g[9:5] <= to_save;
                            5'd7: h[9:5] <= to_save;
                            5'd8: i[9:5] <= to_save;
                            5'd9: j[9:5] <= to_save;
                            5'd10: k[9:5] <= to_save;
                            5'd11: l[9:5] <= to_save;
                            5'd12: m[9:5] <= to_save;
                            5'd13: n[9:5] <= to_save;
                            5'd14: o[9:5] <= to_save;
                            5'd15: p[9:5] <= to_save;
                            5'd16: q[9:5] <= to_save;
                            5'd17: r[9:5] <= to_save;
                            5'd18: s[9:5] <= to_save;
                            5'd19: t[9:5] <= to_save;
                            5'd20: u[9:5] <= to_save;
                            5'd21: v[9:5] <= to_save;
                            5'd22: w[9:5] <= to_save;
                            5'd23: x[9:5] <= to_save;
                            5'd24: y[9:5] <= to_save;
                            5'd25: z[9:5] <= to_save;
                            default: begin end
                        endcase
                    end
                    4'd2: begin
                        case(class)
                            5'd0: a[14:10] <= to_save;
                            5'd1: b[14:10] <= to_save;
                            5'd2: c[14:10] <= to_save;
                            5'd3: d[14:10] <= to_save;
                            5'd4: e[14:10] <= to_save;
                            5'd5: f[14:10] <= to_save;
                            5'd6: g[14:10] <= to_save;
                            5'd7: h[14:10] <= to_save;
                            5'd8: i[14:10] <= to_save;
                            5'd9: j[14:10] <= to_save;
                            5'd10: k[14:10] <= to_save;
                            5'd11: l[14:10] <= to_save;
                            5'd12: m[14:10] <= to_save;
                            5'd13: n[14:10] <= to_save;
                            5'd14: o[14:10] <= to_save;
                            5'd15: p[14:10] <= to_save;
                            5'd16: q[14:10] <= to_save;
                            5'd17: r[14:10] <= to_save;
                            5'd18: s[14:10] <= to_save;
                            5'd19: t[14:10] <= to_save;
                            5'd20: u[14:10] <= to_save;
                            5'd21: v[14:10] <= to_save;
                            5'd22: w[14:10] <= to_save;
                            5'd23: x[14:10] <= to_save;
                            5'd24: y[14:10] <= to_save;
                            5'd25: z[14:10] <= to_save;
                            default: begin end
                        endcase
                    end
                    4'd3: begin
                        case(class)
                            5'd0: a[19:15] <= to_save;
                            5'd1: b[19:15] <= to_save;
                            5'd2: c[19:15] <= to_save;
                            5'd3: d[19:15] <= to_save;
                            5'd4: e[19:15] <= to_save;
                            5'd5: f[19:15] <= to_save;
                            5'd6: g[19:15] <= to_save;
                            5'd7: h[19:15] <= to_save;
                            5'd8: i[19:15] <= to_save;
                            5'd9: j[19:15] <= to_save;
                            5'd10: k[19:15] <= to_save;
                            5'd11: l[19:15] <= to_save;
                            5'd12: m[19:15] <= to_save;
                            5'd13: n[19:15] <= to_save;
                            5'd14: o[19:15] <= to_save;
                            5'd15: p[19:15] <= to_save;
                            5'd16: q[19:15] <= to_save;
                            5'd17: r[19:15] <= to_save;
                            5'd18: s[19:15] <= to_save;
                            5'd19: t[19:15] <= to_save;
                            5'd20: u[19:15] <= to_save;
                            5'd21: v[19:15] <= to_save;
                            5'd22: w[19:15] <= to_save;
                            5'd23: x[19:15] <= to_save;
                            5'd24: y[19:15] <= to_save;
                            5'd25: z[19:15] <= to_save;
                            default: begin end
                        endcase
                    end
                    4'd4: begin
                        case(class)
                            5'd0: a[24:20] <= to_save;
                            5'd1: b[24:20] <= to_save;
                            5'd2: c[24:20] <= to_save;
                            5'd3: d[24:20] <= to_save;
                            5'd4: e[24:20] <= to_save;
                            5'd5: f[24:20] <= to_save;
                            5'd6: g[24:20] <= to_save;
                            5'd7: h[24:20] <= to_save;
                            5'd8: i[24:20] <= to_save;
                            5'd9: j[24:20] <= to_save;
                            5'd10: k[24:20] <= to_save;
                            5'd11: l[24:20] <= to_save;
                            5'd12: m[24:20] <= to_save;
                            5'd13: n[24:20] <= to_save;
                            5'd14: o[24:20] <= to_save;
                            5'd15: p[24:20] <= to_save;
                            5'd16: q[24:20] <= to_save;
                            5'd17: r[24:20] <= to_save;
                            5'd18: s[24:20] <= to_save;
                            5'd19: t[24:20] <= to_save;
                            5'd20: u[24:20] <= to_save;
                            5'd21: v[24:20] <= to_save;
                            5'd22: w[24:20] <= to_save;
                            5'd23: x[24:20] <= to_save;
                            5'd24: y[24:20] <= to_save;
                            5'd25: z[24:20] <= to_save;
                            default: begin end
                        endcase
                    end
                    4'd5: begin
                        case(class)
                            5'd0: a[29:25] <= to_save;
                            5'd1: b[29:25] <= to_save;
                            5'd2: c[29:25] <= to_save;
                            5'd3: d[29:25] <= to_save;
                            5'd4: e[29:25] <= to_save;
                            5'd5: f[29:25] <= to_save;
                            5'd6: g[29:25] <= to_save;
                            5'd7: h[29:25] <= to_save;
                            5'd8: i[29:25] <= to_save;
                            5'd9: j[29:25] <= to_save;
                            5'd10: k[29:25] <= to_save;
                            5'd11: l[29:25] <= to_save;
                            5'd12: m[29:25] <= to_save;
                            5'd13: n[29:25] <= to_save;
                            5'd14: o[29:25] <= to_save;
                            5'd15: p[29:25] <= to_save;
                            5'd16: q[29:25] <= to_save;
                            5'd17: r[29:25] <= to_save;
                            5'd18: s[29:25] <= to_save;
                            5'd19: t[29:25] <= to_save;
                            5'd20: u[29:25] <= to_save;
                            5'd21: v[29:25] <= to_save;
                            5'd22: w[29:25] <= to_save;
                            5'd23: x[29:25] <= to_save;
                            5'd24: y[29:25] <= to_save;
                            5'd25: z[29:25] <= to_save;
                            default: begin end
                        endcase
                    end
                    4'd6: begin
                        case(class)
                            5'd0: a[34:30] <= to_save;
                            5'd1: b[34:30] <= to_save;
                            5'd2: c[34:30] <= to_save;
                            5'd3: d[34:30] <= to_save;
                            5'd4: e[34:30] <= to_save;
                            5'd5: f[34:30] <= to_save;
                            5'd6: g[34:30] <= to_save;
                            5'd7: h[34:30] <= to_save;
                            5'd8: i[34:30] <= to_save;
                            5'd9: j[34:30] <= to_save;
                            5'd10: k[34:30] <= to_save;
                            5'd11: l[34:30] <= to_save;
                            5'd12: m[34:30] <= to_save;
                            5'd13: n[34:30] <= to_save;
                            5'd14: o[34:30] <= to_save;
                            5'd15: p[34:30] <= to_save;
                            5'd16: q[34:30] <= to_save;
                            5'd17: r[34:30] <= to_save;
                            5'd18: s[34:30] <= to_save;
                            5'd19: t[34:30] <= to_save;
                            5'd20: u[34:30] <= to_save;
                            5'd21: v[34:30] <= to_save;
                            5'd22: w[34:30] <= to_save;
                            5'd23: x[34:30] <= to_save;
                            5'd24: y[34:30] <= to_save;
                            5'd25: z[34:30] <= to_save;
                            default: begin end
                        endcase
                    end
                    4'd7: begin
                        case(class)
                            5'd0: a[39:35] <= to_save;
                            5'd1: b[39:35] <= to_save;
                            5'd2: c[39:35] <= to_save;
                            5'd3: d[39:35] <= to_save;
                            5'd4: e[39:35] <= to_save;
                            5'd5: f[39:35] <= to_save;
                            5'd6: g[39:35] <= to_save;
                            5'd7: h[39:35] <= to_save;
                            5'd8: i[39:35] <= to_save;
                            5'd9: j[39:35] <= to_save;
                            5'd10: k[39:35] <= to_save;
                            5'd11: l[39:35] <= to_save;
                            5'd12: m[39:35] <= to_save;
                            5'd13: n[39:35] <= to_save;
                            5'd14: o[39:35] <= to_save;
                            5'd15: p[39:35] <= to_save;
                            5'd16: q[39:35] <= to_save;
                            5'd17: r[39:35] <= to_save;
                            5'd18: s[39:35] <= to_save;
                            5'd19: t[39:35] <= to_save;
                            5'd20: u[39:35] <= to_save;
                            5'd21: v[39:35] <= to_save;
                            5'd22: w[39:35] <= to_save;
                            5'd23: x[39:35] <= to_save;
                            5'd24: y[39:35] <= to_save;
                            5'd25: z[39:35] <= to_save;
                            default: begin end
                        endcase
                    end
                    4'd8: begin
                        case(class)
                            5'd0: a[44:40] <= to_save;
                            5'd1: b[44:40] <= to_save;
                            5'd2: c[44:40] <= to_save;
                            5'd3: d[44:40] <= to_save;
                            5'd4: e[44:40] <= to_save;
                            5'd5: f[44:40] <= to_save;
                            5'd6: g[44:40] <= to_save;
                            5'd7: h[44:40] <= to_save;
                            5'd8: i[44:40] <= to_save;
                            5'd9: j[44:40] <= to_save;
                            5'd10: k[44:40] <= to_save;
                            5'd11: l[44:40] <= to_save;
                            5'd12: m[44:40] <= to_save;
                            5'd13: n[44:40] <= to_save;
                            5'd14: o[44:40] <= to_save;
                            5'd15: p[44:40] <= to_save;
                            5'd16: q[44:40] <= to_save;
                            5'd17: r[44:40] <= to_save;
                            5'd18: s[44:40] <= to_save;
                            5'd19: t[44:40] <= to_save;
                            5'd20: u[44:40] <= to_save;
                            5'd21: v[44:40] <= to_save;
                            5'd22: w[44:40] <= to_save;
                            5'd23: x[44:40] <= to_save;
                            5'd24: y[44:40] <= to_save;
                            5'd25: z[44:40] <= to_save;
                            default: begin end
                        endcase
                    end
                    4'd9: begin
                        case(class)
                            5'd0: a[49:45] <= to_save;
                            5'd1: b[49:45] <= to_save;
                            5'd2: c[49:45] <= to_save;
                            5'd3: d[49:45] <= to_save;
                            5'd4: e[49:45] <= to_save;
                            5'd5: f[49:45] <= to_save;
                            5'd6: g[49:45] <= to_save;
                            5'd7: h[49:45] <= to_save;
                            5'd8: i[49:45] <= to_save;
                            5'd9: j[49:45] <= to_save;
                            5'd10: k[49:45] <= to_save;
                            5'd11: l[49:45] <= to_save;
                            5'd12: m[49:45] <= to_save;
                            5'd13: n[49:45] <= to_save;
                            5'd14: o[49:45] <= to_save;
                            5'd15: p[49:45] <= to_save;
                            5'd16: q[49:45] <= to_save;
                            5'd17: r[49:45] <= to_save;
                            5'd18: s[49:45] <= to_save;
                            5'd19: t[49:45] <= to_save;
                            5'd20: u[49:45] <= to_save;
                            5'd21: v[49:45] <= to_save;
                            5'd22: w[49:45] <= to_save;
                            5'd23: x[49:45] <= to_save;
                            5'd24: y[49:45] <= to_save;
                            5'd25: z[49:45] <= to_save;
                            default: begin end
                        endcase
                    end
                    default: begin
                    
                    end
                endcase
            end
        end
    end
    
endmodule
