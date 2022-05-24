module qtz_sp_dff(
	input  wire 					clk,
	input  wire 					nrst,
	input  wire						mapping_hv_segment,
	input  wire  [3:0]				sel,
	input  wire  [HV_DIM-1:0] 		level_hv,
	output logic [HV_DIM-1:0]		level_hvs_reg_0,
	output logic [HV_DIM-1:0]		level_hvs_reg_1,
	output logic [HV_DIM-1:0]		level_hvs_reg_2,
	output logic [HV_DIM-1:0]		level_hvs_reg_3,
	output logic [HV_DIM-1:0]		level_hvs_reg_4,
	output logic [HV_DIM-1:0]		level_hvs_reg_5,
	output logic [HV_DIM-1:0]		level_hvs_reg_6,
	output logic [HV_DIM-1:0]		level_hvs_reg_7,
	output logic [HV_DIM-1:0]		level_hvs_reg_8
    );  

	always_ff @(posedge clk or negedge nrst) begin
		if (!nrst) begin
			level_hvs_reg_0 <= '0;
			level_hvs_reg_1 <= '0;
			level_hvs_reg_2 <= '0;
			level_hvs_reg_3 <= '0;
			level_hvs_reg_4 <= '0;
			level_hvs_reg_5 <= '0;
			level_hvs_reg_6 <= '0;
			level_hvs_reg_7 <= '0;
			level_hvs_reg_8 <= '0;
		end
		else if (mapping_hv_segment) begin
		    case(sel)
		        4'd0:    level_hvs_reg_0	<= level_hv;
		        4'd1:    level_hvs_reg_1 	<= level_hv;
		        4'd2:    level_hvs_reg_2 	<= level_hv;
		        4'd3:    level_hvs_reg_3 	<= level_hv;
		        4'd4:    level_hvs_reg_4 	<= level_hv;
		        4'd5:    level_hvs_reg_5 	<= level_hv;
		        4'd6:    level_hvs_reg_6	<= level_hv;
		        4'd7:    level_hvs_reg_7 	<= level_hv;
		        4'd8:    level_hvs_reg_8 	<= level_hv;
				default: begin
							level_hvs_reg_0 <= level_hvs_reg_0;
							level_hvs_reg_1 <= level_hvs_reg_1;
							level_hvs_reg_2 <= level_hvs_reg_2;
							level_hvs_reg_3 <= level_hvs_reg_3;
							level_hvs_reg_4 <= level_hvs_reg_4;
							level_hvs_reg_5 <= level_hvs_reg_5;
							level_hvs_reg_6 <= level_hvs_reg_6;
							level_hvs_reg_7 <= level_hvs_reg_7;
							level_hvs_reg_8 <= level_hvs_reg_8;
						end
		    endcase
		end
		else begin
			level_hvs_reg_0 <= level_hvs_reg_0;
			level_hvs_reg_1 <= level_hvs_reg_1;
			level_hvs_reg_2 <= level_hvs_reg_2;
			level_hvs_reg_3 <= level_hvs_reg_3;
			level_hvs_reg_4 <= level_hvs_reg_4;
			level_hvs_reg_5 <= level_hvs_reg_5;
			level_hvs_reg_6 <= level_hvs_reg_6;
			level_hvs_reg_7 <= level_hvs_reg_7;
			level_hvs_reg_8 <= level_hvs_reg_8;
		end
    end 

endmodule
