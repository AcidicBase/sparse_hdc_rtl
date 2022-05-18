module encoding_top_rework(
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
        .ctr(ctr),
		.bundling_features						(bundling_features),
        .encoding_done							(encoding_done)
    );  
         
    // FEATURE_COUNT=617 binders

	/* old binder instantiation
    for (genvar i = 0; i < FEATURE_COUNT; i++) 
		begin : binders
			enc_binder #(.SHIFT(SHIFTS[i]))
			ENC_BINDER(
			    .clk							(clk),
			    .nrst							(nrst),
			    .start_binding					(start_encoding && en),
			    .level_hv						(level_hvs[i]),
			    .shifted_hv						(shifted_hvs[i])
			);
    	end   
	*/
	
	//New binder instantiation
	enc_binder_pack_0 ENC_BINDER_PACK_0(
				.clk							(clk),
			    .nrst							(nrst),
			    .start_binding					(start_encoding),
				.en								(en),
			    .level_hv						(level_hvs[0:61]),
			    .shifted_hv						(shifted_hvs[0:61])
			);
			
	enc_binder_pack_1 ENC_BINDER_PACK_1(
				.clk							(clk),
			    .nrst							(nrst),
			    .start_binding					(start_encoding),
				.en								(en),
			    .level_hv						(level_hvs[62:123]),
			    .shifted_hv						(shifted_hvs[62:123])
			);
			
	enc_binder_pack_2 ENC_BINDER_PACK_2(
				.clk							(clk),
			    .nrst							(nrst),
			    .start_binding					(start_encoding),
				.en								(en),
			    .level_hv						(level_hvs[124:185]),
			    .shifted_hv						(shifted_hvs[124:185])
			);
	
	enc_binder_pack_3 ENC_BINDER_PACK_3(
				.clk							(clk),
			    .nrst							(nrst),
			    .start_binding					(start_encoding),
				.en								(en),
			    .level_hv						(level_hvs[186:247]),
			    .shifted_hv						(shifted_hvs[186:247])
			);
	
	enc_binder_pack_4 ENC_BINDER_PACK_4(
				.clk							(clk),
			    .nrst							(nrst),
			    .start_binding					(start_encoding),
				.en								(en),
			    .level_hv						(level_hvs[248:309]),
			    .shifted_hv						(shifted_hvs[248:309])
			);
	
	enc_binder_pack_5 ENC_BINDER_PACK_5(
				.clk							(clk),
			    .nrst							(nrst),
			    .start_binding					(start_encoding),
				.en								(en),
			    .level_hv						(level_hvs[310:371]),
			    .shifted_hv						(shifted_hvs[310:371])
			);	
	enc_binder_pack_6 ENC_BINDER_PACK_6(
				.clk							(clk),
			    .nrst							(nrst),
			    .start_binding					(start_encoding),
				.en								(en),
			    .level_hv						(level_hvs[372:433]),
			    .shifted_hv						(shifted_hvs[372:433])
			);
			
	enc_binder_pack_7 ENC_BINDER_PACK_7(
				.clk							(clk),
			    .nrst							(nrst),
			    .start_binding					(start_encoding),
				.en								(en),
			    .level_hv						(level_hvs[434:495]),
			    .shifted_hv						(shifted_hvs[434:495])
			);
			
	enc_binder_pack_8 ENC_BINDER_PACK_8(
				.clk							(clk),
			    .nrst							(nrst),
			    .start_binding					(start_encoding),
				.en								(en),
			    .level_hv						(level_hvs[496:557]),
			    .shifted_hv						(shifted_hvs[496:557])
			);
			
	enc_binder_pack_9 ENC_BINDER_PACK_9(
				.clk							(clk),
			    .nrst							(nrst),
			    .start_binding					(start_encoding),
				.en								(en),
			    .level_hv						(level_hvs[558:616]),
			    .shifted_hv						(shifted_hvs[558:616])
			);
	
	// Nets (for bundler input assignment)
	
	//old Nets
	/*
	enc_nets ENC_NETS_0(
		.shifted_hvs							(shifted_hvs),
		.bits_to_bundle_arr						(bits_to_bundle_arr)
	);
	*/
	
	//New Nets
	for (genvar k = 0; k < HV_DIM; k++) 
    	begin : nets
			enc_nets_rework ENC_NETS(
			   .shifted_hvs						({shifted_hvs[0][k], shifted_hvs[1][k],shifted_hvs[2][k], shifted_hvs[3][k], shifted_hvs[4][k],
												shifted_hvs[5][k], shifted_hvs[6][k],shifted_hvs[7][k], shifted_hvs[8][k], shifted_hvs[9][k],
												shifted_hvs[10][k], shifted_hvs[11][k],shifted_hvs[12][k], shifted_hvs[13][k], shifted_hvs[14][k],
												shifted_hvs[15][k], shifted_hvs[16][k],shifted_hvs[17][k], shifted_hvs[18][k], shifted_hvs[19][k],
												shifted_hvs[20][k], shifted_hvs[21][k],shifted_hvs[22][k], shifted_hvs[23][k], shifted_hvs[24][k],
												shifted_hvs[25][k], shifted_hvs[26][k],shifted_hvs[27][k], shifted_hvs[28][k], shifted_hvs[29][k],
												shifted_hvs[30][k], shifted_hvs[31][k],shifted_hvs[32][k], shifted_hvs[33][k], shifted_hvs[34][k],
												shifted_hvs[35][k], shifted_hvs[36][k],shifted_hvs[37][k], shifted_hvs[38][k], shifted_hvs[39][k],
												shifted_hvs[40][k], shifted_hvs[41][k],shifted_hvs[42][k], shifted_hvs[43][k], shifted_hvs[44][k],
												shifted_hvs[45][k], shifted_hvs[46][k],shifted_hvs[47][k], shifted_hvs[48][k], shifted_hvs[49][k],
												shifted_hvs[50][k], shifted_hvs[51][k],shifted_hvs[52][k], shifted_hvs[53][k], shifted_hvs[54][k],
												shifted_hvs[55][k], shifted_hvs[56][k],shifted_hvs[57][k], shifted_hvs[58][k], shifted_hvs[59][k],
												shifted_hvs[60][k], shifted_hvs[61][k],shifted_hvs[62][k], shifted_hvs[63][k], shifted_hvs[64][k],
												shifted_hvs[65][k], shifted_hvs[66][k],shifted_hvs[67][k], shifted_hvs[68][k], shifted_hvs[69][k],
												shifted_hvs[70][k], shifted_hvs[71][k],shifted_hvs[72][k], shifted_hvs[73][k], shifted_hvs[74][k],
												shifted_hvs[75][k], shifted_hvs[76][k],shifted_hvs[77][k], shifted_hvs[78][k], shifted_hvs[79][k],
												shifted_hvs[80][k], shifted_hvs[81][k],shifted_hvs[82][k], shifted_hvs[83][k], shifted_hvs[84][k],
												shifted_hvs[85][k], shifted_hvs[86][k],shifted_hvs[87][k], shifted_hvs[88][k], shifted_hvs[89][k],
												shifted_hvs[90][k], shifted_hvs[91][k],shifted_hvs[92][k], shifted_hvs[93][k], shifted_hvs[94][k],
												shifted_hvs[95][k], shifted_hvs[96][k],shifted_hvs[97][k], shifted_hvs[98][k], shifted_hvs[99][k],
												shifted_hvs[100][k], shifted_hvs[101][k],shifted_hvs[102][k], shifted_hvs[103][k], shifted_hvs[104][k],
												shifted_hvs[105][k], shifted_hvs[106][k],shifted_hvs[107][k], shifted_hvs[108][k], shifted_hvs[109][k],
												shifted_hvs[110][k], shifted_hvs[111][k],shifted_hvs[112][k], shifted_hvs[113][k], shifted_hvs[114][k],
												shifted_hvs[115][k], shifted_hvs[116][k],shifted_hvs[117][k], shifted_hvs[118][k], shifted_hvs[119][k],
												shifted_hvs[120][k], shifted_hvs[121][k],shifted_hvs[122][k], shifted_hvs[123][k], shifted_hvs[124][k],
												shifted_hvs[125][k], shifted_hvs[126][k],shifted_hvs[127][k], shifted_hvs[128][k], shifted_hvs[129][k],
												shifted_hvs[130][k], shifted_hvs[131][k],shifted_hvs[132][k], shifted_hvs[133][k], shifted_hvs[134][k],
												shifted_hvs[135][k], shifted_hvs[136][k],shifted_hvs[137][k], shifted_hvs[138][k], shifted_hvs[139][k],
												shifted_hvs[140][k], shifted_hvs[141][k],shifted_hvs[142][k], shifted_hvs[143][k], shifted_hvs[144][k],
												shifted_hvs[145][k], shifted_hvs[146][k],shifted_hvs[147][k], shifted_hvs[148][k], shifted_hvs[149][k],
												shifted_hvs[150][k], shifted_hvs[151][k],shifted_hvs[152][k], shifted_hvs[153][k], shifted_hvs[154][k],
												shifted_hvs[155][k], shifted_hvs[156][k],shifted_hvs[157][k], shifted_hvs[158][k], shifted_hvs[159][k],
												shifted_hvs[160][k], shifted_hvs[161][k],shifted_hvs[162][k], shifted_hvs[163][k], shifted_hvs[164][k],
												shifted_hvs[165][k], shifted_hvs[166][k],shifted_hvs[167][k], shifted_hvs[168][k], shifted_hvs[169][k],
												shifted_hvs[170][k], shifted_hvs[171][k],shifted_hvs[172][k], shifted_hvs[173][k], shifted_hvs[174][k],
												shifted_hvs[175][k], shifted_hvs[176][k],shifted_hvs[177][k], shifted_hvs[178][k], shifted_hvs[179][k],
												shifted_hvs[180][k], shifted_hvs[181][k],shifted_hvs[182][k], shifted_hvs[183][k], shifted_hvs[184][k],
												shifted_hvs[185][k], shifted_hvs[186][k],shifted_hvs[187][k], shifted_hvs[188][k], shifted_hvs[189][k],
												shifted_hvs[190][k], shifted_hvs[191][k],shifted_hvs[192][k], shifted_hvs[193][k], shifted_hvs[194][k],
												shifted_hvs[195][k], shifted_hvs[196][k],shifted_hvs[197][k], shifted_hvs[198][k], shifted_hvs[199][k],
												shifted_hvs[200][k], shifted_hvs[201][k],shifted_hvs[202][k], shifted_hvs[203][k], shifted_hvs[204][k],
												shifted_hvs[205][k], shifted_hvs[206][k],shifted_hvs[207][k], shifted_hvs[208][k], shifted_hvs[209][k],
												shifted_hvs[210][k], shifted_hvs[211][k],shifted_hvs[212][k], shifted_hvs[213][k], shifted_hvs[214][k],
												shifted_hvs[215][k], shifted_hvs[216][k],shifted_hvs[217][k], shifted_hvs[218][k], shifted_hvs[219][k],
												shifted_hvs[220][k], shifted_hvs[221][k],shifted_hvs[222][k], shifted_hvs[223][k], shifted_hvs[224][k],
												shifted_hvs[225][k], shifted_hvs[226][k],shifted_hvs[227][k], shifted_hvs[228][k], shifted_hvs[229][k],
												shifted_hvs[230][k], shifted_hvs[231][k],shifted_hvs[232][k], shifted_hvs[233][k], shifted_hvs[234][k],
												shifted_hvs[235][k], shifted_hvs[236][k],shifted_hvs[237][k], shifted_hvs[238][k], shifted_hvs[239][k],
												shifted_hvs[240][k], shifted_hvs[241][k],shifted_hvs[242][k], shifted_hvs[243][k], shifted_hvs[244][k],
												shifted_hvs[245][k], shifted_hvs[246][k],shifted_hvs[247][k], shifted_hvs[248][k], shifted_hvs[249][k],
												shifted_hvs[250][k], shifted_hvs[251][k],shifted_hvs[252][k], shifted_hvs[253][k], shifted_hvs[254][k],
												shifted_hvs[255][k], shifted_hvs[256][k],shifted_hvs[257][k], shifted_hvs[258][k], shifted_hvs[259][k],
												shifted_hvs[260][k], shifted_hvs[261][k],shifted_hvs[262][k], shifted_hvs[263][k], shifted_hvs[264][k],
												shifted_hvs[265][k], shifted_hvs[266][k],shifted_hvs[267][k], shifted_hvs[268][k], shifted_hvs[269][k],
												shifted_hvs[270][k], shifted_hvs[271][k],shifted_hvs[272][k], shifted_hvs[273][k], shifted_hvs[274][k],
												shifted_hvs[275][k], shifted_hvs[276][k],shifted_hvs[277][k], shifted_hvs[278][k], shifted_hvs[279][k],
												shifted_hvs[280][k], shifted_hvs[281][k],shifted_hvs[282][k], shifted_hvs[283][k], shifted_hvs[284][k],
												shifted_hvs[285][k], shifted_hvs[286][k],shifted_hvs[287][k], shifted_hvs[288][k], shifted_hvs[289][k],
												shifted_hvs[290][k], shifted_hvs[291][k],shifted_hvs[292][k], shifted_hvs[293][k], shifted_hvs[294][k],
												shifted_hvs[295][k], shifted_hvs[296][k],shifted_hvs[297][k], shifted_hvs[298][k], shifted_hvs[299][k],
												shifted_hvs[300][k], shifted_hvs[301][k],shifted_hvs[302][k], shifted_hvs[303][k], shifted_hvs[304][k],
												shifted_hvs[305][k], shifted_hvs[306][k],shifted_hvs[307][k], shifted_hvs[308][k], shifted_hvs[309][k],
												shifted_hvs[310][k], shifted_hvs[311][k],shifted_hvs[312][k], shifted_hvs[313][k], shifted_hvs[314][k],
												shifted_hvs[315][k], shifted_hvs[316][k],shifted_hvs[317][k], shifted_hvs[318][k], shifted_hvs[319][k],
												shifted_hvs[320][k], shifted_hvs[321][k],shifted_hvs[322][k], shifted_hvs[323][k], shifted_hvs[324][k],
												shifted_hvs[325][k], shifted_hvs[326][k],shifted_hvs[327][k], shifted_hvs[328][k], shifted_hvs[329][k],
												shifted_hvs[330][k], shifted_hvs[331][k],shifted_hvs[332][k], shifted_hvs[333][k], shifted_hvs[334][k],
												shifted_hvs[335][k], shifted_hvs[336][k],shifted_hvs[337][k], shifted_hvs[338][k], shifted_hvs[339][k],
												shifted_hvs[340][k], shifted_hvs[341][k],shifted_hvs[342][k], shifted_hvs[343][k], shifted_hvs[344][k],
												shifted_hvs[345][k], shifted_hvs[346][k],shifted_hvs[347][k], shifted_hvs[348][k], shifted_hvs[349][k],
												shifted_hvs[350][k], shifted_hvs[351][k],shifted_hvs[352][k], shifted_hvs[353][k], shifted_hvs[354][k],
												shifted_hvs[355][k], shifted_hvs[356][k],shifted_hvs[357][k], shifted_hvs[358][k], shifted_hvs[359][k],
												shifted_hvs[360][k], shifted_hvs[361][k],shifted_hvs[362][k], shifted_hvs[363][k], shifted_hvs[364][k],
												shifted_hvs[365][k], shifted_hvs[366][k],shifted_hvs[367][k], shifted_hvs[368][k], shifted_hvs[369][k],
												shifted_hvs[370][k], shifted_hvs[371][k],shifted_hvs[372][k], shifted_hvs[373][k], shifted_hvs[374][k],
												shifted_hvs[375][k], shifted_hvs[376][k],shifted_hvs[377][k], shifted_hvs[378][k], shifted_hvs[379][k],
												shifted_hvs[380][k], shifted_hvs[381][k],shifted_hvs[382][k], shifted_hvs[383][k], shifted_hvs[384][k],
												shifted_hvs[385][k], shifted_hvs[386][k],shifted_hvs[387][k], shifted_hvs[388][k], shifted_hvs[389][k],
												shifted_hvs[390][k], shifted_hvs[391][k],shifted_hvs[392][k], shifted_hvs[393][k], shifted_hvs[394][k],
												shifted_hvs[395][k], shifted_hvs[396][k],shifted_hvs[397][k], shifted_hvs[398][k], shifted_hvs[399][k],
												shifted_hvs[400][k], shifted_hvs[401][k],shifted_hvs[402][k], shifted_hvs[403][k], shifted_hvs[404][k],
												shifted_hvs[405][k], shifted_hvs[406][k],shifted_hvs[407][k], shifted_hvs[408][k], shifted_hvs[409][k],
												shifted_hvs[410][k], shifted_hvs[411][k],shifted_hvs[412][k], shifted_hvs[413][k], shifted_hvs[414][k],
												shifted_hvs[415][k], shifted_hvs[416][k],shifted_hvs[417][k], shifted_hvs[418][k], shifted_hvs[419][k],
												shifted_hvs[420][k], shifted_hvs[421][k],shifted_hvs[422][k], shifted_hvs[423][k], shifted_hvs[424][k],
												shifted_hvs[425][k], shifted_hvs[426][k],shifted_hvs[427][k], shifted_hvs[428][k], shifted_hvs[429][k],
												shifted_hvs[430][k], shifted_hvs[431][k],shifted_hvs[432][k], shifted_hvs[433][k], shifted_hvs[434][k],
												shifted_hvs[435][k], shifted_hvs[436][k],shifted_hvs[437][k], shifted_hvs[438][k], shifted_hvs[439][k],
												shifted_hvs[440][k], shifted_hvs[441][k],shifted_hvs[442][k], shifted_hvs[443][k], shifted_hvs[444][k],
												shifted_hvs[445][k], shifted_hvs[446][k],shifted_hvs[447][k], shifted_hvs[448][k], shifted_hvs[449][k],
												shifted_hvs[450][k], shifted_hvs[451][k],shifted_hvs[452][k], shifted_hvs[453][k], shifted_hvs[454][k],
												shifted_hvs[455][k], shifted_hvs[456][k],shifted_hvs[457][k], shifted_hvs[458][k], shifted_hvs[459][k],
												shifted_hvs[460][k], shifted_hvs[461][k],shifted_hvs[462][k], shifted_hvs[463][k], shifted_hvs[464][k],
												shifted_hvs[465][k], shifted_hvs[466][k],shifted_hvs[467][k], shifted_hvs[468][k], shifted_hvs[469][k],
												shifted_hvs[470][k], shifted_hvs[471][k],shifted_hvs[472][k], shifted_hvs[473][k], shifted_hvs[474][k],
												shifted_hvs[475][k], shifted_hvs[476][k],shifted_hvs[477][k], shifted_hvs[478][k], shifted_hvs[479][k],
												shifted_hvs[480][k], shifted_hvs[481][k],shifted_hvs[482][k], shifted_hvs[483][k], shifted_hvs[484][k],
												shifted_hvs[485][k], shifted_hvs[486][k],shifted_hvs[487][k], shifted_hvs[488][k], shifted_hvs[489][k],
												shifted_hvs[490][k], shifted_hvs[491][k],shifted_hvs[492][k], shifted_hvs[493][k], shifted_hvs[494][k],
												shifted_hvs[495][k], shifted_hvs[496][k],shifted_hvs[497][k], shifted_hvs[498][k], shifted_hvs[499][k],
												shifted_hvs[500][k], shifted_hvs[501][k],shifted_hvs[502][k], shifted_hvs[503][k], shifted_hvs[504][k],
												shifted_hvs[505][k], shifted_hvs[506][k],shifted_hvs[507][k], shifted_hvs[508][k], shifted_hvs[509][k],
												shifted_hvs[510][k], shifted_hvs[511][k],shifted_hvs[512][k], shifted_hvs[513][k], shifted_hvs[514][k],
												shifted_hvs[515][k], shifted_hvs[516][k],shifted_hvs[517][k], shifted_hvs[518][k], shifted_hvs[519][k],
												shifted_hvs[520][k], shifted_hvs[521][k],shifted_hvs[522][k], shifted_hvs[523][k], shifted_hvs[524][k],
												shifted_hvs[525][k], shifted_hvs[526][k],shifted_hvs[527][k], shifted_hvs[528][k], shifted_hvs[529][k],
												shifted_hvs[530][k], shifted_hvs[531][k],shifted_hvs[532][k], shifted_hvs[533][k], shifted_hvs[534][k],
												shifted_hvs[535][k], shifted_hvs[536][k],shifted_hvs[537][k], shifted_hvs[538][k], shifted_hvs[539][k],
												shifted_hvs[540][k], shifted_hvs[541][k],shifted_hvs[542][k], shifted_hvs[543][k], shifted_hvs[544][k],
												shifted_hvs[545][k], shifted_hvs[546][k],shifted_hvs[547][k], shifted_hvs[548][k], shifted_hvs[549][k],
												shifted_hvs[550][k], shifted_hvs[551][k],shifted_hvs[552][k], shifted_hvs[553][k], shifted_hvs[554][k],
												shifted_hvs[555][k], shifted_hvs[556][k],shifted_hvs[557][k], shifted_hvs[558][k], shifted_hvs[559][k],
												shifted_hvs[560][k], shifted_hvs[561][k],shifted_hvs[562][k], shifted_hvs[563][k], shifted_hvs[564][k],
												shifted_hvs[565][k], shifted_hvs[566][k],shifted_hvs[567][k], shifted_hvs[568][k], shifted_hvs[569][k],
												shifted_hvs[570][k], shifted_hvs[571][k],shifted_hvs[572][k], shifted_hvs[573][k], shifted_hvs[574][k],
												shifted_hvs[575][k], shifted_hvs[576][k],shifted_hvs[577][k], shifted_hvs[578][k], shifted_hvs[579][k],
												shifted_hvs[580][k], shifted_hvs[581][k],shifted_hvs[582][k], shifted_hvs[583][k], shifted_hvs[584][k],
												shifted_hvs[585][k], shifted_hvs[586][k],shifted_hvs[587][k], shifted_hvs[588][k], shifted_hvs[589][k],
												shifted_hvs[590][k], shifted_hvs[591][k],shifted_hvs[592][k], shifted_hvs[593][k], shifted_hvs[594][k],
												shifted_hvs[595][k], shifted_hvs[596][k],shifted_hvs[597][k], shifted_hvs[598][k], shifted_hvs[599][k],
												shifted_hvs[600][k], shifted_hvs[601][k],shifted_hvs[602][k], shifted_hvs[603][k], shifted_hvs[604][k],
												shifted_hvs[605][k], shifted_hvs[606][k],shifted_hvs[607][k], shifted_hvs[608][k], shifted_hvs[609][k],
												shifted_hvs[610][k], shifted_hvs[611][k],shifted_hvs[612][k], shifted_hvs[613][k], shifted_hvs[614][k],
												shifted_hvs[615][k], shifted_hvs[616][k]}),
			   .bits_to_bundle_arr				(bits_to_bundle_arr[k])
			); 
    	end
	
	// Input MUX for bundlers
	
	
	//Old input MUX
	/*
	enc_mux_in ENC_MUX_IN_0(
		.ctr									(ctr),
		.bits_to_bundle_arr						(bits_to_bundle_arr),
		.mux_out								(mux_out)
	);
	*/
	
	//New input mux
	for (genvar l = 0; l < FEATURE_COUNT; l++) 
    	begin : enc_mux
			enc_mux_in_rework ENC_MUX_IN(
				.ctr									(ctr),
				.bits_to_bundle_arr						(bits_to_bundle_arr[HV_DIM-1:0][l]),
				.mux_out								(mux_out[DIMS_PER_CC-1:0][l])
			); 
    	end
             
    // DIMS_PER_CC=500 bundlers   
    for (genvar j = 0; j < DIMS_PER_CC; j++) 
    	begin : bundlers
			enc_bundler ENC_BUNDLER(
			   .bundling_features				(bundling_features),
			   .bits_to_bundle					(mux_out[j]), 
			   .thresholded_bit					(thresholded_bits[j])
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