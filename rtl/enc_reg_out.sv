module enc_reg_out(
	input  wire 						clk,
	input  wire 						nrst,
	input  wire 						bundling_features,
	input  wire 	[3:0]         		ctr,
	input  wire 	[DIMS_PER_CC-1:0] 	thresholded_bits,
	output logic	[HV_DIM-1:0]		encoded_hv
	);

    always_ff @(posedge clk or negedge nrst) begin
        if (!nrst) begin
            encoded_hv <= '0;
        end    
        else if (bundling_features) begin			
            case(ctr) 
                4'd0:    encoded_hv[499:0]     <= thresholded_bits;
                4'd1:    encoded_hv[999:500]   <= thresholded_bits;
                4'd2:    encoded_hv[1499:1000] <= thresholded_bits;
                4'd3:    encoded_hv[1999:1500] <= thresholded_bits;
                4'd4:    encoded_hv[2499:2000] <= thresholded_bits;
                4'd5:    encoded_hv[2999:2500] <= thresholded_bits;
                4'd6:    encoded_hv[3499:3000] <= thresholded_bits;
                4'd7:    encoded_hv[3999:3500] <= thresholded_bits;
                4'd8:    encoded_hv[4499:4000] <= thresholded_bits;
                4'd9:    encoded_hv[4999:4500] <= thresholded_bits;
                default: encoded_hv <= encoded_hv;    
            endcase
        end 
        else begin
            encoded_hv <= encoded_hv;
        end
    end 

endmodule
