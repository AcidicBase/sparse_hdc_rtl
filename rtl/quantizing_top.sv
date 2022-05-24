module quantizing_top(
    input  wire               	clk,
    input  wire               	nrst,
    input  wire               	en,
    input  wire               	start_mapping,
    input  wire  [15:0]       	input_values 			[0:FEATURE_COUNT-1],
    output wire               	mapping_done,
    output wire  [HV_DIM-1:0]	level_hvs      			[0:FEATURE_COUNT-1] 
    );

	wire               			mapping_hv_segment;
    wire 	[3:0]         		sel;	
    wire  	[3:0]         		quantized_value_levels	[0:FEATURES_PER_CC-1];
    wire  	[HV_DIM-1:0]  		im_fetch_outputs        [0:FEATURES_PER_CC-1]; 
    wire 	[HV_DIM-1:0]		im_hvs                  [0:M-1]; 
    wire	[15:0]        		mux_out                 [0:FEATURES_PER_CC-1];    

    // FSM Controller
    qtz_fsm Q_FSM_0(
        .clk										(clk),
        .nrst										(nrst),
        .en											(en),
        .start_mapping								(start_mapping),
        .ctr										(sel),
		.mapping_hv_segment							(mapping_hv_segment),
        .mapping_done								(mapping_done)
    ); 

	// Input MUX
	qtz_mux_in Q_MUX_IN_0(
		.sel										(sel),
		.input_values								(input_values),
		.mux_out									(mux_out)
	);
    
    // Quantizers  
    for (genvar i = 0; i < FEATURES_PER_CC; i++) 
		begin : qtzs
		    quantizer QTZ(
				.input_value						(mux_out[i]),
				.quantized_value_level				(quantized_value_levels[i])
		    );
    	end

	// Item Memory
	qtz_im IM_0(.im_hvs(im_hvs));

    // IM Fetch
	for (genvar j = 0; j < FEATURES_PER_CC; j++) 
		begin : ims
			qtz_im_fetch Q_IM(
				.qlevel								(quantized_value_levels[j]),
				.im_hvs								(im_hvs),          
				.level_hv							(im_fetch_outputs[j])
			);
		end

	// Output registers
	for (genvar k = 0; k < FEATURES_PER_CC-3; k++) 
		begin : qtz_dffs
			qtz_dff QTZ_DFF(
				.clk								(clk),
        		.nrst								(nrst),
				.mapping_hv_segment					(mapping_hv_segment),
				.sel								(sel),
				.level_hv							(im_fetch_outputs[k]),
				.level_hvs_reg_0					(level_hvs[k]),	
				.level_hvs_reg_1					(level_hvs[k+62]),	
				.level_hvs_reg_2					(level_hvs[k+124]),	
				.level_hvs_reg_3					(level_hvs[k+186]),	
				.level_hvs_reg_4					(level_hvs[k+248]),		
				.level_hvs_reg_5					(level_hvs[k+310]),			
				.level_hvs_reg_6					(level_hvs[k+372]),	
				.level_hvs_reg_7					(level_hvs[k+434]),	
				.level_hvs_reg_8					(level_hvs[k+496]),	
				.level_hvs_reg_9					(level_hvs[k+558])	
			);
		end

	// Special output registers (since we only have 617 features, not 620)
	for (genvar k = FEATURES_PER_CC-3; k < FEATURES_PER_CC; k++)
		begin : qtz_sp_dffs
			qtz_sp_dff QTZ_SP_DFF(
				.clk								(clk),
        		.nrst								(nrst),
				.mapping_hv_segment					(mapping_hv_segment),
				.sel								(sel),
				.level_hv							(im_fetch_outputs[k]),
				.level_hvs_reg_0					(level_hvs[k]),	
				.level_hvs_reg_1					(level_hvs[k+62]),	
				.level_hvs_reg_2					(level_hvs[k+124]),	
				.level_hvs_reg_3					(level_hvs[k+186]),	
				.level_hvs_reg_4					(level_hvs[k+248]),		
				.level_hvs_reg_5					(level_hvs[k+310]),			
				.level_hvs_reg_6					(level_hvs[k+372]),	
				.level_hvs_reg_7					(level_hvs[k+434]),	
				.level_hvs_reg_8					(level_hvs[k+496])
			);
		end

endmodule
