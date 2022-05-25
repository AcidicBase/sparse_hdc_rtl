module enc_shift_reg(
    input  wire  					clk,
    input  wire  					nrst,
    input  wire  					start_encoding,
    input  wire  	[HV_DIM-1:0] 	shifted_hv,
    output logic	[HV_DIM-1:0] 	shifted_hv_reg_out
);

	always_ff @(posedge clk or negedge nrst) begin
        if (!nrst) begin
            shifted_hv_reg_out <= '0;
        end
        else if (start_encoding) begin
            shifted_hv_reg_out <= shifted_hv;
        end
        else begin
            shifted_hv_reg_out <= shifted_hv_reg_out;
        end
    end

endmodule