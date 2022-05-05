module binary_class_reg(
    input wire clk,
    input wire nrst,
    input wire en,
    input wire binarizing_class_hvs,
    input wire [4:0] binarized_class_counter,
    input wire [3:0] bin_ctr,    
    input wire [DIMS_PER_CC-1:0] bin_class_reg_in,    
    output logic [SEQ_CYCLE_COUNT-1:0][DIMS_PER_CC-1:0] bin_class_hvs [0:25]
    );    
  
    // Note: output logic [9:0][499:0] bin_class_hvs [0:25]
         
    // binary class hvs & input nonbinary class demux
    always_ff @(posedge clk or negedge nrst) begin
        if (!nrst) begin
            for(int i = 0; i < 26; i++) begin
                bin_class_hvs[i] = 0;
            end
        end    
        else if (binarizing_class_hvs && en) begin
            case(binarized_class_counter)
                5'd0: begin
                    case(bin_ctr)
                        5'd0: bin_class_hvs[0][0] <= bin_class_reg_in;
                        5'd1: bin_class_hvs[0][1] <= bin_class_reg_in;
                        5'd2: bin_class_hvs[0][2] <= bin_class_reg_in;
                        5'd3: bin_class_hvs[0][3] <= bin_class_reg_in;
                        5'd4: bin_class_hvs[0][4] <= bin_class_reg_in;
                        5'd5: bin_class_hvs[0][5] <= bin_class_reg_in;
                        5'd6: bin_class_hvs[0][6] <= bin_class_reg_in;
                        5'd7: bin_class_hvs[0][7] <= bin_class_reg_in;
                        5'd8: bin_class_hvs[0][8] <= bin_class_reg_in;
                        default: bin_class_hvs[0][9] <= bin_class_reg_in;
                    endcase
                end
                5'd1: begin
                    case(bin_ctr)
                        5'd0: bin_class_hvs[1][0] <= bin_class_reg_in;
                        5'd1: bin_class_hvs[1][1] <= bin_class_reg_in;
                        5'd2: bin_class_hvs[1][2] <= bin_class_reg_in;
                        5'd3: bin_class_hvs[1][3] <= bin_class_reg_in;
                        5'd4: bin_class_hvs[1][4] <= bin_class_reg_in;
                        5'd5: bin_class_hvs[1][5] <= bin_class_reg_in;
                        5'd6: bin_class_hvs[1][6] <= bin_class_reg_in;
                        5'd7: bin_class_hvs[1][7] <= bin_class_reg_in;
                        5'd8: bin_class_hvs[1][8] <= bin_class_reg_in;
                        default: bin_class_hvs[1][9] <= bin_class_reg_in;
                    endcase
                end
                5'd2: begin
                    case(bin_ctr)
                        5'd0: bin_class_hvs[2][0] <= bin_class_reg_in;
                        5'd1: bin_class_hvs[2][1] <= bin_class_reg_in;
                        5'd2: bin_class_hvs[2][2] <= bin_class_reg_in;
                        5'd3: bin_class_hvs[2][3] <= bin_class_reg_in;
                        5'd4: bin_class_hvs[2][4] <= bin_class_reg_in;
                        5'd5: bin_class_hvs[2][5] <= bin_class_reg_in;
                        5'd6: bin_class_hvs[2][6] <= bin_class_reg_in;
                        5'd7: bin_class_hvs[2][7] <= bin_class_reg_in;
                        5'd8: bin_class_hvs[2][8] <= bin_class_reg_in;
                        default: bin_class_hvs[2][9] <= bin_class_reg_in;
                    endcase
                end
                5'd3: begin
                    case(bin_ctr)
                        5'd0: bin_class_hvs[3][0] <= bin_class_reg_in;
                        5'd1: bin_class_hvs[3][1] <= bin_class_reg_in;
                        5'd2: bin_class_hvs[3][2] <= bin_class_reg_in;
                        5'd3: bin_class_hvs[3][3] <= bin_class_reg_in;
                        5'd4: bin_class_hvs[3][4] <= bin_class_reg_in;
                        5'd5: bin_class_hvs[3][5] <= bin_class_reg_in;
                        5'd6: bin_class_hvs[3][6] <= bin_class_reg_in;
                        5'd7: bin_class_hvs[3][7] <= bin_class_reg_in;
                        5'd8: bin_class_hvs[3][8] <= bin_class_reg_in;
                        default: bin_class_hvs[3][9] <= bin_class_reg_in;
                    endcase
                end
                5'd4: begin
                    case(bin_ctr)
                        5'd0: bin_class_hvs[4][0] <= bin_class_reg_in;
                        5'd1: bin_class_hvs[4][1] <= bin_class_reg_in;
                        5'd2: bin_class_hvs[4][2] <= bin_class_reg_in;
                        5'd3: bin_class_hvs[4][3] <= bin_class_reg_in;
                        5'd4: bin_class_hvs[4][4] <= bin_class_reg_in;
                        5'd5: bin_class_hvs[4][5] <= bin_class_reg_in;
                        5'd6: bin_class_hvs[4][6] <= bin_class_reg_in;
                        5'd7: bin_class_hvs[4][7] <= bin_class_reg_in;
                        5'd8: bin_class_hvs[4][8] <= bin_class_reg_in;
                        default: bin_class_hvs[4][9] <= bin_class_reg_in;
                    endcase
                end
                5'd5: begin
                    case(bin_ctr)
                        5'd0: bin_class_hvs[5][0] <= bin_class_reg_in;
                        5'd1: bin_class_hvs[5][1] <= bin_class_reg_in;
                        5'd2: bin_class_hvs[5][2] <= bin_class_reg_in;
                        5'd3: bin_class_hvs[5][3] <= bin_class_reg_in;
                        5'd4: bin_class_hvs[5][4] <= bin_class_reg_in;
                        5'd5: bin_class_hvs[5][5] <= bin_class_reg_in;
                        5'd6: bin_class_hvs[5][6] <= bin_class_reg_in;
                        5'd7: bin_class_hvs[5][7] <= bin_class_reg_in;
                        5'd8: bin_class_hvs[5][8] <= bin_class_reg_in;
                        default: bin_class_hvs[5][9] <= bin_class_reg_in;
                    endcase
                end
                5'd6: begin
                    case(bin_ctr)
                        5'd0: bin_class_hvs[6][0] <= bin_class_reg_in;
                        5'd1: bin_class_hvs[6][1] <= bin_class_reg_in;
                        5'd2: bin_class_hvs[6][2] <= bin_class_reg_in;
                        5'd3: bin_class_hvs[6][3] <= bin_class_reg_in;
                        5'd4: bin_class_hvs[6][4] <= bin_class_reg_in;
                        5'd5: bin_class_hvs[6][5] <= bin_class_reg_in;
                        5'd6: bin_class_hvs[6][6] <= bin_class_reg_in;
                        5'd7: bin_class_hvs[6][7] <= bin_class_reg_in;
                        5'd8: bin_class_hvs[6][8] <= bin_class_reg_in;
                        default: bin_class_hvs[6][9] <= bin_class_reg_in;
                    endcase
                end
                5'd7: begin
                    case(bin_ctr)
                        5'd0: bin_class_hvs[7][0] <= bin_class_reg_in;
                        5'd1: bin_class_hvs[7][1] <= bin_class_reg_in;
                        5'd2: bin_class_hvs[7][2] <= bin_class_reg_in;
                        5'd3: bin_class_hvs[7][3] <= bin_class_reg_in;
                        5'd4: bin_class_hvs[7][4] <= bin_class_reg_in;
                        5'd5: bin_class_hvs[7][5] <= bin_class_reg_in;
                        5'd6: bin_class_hvs[7][6] <= bin_class_reg_in;
                        5'd7: bin_class_hvs[7][7] <= bin_class_reg_in;
                        5'd8: bin_class_hvs[7][8] <= bin_class_reg_in;
                        default: bin_class_hvs[7][9] <= bin_class_reg_in;
                    endcase
                end
                5'd8: begin
                    case(bin_ctr)
                        5'd0: bin_class_hvs[8][0] <= bin_class_reg_in;
                        5'd1: bin_class_hvs[8][1] <= bin_class_reg_in;
                        5'd2: bin_class_hvs[8][2] <= bin_class_reg_in;
                        5'd3: bin_class_hvs[8][3] <= bin_class_reg_in;
                        5'd4: bin_class_hvs[8][4] <= bin_class_reg_in;
                        5'd5: bin_class_hvs[8][5] <= bin_class_reg_in;
                        5'd6: bin_class_hvs[8][6] <= bin_class_reg_in;
                        5'd7: bin_class_hvs[8][7] <= bin_class_reg_in;
                        5'd8: bin_class_hvs[8][8] <= bin_class_reg_in;
                        default: bin_class_hvs[8][9] <= bin_class_reg_in;
                    endcase
                end
                5'd9: begin
                    case(bin_ctr)
                        5'd0: bin_class_hvs[9][0] <= bin_class_reg_in;
                        5'd1: bin_class_hvs[9][1] <= bin_class_reg_in;
                        5'd2: bin_class_hvs[9][2] <= bin_class_reg_in;
                        5'd3: bin_class_hvs[9][3] <= bin_class_reg_in;
                        5'd4: bin_class_hvs[9][4] <= bin_class_reg_in;
                        5'd5: bin_class_hvs[9][5] <= bin_class_reg_in;
                        5'd6: bin_class_hvs[9][6] <= bin_class_reg_in;
                        5'd7: bin_class_hvs[9][7] <= bin_class_reg_in;
                        5'd8: bin_class_hvs[9][8] <= bin_class_reg_in;
                        default: bin_class_hvs[9][9] <= bin_class_reg_in;
                    endcase
                end
                5'd10: begin
                    case(bin_ctr)
                        5'd0: bin_class_hvs[10][0] <= bin_class_reg_in;
                        5'd1: bin_class_hvs[10][1] <= bin_class_reg_in;
                        5'd2: bin_class_hvs[10][2] <= bin_class_reg_in;
                        5'd3: bin_class_hvs[10][3] <= bin_class_reg_in;
                        5'd4: bin_class_hvs[10][4] <= bin_class_reg_in;
                        5'd5: bin_class_hvs[10][5] <= bin_class_reg_in;
                        5'd6: bin_class_hvs[10][6] <= bin_class_reg_in;
                        5'd7: bin_class_hvs[10][7] <= bin_class_reg_in;
                        5'd8: bin_class_hvs[10][8] <= bin_class_reg_in;
                        default: bin_class_hvs[10][9] <= bin_class_reg_in;
                    endcase
                end
                5'd11: begin
                    case(bin_ctr)
                        5'd0: bin_class_hvs[11][0] <= bin_class_reg_in;
                        5'd1: bin_class_hvs[11][1] <= bin_class_reg_in;
                        5'd2: bin_class_hvs[11][2] <= bin_class_reg_in;
                        5'd3: bin_class_hvs[11][3] <= bin_class_reg_in;
                        5'd4: bin_class_hvs[11][4] <= bin_class_reg_in;
                        5'd5: bin_class_hvs[11][5] <= bin_class_reg_in;
                        5'd6: bin_class_hvs[11][6] <= bin_class_reg_in;
                        5'd7: bin_class_hvs[11][7] <= bin_class_reg_in;
                        5'd8: bin_class_hvs[11][8] <= bin_class_reg_in;
                        default: bin_class_hvs[11][9] <= bin_class_reg_in;
                    endcase
                end
                5'd12: begin
                    case(bin_ctr)
                        5'd0: bin_class_hvs[12][0] <= bin_class_reg_in;
                        5'd1: bin_class_hvs[12][1] <= bin_class_reg_in;
                        5'd2: bin_class_hvs[12][2] <= bin_class_reg_in;
                        5'd3: bin_class_hvs[12][3] <= bin_class_reg_in;
                        5'd4: bin_class_hvs[12][4] <= bin_class_reg_in;
                        5'd5: bin_class_hvs[12][5] <= bin_class_reg_in;
                        5'd6: bin_class_hvs[12][6] <= bin_class_reg_in;
                        5'd7: bin_class_hvs[12][7] <= bin_class_reg_in;
                        5'd8: bin_class_hvs[12][8] <= bin_class_reg_in;
                        default: bin_class_hvs[12][9] <= bin_class_reg_in;
                    endcase
                end
                5'd13: begin
                    case(bin_ctr)
                        5'd0: bin_class_hvs[13][0] <= bin_class_reg_in;
                        5'd1: bin_class_hvs[13][1] <= bin_class_reg_in;
                        5'd2: bin_class_hvs[13][2] <= bin_class_reg_in;
                        5'd3: bin_class_hvs[13][3] <= bin_class_reg_in;
                        5'd4: bin_class_hvs[13][4] <= bin_class_reg_in;
                        5'd5: bin_class_hvs[13][5] <= bin_class_reg_in;
                        5'd6: bin_class_hvs[13][6] <= bin_class_reg_in;
                        5'd7: bin_class_hvs[13][7] <= bin_class_reg_in;
                        5'd8: bin_class_hvs[13][8] <= bin_class_reg_in;
                        default: bin_class_hvs[13][9] <= bin_class_reg_in;
                    endcase
                end
                5'd14: begin
                    case(bin_ctr)
                        5'd0: bin_class_hvs[14][0] <= bin_class_reg_in;
                        5'd1: bin_class_hvs[14][1] <= bin_class_reg_in;
                        5'd2: bin_class_hvs[14][2] <= bin_class_reg_in;
                        5'd3: bin_class_hvs[14][3] <= bin_class_reg_in;
                        5'd4: bin_class_hvs[14][4] <= bin_class_reg_in;
                        5'd5: bin_class_hvs[14][5] <= bin_class_reg_in;
                        5'd6: bin_class_hvs[14][6] <= bin_class_reg_in;
                        5'd7: bin_class_hvs[14][7] <= bin_class_reg_in;
                        5'd8: bin_class_hvs[14][8] <= bin_class_reg_in;
                        default: bin_class_hvs[14][9] <= bin_class_reg_in;
                    endcase
                end
                5'd15: begin
                    case(bin_ctr)
                        5'd0: bin_class_hvs[15][0] <= bin_class_reg_in;
                        5'd1: bin_class_hvs[15][1] <= bin_class_reg_in;
                        5'd2: bin_class_hvs[15][2] <= bin_class_reg_in;
                        5'd3: bin_class_hvs[15][3] <= bin_class_reg_in;
                        5'd4: bin_class_hvs[15][4] <= bin_class_reg_in;
                        5'd5: bin_class_hvs[15][5] <= bin_class_reg_in;
                        5'd6: bin_class_hvs[15][6] <= bin_class_reg_in;
                        5'd7: bin_class_hvs[15][7] <= bin_class_reg_in;
                        5'd8: bin_class_hvs[15][8] <= bin_class_reg_in;
                        default: bin_class_hvs[15][9] <= bin_class_reg_in;
                    endcase
                end
                5'd16: begin
                    case(bin_ctr)
                        5'd0: bin_class_hvs[16][0] <= bin_class_reg_in;
                        5'd1: bin_class_hvs[16][1] <= bin_class_reg_in;
                        5'd2: bin_class_hvs[16][2] <= bin_class_reg_in;
                        5'd3: bin_class_hvs[16][3] <= bin_class_reg_in;
                        5'd4: bin_class_hvs[16][4] <= bin_class_reg_in;
                        5'd5: bin_class_hvs[16][5] <= bin_class_reg_in;
                        5'd6: bin_class_hvs[16][6] <= bin_class_reg_in;
                        5'd7: bin_class_hvs[16][7] <= bin_class_reg_in;
                        5'd8: bin_class_hvs[16][8] <= bin_class_reg_in;
                        default: bin_class_hvs[16][9] <= bin_class_reg_in;
                    endcase
                end
                5'd17: begin
                    case(bin_ctr)
                        5'd0: bin_class_hvs[17][0] <= bin_class_reg_in;
                        5'd1: bin_class_hvs[17][1] <= bin_class_reg_in;
                        5'd2: bin_class_hvs[17][2] <= bin_class_reg_in;
                        5'd3: bin_class_hvs[17][3] <= bin_class_reg_in;
                        5'd4: bin_class_hvs[17][4] <= bin_class_reg_in;
                        5'd5: bin_class_hvs[17][5] <= bin_class_reg_in;
                        5'd6: bin_class_hvs[17][6] <= bin_class_reg_in;
                        5'd7: bin_class_hvs[17][7] <= bin_class_reg_in;
                        5'd8: bin_class_hvs[17][8] <= bin_class_reg_in;
                        default: bin_class_hvs[17][9] <= bin_class_reg_in;
                    endcase
                end
                5'd18: begin
                    case(bin_ctr)
                        5'd0: bin_class_hvs[18][0] <= bin_class_reg_in;
                        5'd1: bin_class_hvs[18][1] <= bin_class_reg_in;
                        5'd2: bin_class_hvs[18][2] <= bin_class_reg_in;
                        5'd3: bin_class_hvs[18][3] <= bin_class_reg_in;
                        5'd4: bin_class_hvs[18][4] <= bin_class_reg_in;
                        5'd5: bin_class_hvs[18][5] <= bin_class_reg_in;
                        5'd6: bin_class_hvs[18][6] <= bin_class_reg_in;
                        5'd7: bin_class_hvs[18][7] <= bin_class_reg_in;
                        5'd8: bin_class_hvs[18][8] <= bin_class_reg_in;
                        default: bin_class_hvs[18][9] <= bin_class_reg_in;
                    endcase
                end
                5'd19: begin
                    case(bin_ctr)
                        5'd0: bin_class_hvs[19][0] <= bin_class_reg_in;
                        5'd1: bin_class_hvs[19][1] <= bin_class_reg_in;
                        5'd2: bin_class_hvs[19][2] <= bin_class_reg_in;
                        5'd3: bin_class_hvs[19][3] <= bin_class_reg_in;
                        5'd4: bin_class_hvs[19][4] <= bin_class_reg_in;
                        5'd5: bin_class_hvs[19][5] <= bin_class_reg_in;
                        5'd6: bin_class_hvs[19][6] <= bin_class_reg_in;
                        5'd7: bin_class_hvs[19][7] <= bin_class_reg_in;
                        5'd8: bin_class_hvs[19][8] <= bin_class_reg_in;
                        default: bin_class_hvs[19][9] <= bin_class_reg_in;
                    endcase
                end
                5'd20: begin
                    case(bin_ctr)
                        5'd0: bin_class_hvs[20][0] <= bin_class_reg_in;
                        5'd1: bin_class_hvs[20][1] <= bin_class_reg_in;
                        5'd2: bin_class_hvs[20][2] <= bin_class_reg_in;
                        5'd3: bin_class_hvs[20][3] <= bin_class_reg_in;
                        5'd4: bin_class_hvs[20][4] <= bin_class_reg_in;
                        5'd5: bin_class_hvs[20][5] <= bin_class_reg_in;
                        5'd6: bin_class_hvs[20][6] <= bin_class_reg_in;
                        5'd7: bin_class_hvs[20][7] <= bin_class_reg_in;
                        5'd8: bin_class_hvs[20][8] <= bin_class_reg_in;
                        default: bin_class_hvs[20][9] <= bin_class_reg_in;
                    endcase
                end
                5'd21: begin
                    case(bin_ctr)
                        5'd0: bin_class_hvs[21][0] <= bin_class_reg_in;
                        5'd1: bin_class_hvs[21][1] <= bin_class_reg_in;
                        5'd2: bin_class_hvs[21][2] <= bin_class_reg_in;
                        5'd3: bin_class_hvs[21][3] <= bin_class_reg_in;
                        5'd4: bin_class_hvs[21][4] <= bin_class_reg_in;
                        5'd5: bin_class_hvs[21][5] <= bin_class_reg_in;
                        5'd6: bin_class_hvs[21][6] <= bin_class_reg_in;
                        5'd7: bin_class_hvs[21][7] <= bin_class_reg_in;
                        5'd8: bin_class_hvs[21][8] <= bin_class_reg_in;
                        default: bin_class_hvs[21][9] <= bin_class_reg_in;
                    endcase
                end
                5'd22: begin
                    case(bin_ctr)
                        5'd0: bin_class_hvs[22][0] <= bin_class_reg_in;
                        5'd1: bin_class_hvs[22][1] <= bin_class_reg_in;
                        5'd2: bin_class_hvs[22][2] <= bin_class_reg_in;
                        5'd3: bin_class_hvs[22][3] <= bin_class_reg_in;
                        5'd4: bin_class_hvs[22][4] <= bin_class_reg_in;
                        5'd5: bin_class_hvs[22][5] <= bin_class_reg_in;
                        5'd6: bin_class_hvs[22][6] <= bin_class_reg_in;
                        5'd7: bin_class_hvs[22][7] <= bin_class_reg_in;
                        5'd8: bin_class_hvs[22][8] <= bin_class_reg_in;
                        default: bin_class_hvs[22][9] <= bin_class_reg_in;
                    endcase
                end
                5'd23: begin
                    case(bin_ctr)
                        5'd0: bin_class_hvs[23][0] <= bin_class_reg_in;
                        5'd1: bin_class_hvs[23][1] <= bin_class_reg_in;
                        5'd2: bin_class_hvs[23][2] <= bin_class_reg_in;
                        5'd3: bin_class_hvs[23][3] <= bin_class_reg_in;
                        5'd4: bin_class_hvs[23][4] <= bin_class_reg_in;
                        5'd5: bin_class_hvs[23][5] <= bin_class_reg_in;
                        5'd6: bin_class_hvs[23][6] <= bin_class_reg_in;
                        5'd7: bin_class_hvs[23][7] <= bin_class_reg_in;
                        5'd8: bin_class_hvs[23][8] <= bin_class_reg_in;
                        default: bin_class_hvs[23][9] <= bin_class_reg_in;
                    endcase
                end
                5'd24: begin
                    case(bin_ctr)
                        5'd0: bin_class_hvs[24][0] <= bin_class_reg_in;
                        5'd1: bin_class_hvs[24][1] <= bin_class_reg_in;
                        5'd2: bin_class_hvs[24][2] <= bin_class_reg_in;
                        5'd3: bin_class_hvs[24][3] <= bin_class_reg_in;
                        5'd4: bin_class_hvs[24][4] <= bin_class_reg_in;
                        5'd5: bin_class_hvs[24][5] <= bin_class_reg_in;
                        5'd6: bin_class_hvs[24][6] <= bin_class_reg_in;
                        5'd7: bin_class_hvs[24][7] <= bin_class_reg_in;
                        5'd8: bin_class_hvs[24][8] <= bin_class_reg_in;
                        default: bin_class_hvs[24][9] <= bin_class_reg_in;
                    endcase
                end
                default: begin
                    case(bin_ctr)
                        5'd0: bin_class_hvs[25][0] <= bin_class_reg_in;
                        5'd1: bin_class_hvs[25][1] <= bin_class_reg_in;
                        5'd2: bin_class_hvs[25][2] <= bin_class_reg_in;
                        5'd3: bin_class_hvs[25][3] <= bin_class_reg_in;
                        5'd4: bin_class_hvs[25][4] <= bin_class_reg_in;
                        5'd5: bin_class_hvs[25][5] <= bin_class_reg_in;
                        5'd6: bin_class_hvs[25][6] <= bin_class_reg_in;
                        5'd7: bin_class_hvs[25][7] <= bin_class_reg_in;
                        5'd8: bin_class_hvs[25][8] <= bin_class_reg_in;
                        default: bin_class_hvs[25][9] <= bin_class_reg_in;
                    endcase
                end     
            endcase
        end 
        else begin
            bin_class_hvs <= bin_class_hvs;
        end
    end 
  
endmodule
