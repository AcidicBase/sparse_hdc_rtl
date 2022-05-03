module class_thresholder(
    input wire nrst,
    input wire en,
    input wire binarizing_class_hvs,    
    input wire [DIMS_PER_CC-1:0][BITWIDTH_PER_DIM-1:0] nonbin_class_reg_out,
    output logic [DIMS_PER_CC-1:0] thresholded_hv
    );
    
    always_comb begin
        if (!nrst) begin
            for(int i = 0; i < DIMS_PER_CC; i++) begin
                thresholded_hv[i] = 1'b0;
            end
        end
        else begin
            if (binarizing_class_hvs && en) begin
                for(int i = 0; i < DIMS_PER_CC; i++) begin
                    thresholded_hv[i] = (nonbin_class_reg_out[i] >= CLASS_BIT_THR) ? 1'b1 : 1'b0;
                end
            end
            else begin
                thresholded_hv = thresholded_hv;
            end         
        end
    end
 
endmodule
