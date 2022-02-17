`timescale 1ns / 1ps


module class_gen(
    clk,
    nrst,
    class,
    hypervector,
    a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z
    );
    
    input clk;
    input nrst;
    input [4:0] class;
    input [9:0] hypervector;
    output reg [9:0] a;
    output reg [9:0] b;
    output reg [9:0] c;
    output reg [9:0] d;
    output reg [9:0] e;
    output reg [9:0] f;
    output reg [9:0] g;
    output reg [9:0] h;
    output reg [9:0] i;
    output reg [9:0] j;
    output reg [9:0] k;
    output reg [9:0] l;
    output reg [9:0] m;
    output reg [9:0] n;
    output reg [9:0] o;
    output reg [9:0] p;
    output reg [9:0] q;
    output reg [9:0] r;
    output reg [9:0] s;
    output reg [9:0] t;
    output reg [9:0] u;
    output reg [9:0] v;
    output reg [9:0] w;
    output reg [9:0] x;
    output reg [9:0] y;
    output reg [9:0] z;
    
    reg [79:0] nb_a,nb_b,nb_c,nb_d,nb_e,nb_f,nb_g,nb_h,nb_i,nb_j,nb_k,nb_l,nb_m,nb_n,nb_o,nb_p,nb_q,nb_r,nb_s,nb_t,nb_u,nb_v,nb_w,nb_x,nb_y,nb_z; 
    //240 samples per class (8 bits)*# of dimensions
    //1st bit: [7:0], 2nd: [15:8], etc...
    
    //FOR NOW, THRESHOLD VALUE WILL BE 30
    always @ (posedge clk or negedge nrst) begin
        if(!nrst) begin 
            nb_a = 80'd0;
            nb_b = 80'd0;
            nb_c = 80'd0;
            nb_d = 80'd0;
            nb_e = 80'd0;
            nb_f = 80'd0;
            nb_g = 80'd0;
            nb_h = 80'd0;
            nb_i = 80'd0;
            nb_j = 80'd0;
            nb_k = 80'd0;
            nb_l = 80'd0;
            nb_m = 80'd0;
            nb_n = 80'd0;
            nb_o = 80'd0;
            nb_p = 80'd0;
            nb_q = 80'd0;
            nb_r = 80'd0;
            nb_s = 80'd0;
            nb_t = 80'd0;
            nb_u = 80'd0;
            nb_v = 80'd0;
            nb_w = 80'd0;
            nb_x = 80'd0;
            nb_y = 80'd0;
            nb_z = 80'd0;              
        end
        else begin
            case(class)
                5'd0: begin //A
                    nb_a[7:0] = nb_a[7:0] + {7'b0000000,hypervector[0]};
                    nb_a[15:8] = nb_a[15:8] + {7'b0000000,hypervector[1]};
                    nb_a[23:16] = nb_a[23:16] + {7'b0000000,hypervector[2]};
                    nb_a[31:24] = nb_a[31:24] + {7'b0000000,hypervector[3]};
                    nb_a[39:32] = nb_a[39:32] + {7'b0000000,hypervector[4]};
                    nb_a[47:40] = nb_a[47:40] + {7'b0000000,hypervector[5]};
                    nb_a[55:48] = nb_a[55:48] + {7'b0000000,hypervector[6]};
                    nb_a[63:56] = nb_a[63:56] + {7'b0000000,hypervector[7]};
                    nb_a[71:64] = nb_a[71:64] + {7'b0000000,hypervector[8]};
                    nb_a[79:72] = nb_a[79:72] + {7'b0000000,hypervector[9]};
                end
                5'd1: begin //B
                    nb_b[7:0] = nb_b[7:0] + {7'b0000000,hypervector[0]};
                    nb_b[15:8] = nb_b[15:8] + {7'b0000000,hypervector[1]};
                    nb_b[23:16] = nb_b[23:16] + {7'b0000000,hypervector[2]};
                    nb_b[31:24] = nb_b[31:24] + {7'b0000000,hypervector[3]};
                    nb_b[39:32] = nb_b[39:32] + {7'b0000000,hypervector[4]};
                    nb_b[47:40] = nb_b[47:40] + {7'b0000000,hypervector[5]};
                    nb_b[55:48] = nb_b[55:48] + {7'b0000000,hypervector[6]};
                    nb_b[63:56] = nb_b[63:56] + {7'b0000000,hypervector[7]};
                    nb_b[71:64] = nb_b[71:64] + {7'b0000000,hypervector[8]};
                    nb_b[79:72] = nb_b[79:72] + {7'b0000000,hypervector[9]};
                end
                5'd2: begin //C
                
                end
                5'd3: begin //D
                
                end
                5'd4: begin //E
                
                end
                5'd5: begin //F
                
                end
                5'd6: begin //G
                
                end
                5'd7: begin //H
                
                end
                5'd8: begin //I
                
                end
                5'd9: begin //J
                
                end
                5'd10: begin //K
                
                end
                5'd11: begin //L
                
                end
                5'd12: begin //M
                
                end
                5'd13: begin //N
                
                end
                5'd14: begin //O
                
                end
                5'd15: begin //P
                
                end
                5'd16: begin //Q
                
                end
                5'd17: begin //R
                
                end
                5'd18: begin //S
                
                end
                5'd19: begin //T
                
                end
                5'd20: begin //U
                
                end
                5'd21: begin //V
                
                end
                5'd22: begin //W
                
                end
                5'd23: begin //X
                
                end
                5'd24: begin //Y
                
                end
                5'd25: begin //Z
                
                end
                default: begin
                
                end
            endcase
            
        
        end
    end
    
    always @(*) begin
        if(!nrst) begin
            a <= 10'd0;
            b <= 10'd0;
            c <= 10'd0;
            d <= 10'd0;
            e <= 10'd0;
            f <= 10'd0;
            g <= 10'd0;
            h <= 10'd0;
            i <= 10'd0;
            j <= 10'd0;
            k <= 10'd0;
            l <= 10'd0;
            m <= 10'd0;
            n <= 10'd0;
            o <= 10'd0;
            p <= 10'd0;
            q <= 10'd0;
            r <= 10'd0;
            s <= 10'd0;
            t <= 10'd0;
            u <= 10'd0;
            v <= 10'd0;
            w <= 10'd0;
            x <= 10'd0;
            y <= 10'd0;
            z <= 10'd0;
        end
        else begin
            case(class)
                5'd0: begin //A
                    if(nb_a[7:0] >= 8'd30) begin
                        a[0] <= 1'b1;
                    end
                    else begin
                        a[0] <= 1'b0;
                    end
                    
                    if(nb_a[15:8] >= 8'd30) begin
                        a[1] <= 1'b1;
                    end
                    else begin
                        a[1] <= 1'b0;
                    end
                    
                    if(nb_a[23:16] >= 8'd30) begin
                        a[2] <= 1'b1;
                    end
                    else begin
                        a[2] <= 1'b0;
                    end
                    
                    if(nb_a[31:24] >= 8'd30) begin
                        a[3] <= 1'b1;
                    end
                    else begin
                        a[3] <= 1'b0;
                    end
                    
                    if(nb_a[39:32] >= 8'd30) begin
                        a[4] <= 1'b1;
                    end
                    else begin
                        a[4] <= 1'b0;
                    end
                    
                    if(nb_a[47:40] >= 8'd30) begin
                        a[5] <= 1'b1;
                    end
                    else begin
                        a[5] <= 1'b0;
                    end
                    
                    if(nb_a[55:48] >= 8'd30) begin
                        a[6] <= 1'b1;
                    end
                    else begin
                        a[6] <= 1'b0;
                    end
                    
                    if(nb_a[63:56] >= 8'd30) begin
                        a[7] <= 1'b1;
                    end
                    else begin
                        a[7] <= 1'b0;
                    end
                    
                    if(nb_a[71:64] >= 8'd30) begin
                        a[8] <= 1'b1;
                    end
                    else begin
                        a[8] <= 1'b0;
                    end
                    
                    if(nb_a[79:72] >= 8'd30) begin
                        a[9] <= 1'b1;
                    end
                    else begin
                        a[9] <= 1'b0;
                    end
                    
                end
                5'd1: begin //B
                    if(nb_b[7:0] >= 8'd30) begin
                        b[0] <= 1'b1;
                    end
                    else begin
                        b[0] <= 1'b0;
                    end
                    
                    if(nb_b[15:8] >= 8'd30) begin
                        b[1] <= 1'b1;
                    end
                    else begin
                        b[1] <= 1'b0;
                    end
                    
                    if(nb_b[23:16] >= 8'd30) begin
                        b[2] <= 1'b1;
                    end
                    else begin
                        b[2] <= 1'b0;
                    end
                    
                    if(nb_b[31:24] >= 8'd30) begin
                        b[3] <= 1'b1;
                    end
                    else begin
                        b[3] <= 1'b0;
                    end
                    
                    if(nb_b[39:32] >= 8'd30) begin
                        b[4] <= 1'b1;
                    end
                    else begin
                        b[4] <= 1'b0;
                    end
                    
                    if(nb_b[47:40] >= 8'd30) begin
                        b[5] <= 1'b1;
                    end
                    else begin
                        b[5] <= 1'b0;
                    end
                    
                    if(nb_b[55:48] >= 8'd30) begin
                        b[6] <= 1'b1;
                    end
                    else begin
                        b[6] <= 1'b0;
                    end
                    
                    if(nb_b[63:56] >= 8'd30) begin
                        b[7] <= 1'b1;
                    end
                    else begin
                        b[7] <= 1'b0;
                    end
                    
                    if(nb_b[71:64] >= 8'd30) begin
                        b[8] <= 1'b1;
                    end
                    else begin
                        b[8] <= 1'b0;
                    end
                    
                    if(nb_b[79:72] >= 8'd30) begin
                        b[9] <= 1'b1;
                    end
                    else begin
                        b[9] <= 1'b0;
                    end
                    
                end
                5'd2: begin //C
                
                end
                5'd3: begin //D
                
                end
                5'd4: begin //E
                
                end
                5'd5: begin //F
                
                end
                5'd6: begin //G
                
                end
                5'd7: begin //H
                
                end
                5'd8: begin //I
                
                end
                5'd9: begin //J
                
                end
                5'd10: begin //K
                
                end
                5'd11: begin //L
                
                end
                5'd12: begin //M
                
                end
                5'd13: begin //N
                
                end
                5'd14: begin //O
                
                end
                5'd15: begin //P
                
                end
                5'd16: begin //Q
                
                end
                5'd17: begin //R
                
                end
                5'd18: begin //S
                
                end
                5'd19: begin //T
                
                end
                5'd20: begin //U
                
                end
                5'd21: begin //V
                
                end
                5'd22: begin //W
                
                end
                5'd23: begin //X
                
                end
                5'd24: begin //Y
                
                end
                5'd25: begin //Z
                
                end
                default: begin
                
                end
            endcase
        end
    end
endmodule
