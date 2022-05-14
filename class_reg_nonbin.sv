module class_reg_nonbin(
    input  wire  clk,
    input  wire  nrst,
    input  wire  en,
    input  wire  adjusting_nonbin_class_hvs,
    input  wire  [4:0] class_select_bits,
	input  wire  [4:0] nonbin_class_select_bits,
    input  wire  [3:0] nonbin_ctr,    
    input  wire  [3:0] class_hv_gen_ctr,
    input  wire  [DIMS_PER_CC-1:0][BITWIDTH_PER_DIM-1:0] nonbin_class_reg_in,
    output logic [DIMS_PER_CC-1:0][BITWIDTH_PER_DIM-1:0] nonbin_class_reg_out
    );  
   
    // we have 26 registers, each having 5000 dimensions. Each dimension is 9 bits long.
    // equal to "logic [9:0][499:0][8:0] nonbin_class_hvs [0:25]"

    logic [SEQ_CYCLE_COUNT-1:0][DIMS_PER_CC-1:0][BITWIDTH_PER_DIM-1:0] nonbin_class_hvs [0:25];
  
    // class hvs & input nonbinary class demux
    always_ff @(posedge clk or negedge nrst) begin
        if (!nrst) begin
            for(int i = 0; i < 26; i++) begin
                nonbin_class_hvs[i] <= 0;
            end
        end    
        else if (adjusting_nonbin_class_hvs && en) begin
            case(class_select_bits)
                5'd0: begin
                    case(nonbin_ctr)
                        5'd0: nonbin_class_hvs[0][0] <= nonbin_class_reg_in;
                        5'd1: nonbin_class_hvs[0][1] <= nonbin_class_reg_in;
                        5'd2: nonbin_class_hvs[0][2] <= nonbin_class_reg_in;
                        5'd3: nonbin_class_hvs[0][3] <= nonbin_class_reg_in;
                        5'd4: nonbin_class_hvs[0][4] <= nonbin_class_reg_in;
                        5'd5: nonbin_class_hvs[0][5] <= nonbin_class_reg_in;
                        5'd6: nonbin_class_hvs[0][6] <= nonbin_class_reg_in;
                        5'd7: nonbin_class_hvs[0][7] <= nonbin_class_reg_in;
                        5'd8: nonbin_class_hvs[0][8] <= nonbin_class_reg_in;
                        default: nonbin_class_hvs[0][9] <= nonbin_class_reg_in;
                    endcase
                end
                5'd1: begin
                    case(nonbin_ctr)
                        5'd0: nonbin_class_hvs[1][0] <= nonbin_class_reg_in;
                        5'd1: nonbin_class_hvs[1][1] <= nonbin_class_reg_in;
                        5'd2: nonbin_class_hvs[1][2] <= nonbin_class_reg_in;
                        5'd3: nonbin_class_hvs[1][3] <= nonbin_class_reg_in;
                        5'd4: nonbin_class_hvs[1][4] <= nonbin_class_reg_in;
                        5'd5: nonbin_class_hvs[1][5] <= nonbin_class_reg_in;
                        5'd6: nonbin_class_hvs[1][6] <= nonbin_class_reg_in;
                        5'd7: nonbin_class_hvs[1][7] <= nonbin_class_reg_in;
                        5'd8: nonbin_class_hvs[1][8] <= nonbin_class_reg_in;
                        default: nonbin_class_hvs[1][9] <= nonbin_class_reg_in;
                    endcase
                end
                5'd2: begin
                    case(nonbin_ctr)
                        5'd0: nonbin_class_hvs[2][0] <= nonbin_class_reg_in;
                        5'd1: nonbin_class_hvs[2][1] <= nonbin_class_reg_in;
                        5'd2: nonbin_class_hvs[2][2] <= nonbin_class_reg_in;
                        5'd3: nonbin_class_hvs[2][3] <= nonbin_class_reg_in;
                        5'd4: nonbin_class_hvs[2][4] <= nonbin_class_reg_in;
                        5'd5: nonbin_class_hvs[2][5] <= nonbin_class_reg_in;
                        5'd6: nonbin_class_hvs[2][6] <= nonbin_class_reg_in;
                        5'd7: nonbin_class_hvs[2][7] <= nonbin_class_reg_in;
                        5'd8: nonbin_class_hvs[2][8] <= nonbin_class_reg_in;
                        default: nonbin_class_hvs[2][9] <= nonbin_class_reg_in;
                    endcase
                end
                5'd3: begin
                    case(nonbin_ctr)
                        5'd0: nonbin_class_hvs[3][0] <= nonbin_class_reg_in;
                        5'd1: nonbin_class_hvs[3][1] <= nonbin_class_reg_in;
                        5'd2: nonbin_class_hvs[3][2] <= nonbin_class_reg_in;
                        5'd3: nonbin_class_hvs[3][3] <= nonbin_class_reg_in;
                        5'd4: nonbin_class_hvs[3][4] <= nonbin_class_reg_in;
                        5'd5: nonbin_class_hvs[3][5] <= nonbin_class_reg_in;
                        5'd6: nonbin_class_hvs[3][6] <= nonbin_class_reg_in;
                        5'd7: nonbin_class_hvs[3][7] <= nonbin_class_reg_in;
                        5'd8: nonbin_class_hvs[3][8] <= nonbin_class_reg_in;
                        default: nonbin_class_hvs[3][9] <= nonbin_class_reg_in;
                    endcase
                end
                5'd4: begin
                    case(nonbin_ctr)
                        5'd0: nonbin_class_hvs[4][0] <= nonbin_class_reg_in;
                        5'd1: nonbin_class_hvs[4][1] <= nonbin_class_reg_in;
                        5'd2: nonbin_class_hvs[4][2] <= nonbin_class_reg_in;
                        5'd3: nonbin_class_hvs[4][3] <= nonbin_class_reg_in;
                        5'd4: nonbin_class_hvs[4][4] <= nonbin_class_reg_in;
                        5'd5: nonbin_class_hvs[4][5] <= nonbin_class_reg_in;
                        5'd6: nonbin_class_hvs[4][6] <= nonbin_class_reg_in;
                        5'd7: nonbin_class_hvs[4][7] <= nonbin_class_reg_in;
                        5'd8: nonbin_class_hvs[4][8] <= nonbin_class_reg_in;
                        default: nonbin_class_hvs[4][9] <= nonbin_class_reg_in;
                    endcase
                end
                5'd5: begin
                    case(nonbin_ctr)
                        5'd0: nonbin_class_hvs[5][0] <= nonbin_class_reg_in;
                        5'd1: nonbin_class_hvs[5][1] <= nonbin_class_reg_in;
                        5'd2: nonbin_class_hvs[5][2] <= nonbin_class_reg_in;
                        5'd3: nonbin_class_hvs[5][3] <= nonbin_class_reg_in;
                        5'd4: nonbin_class_hvs[5][4] <= nonbin_class_reg_in;
                        5'd5: nonbin_class_hvs[5][5] <= nonbin_class_reg_in;
                        5'd6: nonbin_class_hvs[5][6] <= nonbin_class_reg_in;
                        5'd7: nonbin_class_hvs[5][7] <= nonbin_class_reg_in;
                        5'd8: nonbin_class_hvs[5][8] <= nonbin_class_reg_in;
                        default: nonbin_class_hvs[5][9] <= nonbin_class_reg_in;
                    endcase
                end
                5'd6: begin
                    case(nonbin_ctr)
                        5'd0: nonbin_class_hvs[6][0] <= nonbin_class_reg_in;
                        5'd1: nonbin_class_hvs[6][1] <= nonbin_class_reg_in;
                        5'd2: nonbin_class_hvs[6][2] <= nonbin_class_reg_in;
                        5'd3: nonbin_class_hvs[6][3] <= nonbin_class_reg_in;
                        5'd4: nonbin_class_hvs[6][4] <= nonbin_class_reg_in;
                        5'd5: nonbin_class_hvs[6][5] <= nonbin_class_reg_in;
                        5'd6: nonbin_class_hvs[6][6] <= nonbin_class_reg_in;
                        5'd7: nonbin_class_hvs[6][7] <= nonbin_class_reg_in;
                        5'd8: nonbin_class_hvs[6][8] <= nonbin_class_reg_in;
                        default: nonbin_class_hvs[6][9] <= nonbin_class_reg_in;
                    endcase
                end
                5'd7: begin
                    case(nonbin_ctr)
                        5'd0: nonbin_class_hvs[7][0] <= nonbin_class_reg_in;
                        5'd1: nonbin_class_hvs[7][1] <= nonbin_class_reg_in;
                        5'd2: nonbin_class_hvs[7][2] <= nonbin_class_reg_in;
                        5'd3: nonbin_class_hvs[7][3] <= nonbin_class_reg_in;
                        5'd4: nonbin_class_hvs[7][4] <= nonbin_class_reg_in;
                        5'd5: nonbin_class_hvs[7][5] <= nonbin_class_reg_in;
                        5'd6: nonbin_class_hvs[7][6] <= nonbin_class_reg_in;
                        5'd7: nonbin_class_hvs[7][7] <= nonbin_class_reg_in;
                        5'd8: nonbin_class_hvs[7][8] <= nonbin_class_reg_in;
                        default: nonbin_class_hvs[7][9] <= nonbin_class_reg_in;
                    endcase
                end
                5'd8: begin
                    case(nonbin_ctr)
                        5'd0: nonbin_class_hvs[8][0] <= nonbin_class_reg_in;
                        5'd1: nonbin_class_hvs[8][1] <= nonbin_class_reg_in;
                        5'd2: nonbin_class_hvs[8][2] <= nonbin_class_reg_in;
                        5'd3: nonbin_class_hvs[8][3] <= nonbin_class_reg_in;
                        5'd4: nonbin_class_hvs[8][4] <= nonbin_class_reg_in;
                        5'd5: nonbin_class_hvs[8][5] <= nonbin_class_reg_in;
                        5'd6: nonbin_class_hvs[8][6] <= nonbin_class_reg_in;
                        5'd7: nonbin_class_hvs[8][7] <= nonbin_class_reg_in;
                        5'd8: nonbin_class_hvs[8][8] <= nonbin_class_reg_in;
                        default: nonbin_class_hvs[8][9] <= nonbin_class_reg_in;
                    endcase
                end
                5'd9: begin
                    case(nonbin_ctr)
                        5'd0: nonbin_class_hvs[9][0] <= nonbin_class_reg_in;
                        5'd1: nonbin_class_hvs[9][1] <= nonbin_class_reg_in;
                        5'd2: nonbin_class_hvs[9][2] <= nonbin_class_reg_in;
                        5'd3: nonbin_class_hvs[9][3] <= nonbin_class_reg_in;
                        5'd4: nonbin_class_hvs[9][4] <= nonbin_class_reg_in;
                        5'd5: nonbin_class_hvs[9][5] <= nonbin_class_reg_in;
                        5'd6: nonbin_class_hvs[9][6] <= nonbin_class_reg_in;
                        5'd7: nonbin_class_hvs[9][7] <= nonbin_class_reg_in;
                        5'd8: nonbin_class_hvs[9][8] <= nonbin_class_reg_in;
                        default: nonbin_class_hvs[9][9] <= nonbin_class_reg_in;
                    endcase
                end
                5'd10: begin
                    case(nonbin_ctr)
                        5'd0: nonbin_class_hvs[10][0] <= nonbin_class_reg_in;
                        5'd1: nonbin_class_hvs[10][1] <= nonbin_class_reg_in;
                        5'd2: nonbin_class_hvs[10][2] <= nonbin_class_reg_in;
                        5'd3: nonbin_class_hvs[10][3] <= nonbin_class_reg_in;
                        5'd4: nonbin_class_hvs[10][4] <= nonbin_class_reg_in;
                        5'd5: nonbin_class_hvs[10][5] <= nonbin_class_reg_in;
                        5'd6: nonbin_class_hvs[10][6] <= nonbin_class_reg_in;
                        5'd7: nonbin_class_hvs[10][7] <= nonbin_class_reg_in;
                        5'd8: nonbin_class_hvs[10][8] <= nonbin_class_reg_in;
                        default: nonbin_class_hvs[10][9] <= nonbin_class_reg_in;
                    endcase
                end
                5'd11: begin
                    case(nonbin_ctr)
                        5'd0: nonbin_class_hvs[11][0] <= nonbin_class_reg_in;
                        5'd1: nonbin_class_hvs[11][1] <= nonbin_class_reg_in;
                        5'd2: nonbin_class_hvs[11][2] <= nonbin_class_reg_in;
                        5'd3: nonbin_class_hvs[11][3] <= nonbin_class_reg_in;
                        5'd4: nonbin_class_hvs[11][4] <= nonbin_class_reg_in;
                        5'd5: nonbin_class_hvs[11][5] <= nonbin_class_reg_in;
                        5'd6: nonbin_class_hvs[11][6] <= nonbin_class_reg_in;
                        5'd7: nonbin_class_hvs[11][7] <= nonbin_class_reg_in;
                        5'd8: nonbin_class_hvs[11][8] <= nonbin_class_reg_in;
                        default: nonbin_class_hvs[11][9] <= nonbin_class_reg_in;
                    endcase
                end
                5'd12: begin
                    case(nonbin_ctr)
                        5'd0: nonbin_class_hvs[12][0] <= nonbin_class_reg_in;
                        5'd1: nonbin_class_hvs[12][1] <= nonbin_class_reg_in;
                        5'd2: nonbin_class_hvs[12][2] <= nonbin_class_reg_in;
                        5'd3: nonbin_class_hvs[12][3] <= nonbin_class_reg_in;
                        5'd4: nonbin_class_hvs[12][4] <= nonbin_class_reg_in;
                        5'd5: nonbin_class_hvs[12][5] <= nonbin_class_reg_in;
                        5'd6: nonbin_class_hvs[12][6] <= nonbin_class_reg_in;
                        5'd7: nonbin_class_hvs[12][7] <= nonbin_class_reg_in;
                        5'd8: nonbin_class_hvs[12][8] <= nonbin_class_reg_in;
                        default: nonbin_class_hvs[12][9] <= nonbin_class_reg_in;
                    endcase
                end
                5'd13: begin
                    case(nonbin_ctr)
                        5'd0: nonbin_class_hvs[13][0] <= nonbin_class_reg_in;
                        5'd1: nonbin_class_hvs[13][1] <= nonbin_class_reg_in;
                        5'd2: nonbin_class_hvs[13][2] <= nonbin_class_reg_in;
                        5'd3: nonbin_class_hvs[13][3] <= nonbin_class_reg_in;
                        5'd4: nonbin_class_hvs[13][4] <= nonbin_class_reg_in;
                        5'd5: nonbin_class_hvs[13][5] <= nonbin_class_reg_in;
                        5'd6: nonbin_class_hvs[13][6] <= nonbin_class_reg_in;
                        5'd7: nonbin_class_hvs[13][7] <= nonbin_class_reg_in;
                        5'd8: nonbin_class_hvs[13][8] <= nonbin_class_reg_in;
                        default: nonbin_class_hvs[13][9] <= nonbin_class_reg_in;
                    endcase
                end
                5'd14: begin
                    case(nonbin_ctr)
                        5'd0: nonbin_class_hvs[14][0] <= nonbin_class_reg_in;
                        5'd1: nonbin_class_hvs[14][1] <= nonbin_class_reg_in;
                        5'd2: nonbin_class_hvs[14][2] <= nonbin_class_reg_in;
                        5'd3: nonbin_class_hvs[14][3] <= nonbin_class_reg_in;
                        5'd4: nonbin_class_hvs[14][4] <= nonbin_class_reg_in;
                        5'd5: nonbin_class_hvs[14][5] <= nonbin_class_reg_in;
                        5'd6: nonbin_class_hvs[14][6] <= nonbin_class_reg_in;
                        5'd7: nonbin_class_hvs[14][7] <= nonbin_class_reg_in;
                        5'd8: nonbin_class_hvs[14][8] <= nonbin_class_reg_in;
                        default: nonbin_class_hvs[14][9] <= nonbin_class_reg_in;
                    endcase
                end
                5'd15: begin
                    case(nonbin_ctr)
                        5'd0: nonbin_class_hvs[15][0] <= nonbin_class_reg_in;
                        5'd1: nonbin_class_hvs[15][1] <= nonbin_class_reg_in;
                        5'd2: nonbin_class_hvs[15][2] <= nonbin_class_reg_in;
                        5'd3: nonbin_class_hvs[15][3] <= nonbin_class_reg_in;
                        5'd4: nonbin_class_hvs[15][4] <= nonbin_class_reg_in;
                        5'd5: nonbin_class_hvs[15][5] <= nonbin_class_reg_in;
                        5'd6: nonbin_class_hvs[15][6] <= nonbin_class_reg_in;
                        5'd7: nonbin_class_hvs[15][7] <= nonbin_class_reg_in;
                        5'd8: nonbin_class_hvs[15][8] <= nonbin_class_reg_in;
                        default: nonbin_class_hvs[15][9] <= nonbin_class_reg_in;
                    endcase
                end
                5'd16: begin
                    case(nonbin_ctr)
                        5'd0: nonbin_class_hvs[16][0] <= nonbin_class_reg_in;
                        5'd1: nonbin_class_hvs[16][1] <= nonbin_class_reg_in;
                        5'd2: nonbin_class_hvs[16][2] <= nonbin_class_reg_in;
                        5'd3: nonbin_class_hvs[16][3] <= nonbin_class_reg_in;
                        5'd4: nonbin_class_hvs[16][4] <= nonbin_class_reg_in;
                        5'd5: nonbin_class_hvs[16][5] <= nonbin_class_reg_in;
                        5'd6: nonbin_class_hvs[16][6] <= nonbin_class_reg_in;
                        5'd7: nonbin_class_hvs[16][7] <= nonbin_class_reg_in;
                        5'd8: nonbin_class_hvs[16][8] <= nonbin_class_reg_in;
                        default: nonbin_class_hvs[16][9] <= nonbin_class_reg_in;
                    endcase
                end
                5'd17: begin
                    case(nonbin_ctr)
                        5'd0: nonbin_class_hvs[17][0] <= nonbin_class_reg_in;
                        5'd1: nonbin_class_hvs[17][1] <= nonbin_class_reg_in;
                        5'd2: nonbin_class_hvs[17][2] <= nonbin_class_reg_in;
                        5'd3: nonbin_class_hvs[17][3] <= nonbin_class_reg_in;
                        5'd4: nonbin_class_hvs[17][4] <= nonbin_class_reg_in;
                        5'd5: nonbin_class_hvs[17][5] <= nonbin_class_reg_in;
                        5'd6: nonbin_class_hvs[17][6] <= nonbin_class_reg_in;
                        5'd7: nonbin_class_hvs[17][7] <= nonbin_class_reg_in;
                        5'd8: nonbin_class_hvs[17][8] <= nonbin_class_reg_in;
                        default: nonbin_class_hvs[17][9] <= nonbin_class_reg_in;
                    endcase
                end
                5'd18: begin
                    case(nonbin_ctr)
                        5'd0: nonbin_class_hvs[18][0] <= nonbin_class_reg_in;
                        5'd1: nonbin_class_hvs[18][1] <= nonbin_class_reg_in;
                        5'd2: nonbin_class_hvs[18][2] <= nonbin_class_reg_in;
                        5'd3: nonbin_class_hvs[18][3] <= nonbin_class_reg_in;
                        5'd4: nonbin_class_hvs[18][4] <= nonbin_class_reg_in;
                        5'd5: nonbin_class_hvs[18][5] <= nonbin_class_reg_in;
                        5'd6: nonbin_class_hvs[18][6] <= nonbin_class_reg_in;
                        5'd7: nonbin_class_hvs[18][7] <= nonbin_class_reg_in;
                        5'd8: nonbin_class_hvs[18][8] <= nonbin_class_reg_in;
                        default: nonbin_class_hvs[18][9] <= nonbin_class_reg_in;
                    endcase
                end
                5'd19: begin
                    case(nonbin_ctr)
                        5'd0: nonbin_class_hvs[19][0] <= nonbin_class_reg_in;
                        5'd1: nonbin_class_hvs[19][1] <= nonbin_class_reg_in;
                        5'd2: nonbin_class_hvs[19][2] <= nonbin_class_reg_in;
                        5'd3: nonbin_class_hvs[19][3] <= nonbin_class_reg_in;
                        5'd4: nonbin_class_hvs[19][4] <= nonbin_class_reg_in;
                        5'd5: nonbin_class_hvs[19][5] <= nonbin_class_reg_in;
                        5'd6: nonbin_class_hvs[19][6] <= nonbin_class_reg_in;
                        5'd7: nonbin_class_hvs[19][7] <= nonbin_class_reg_in;
                        5'd8: nonbin_class_hvs[19][8] <= nonbin_class_reg_in;
                        default: nonbin_class_hvs[19][9] <= nonbin_class_reg_in;
                    endcase
                end
                5'd20: begin
                    case(nonbin_ctr)
                        5'd0: nonbin_class_hvs[20][0] <= nonbin_class_reg_in;
                        5'd1: nonbin_class_hvs[20][1] <= nonbin_class_reg_in;
                        5'd2: nonbin_class_hvs[20][2] <= nonbin_class_reg_in;
                        5'd3: nonbin_class_hvs[20][3] <= nonbin_class_reg_in;
                        5'd4: nonbin_class_hvs[20][4] <= nonbin_class_reg_in;
                        5'd5: nonbin_class_hvs[20][5] <= nonbin_class_reg_in;
                        5'd6: nonbin_class_hvs[20][6] <= nonbin_class_reg_in;
                        5'd7: nonbin_class_hvs[20][7] <= nonbin_class_reg_in;
                        5'd8: nonbin_class_hvs[20][8] <= nonbin_class_reg_in;
                        default: nonbin_class_hvs[20][9] <= nonbin_class_reg_in;
                    endcase
                end
                5'd21: begin
                    case(nonbin_ctr)
                        5'd0: nonbin_class_hvs[21][0] <= nonbin_class_reg_in;
                        5'd1: nonbin_class_hvs[21][1] <= nonbin_class_reg_in;
                        5'd2: nonbin_class_hvs[21][2] <= nonbin_class_reg_in;
                        5'd3: nonbin_class_hvs[21][3] <= nonbin_class_reg_in;
                        5'd4: nonbin_class_hvs[21][4] <= nonbin_class_reg_in;
                        5'd5: nonbin_class_hvs[21][5] <= nonbin_class_reg_in;
                        5'd6: nonbin_class_hvs[21][6] <= nonbin_class_reg_in;
                        5'd7: nonbin_class_hvs[21][7] <= nonbin_class_reg_in;
                        5'd8: nonbin_class_hvs[21][8] <= nonbin_class_reg_in;
                        default: nonbin_class_hvs[21][9] <= nonbin_class_reg_in;
                    endcase
                end
                5'd22: begin
                    case(nonbin_ctr)
                        5'd0: nonbin_class_hvs[22][0] <= nonbin_class_reg_in;
                        5'd1: nonbin_class_hvs[22][1] <= nonbin_class_reg_in;
                        5'd2: nonbin_class_hvs[22][2] <= nonbin_class_reg_in;
                        5'd3: nonbin_class_hvs[22][3] <= nonbin_class_reg_in;
                        5'd4: nonbin_class_hvs[22][4] <= nonbin_class_reg_in;
                        5'd5: nonbin_class_hvs[22][5] <= nonbin_class_reg_in;
                        5'd6: nonbin_class_hvs[22][6] <= nonbin_class_reg_in;
                        5'd7: nonbin_class_hvs[22][7] <= nonbin_class_reg_in;
                        5'd8: nonbin_class_hvs[22][8] <= nonbin_class_reg_in;
                        default: nonbin_class_hvs[22][9] <= nonbin_class_reg_in;
                    endcase
                end
                5'd23: begin
                    case(nonbin_ctr)
                        5'd0: nonbin_class_hvs[23][0] <= nonbin_class_reg_in;
                        5'd1: nonbin_class_hvs[23][1] <= nonbin_class_reg_in;
                        5'd2: nonbin_class_hvs[23][2] <= nonbin_class_reg_in;
                        5'd3: nonbin_class_hvs[23][3] <= nonbin_class_reg_in;
                        5'd4: nonbin_class_hvs[23][4] <= nonbin_class_reg_in;
                        5'd5: nonbin_class_hvs[23][5] <= nonbin_class_reg_in;
                        5'd6: nonbin_class_hvs[23][6] <= nonbin_class_reg_in;
                        5'd7: nonbin_class_hvs[23][7] <= nonbin_class_reg_in;
                        5'd8: nonbin_class_hvs[23][8] <= nonbin_class_reg_in;
                        default: nonbin_class_hvs[23][9] <= nonbin_class_reg_in;
                    endcase
                end
                5'd24: begin
                    case(nonbin_ctr)
                        5'd0: nonbin_class_hvs[24][0] <= nonbin_class_reg_in;
                        5'd1: nonbin_class_hvs[24][1] <= nonbin_class_reg_in;
                        5'd2: nonbin_class_hvs[24][2] <= nonbin_class_reg_in;
                        5'd3: nonbin_class_hvs[24][3] <= nonbin_class_reg_in;
                        5'd4: nonbin_class_hvs[24][4] <= nonbin_class_reg_in;
                        5'd5: nonbin_class_hvs[24][5] <= nonbin_class_reg_in;
                        5'd6: nonbin_class_hvs[24][6] <= nonbin_class_reg_in;
                        5'd7: nonbin_class_hvs[24][7] <= nonbin_class_reg_in;
                        5'd8: nonbin_class_hvs[24][8] <= nonbin_class_reg_in;
                        default: nonbin_class_hvs[24][9] <= nonbin_class_reg_in;
                    endcase
                end
                default: begin
                    case(nonbin_ctr)
                        5'd0: nonbin_class_hvs[25][0] <= nonbin_class_reg_in;
                        5'd1: nonbin_class_hvs[25][1] <= nonbin_class_reg_in;
                        5'd2: nonbin_class_hvs[25][2] <= nonbin_class_reg_in;
                        5'd3: nonbin_class_hvs[25][3] <= nonbin_class_reg_in;
                        5'd4: nonbin_class_hvs[25][4] <= nonbin_class_reg_in;
                        5'd5: nonbin_class_hvs[25][5] <= nonbin_class_reg_in;
                        5'd6: nonbin_class_hvs[25][6] <= nonbin_class_reg_in;
                        5'd7: nonbin_class_hvs[25][7] <= nonbin_class_reg_in;
                        5'd8: nonbin_class_hvs[25][8] <= nonbin_class_reg_in;
                        default: nonbin_class_hvs[25][9] <= nonbin_class_reg_in;
                    endcase
                end            
            endcase
        end 
        else begin
            nonbin_class_hvs <= nonbin_class_hvs;
        end
    end 
  
    // output nonbinary class mux
    always_comb begin
        case(nonbin_class_select_bits) 
            5'd0: begin
                case(class_hv_gen_ctr)
                    5'd0: nonbin_class_reg_out = nonbin_class_hvs[0][0];
                    5'd1: nonbin_class_reg_out = nonbin_class_hvs[0][1];
                    5'd2: nonbin_class_reg_out = nonbin_class_hvs[0][2];
                    5'd3: nonbin_class_reg_out = nonbin_class_hvs[0][3];
                    5'd4: nonbin_class_reg_out = nonbin_class_hvs[0][4];
                    5'd5: nonbin_class_reg_out = nonbin_class_hvs[0][5];
                    5'd6: nonbin_class_reg_out = nonbin_class_hvs[0][6];
                    5'd7: nonbin_class_reg_out = nonbin_class_hvs[0][7];
                    5'd8: nonbin_class_reg_out = nonbin_class_hvs[0][8];
                    default: nonbin_class_reg_out = nonbin_class_hvs[0][9];
                endcase
            end
            5'd1: begin
                case(class_hv_gen_ctr)
                    5'd0: nonbin_class_reg_out = nonbin_class_hvs[1][0];
                    5'd1: nonbin_class_reg_out = nonbin_class_hvs[1][1];
                    5'd2: nonbin_class_reg_out = nonbin_class_hvs[1][2];
                    5'd3: nonbin_class_reg_out = nonbin_class_hvs[1][3];
                    5'd4: nonbin_class_reg_out = nonbin_class_hvs[1][4];
                    5'd5: nonbin_class_reg_out = nonbin_class_hvs[1][5];
                    5'd6: nonbin_class_reg_out = nonbin_class_hvs[1][6];
                    5'd7: nonbin_class_reg_out = nonbin_class_hvs[1][7];
                    5'd8: nonbin_class_reg_out = nonbin_class_hvs[1][8];
                    default: nonbin_class_reg_out = nonbin_class_hvs[1][9];
                endcase
            end
            5'd2: begin
                case(class_hv_gen_ctr)
                    5'd0: nonbin_class_reg_out = nonbin_class_hvs[2][0];
                    5'd1: nonbin_class_reg_out = nonbin_class_hvs[2][1];
                    5'd2: nonbin_class_reg_out = nonbin_class_hvs[2][2];
                    5'd3: nonbin_class_reg_out = nonbin_class_hvs[2][3];
                    5'd4: nonbin_class_reg_out = nonbin_class_hvs[2][4];
                    5'd5: nonbin_class_reg_out = nonbin_class_hvs[2][5];
                    5'd6: nonbin_class_reg_out = nonbin_class_hvs[2][6];
                    5'd7: nonbin_class_reg_out = nonbin_class_hvs[2][7];
                    5'd8: nonbin_class_reg_out = nonbin_class_hvs[2][8];
                    default: nonbin_class_reg_out = nonbin_class_hvs[2][9];
                endcase
            end
            5'd3: begin
                case(class_hv_gen_ctr)
                    5'd0: nonbin_class_reg_out = nonbin_class_hvs[3][0];
                    5'd1: nonbin_class_reg_out = nonbin_class_hvs[3][1];
                    5'd2: nonbin_class_reg_out = nonbin_class_hvs[3][2];
                    5'd3: nonbin_class_reg_out = nonbin_class_hvs[3][3];
                    5'd4: nonbin_class_reg_out = nonbin_class_hvs[3][4];
                    5'd5: nonbin_class_reg_out = nonbin_class_hvs[3][5];
                    5'd6: nonbin_class_reg_out = nonbin_class_hvs[3][6];
                    5'd7: nonbin_class_reg_out = nonbin_class_hvs[3][7];
                    5'd8: nonbin_class_reg_out = nonbin_class_hvs[3][8];
                    default: nonbin_class_reg_out = nonbin_class_hvs[3][9];
                endcase
            end
            5'd4: begin
                case(class_hv_gen_ctr)
                    5'd0: nonbin_class_reg_out = nonbin_class_hvs[4][0];
                    5'd1: nonbin_class_reg_out = nonbin_class_hvs[4][1];
                    5'd2: nonbin_class_reg_out = nonbin_class_hvs[4][2];
                    5'd3: nonbin_class_reg_out = nonbin_class_hvs[4][3];
                    5'd4: nonbin_class_reg_out = nonbin_class_hvs[4][4];
                    5'd5: nonbin_class_reg_out = nonbin_class_hvs[4][5];
                    5'd6: nonbin_class_reg_out = nonbin_class_hvs[4][6];
                    5'd7: nonbin_class_reg_out = nonbin_class_hvs[4][7];
                    5'd8: nonbin_class_reg_out = nonbin_class_hvs[4][8];
                    default: nonbin_class_reg_out = nonbin_class_hvs[4][9];
                endcase
            end
            5'd5: begin
                case(class_hv_gen_ctr)
                    5'd0: nonbin_class_reg_out = nonbin_class_hvs[5][0];
                    5'd1: nonbin_class_reg_out = nonbin_class_hvs[5][1];
                    5'd2: nonbin_class_reg_out = nonbin_class_hvs[5][2];
                    5'd3: nonbin_class_reg_out = nonbin_class_hvs[5][3];
                    5'd4: nonbin_class_reg_out = nonbin_class_hvs[5][4];
                    5'd5: nonbin_class_reg_out = nonbin_class_hvs[5][5];
                    5'd6: nonbin_class_reg_out = nonbin_class_hvs[5][6];
                    5'd7: nonbin_class_reg_out = nonbin_class_hvs[5][7];
                    5'd8: nonbin_class_reg_out = nonbin_class_hvs[5][8];
                    default: nonbin_class_reg_out = nonbin_class_hvs[5][9];
                endcase
            end
            5'd6: begin
                case(class_hv_gen_ctr)
                    5'd0: nonbin_class_reg_out = nonbin_class_hvs[6][0];
                    5'd1: nonbin_class_reg_out = nonbin_class_hvs[6][1];
                    5'd2: nonbin_class_reg_out = nonbin_class_hvs[6][2];
                    5'd3: nonbin_class_reg_out = nonbin_class_hvs[6][3];
                    5'd4: nonbin_class_reg_out = nonbin_class_hvs[6][4];
                    5'd5: nonbin_class_reg_out = nonbin_class_hvs[6][5];
                    5'd6: nonbin_class_reg_out = nonbin_class_hvs[6][6];
                    5'd7: nonbin_class_reg_out = nonbin_class_hvs[6][7];
                    5'd8: nonbin_class_reg_out = nonbin_class_hvs[6][8];
                    default: nonbin_class_reg_out = nonbin_class_hvs[6][9];
                endcase
            end
            5'd7: begin
                case(class_hv_gen_ctr)
                    5'd0: nonbin_class_reg_out = nonbin_class_hvs[7][0];
                    5'd1: nonbin_class_reg_out = nonbin_class_hvs[7][1];
                    5'd2: nonbin_class_reg_out = nonbin_class_hvs[7][2];
                    5'd3: nonbin_class_reg_out = nonbin_class_hvs[7][3];
                    5'd4: nonbin_class_reg_out = nonbin_class_hvs[7][4];
                    5'd5: nonbin_class_reg_out = nonbin_class_hvs[7][5];
                    5'd6: nonbin_class_reg_out = nonbin_class_hvs[7][6];
                    5'd7: nonbin_class_reg_out = nonbin_class_hvs[7][7];
                    5'd8: nonbin_class_reg_out = nonbin_class_hvs[7][8];
                    default: nonbin_class_reg_out = nonbin_class_hvs[7][9];
                endcase
            end
            5'd8: begin
                case(class_hv_gen_ctr)
                    5'd0: nonbin_class_reg_out = nonbin_class_hvs[8][0];
                    5'd1: nonbin_class_reg_out = nonbin_class_hvs[8][1];
                    5'd2: nonbin_class_reg_out = nonbin_class_hvs[8][2];
                    5'd3: nonbin_class_reg_out = nonbin_class_hvs[8][3];
                    5'd4: nonbin_class_reg_out = nonbin_class_hvs[8][4];
                    5'd5: nonbin_class_reg_out = nonbin_class_hvs[8][5];
                    5'd6: nonbin_class_reg_out = nonbin_class_hvs[8][6];
                    5'd7: nonbin_class_reg_out = nonbin_class_hvs[8][7];
                    5'd8: nonbin_class_reg_out = nonbin_class_hvs[8][8];
                    default: nonbin_class_reg_out = nonbin_class_hvs[8][9];
                endcase
            end
            5'd9: begin
                case(class_hv_gen_ctr)
                    5'd0: nonbin_class_reg_out = nonbin_class_hvs[9][0];
                    5'd1: nonbin_class_reg_out = nonbin_class_hvs[9][1];
                    5'd2: nonbin_class_reg_out = nonbin_class_hvs[9][2];
                    5'd3: nonbin_class_reg_out = nonbin_class_hvs[9][3];
                    5'd4: nonbin_class_reg_out = nonbin_class_hvs[9][4];
                    5'd5: nonbin_class_reg_out = nonbin_class_hvs[9][5];
                    5'd6: nonbin_class_reg_out = nonbin_class_hvs[9][6];
                    5'd7: nonbin_class_reg_out = nonbin_class_hvs[9][7];
                    5'd8: nonbin_class_reg_out = nonbin_class_hvs[9][8];
                    default: nonbin_class_reg_out = nonbin_class_hvs[9][9];
                endcase
            end
            5'd10: begin
                case(class_hv_gen_ctr)
                    5'd0: nonbin_class_reg_out = nonbin_class_hvs[10][0];
                    5'd1: nonbin_class_reg_out = nonbin_class_hvs[10][1];
                    5'd2: nonbin_class_reg_out = nonbin_class_hvs[10][2];
                    5'd3: nonbin_class_reg_out = nonbin_class_hvs[10][3];
                    5'd4: nonbin_class_reg_out = nonbin_class_hvs[10][4];
                    5'd5: nonbin_class_reg_out = nonbin_class_hvs[10][5];
                    5'd6: nonbin_class_reg_out = nonbin_class_hvs[10][6];
                    5'd7: nonbin_class_reg_out = nonbin_class_hvs[10][7];
                    5'd8: nonbin_class_reg_out = nonbin_class_hvs[10][8];
                    default: nonbin_class_reg_out = nonbin_class_hvs[10][9];
                endcase
            end
            5'd11: begin
                case(class_hv_gen_ctr)
                    5'd0: nonbin_class_reg_out = nonbin_class_hvs[11][0];
                    5'd1: nonbin_class_reg_out = nonbin_class_hvs[11][1];
                    5'd2: nonbin_class_reg_out = nonbin_class_hvs[11][2];
                    5'd3: nonbin_class_reg_out = nonbin_class_hvs[11][3];
                    5'd4: nonbin_class_reg_out = nonbin_class_hvs[11][4];
                    5'd5: nonbin_class_reg_out = nonbin_class_hvs[11][5];
                    5'd6: nonbin_class_reg_out = nonbin_class_hvs[11][6];
                    5'd7: nonbin_class_reg_out = nonbin_class_hvs[11][7];
                    5'd8: nonbin_class_reg_out = nonbin_class_hvs[11][8];
                    default: nonbin_class_reg_out = nonbin_class_hvs[11][9];
                endcase
            end
            5'd12: begin
                case(class_hv_gen_ctr)
                    5'd0: nonbin_class_reg_out = nonbin_class_hvs[12][0];
                    5'd1: nonbin_class_reg_out = nonbin_class_hvs[12][1];
                    5'd2: nonbin_class_reg_out = nonbin_class_hvs[12][2];
                    5'd3: nonbin_class_reg_out = nonbin_class_hvs[12][3];
                    5'd4: nonbin_class_reg_out = nonbin_class_hvs[12][4];
                    5'd5: nonbin_class_reg_out = nonbin_class_hvs[12][5];
                    5'd6: nonbin_class_reg_out = nonbin_class_hvs[12][6];
                    5'd7: nonbin_class_reg_out = nonbin_class_hvs[12][7];
                    5'd8: nonbin_class_reg_out = nonbin_class_hvs[12][8];
                    default: nonbin_class_reg_out = nonbin_class_hvs[12][9];
                endcase
            end
            5'd13: begin
                case(class_hv_gen_ctr)
                    5'd0: nonbin_class_reg_out = nonbin_class_hvs[13][0];
                    5'd1: nonbin_class_reg_out = nonbin_class_hvs[13][1];
                    5'd2: nonbin_class_reg_out = nonbin_class_hvs[13][2];
                    5'd3: nonbin_class_reg_out = nonbin_class_hvs[13][3];
                    5'd4: nonbin_class_reg_out = nonbin_class_hvs[13][4];
                    5'd5: nonbin_class_reg_out = nonbin_class_hvs[13][5];
                    5'd6: nonbin_class_reg_out = nonbin_class_hvs[13][6];
                    5'd7: nonbin_class_reg_out = nonbin_class_hvs[13][7];
                    5'd8: nonbin_class_reg_out = nonbin_class_hvs[13][8];
                    default: nonbin_class_reg_out = nonbin_class_hvs[13][9];
                endcase
            end
            5'd14: begin
                case(class_hv_gen_ctr)
                    5'd0: nonbin_class_reg_out = nonbin_class_hvs[14][0];
                    5'd1: nonbin_class_reg_out = nonbin_class_hvs[14][1];
                    5'd2: nonbin_class_reg_out = nonbin_class_hvs[14][2];
                    5'd3: nonbin_class_reg_out = nonbin_class_hvs[14][3];
                    5'd4: nonbin_class_reg_out = nonbin_class_hvs[14][4];
                    5'd5: nonbin_class_reg_out = nonbin_class_hvs[14][5];
                    5'd6: nonbin_class_reg_out = nonbin_class_hvs[14][6];
                    5'd7: nonbin_class_reg_out = nonbin_class_hvs[14][7];
                    5'd8: nonbin_class_reg_out = nonbin_class_hvs[14][8];
                    default: nonbin_class_reg_out = nonbin_class_hvs[14][9];
                endcase
            end
            5'd15: begin
                case(class_hv_gen_ctr)
                    5'd0: nonbin_class_reg_out = nonbin_class_hvs[15][0];
                    5'd1: nonbin_class_reg_out = nonbin_class_hvs[15][1];
                    5'd2: nonbin_class_reg_out = nonbin_class_hvs[15][2];
                    5'd3: nonbin_class_reg_out = nonbin_class_hvs[15][3];
                    5'd4: nonbin_class_reg_out = nonbin_class_hvs[15][4];
                    5'd5: nonbin_class_reg_out = nonbin_class_hvs[15][5];
                    5'd6: nonbin_class_reg_out = nonbin_class_hvs[15][6];
                    5'd7: nonbin_class_reg_out = nonbin_class_hvs[15][7];
                    5'd8: nonbin_class_reg_out = nonbin_class_hvs[15][8];
                    default: nonbin_class_reg_out = nonbin_class_hvs[15][9];
                endcase
            end
            5'd16: begin
                case(class_hv_gen_ctr)
                    5'd0: nonbin_class_reg_out = nonbin_class_hvs[16][0];
                    5'd1: nonbin_class_reg_out = nonbin_class_hvs[16][1];
                    5'd2: nonbin_class_reg_out = nonbin_class_hvs[16][2];
                    5'd3: nonbin_class_reg_out = nonbin_class_hvs[16][3];
                    5'd4: nonbin_class_reg_out = nonbin_class_hvs[16][4];
                    5'd5: nonbin_class_reg_out = nonbin_class_hvs[16][5];
                    5'd6: nonbin_class_reg_out = nonbin_class_hvs[16][6];
                    5'd7: nonbin_class_reg_out = nonbin_class_hvs[16][7];
                    5'd8: nonbin_class_reg_out = nonbin_class_hvs[16][8];
                    default: nonbin_class_reg_out = nonbin_class_hvs[16][9];
                endcase
            end
            5'd17: begin
                case(class_hv_gen_ctr)
                    5'd0: nonbin_class_reg_out = nonbin_class_hvs[17][0];
                    5'd1: nonbin_class_reg_out = nonbin_class_hvs[17][1];
                    5'd2: nonbin_class_reg_out = nonbin_class_hvs[17][2];
                    5'd3: nonbin_class_reg_out = nonbin_class_hvs[17][3];
                    5'd4: nonbin_class_reg_out = nonbin_class_hvs[17][4];
                    5'd5: nonbin_class_reg_out = nonbin_class_hvs[17][5];
                    5'd6: nonbin_class_reg_out = nonbin_class_hvs[17][6];
                    5'd7: nonbin_class_reg_out = nonbin_class_hvs[17][7];
                    5'd8: nonbin_class_reg_out = nonbin_class_hvs[17][8];
                    default: nonbin_class_reg_out = nonbin_class_hvs[17][9];
                endcase
            end
            5'd18: begin
                case(class_hv_gen_ctr)
                    5'd0: nonbin_class_reg_out = nonbin_class_hvs[18][0];
                    5'd1: nonbin_class_reg_out = nonbin_class_hvs[18][1];
                    5'd2: nonbin_class_reg_out = nonbin_class_hvs[18][2];
                    5'd3: nonbin_class_reg_out = nonbin_class_hvs[18][3];
                    5'd4: nonbin_class_reg_out = nonbin_class_hvs[18][4];
                    5'd5: nonbin_class_reg_out = nonbin_class_hvs[18][5];
                    5'd6: nonbin_class_reg_out = nonbin_class_hvs[18][6];
                    5'd7: nonbin_class_reg_out = nonbin_class_hvs[18][7];
                    5'd8: nonbin_class_reg_out = nonbin_class_hvs[18][8];
                    default: nonbin_class_reg_out = nonbin_class_hvs[18][9];
                endcase
            end
            5'd19: begin
                case(class_hv_gen_ctr)
                    5'd0: nonbin_class_reg_out = nonbin_class_hvs[19][0];
                    5'd1: nonbin_class_reg_out = nonbin_class_hvs[19][1];
                    5'd2: nonbin_class_reg_out = nonbin_class_hvs[19][2];
                    5'd3: nonbin_class_reg_out = nonbin_class_hvs[19][3];
                    5'd4: nonbin_class_reg_out = nonbin_class_hvs[19][4];
                    5'd5: nonbin_class_reg_out = nonbin_class_hvs[19][5];
                    5'd6: nonbin_class_reg_out = nonbin_class_hvs[19][6];
                    5'd7: nonbin_class_reg_out = nonbin_class_hvs[19][7];
                    5'd8: nonbin_class_reg_out = nonbin_class_hvs[19][8];
                    default: nonbin_class_reg_out = nonbin_class_hvs[19][9];
                endcase
            end
            5'd20: begin
                case(class_hv_gen_ctr)
                    5'd0: nonbin_class_reg_out = nonbin_class_hvs[20][0];
                    5'd1: nonbin_class_reg_out = nonbin_class_hvs[20][1];
                    5'd2: nonbin_class_reg_out = nonbin_class_hvs[20][2];
                    5'd3: nonbin_class_reg_out = nonbin_class_hvs[20][3];
                    5'd4: nonbin_class_reg_out = nonbin_class_hvs[20][4];
                    5'd5: nonbin_class_reg_out = nonbin_class_hvs[20][5];
                    5'd6: nonbin_class_reg_out = nonbin_class_hvs[20][6];
                    5'd7: nonbin_class_reg_out = nonbin_class_hvs[20][7];
                    5'd8: nonbin_class_reg_out = nonbin_class_hvs[20][8];
                    default: nonbin_class_reg_out = nonbin_class_hvs[20][9];
                endcase
            end
            5'd21: begin
                case(class_hv_gen_ctr)
                    5'd0: nonbin_class_reg_out = nonbin_class_hvs[21][0];
                    5'd1: nonbin_class_reg_out = nonbin_class_hvs[21][1];
                    5'd2: nonbin_class_reg_out = nonbin_class_hvs[21][2];
                    5'd3: nonbin_class_reg_out = nonbin_class_hvs[21][3];
                    5'd4: nonbin_class_reg_out = nonbin_class_hvs[21][4];
                    5'd5: nonbin_class_reg_out = nonbin_class_hvs[21][5];
                    5'd6: nonbin_class_reg_out = nonbin_class_hvs[21][6];
                    5'd7: nonbin_class_reg_out = nonbin_class_hvs[21][7];
                    5'd8: nonbin_class_reg_out = nonbin_class_hvs[21][8];
                    default: nonbin_class_reg_out = nonbin_class_hvs[21][9];
                endcase
            end
            5'd22: begin
                case(class_hv_gen_ctr)
                    5'd0: nonbin_class_reg_out = nonbin_class_hvs[22][0];
                    5'd1: nonbin_class_reg_out = nonbin_class_hvs[22][1];
                    5'd2: nonbin_class_reg_out = nonbin_class_hvs[22][2];
                    5'd3: nonbin_class_reg_out = nonbin_class_hvs[22][3];
                    5'd4: nonbin_class_reg_out = nonbin_class_hvs[22][4];
                    5'd5: nonbin_class_reg_out = nonbin_class_hvs[22][5];
                    5'd6: nonbin_class_reg_out = nonbin_class_hvs[22][6];
                    5'd7: nonbin_class_reg_out = nonbin_class_hvs[22][7];
                    5'd8: nonbin_class_reg_out = nonbin_class_hvs[22][8];
                    default: nonbin_class_reg_out = nonbin_class_hvs[22][9];
                endcase
            end
            5'd23: begin
                case(class_hv_gen_ctr)
                    5'd0: nonbin_class_reg_out = nonbin_class_hvs[23][0];
                    5'd1: nonbin_class_reg_out = nonbin_class_hvs[23][1];
                    5'd2: nonbin_class_reg_out = nonbin_class_hvs[23][2];
                    5'd3: nonbin_class_reg_out = nonbin_class_hvs[23][3];
                    5'd4: nonbin_class_reg_out = nonbin_class_hvs[23][4];
                    5'd5: nonbin_class_reg_out = nonbin_class_hvs[23][5];
                    5'd6: nonbin_class_reg_out = nonbin_class_hvs[23][6];
                    5'd7: nonbin_class_reg_out = nonbin_class_hvs[23][7];
                    5'd8: nonbin_class_reg_out = nonbin_class_hvs[23][8];
                    default: nonbin_class_reg_out = nonbin_class_hvs[23][9];
                endcase
            end
            5'd24: begin
                case(class_hv_gen_ctr)
                    5'd0: nonbin_class_reg_out = nonbin_class_hvs[24][0];
                    5'd1: nonbin_class_reg_out = nonbin_class_hvs[24][1];
                    5'd2: nonbin_class_reg_out = nonbin_class_hvs[24][2];
                    5'd3: nonbin_class_reg_out = nonbin_class_hvs[24][3];
                    5'd4: nonbin_class_reg_out = nonbin_class_hvs[24][4];
                    5'd5: nonbin_class_reg_out = nonbin_class_hvs[24][5];
                    5'd6: nonbin_class_reg_out = nonbin_class_hvs[24][6];
                    5'd7: nonbin_class_reg_out = nonbin_class_hvs[24][7];
                    5'd8: nonbin_class_reg_out = nonbin_class_hvs[24][8];
                    default: nonbin_class_reg_out = nonbin_class_hvs[24][9];
                endcase
            end
            default: begin
                case(class_hv_gen_ctr)
                    5'd0: nonbin_class_reg_out = nonbin_class_hvs[25][0];
                    5'd1: nonbin_class_reg_out = nonbin_class_hvs[25][1];
                    5'd2: nonbin_class_reg_out = nonbin_class_hvs[25][2];
                    5'd3: nonbin_class_reg_out = nonbin_class_hvs[25][3];
                    5'd4: nonbin_class_reg_out = nonbin_class_hvs[25][4];
                    5'd5: nonbin_class_reg_out = nonbin_class_hvs[25][5];
                    5'd6: nonbin_class_reg_out = nonbin_class_hvs[25][6];
                    5'd7: nonbin_class_reg_out = nonbin_class_hvs[25][7];
                    5'd8: nonbin_class_reg_out = nonbin_class_hvs[25][8];
                    default: nonbin_class_reg_out = nonbin_class_hvs[25][9];
                endcase
            end         
        endcase       
    end 

endmodule

