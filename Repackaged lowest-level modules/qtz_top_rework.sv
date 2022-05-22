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
	wire						qtz_out_reg_en			[9:0];

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
	
	/*
	// Output mux into register
	qtz_reg_out Q_REG_OUT_0(
		.clk										(clk),
		.nrst										(nrst),
		.mapping_hv_segment							(mapping_hv_segment),
		.sel										(sel),
		.im_fetch_outputs							(im_fetch_outputs),
		.level_hvs									(level_hvs)
	);
	*/
	
	//REPLACED QTZ_REG_OUT WITH THE CODE BELOW: 
	//I basically just made the registers smaller so they can just be reinstantiated, then sel drives a mux that drives an enable signal to the registers. If en = 1, register updates with im_fetch_outputs
	//10th register set is special and separately instantiated since it only stores 59 level_hvs
	
	//output mux into output registers
	qtz_out_mux Q_OUT_MUX_0(
		.sel										(sel),
		.qtz_out_reg_en								(qtz_out_reg_en);
	
	);
	
	
	//Smaller registers re-instantiated (blocks of (HV_DIM/5) = 1000 hv dims * 62 features/cc = 62k registers instantiated 5 times per class, so 130 times total)
	
	for (genvar k = 0; k < SEQ_CYCLE_COUNT-1; k++) 
		begin : outReg
			qtz_reg_out Q_REG_OUT_0(
				.clk								(clk),
				.nrst								(nrst),
				.mapping_hv_segment					(mapping_hv_segment),
				.qtz_out_reg_en						(qtz_out_reg_en[k]),
				.im_fetch_outputs					(im_fetch_outputs[0:FEATURES_PER_CC-1][0+:(HV_DIM/5)]),
				.level_hvs							(level_hvs[k:FEATURES_PER_CC*k][0+:(HV_DIM/5)])
			);
			qtz_reg_out Q_REG_OUT_1(
				.clk								(clk),
				.nrst								(nrst),
				.mapping_hv_segment					(mapping_hv_segment),
				.qtz_out_reg_en						(qtz_out_reg_en[k]),
				.im_fetch_outputs					(im_fetch_outputs[0:FEATURES_PER_CC-1][(HV_DIM/5)+:(HV_DIM/5)]),
				.level_hvs							(level_hvs[k:FEATURES_PER_CC*k][(HV_DIM/5)+:(HV_DIM/5)])
			);
			qtz_reg_out Q_REG_OUT_2(
				.clk								(clk),
				.nrst								(nrst),
				.mapping_hv_segment					(mapping_hv_segment),
				.qtz_out_reg_en						(qtz_out_reg_en[k]),
				.im_fetch_outputs					(im_fetch_outputs[0:FEATURES_PER_CC-1][(HV_DIM*(2/5))+:(HV_DIM/5)]),
				.level_hvs							(level_hvs[k:FEATURES_PER_CC*k][(HV_DIM*(2/5))+:(HV_DIM/5)])
			);
			qtz_reg_out Q_REG_OUT_3(
				.clk								(clk),
				.nrst								(nrst),
				.mapping_hv_segment					(mapping_hv_segment),
				.qtz_out_reg_en						(qtz_out_reg_en[k]),
				.im_fetch_outputs					(im_fetch_outputs[0:FEATURES_PER_CC-1][(HV_DIM*(3/5))+:(HV_DIM/5)]),
				.level_hvs							(level_hvs[k:FEATURES_PER_CC*k][(HV_DIM*(3/5))+:(HV_DIM/5)])
			);
			qtz_reg_out Q_REG_OUT_4(
				.clk								(clk),
				.nrst								(nrst),
				.mapping_hv_segment					(mapping_hv_segment),
				.qtz_out_reg_en						(qtz_out_reg_en[k]),
				.im_fetch_outputs					(im_fetch_outputs[0:FEATURES_PER_CC-1][(HV_DIM*(4/5))+:(HV_DIM/5)]),
				.level_hvs							(level_hvs[k:FEATURES_PER_CC*k][(HV_DIM*(4/5))+:(HV_DIM/5)])
			);
		end
	
	//10th CC register
	qtz_reg_out_10 Q_REG_OUT_10th_0(
				.clk								(clk),
				.nrst								(nrst),
				.mapping_hv_segment					(mapping_hv_segment),
				.qtz_out_reg_en						(qtz_out_reg_en[9]),
				.im_fetch_outputs					(im_fetch_outputs[0:FEATURES_PER_CC-1][0+:(HV_DIM/5)]),
				.level_hvs							(level_hvs[558:616][0+:(HV_DIM/5)])
			);
	qtz_reg_out_10 Q_REG_OUT_10th_1(
				.clk								(clk),
				.nrst								(nrst),
				.mapping_hv_segment					(mapping_hv_segment),
				.qtz_out_reg_en						(qtz_out_reg_en[9]),
				.im_fetch_outputs					(im_fetch_outputs[0:FEATURES_PER_CC-1][(HV_DIM/5)+:(HV_DIM/5)]),
				.level_hvs							(level_hvs[558:616][(HV_DIM/5)+:(HV_DIM/5)])
			);
	qtz_reg_out_10 Q_REG_OUT_10th_2(
				.clk								(clk),
				.nrst								(nrst),
				.mapping_hv_segment					(mapping_hv_segment),
				.qtz_out_reg_en						(qtz_out_reg_en[9]),
				.im_fetch_outputs					(im_fetch_outputs[0:FEATURES_PER_CC-1][(HV_DIM*(2/5))+:(HV_DIM/5)]),
				.level_hvs							(level_hvs[558:616][(HV_DIM*(2/5))+:(HV_DIM/5)])
			);
	qtz_reg_out_10 Q_REG_OUT_10th_3(
				.clk								(clk),
				.nrst								(nrst),
				.mapping_hv_segment					(mapping_hv_segment),
				.qtz_out_reg_en						(qtz_out_reg_en[9]),
				.im_fetch_outputs					(im_fetch_outputs[0:FEATURES_PER_CC-1][(HV_DIM*(3/5))+:(HV_DIM/5)]),
				.level_hvs							(level_hvs[558:616][(HV_DIM*(3/5))+:(HV_DIM/5)])
			);
	qtz_reg_out_10 Q_REG_OUT_10th_4(
				.clk								(clk),
				.nrst								(nrst),
				.mapping_hv_segment					(mapping_hv_segment),
				.qtz_out_reg_en						(qtz_out_reg_en[9]),
				.im_fetch_outputs					(im_fetch_outputs[0:FEATURES_PER_CC-1][(HV_DIM*(4/5))+:(HV_DIM/5)]),
				.level_hvs							(level_hvs[558:616][(HV_DIM*(4/5))+:(HV_DIM/5)])
			);
endmodule