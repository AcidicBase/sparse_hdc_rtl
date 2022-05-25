module encoding_top(
    input  wire 					clk, 
    input  wire 					nrst, 
    input  wire 		            en, 
    input  wire 					start_encoding,
    input  wire   	[HV_DIM-1:0] 	level_hvs 				[0:FEATURE_COUNT-1],
    output wire 					encoding_done,
    output wire		[HV_DIM-1:0] 	encoded_hv
    );
    
	wire 						 	bundling_features;
    wire 	[3:0] 				 	ctr;
    wire 	[HV_DIM-1:0] 		 	shifted_hvs 			[0:FEATURE_COUNT-1];
    wire 	[FEATURE_COUNT-1:0] 	bits_to_bundle_arr		[HV_DIM-1:0];
    
    // for mux & demux 
    wire 	[FEATURE_COUNT-1:0] 	mux_out 				[DIMS_PER_CC-1:0];
    wire 	[DIMS_PER_CC-1:0] 		thresholded_bits;
	
    
    // FSM Controller
    enc_fsm ENC_FSM_0(
        .clk									(clk),
        .nrst									(nrst),
        .en										(en),
        .start_encoding							(start_encoding),
        .ctr									(ctr),
		.bundling_features						(bundling_features),
        .encoding_done							(encoding_done)
    );  
         
    // FEATURE_COUNT=617 binders (packed into groups of 10 binders)
	enc_binder_pack_0 ENC_BINDER_PACK_0(
		.clk									(clk),
	    .nrst									(nrst),
	    .start_encoding							(start_encoding),
	    .level_hv								(level_hvs[0:9]),
	    .shifted_hv								(shifted_hvs[0:9])
	);
	enc_binder_pack_1 ENC_BINDER_PACK_1(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[10:19]),
			.shifted_hv								(shifted_hvs[10:19])
		);
	enc_binder_pack_2 ENC_BINDER_PACK_2(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[20:29]),
			.shifted_hv								(shifted_hvs[20:29])
		);
	enc_binder_pack_3 ENC_BINDER_PACK_3(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[30:39]),
			.shifted_hv								(shifted_hvs[30:39])
		);
	enc_binder_pack_4 ENC_BINDER_PACK_4(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[40:49]),
			.shifted_hv								(shifted_hvs[40:49])
		);
	enc_binder_pack_5 ENC_BINDER_PACK_5(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[50:59]),
			.shifted_hv								(shifted_hvs[50:59])
		);
	enc_binder_pack_6 ENC_BINDER_PACK_6(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[60:69]),
			.shifted_hv								(shifted_hvs[60:69])
		);
	enc_binder_pack_7 ENC_BINDER_PACK_7(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[70:79]),
			.shifted_hv								(shifted_hvs[70:79])
		);
	enc_binder_pack_8 ENC_BINDER_PACK_8(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[80:89]),
			.shifted_hv								(shifted_hvs[80:89])
		);
	enc_binder_pack_9 ENC_BINDER_PACK_9(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[90:99]),
			.shifted_hv								(shifted_hvs[90:99])
		);
	enc_binder_pack_10 ENC_BINDER_PACK_10(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[100:109]),
			.shifted_hv								(shifted_hvs[100:109])
		);
	enc_binder_pack_11 ENC_BINDER_PACK_11(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[110:119]),
			.shifted_hv								(shifted_hvs[110:119])
		);
	enc_binder_pack_12 ENC_BINDER_PACK_12(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[120:129]),
			.shifted_hv								(shifted_hvs[120:129])
		);
	enc_binder_pack_13 ENC_BINDER_PACK_13(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[130:139]),
			.shifted_hv								(shifted_hvs[130:139])
		);
	enc_binder_pack_14 ENC_BINDER_PACK_14(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[140:149]),
			.shifted_hv								(shifted_hvs[140:149])
		);
	enc_binder_pack_15 ENC_BINDER_PACK_15(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[150:159]),
			.shifted_hv								(shifted_hvs[150:159])
		);
	enc_binder_pack_16 ENC_BINDER_PACK_16(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[160:169]),
			.shifted_hv								(shifted_hvs[160:169])
		);
	enc_binder_pack_17 ENC_BINDER_PACK_17(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[170:179]),
			.shifted_hv								(shifted_hvs[170:179])
		);
	enc_binder_pack_18 ENC_BINDER_PACK_18(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[180:189]),
			.shifted_hv								(shifted_hvs[180:189])
		);
	enc_binder_pack_19 ENC_BINDER_PACK_19(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[190:199]),
			.shifted_hv								(shifted_hvs[190:199])
		);
	enc_binder_pack_20 ENC_BINDER_PACK_20(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[200:209]),
			.shifted_hv								(shifted_hvs[200:209])
		);
	enc_binder_pack_21 ENC_BINDER_PACK_21(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[210:219]),
			.shifted_hv								(shifted_hvs[210:219])
		);
	enc_binder_pack_22 ENC_BINDER_PACK_22(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[220:229]),
			.shifted_hv								(shifted_hvs[220:229])
		);
	enc_binder_pack_23 ENC_BINDER_PACK_23(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[230:239]),
			.shifted_hv								(shifted_hvs[230:239])
		);
	enc_binder_pack_24 ENC_BINDER_PACK_24(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[240:249]),
			.shifted_hv								(shifted_hvs[240:249])
		);
	enc_binder_pack_25 ENC_BINDER_PACK_25(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[250:259]),
			.shifted_hv								(shifted_hvs[250:259])
		);
	enc_binder_pack_26 ENC_BINDER_PACK_26(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[260:269]),
			.shifted_hv								(shifted_hvs[260:269])
		);
	enc_binder_pack_27 ENC_BINDER_PACK_27(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[270:279]),
			.shifted_hv								(shifted_hvs[270:279])
		);
	enc_binder_pack_28 ENC_BINDER_PACK_28(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[280:289]),
			.shifted_hv								(shifted_hvs[280:289])
		);
	enc_binder_pack_29 ENC_BINDER_PACK_29(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[290:299]),
			.shifted_hv								(shifted_hvs[290:299])
		);
	enc_binder_pack_30 ENC_BINDER_PACK_30(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[300:309]),
			.shifted_hv								(shifted_hvs[300:309])
		);
	enc_binder_pack_31 ENC_BINDER_PACK_31(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[310:319]),
			.shifted_hv								(shifted_hvs[310:319])
		);
	enc_binder_pack_32 ENC_BINDER_PACK_32(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[320:329]),
			.shifted_hv								(shifted_hvs[320:329])
		);
	enc_binder_pack_33 ENC_BINDER_PACK_33(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[330:339]),
			.shifted_hv								(shifted_hvs[330:339])
		);
	enc_binder_pack_34 ENC_BINDER_PACK_34(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[340:349]),
			.shifted_hv								(shifted_hvs[340:349])
		);
	enc_binder_pack_35 ENC_BINDER_PACK_35(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[350:359]),
			.shifted_hv								(shifted_hvs[350:359])
		);
	enc_binder_pack_36 ENC_BINDER_PACK_36(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[360:369]),
			.shifted_hv								(shifted_hvs[360:369])
		);
	enc_binder_pack_37 ENC_BINDER_PACK_37(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[370:379]),
			.shifted_hv								(shifted_hvs[370:379])
		);
	enc_binder_pack_38 ENC_BINDER_PACK_38(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[380:389]),
			.shifted_hv								(shifted_hvs[380:389])
		);
	enc_binder_pack_39 ENC_BINDER_PACK_39(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[390:399]),
			.shifted_hv								(shifted_hvs[390:399])
		);
	enc_binder_pack_40 ENC_BINDER_PACK_40(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[400:409]),
			.shifted_hv								(shifted_hvs[400:409])
		);
	enc_binder_pack_41 ENC_BINDER_PACK_41(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[410:419]),
			.shifted_hv								(shifted_hvs[410:419])
		);
	enc_binder_pack_42 ENC_BINDER_PACK_42(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[420:429]),
			.shifted_hv								(shifted_hvs[420:429])
		);
	enc_binder_pack_43 ENC_BINDER_PACK_43(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[430:439]),
			.shifted_hv								(shifted_hvs[430:439])
		);
	enc_binder_pack_44 ENC_BINDER_PACK_44(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[440:449]),
			.shifted_hv								(shifted_hvs[440:449])
		);
	enc_binder_pack_45 ENC_BINDER_PACK_45(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[450:459]),
			.shifted_hv								(shifted_hvs[450:459])
		);
	enc_binder_pack_46 ENC_BINDER_PACK_46(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[460:469]),
			.shifted_hv								(shifted_hvs[460:469])
		);
	enc_binder_pack_47 ENC_BINDER_PACK_47(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[470:479]),
			.shifted_hv								(shifted_hvs[470:479])
		);
	enc_binder_pack_48 ENC_BINDER_PACK_48(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[480:489]),
			.shifted_hv								(shifted_hvs[480:489])
		);
	enc_binder_pack_49 ENC_BINDER_PACK_49(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[490:499]),
			.shifted_hv								(shifted_hvs[490:499])
		);
	enc_binder_pack_50 ENC_BINDER_PACK_50(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[500:509]),
			.shifted_hv								(shifted_hvs[500:509])
		);
	enc_binder_pack_51 ENC_BINDER_PACK_51(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[510:519]),
			.shifted_hv								(shifted_hvs[510:519])
		);
	enc_binder_pack_52 ENC_BINDER_PACK_52(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[520:529]),
			.shifted_hv								(shifted_hvs[520:529])
		);
	enc_binder_pack_53 ENC_BINDER_PACK_53(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[530:539]),
			.shifted_hv								(shifted_hvs[530:539])
		);
	enc_binder_pack_54 ENC_BINDER_PACK_54(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[540:549]),
			.shifted_hv								(shifted_hvs[540:549])
		);
	enc_binder_pack_55 ENC_BINDER_PACK_55(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[550:559]),
			.shifted_hv								(shifted_hvs[550:559])
		);
	enc_binder_pack_56 ENC_BINDER_PACK_56(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[560:569]),
			.shifted_hv								(shifted_hvs[560:569])
		);
	enc_binder_pack_57 ENC_BINDER_PACK_57(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[570:579]),
			.shifted_hv								(shifted_hvs[570:579])
		);
	enc_binder_pack_58 ENC_BINDER_PACK_58(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[580:589]),
			.shifted_hv								(shifted_hvs[580:589])
		);
	enc_binder_pack_59 ENC_BINDER_PACK_59(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[590:599]),
			.shifted_hv								(shifted_hvs[590:599])
		);
	enc_binder_pack_60 ENC_BINDER_PACK_60(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[600:609]),
			.shifted_hv								(shifted_hvs[600:609])
		);
	enc_binder_pack_61 ENC_BINDER_PACK_61(
			.clk									(clk),
			.nrst									(nrst),
			.start_encoding							(start_encoding),
			.level_hv								(level_hvs[610:616]),
			.shifted_hv								(shifted_hvs[610:616])
		);


	// Nets (this just packs the dimensions of shifted_hvs)
	for (genvar j = 0; j < HV_DIM; j++) 
		begin: nets
			enc_nets ENC_NETS (
				.hv_bits_per_dim				({
												shifted_hvs[0][j], shifted_hvs[1][j],shifted_hvs[2][j], shifted_hvs[3][j], shifted_hvs[4][j],
												shifted_hvs[5][j], shifted_hvs[6][j],shifted_hvs[7][j], shifted_hvs[8][j], shifted_hvs[9][j],
												shifted_hvs[10][j], shifted_hvs[11][j],shifted_hvs[12][j], shifted_hvs[13][j], shifted_hvs[14][j],
												shifted_hvs[15][j], shifted_hvs[16][j],shifted_hvs[17][j], shifted_hvs[18][j], shifted_hvs[19][j],
												shifted_hvs[20][j], shifted_hvs[21][j],shifted_hvs[22][j], shifted_hvs[23][j], shifted_hvs[24][j],
												shifted_hvs[25][j], shifted_hvs[26][j],shifted_hvs[27][j], shifted_hvs[28][j], shifted_hvs[29][j],
												shifted_hvs[30][j], shifted_hvs[31][j],shifted_hvs[32][j], shifted_hvs[33][j], shifted_hvs[34][j],
												shifted_hvs[35][j], shifted_hvs[36][j],shifted_hvs[37][j], shifted_hvs[38][j], shifted_hvs[39][j],
												shifted_hvs[40][j], shifted_hvs[41][j],shifted_hvs[42][j], shifted_hvs[43][j], shifted_hvs[44][j],
												shifted_hvs[45][j], shifted_hvs[46][j],shifted_hvs[47][j], shifted_hvs[48][j], shifted_hvs[49][j],
												shifted_hvs[50][j], shifted_hvs[51][j],shifted_hvs[52][j], shifted_hvs[53][j], shifted_hvs[54][j],
												shifted_hvs[55][j], shifted_hvs[56][j],shifted_hvs[57][j], shifted_hvs[58][j], shifted_hvs[59][j],
												shifted_hvs[60][j], shifted_hvs[61][j],shifted_hvs[62][j], shifted_hvs[63][j], shifted_hvs[64][j],
												shifted_hvs[65][j], shifted_hvs[66][j],shifted_hvs[67][j], shifted_hvs[68][j], shifted_hvs[69][j],
												shifted_hvs[70][j], shifted_hvs[71][j],shifted_hvs[72][j], shifted_hvs[73][j], shifted_hvs[74][j],
												shifted_hvs[75][j], shifted_hvs[76][j],shifted_hvs[77][j], shifted_hvs[78][j], shifted_hvs[79][j],
												shifted_hvs[80][j], shifted_hvs[81][j],shifted_hvs[82][j], shifted_hvs[83][j], shifted_hvs[84][j],
												shifted_hvs[85][j], shifted_hvs[86][j],shifted_hvs[87][j], shifted_hvs[88][j], shifted_hvs[89][j],
												shifted_hvs[90][j], shifted_hvs[91][j],shifted_hvs[92][j], shifted_hvs[93][j], shifted_hvs[94][j],
												shifted_hvs[95][j], shifted_hvs[96][j],shifted_hvs[97][j], shifted_hvs[98][j], shifted_hvs[99][j],
												shifted_hvs[100][j], shifted_hvs[101][j],shifted_hvs[102][j], shifted_hvs[103][j], shifted_hvs[104][j],
												shifted_hvs[105][j], shifted_hvs[106][j],shifted_hvs[107][j], shifted_hvs[108][j], shifted_hvs[109][j],
												shifted_hvs[110][j], shifted_hvs[111][j],shifted_hvs[112][j], shifted_hvs[113][j], shifted_hvs[114][j],
												shifted_hvs[115][j], shifted_hvs[116][j],shifted_hvs[117][j], shifted_hvs[118][j], shifted_hvs[119][j],
												shifted_hvs[120][j], shifted_hvs[121][j],shifted_hvs[122][j], shifted_hvs[123][j], shifted_hvs[124][j],
												shifted_hvs[125][j], shifted_hvs[126][j],shifted_hvs[127][j], shifted_hvs[128][j], shifted_hvs[129][j],
												shifted_hvs[130][j], shifted_hvs[131][j],shifted_hvs[132][j], shifted_hvs[133][j], shifted_hvs[134][j],
												shifted_hvs[135][j], shifted_hvs[136][j],shifted_hvs[137][j], shifted_hvs[138][j], shifted_hvs[139][j],
												shifted_hvs[140][j], shifted_hvs[141][j],shifted_hvs[142][j], shifted_hvs[143][j], shifted_hvs[144][j],
												shifted_hvs[145][j], shifted_hvs[146][j],shifted_hvs[147][j], shifted_hvs[148][j], shifted_hvs[149][j],
												shifted_hvs[150][j], shifted_hvs[151][j],shifted_hvs[152][j], shifted_hvs[153][j], shifted_hvs[154][j],
												shifted_hvs[155][j], shifted_hvs[156][j],shifted_hvs[157][j], shifted_hvs[158][j], shifted_hvs[159][j],
												shifted_hvs[160][j], shifted_hvs[161][j],shifted_hvs[162][j], shifted_hvs[163][j], shifted_hvs[164][j],
												shifted_hvs[165][j], shifted_hvs[166][j],shifted_hvs[167][j], shifted_hvs[168][j], shifted_hvs[169][j],
												shifted_hvs[170][j], shifted_hvs[171][j],shifted_hvs[172][j], shifted_hvs[173][j], shifted_hvs[174][j],
												shifted_hvs[175][j], shifted_hvs[176][j],shifted_hvs[177][j], shifted_hvs[178][j], shifted_hvs[179][j],
												shifted_hvs[180][j], shifted_hvs[181][j],shifted_hvs[182][j], shifted_hvs[183][j], shifted_hvs[184][j],
												shifted_hvs[185][j], shifted_hvs[186][j],shifted_hvs[187][j], shifted_hvs[188][j], shifted_hvs[189][j],
												shifted_hvs[190][j], shifted_hvs[191][j],shifted_hvs[192][j], shifted_hvs[193][j], shifted_hvs[194][j],
												shifted_hvs[195][j], shifted_hvs[196][j],shifted_hvs[197][j], shifted_hvs[198][j], shifted_hvs[199][j],
												shifted_hvs[200][j], shifted_hvs[201][j],shifted_hvs[202][j], shifted_hvs[203][j], shifted_hvs[204][j],
												shifted_hvs[205][j], shifted_hvs[206][j],shifted_hvs[207][j], shifted_hvs[208][j], shifted_hvs[209][j],
												shifted_hvs[210][j], shifted_hvs[211][j],shifted_hvs[212][j], shifted_hvs[213][j], shifted_hvs[214][j],
												shifted_hvs[215][j], shifted_hvs[216][j],shifted_hvs[217][j], shifted_hvs[218][j], shifted_hvs[219][j],
												shifted_hvs[220][j], shifted_hvs[221][j],shifted_hvs[222][j], shifted_hvs[223][j], shifted_hvs[224][j],
												shifted_hvs[225][j], shifted_hvs[226][j],shifted_hvs[227][j], shifted_hvs[228][j], shifted_hvs[229][j],
												shifted_hvs[230][j], shifted_hvs[231][j],shifted_hvs[232][j], shifted_hvs[233][j], shifted_hvs[234][j],
												shifted_hvs[235][j], shifted_hvs[236][j],shifted_hvs[237][j], shifted_hvs[238][j], shifted_hvs[239][j],
												shifted_hvs[240][j], shifted_hvs[241][j],shifted_hvs[242][j], shifted_hvs[243][j], shifted_hvs[244][j],
												shifted_hvs[245][j], shifted_hvs[246][j],shifted_hvs[247][j], shifted_hvs[248][j], shifted_hvs[249][j],
												shifted_hvs[250][j], shifted_hvs[251][j],shifted_hvs[252][j], shifted_hvs[253][j], shifted_hvs[254][j],
												shifted_hvs[255][j], shifted_hvs[256][j],shifted_hvs[257][j], shifted_hvs[258][j], shifted_hvs[259][j],
												shifted_hvs[260][j], shifted_hvs[261][j],shifted_hvs[262][j], shifted_hvs[263][j], shifted_hvs[264][j],
												shifted_hvs[265][j], shifted_hvs[266][j],shifted_hvs[267][j], shifted_hvs[268][j], shifted_hvs[269][j],
												shifted_hvs[270][j], shifted_hvs[271][j],shifted_hvs[272][j], shifted_hvs[273][j], shifted_hvs[274][j],
												shifted_hvs[275][j], shifted_hvs[276][j],shifted_hvs[277][j], shifted_hvs[278][j], shifted_hvs[279][j],
												shifted_hvs[280][j], shifted_hvs[281][j],shifted_hvs[282][j], shifted_hvs[283][j], shifted_hvs[284][j],
												shifted_hvs[285][j], shifted_hvs[286][j],shifted_hvs[287][j], shifted_hvs[288][j], shifted_hvs[289][j],
												shifted_hvs[290][j], shifted_hvs[291][j],shifted_hvs[292][j], shifted_hvs[293][j], shifted_hvs[294][j],
												shifted_hvs[295][j], shifted_hvs[296][j],shifted_hvs[297][j], shifted_hvs[298][j], shifted_hvs[299][j],
												shifted_hvs[300][j], shifted_hvs[301][j],shifted_hvs[302][j], shifted_hvs[303][j], shifted_hvs[304][j],
												shifted_hvs[305][j], shifted_hvs[306][j],shifted_hvs[307][j], shifted_hvs[308][j], shifted_hvs[309][j],
												shifted_hvs[310][j], shifted_hvs[311][j],shifted_hvs[312][j], shifted_hvs[313][j], shifted_hvs[314][j],
												shifted_hvs[315][j], shifted_hvs[316][j],shifted_hvs[317][j], shifted_hvs[318][j], shifted_hvs[319][j],
												shifted_hvs[320][j], shifted_hvs[321][j],shifted_hvs[322][j], shifted_hvs[323][j], shifted_hvs[324][j],
												shifted_hvs[325][j], shifted_hvs[326][j],shifted_hvs[327][j], shifted_hvs[328][j], shifted_hvs[329][j],
												shifted_hvs[330][j], shifted_hvs[331][j],shifted_hvs[332][j], shifted_hvs[333][j], shifted_hvs[334][j],
												shifted_hvs[335][j], shifted_hvs[336][j],shifted_hvs[337][j], shifted_hvs[338][j], shifted_hvs[339][j],
												shifted_hvs[340][j], shifted_hvs[341][j],shifted_hvs[342][j], shifted_hvs[343][j], shifted_hvs[344][j],
												shifted_hvs[345][j], shifted_hvs[346][j],shifted_hvs[347][j], shifted_hvs[348][j], shifted_hvs[349][j],
												shifted_hvs[350][j], shifted_hvs[351][j],shifted_hvs[352][j], shifted_hvs[353][j], shifted_hvs[354][j],
												shifted_hvs[355][j], shifted_hvs[356][j],shifted_hvs[357][j], shifted_hvs[358][j], shifted_hvs[359][j],
												shifted_hvs[360][j], shifted_hvs[361][j],shifted_hvs[362][j], shifted_hvs[363][j], shifted_hvs[364][j],
												shifted_hvs[365][j], shifted_hvs[366][j],shifted_hvs[367][j], shifted_hvs[368][j], shifted_hvs[369][j],
												shifted_hvs[370][j], shifted_hvs[371][j],shifted_hvs[372][j], shifted_hvs[373][j], shifted_hvs[374][j],
												shifted_hvs[375][j], shifted_hvs[376][j],shifted_hvs[377][j], shifted_hvs[378][j], shifted_hvs[379][j],
												shifted_hvs[380][j], shifted_hvs[381][j],shifted_hvs[382][j], shifted_hvs[383][j], shifted_hvs[384][j],
												shifted_hvs[385][j], shifted_hvs[386][j],shifted_hvs[387][j], shifted_hvs[388][j], shifted_hvs[389][j],
												shifted_hvs[390][j], shifted_hvs[391][j],shifted_hvs[392][j], shifted_hvs[393][j], shifted_hvs[394][j],
												shifted_hvs[395][j], shifted_hvs[396][j],shifted_hvs[397][j], shifted_hvs[398][j], shifted_hvs[399][j],
												shifted_hvs[400][j], shifted_hvs[401][j],shifted_hvs[402][j], shifted_hvs[403][j], shifted_hvs[404][j],
												shifted_hvs[405][j], shifted_hvs[406][j],shifted_hvs[407][j], shifted_hvs[408][j], shifted_hvs[409][j],
												shifted_hvs[410][j], shifted_hvs[411][j],shifted_hvs[412][j], shifted_hvs[413][j], shifted_hvs[414][j],
												shifted_hvs[415][j], shifted_hvs[416][j],shifted_hvs[417][j], shifted_hvs[418][j], shifted_hvs[419][j],
												shifted_hvs[420][j], shifted_hvs[421][j],shifted_hvs[422][j], shifted_hvs[423][j], shifted_hvs[424][j],
												shifted_hvs[425][j], shifted_hvs[426][j],shifted_hvs[427][j], shifted_hvs[428][j], shifted_hvs[429][j],
												shifted_hvs[430][j], shifted_hvs[431][j],shifted_hvs[432][j], shifted_hvs[433][j], shifted_hvs[434][j],
												shifted_hvs[435][j], shifted_hvs[436][j],shifted_hvs[437][j], shifted_hvs[438][j], shifted_hvs[439][j],
												shifted_hvs[440][j], shifted_hvs[441][j],shifted_hvs[442][j], shifted_hvs[443][j], shifted_hvs[444][j],
												shifted_hvs[445][j], shifted_hvs[446][j],shifted_hvs[447][j], shifted_hvs[448][j], shifted_hvs[449][j],
												shifted_hvs[450][j], shifted_hvs[451][j],shifted_hvs[452][j], shifted_hvs[453][j], shifted_hvs[454][j],
												shifted_hvs[455][j], shifted_hvs[456][j],shifted_hvs[457][j], shifted_hvs[458][j], shifted_hvs[459][j],
												shifted_hvs[460][j], shifted_hvs[461][j],shifted_hvs[462][j], shifted_hvs[463][j], shifted_hvs[464][j],
												shifted_hvs[465][j], shifted_hvs[466][j],shifted_hvs[467][j], shifted_hvs[468][j], shifted_hvs[469][j],
												shifted_hvs[470][j], shifted_hvs[471][j],shifted_hvs[472][j], shifted_hvs[473][j], shifted_hvs[474][j],
												shifted_hvs[475][j], shifted_hvs[476][j],shifted_hvs[477][j], shifted_hvs[478][j], shifted_hvs[479][j],
												shifted_hvs[480][j], shifted_hvs[481][j],shifted_hvs[482][j], shifted_hvs[483][j], shifted_hvs[484][j],
												shifted_hvs[485][j], shifted_hvs[486][j],shifted_hvs[487][j], shifted_hvs[488][j], shifted_hvs[489][j],
												shifted_hvs[490][j], shifted_hvs[491][j],shifted_hvs[492][j], shifted_hvs[493][j], shifted_hvs[494][j],
												shifted_hvs[495][j], shifted_hvs[496][j],shifted_hvs[497][j], shifted_hvs[498][j], shifted_hvs[499][j],
												shifted_hvs[500][j], shifted_hvs[501][j],shifted_hvs[502][j], shifted_hvs[503][j], shifted_hvs[504][j],
												shifted_hvs[505][j], shifted_hvs[506][j],shifted_hvs[507][j], shifted_hvs[508][j], shifted_hvs[509][j],
												shifted_hvs[510][j], shifted_hvs[511][j],shifted_hvs[512][j], shifted_hvs[513][j], shifted_hvs[514][j],
												shifted_hvs[515][j], shifted_hvs[516][j],shifted_hvs[517][j], shifted_hvs[518][j], shifted_hvs[519][j],
												shifted_hvs[520][j], shifted_hvs[521][j],shifted_hvs[522][j], shifted_hvs[523][j], shifted_hvs[524][j],
												shifted_hvs[525][j], shifted_hvs[526][j],shifted_hvs[527][j], shifted_hvs[528][j], shifted_hvs[529][j],
												shifted_hvs[530][j], shifted_hvs[531][j],shifted_hvs[532][j], shifted_hvs[533][j], shifted_hvs[534][j],
												shifted_hvs[535][j], shifted_hvs[536][j],shifted_hvs[537][j], shifted_hvs[538][j], shifted_hvs[539][j],
												shifted_hvs[540][j], shifted_hvs[541][j],shifted_hvs[542][j], shifted_hvs[543][j], shifted_hvs[544][j],
												shifted_hvs[545][j], shifted_hvs[546][j],shifted_hvs[547][j], shifted_hvs[548][j], shifted_hvs[549][j],
												shifted_hvs[550][j], shifted_hvs[551][j],shifted_hvs[552][j], shifted_hvs[553][j], shifted_hvs[554][j],
												shifted_hvs[555][j], shifted_hvs[556][j],shifted_hvs[557][j], shifted_hvs[558][j], shifted_hvs[559][j],
												shifted_hvs[560][j], shifted_hvs[561][j],shifted_hvs[562][j], shifted_hvs[563][j], shifted_hvs[564][j],
												shifted_hvs[565][j], shifted_hvs[566][j],shifted_hvs[567][j], shifted_hvs[568][j], shifted_hvs[569][j],
												shifted_hvs[570][j], shifted_hvs[571][j],shifted_hvs[572][j], shifted_hvs[573][j], shifted_hvs[574][j],
												shifted_hvs[575][j], shifted_hvs[576][j],shifted_hvs[577][j], shifted_hvs[578][j], shifted_hvs[579][j],
												shifted_hvs[580][j], shifted_hvs[581][j],shifted_hvs[582][j], shifted_hvs[583][j], shifted_hvs[584][j],
												shifted_hvs[585][j], shifted_hvs[586][j],shifted_hvs[587][j], shifted_hvs[588][j], shifted_hvs[589][j],
												shifted_hvs[590][j], shifted_hvs[591][j],shifted_hvs[592][j], shifted_hvs[593][j], shifted_hvs[594][j],
												shifted_hvs[595][j], shifted_hvs[596][j],shifted_hvs[597][j], shifted_hvs[598][j], shifted_hvs[599][j],
												shifted_hvs[600][j], shifted_hvs[601][j],shifted_hvs[602][j], shifted_hvs[603][j], shifted_hvs[604][j],
												shifted_hvs[605][j], shifted_hvs[606][j],shifted_hvs[607][j], shifted_hvs[608][j], shifted_hvs[609][j],
												shifted_hvs[610][j], shifted_hvs[611][j],shifted_hvs[612][j], shifted_hvs[613][j], shifted_hvs[614][j],
												shifted_hvs[615][j], shifted_hvs[616][j]    
												}),
				.bits_to_bundle					(bits_to_bundle_arr[j])
			);
    	end


	// Input MUX for bundlers
	for (genvar k = 0; k < DIMS_PER_CC; k++) 
		begin : enc_mux_ins
			enc_mux_in ENC_MUX_IN(
				.ctr							(ctr),
				.mux_in							('{bits_to_bundle_arr[k], bits_to_bundle_arr[k+500], bits_to_bundle_arr[k+1000],bits_to_bundle_arr[k+1500],
												bits_to_bundle_arr[k+2000], bits_to_bundle_arr[k+2500], bits_to_bundle_arr[k+3000],bits_to_bundle_arr[k+3500],
												bits_to_bundle_arr[k+4000], bits_to_bundle_arr[k+4500]}),
				.mux_out					    (mux_out[k])
			);
		end 
           
    // DIMS_PER_CC=500 bundlers   
    for (genvar i = 0; i < DIMS_PER_CC; i++) 
    	begin : bundlers
			enc_bundler ENC_BUNDLER(
			   .bundling_features				(bundling_features),
			   .bits_to_bundle					(mux_out[i]), 
			   .thresholded_bit					(thresholded_bits[i])
			); 
    	end
    
    // Encoding Output Reg (contains the encoded hv)
	enc_reg_out ENC_OUT_REG_0(
		.clk									(clk),
		.nrst									(nrst),
		.bundling_features						(bundling_features),
		.ctr									(ctr),
		.thresholded_bits						(thresholded_bits),
		.encoded_hv								(encoded_hv)
	);
              
endmodule