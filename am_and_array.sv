module am_and_array( 
    input wire comparing_query_hv_with_class_hv,
    input wire [3:0] query_ctr,
    input wire [DIMS_PER_CC-1:0] query_hv_segment,
    input wire [SEQ_CYCLE_COUNT-1:0][DIMS_PER_CC-1:0] binary_class_hvs [0:25],
    output logic [DIMS_PER_CC-1:0] and_array_out [0:25]     
    );

    always_comb begin
        if (comparing_query_hv_with_class_hv) begin
            case(query_ctr)
                4'd0: begin
                    for(int i = 0; i < 26; i++) begin
                        and_array_out[i] = binary_class_hvs[i][0] & query_hv_segment;
                    end
                end
                4'd1: begin
                    for(int i = 0; i < 26; i++) begin
                        and_array_out[i] = binary_class_hvs[i][1] & query_hv_segment;
                    end
                end
                4'd2: begin
                    for(int i = 0; i < 26; i++) begin
                        and_array_out[i] = binary_class_hvs[i][2] & query_hv_segment;
                    end
                end               
                4'd3: begin
                    for(int i = 0; i < 26; i++) begin
                        and_array_out[i] = binary_class_hvs[i][3] & query_hv_segment;
                    end
                end                
                4'd4: begin
                    for(int i = 0; i < 26; i++) begin
                        and_array_out[i] = binary_class_hvs[i][4] & query_hv_segment;
                    end
                end                
                4'd5: begin
                    for(int i = 0; i < 26; i++) begin
                        and_array_out[i] = binary_class_hvs[i][5] & query_hv_segment;
                    end
                end
                4'd6: begin
                    for(int i = 0; i < 26; i++) begin
                        and_array_out[i] = binary_class_hvs[i][6] & query_hv_segment;
                    end
                end
                4'd7: begin
                    for(int i = 0; i < 26; i++) begin
                        and_array_out[i] = binary_class_hvs[i][7] & query_hv_segment;
                    end
                end               
                4'd8: begin
                    for(int i = 0; i < 26; i++) begin
                        and_array_out[i] = binary_class_hvs[i][8] & query_hv_segment;
                    end
                end                
                default: begin
                    for(int i = 0; i < 26; i++) begin
                        and_array_out[i] = binary_class_hvs[i][9] & query_hv_segment;
                    end
                end                         
            endcase
        end
        else begin
            for(int i = 0; i < 26; i++) begin
                and_array_out[i] = 0;
            end
        end
    end

endmodule
