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
	wire 	[HV_DIM-1:0] 		 	shifted_hvs_reg 		[0:FEATURE_COUNT-1];
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
         
    // FEATURE_COUNT=617 binders (packed into groups of 62 binders)
	enc_binder_pack_0 ENC_BINDER_PACK_0(
	    .level_hv								(level_hvs[0:61]),
	    .shifted_hv								(shifted_hvs[0:61])

	);

	enc_binder_pack_1 ENC_BINDER_PACK_1(
	    .level_hv								(level_hvs[62:123]),
	    .shifted_hv								(shifted_hvs[62:123])
	);
			
	enc_binder_pack_2 ENC_BINDER_PACK_2(
	    .level_hv								(level_hvs[124:185]),
	    .shifted_hv								(shifted_hvs[124:185])
	);
	
	enc_binder_pack_3 ENC_BINDER_PACK_3(
	    .level_hv								(level_hvs[186:247]),
	    .shifted_hv								(shifted_hvs[186:247])
	);
	
	enc_binder_pack_4 ENC_BINDER_PACK_4(
	    .level_hv								(level_hvs[248:309]),
	    .shifted_hv								(shifted_hvs[248:309])
	);
	
	enc_binder_pack_5 ENC_BINDER_PACK_5(
	    .level_hv								(level_hvs[310:371]),
	    .shifted_hv								(shifted_hvs[310:371])
	);	

	enc_binder_pack_6 ENC_BINDER_PACK_6(
	    .level_hv								(level_hvs[372:433]),
	    .shifted_hv								(shifted_hvs[372:433])
	);
			
	enc_binder_pack_7 ENC_BINDER_PACK_7(
	    .level_hv								(level_hvs[434:495]),
	    .shifted_hv								(shifted_hvs[434:495])
	);
			
	enc_binder_pack_8 ENC_BINDER_PACK_8(
	    .level_hv								(level_hvs[496:557]),
	    .shifted_hv								(shifted_hvs[496:557])
	);
			
	enc_binder_pack_9 ENC_BINDER_PACK_9(
	    .level_hv								(level_hvs[558:616]),
	    .shifted_hv								(shifted_hvs[558:616])
	);

	for (genvar x = 0; x < FEATURE_COUNT; x++)
		begin: enc_shift_reg
			enc_shift_reg ENC_SHIFT_REG (
				.clk									(clk),
				.nrst									(nrst),
				.start_encoding							(start_encoding),
				.shifted_hv								(shifted_hvs[x]),
				.shifted_hv_reg_out						(shifted_hvs_reg[x])
			);
		end
		
	// Nets (this just packs the dimensions of shifted_hvs_reg)
	for (genvar j = 0; j < HV_DIM; j++) 
		begin: nets
			enc_nets ENC_NETS (
				.hv_bits_per_dim				({
												shifted_hvs_reg[0][j], shifted_hvs_reg[1][j],shifted_hvs_reg[2][j], shifted_hvs_reg[3][j], shifted_hvs_reg[4][j],
												shifted_hvs_reg[5][j], shifted_hvs_reg[6][j],shifted_hvs_reg[7][j], shifted_hvs_reg[8][j], shifted_hvs_reg[9][j],
												shifted_hvs_reg[10][j], shifted_hvs_reg[11][j],shifted_hvs_reg[12][j], shifted_hvs_reg[13][j], shifted_hvs_reg[14][j],
												shifted_hvs_reg[15][j], shifted_hvs_reg[16][j],shifted_hvs_reg[17][j], shifted_hvs_reg[18][j], shifted_hvs_reg[19][j],
												shifted_hvs_reg[20][j], shifted_hvs_reg[21][j],shifted_hvs_reg[22][j], shifted_hvs_reg[23][j], shifted_hvs_reg[24][j],
												shifted_hvs_reg[25][j], shifted_hvs_reg[26][j],shifted_hvs_reg[27][j], shifted_hvs_reg[28][j], shifted_hvs_reg[29][j],
												shifted_hvs_reg[30][j], shifted_hvs_reg[31][j],shifted_hvs_reg[32][j], shifted_hvs_reg[33][j], shifted_hvs_reg[34][j],
												shifted_hvs_reg[35][j], shifted_hvs_reg[36][j],shifted_hvs_reg[37][j], shifted_hvs_reg[38][j], shifted_hvs_reg[39][j],
												shifted_hvs_reg[40][j], shifted_hvs_reg[41][j],shifted_hvs_reg[42][j], shifted_hvs_reg[43][j], shifted_hvs_reg[44][j],
												shifted_hvs_reg[45][j], shifted_hvs_reg[46][j],shifted_hvs_reg[47][j], shifted_hvs_reg[48][j], shifted_hvs_reg[49][j],
												shifted_hvs_reg[50][j], shifted_hvs_reg[51][j],shifted_hvs_reg[52][j], shifted_hvs_reg[53][j], shifted_hvs_reg[54][j],
												shifted_hvs_reg[55][j], shifted_hvs_reg[56][j],shifted_hvs_reg[57][j], shifted_hvs_reg[58][j], shifted_hvs_reg[59][j],
												shifted_hvs_reg[60][j], shifted_hvs_reg[61][j],shifted_hvs_reg[62][j], shifted_hvs_reg[63][j], shifted_hvs_reg[64][j],
												shifted_hvs_reg[65][j], shifted_hvs_reg[66][j],shifted_hvs_reg[67][j], shifted_hvs_reg[68][j], shifted_hvs_reg[69][j],
												shifted_hvs_reg[70][j], shifted_hvs_reg[71][j],shifted_hvs_reg[72][j], shifted_hvs_reg[73][j], shifted_hvs_reg[74][j],
												shifted_hvs_reg[75][j], shifted_hvs_reg[76][j],shifted_hvs_reg[77][j], shifted_hvs_reg[78][j], shifted_hvs_reg[79][j],
												shifted_hvs_reg[80][j], shifted_hvs_reg[81][j],shifted_hvs_reg[82][j], shifted_hvs_reg[83][j], shifted_hvs_reg[84][j],
												shifted_hvs_reg[85][j], shifted_hvs_reg[86][j],shifted_hvs_reg[87][j], shifted_hvs_reg[88][j], shifted_hvs_reg[89][j],
												shifted_hvs_reg[90][j], shifted_hvs_reg[91][j],shifted_hvs_reg[92][j], shifted_hvs_reg[93][j], shifted_hvs_reg[94][j],
												shifted_hvs_reg[95][j], shifted_hvs_reg[96][j],shifted_hvs_reg[97][j], shifted_hvs_reg[98][j], shifted_hvs_reg[99][j],
												shifted_hvs_reg[100][j], shifted_hvs_reg[101][j],shifted_hvs_reg[102][j], shifted_hvs_reg[103][j], shifted_hvs_reg[104][j],
												shifted_hvs_reg[105][j], shifted_hvs_reg[106][j],shifted_hvs_reg[107][j], shifted_hvs_reg[108][j], shifted_hvs_reg[109][j],
												shifted_hvs_reg[110][j], shifted_hvs_reg[111][j],shifted_hvs_reg[112][j], shifted_hvs_reg[113][j], shifted_hvs_reg[114][j],
												shifted_hvs_reg[115][j], shifted_hvs_reg[116][j],shifted_hvs_reg[117][j], shifted_hvs_reg[118][j], shifted_hvs_reg[119][j],
												shifted_hvs_reg[120][j], shifted_hvs_reg[121][j],shifted_hvs_reg[122][j], shifted_hvs_reg[123][j], shifted_hvs_reg[124][j],
												shifted_hvs_reg[125][j], shifted_hvs_reg[126][j],shifted_hvs_reg[127][j], shifted_hvs_reg[128][j], shifted_hvs_reg[129][j],
												shifted_hvs_reg[130][j], shifted_hvs_reg[131][j],shifted_hvs_reg[132][j], shifted_hvs_reg[133][j], shifted_hvs_reg[134][j],
												shifted_hvs_reg[135][j], shifted_hvs_reg[136][j],shifted_hvs_reg[137][j], shifted_hvs_reg[138][j], shifted_hvs_reg[139][j],
												shifted_hvs_reg[140][j], shifted_hvs_reg[141][j],shifted_hvs_reg[142][j], shifted_hvs_reg[143][j], shifted_hvs_reg[144][j],
												shifted_hvs_reg[145][j], shifted_hvs_reg[146][j],shifted_hvs_reg[147][j], shifted_hvs_reg[148][j], shifted_hvs_reg[149][j],
												shifted_hvs_reg[150][j], shifted_hvs_reg[151][j],shifted_hvs_reg[152][j], shifted_hvs_reg[153][j], shifted_hvs_reg[154][j],
												shifted_hvs_reg[155][j], shifted_hvs_reg[156][j],shifted_hvs_reg[157][j], shifted_hvs_reg[158][j], shifted_hvs_reg[159][j],
												shifted_hvs_reg[160][j], shifted_hvs_reg[161][j],shifted_hvs_reg[162][j], shifted_hvs_reg[163][j], shifted_hvs_reg[164][j],
												shifted_hvs_reg[165][j], shifted_hvs_reg[166][j],shifted_hvs_reg[167][j], shifted_hvs_reg[168][j], shifted_hvs_reg[169][j],
												shifted_hvs_reg[170][j], shifted_hvs_reg[171][j],shifted_hvs_reg[172][j], shifted_hvs_reg[173][j], shifted_hvs_reg[174][j],
												shifted_hvs_reg[175][j], shifted_hvs_reg[176][j],shifted_hvs_reg[177][j], shifted_hvs_reg[178][j], shifted_hvs_reg[179][j],
												shifted_hvs_reg[180][j], shifted_hvs_reg[181][j],shifted_hvs_reg[182][j], shifted_hvs_reg[183][j], shifted_hvs_reg[184][j],
												shifted_hvs_reg[185][j], shifted_hvs_reg[186][j],shifted_hvs_reg[187][j], shifted_hvs_reg[188][j], shifted_hvs_reg[189][j],
												shifted_hvs_reg[190][j], shifted_hvs_reg[191][j],shifted_hvs_reg[192][j], shifted_hvs_reg[193][j], shifted_hvs_reg[194][j],
												shifted_hvs_reg[195][j], shifted_hvs_reg[196][j],shifted_hvs_reg[197][j], shifted_hvs_reg[198][j], shifted_hvs_reg[199][j],
												shifted_hvs_reg[200][j], shifted_hvs_reg[201][j],shifted_hvs_reg[202][j], shifted_hvs_reg[203][j], shifted_hvs_reg[204][j],
												shifted_hvs_reg[205][j], shifted_hvs_reg[206][j],shifted_hvs_reg[207][j], shifted_hvs_reg[208][j], shifted_hvs_reg[209][j],
												shifted_hvs_reg[210][j], shifted_hvs_reg[211][j],shifted_hvs_reg[212][j], shifted_hvs_reg[213][j], shifted_hvs_reg[214][j],
												shifted_hvs_reg[215][j], shifted_hvs_reg[216][j],shifted_hvs_reg[217][j], shifted_hvs_reg[218][j], shifted_hvs_reg[219][j],
												shifted_hvs_reg[220][j], shifted_hvs_reg[221][j],shifted_hvs_reg[222][j], shifted_hvs_reg[223][j], shifted_hvs_reg[224][j],
												shifted_hvs_reg[225][j], shifted_hvs_reg[226][j],shifted_hvs_reg[227][j], shifted_hvs_reg[228][j], shifted_hvs_reg[229][j],
												shifted_hvs_reg[230][j], shifted_hvs_reg[231][j],shifted_hvs_reg[232][j], shifted_hvs_reg[233][j], shifted_hvs_reg[234][j],
												shifted_hvs_reg[235][j], shifted_hvs_reg[236][j],shifted_hvs_reg[237][j], shifted_hvs_reg[238][j], shifted_hvs_reg[239][j],
												shifted_hvs_reg[240][j], shifted_hvs_reg[241][j],shifted_hvs_reg[242][j], shifted_hvs_reg[243][j], shifted_hvs_reg[244][j],
												shifted_hvs_reg[245][j], shifted_hvs_reg[246][j],shifted_hvs_reg[247][j], shifted_hvs_reg[248][j], shifted_hvs_reg[249][j],
												shifted_hvs_reg[250][j], shifted_hvs_reg[251][j],shifted_hvs_reg[252][j], shifted_hvs_reg[253][j], shifted_hvs_reg[254][j],
												shifted_hvs_reg[255][j], shifted_hvs_reg[256][j],shifted_hvs_reg[257][j], shifted_hvs_reg[258][j], shifted_hvs_reg[259][j],
												shifted_hvs_reg[260][j], shifted_hvs_reg[261][j],shifted_hvs_reg[262][j], shifted_hvs_reg[263][j], shifted_hvs_reg[264][j],
												shifted_hvs_reg[265][j], shifted_hvs_reg[266][j],shifted_hvs_reg[267][j], shifted_hvs_reg[268][j], shifted_hvs_reg[269][j],
												shifted_hvs_reg[270][j], shifted_hvs_reg[271][j],shifted_hvs_reg[272][j], shifted_hvs_reg[273][j], shifted_hvs_reg[274][j],
												shifted_hvs_reg[275][j], shifted_hvs_reg[276][j],shifted_hvs_reg[277][j], shifted_hvs_reg[278][j], shifted_hvs_reg[279][j],
												shifted_hvs_reg[280][j], shifted_hvs_reg[281][j],shifted_hvs_reg[282][j], shifted_hvs_reg[283][j], shifted_hvs_reg[284][j],
												shifted_hvs_reg[285][j], shifted_hvs_reg[286][j],shifted_hvs_reg[287][j], shifted_hvs_reg[288][j], shifted_hvs_reg[289][j],
												shifted_hvs_reg[290][j], shifted_hvs_reg[291][j],shifted_hvs_reg[292][j], shifted_hvs_reg[293][j], shifted_hvs_reg[294][j],
												shifted_hvs_reg[295][j], shifted_hvs_reg[296][j],shifted_hvs_reg[297][j], shifted_hvs_reg[298][j], shifted_hvs_reg[299][j],
												shifted_hvs_reg[300][j], shifted_hvs_reg[301][j],shifted_hvs_reg[302][j], shifted_hvs_reg[303][j], shifted_hvs_reg[304][j],
												shifted_hvs_reg[305][j], shifted_hvs_reg[306][j],shifted_hvs_reg[307][j], shifted_hvs_reg[308][j], shifted_hvs_reg[309][j],
												shifted_hvs_reg[310][j], shifted_hvs_reg[311][j],shifted_hvs_reg[312][j], shifted_hvs_reg[313][j], shifted_hvs_reg[314][j],
												shifted_hvs_reg[315][j], shifted_hvs_reg[316][j],shifted_hvs_reg[317][j], shifted_hvs_reg[318][j], shifted_hvs_reg[319][j],
												shifted_hvs_reg[320][j], shifted_hvs_reg[321][j],shifted_hvs_reg[322][j], shifted_hvs_reg[323][j], shifted_hvs_reg[324][j],
												shifted_hvs_reg[325][j], shifted_hvs_reg[326][j],shifted_hvs_reg[327][j], shifted_hvs_reg[328][j], shifted_hvs_reg[329][j],
												shifted_hvs_reg[330][j], shifted_hvs_reg[331][j],shifted_hvs_reg[332][j], shifted_hvs_reg[333][j], shifted_hvs_reg[334][j],
												shifted_hvs_reg[335][j], shifted_hvs_reg[336][j],shifted_hvs_reg[337][j], shifted_hvs_reg[338][j], shifted_hvs_reg[339][j],
												shifted_hvs_reg[340][j], shifted_hvs_reg[341][j],shifted_hvs_reg[342][j], shifted_hvs_reg[343][j], shifted_hvs_reg[344][j],
												shifted_hvs_reg[345][j], shifted_hvs_reg[346][j],shifted_hvs_reg[347][j], shifted_hvs_reg[348][j], shifted_hvs_reg[349][j],
												shifted_hvs_reg[350][j], shifted_hvs_reg[351][j],shifted_hvs_reg[352][j], shifted_hvs_reg[353][j], shifted_hvs_reg[354][j],
												shifted_hvs_reg[355][j], shifted_hvs_reg[356][j],shifted_hvs_reg[357][j], shifted_hvs_reg[358][j], shifted_hvs_reg[359][j],
												shifted_hvs_reg[360][j], shifted_hvs_reg[361][j],shifted_hvs_reg[362][j], shifted_hvs_reg[363][j], shifted_hvs_reg[364][j],
												shifted_hvs_reg[365][j], shifted_hvs_reg[366][j],shifted_hvs_reg[367][j], shifted_hvs_reg[368][j], shifted_hvs_reg[369][j],
												shifted_hvs_reg[370][j], shifted_hvs_reg[371][j],shifted_hvs_reg[372][j], shifted_hvs_reg[373][j], shifted_hvs_reg[374][j],
												shifted_hvs_reg[375][j], shifted_hvs_reg[376][j],shifted_hvs_reg[377][j], shifted_hvs_reg[378][j], shifted_hvs_reg[379][j],
												shifted_hvs_reg[380][j], shifted_hvs_reg[381][j],shifted_hvs_reg[382][j], shifted_hvs_reg[383][j], shifted_hvs_reg[384][j],
												shifted_hvs_reg[385][j], shifted_hvs_reg[386][j],shifted_hvs_reg[387][j], shifted_hvs_reg[388][j], shifted_hvs_reg[389][j],
												shifted_hvs_reg[390][j], shifted_hvs_reg[391][j],shifted_hvs_reg[392][j], shifted_hvs_reg[393][j], shifted_hvs_reg[394][j],
												shifted_hvs_reg[395][j], shifted_hvs_reg[396][j],shifted_hvs_reg[397][j], shifted_hvs_reg[398][j], shifted_hvs_reg[399][j],
												shifted_hvs_reg[400][j], shifted_hvs_reg[401][j],shifted_hvs_reg[402][j], shifted_hvs_reg[403][j], shifted_hvs_reg[404][j],
												shifted_hvs_reg[405][j], shifted_hvs_reg[406][j],shifted_hvs_reg[407][j], shifted_hvs_reg[408][j], shifted_hvs_reg[409][j],
												shifted_hvs_reg[410][j], shifted_hvs_reg[411][j],shifted_hvs_reg[412][j], shifted_hvs_reg[413][j], shifted_hvs_reg[414][j],
												shifted_hvs_reg[415][j], shifted_hvs_reg[416][j],shifted_hvs_reg[417][j], shifted_hvs_reg[418][j], shifted_hvs_reg[419][j],
												shifted_hvs_reg[420][j], shifted_hvs_reg[421][j],shifted_hvs_reg[422][j], shifted_hvs_reg[423][j], shifted_hvs_reg[424][j],
												shifted_hvs_reg[425][j], shifted_hvs_reg[426][j],shifted_hvs_reg[427][j], shifted_hvs_reg[428][j], shifted_hvs_reg[429][j],
												shifted_hvs_reg[430][j], shifted_hvs_reg[431][j],shifted_hvs_reg[432][j], shifted_hvs_reg[433][j], shifted_hvs_reg[434][j],
												shifted_hvs_reg[435][j], shifted_hvs_reg[436][j],shifted_hvs_reg[437][j], shifted_hvs_reg[438][j], shifted_hvs_reg[439][j],
												shifted_hvs_reg[440][j], shifted_hvs_reg[441][j],shifted_hvs_reg[442][j], shifted_hvs_reg[443][j], shifted_hvs_reg[444][j],
												shifted_hvs_reg[445][j], shifted_hvs_reg[446][j],shifted_hvs_reg[447][j], shifted_hvs_reg[448][j], shifted_hvs_reg[449][j],
												shifted_hvs_reg[450][j], shifted_hvs_reg[451][j],shifted_hvs_reg[452][j], shifted_hvs_reg[453][j], shifted_hvs_reg[454][j],
												shifted_hvs_reg[455][j], shifted_hvs_reg[456][j],shifted_hvs_reg[457][j], shifted_hvs_reg[458][j], shifted_hvs_reg[459][j],
												shifted_hvs_reg[460][j], shifted_hvs_reg[461][j],shifted_hvs_reg[462][j], shifted_hvs_reg[463][j], shifted_hvs_reg[464][j],
												shifted_hvs_reg[465][j], shifted_hvs_reg[466][j],shifted_hvs_reg[467][j], shifted_hvs_reg[468][j], shifted_hvs_reg[469][j],
												shifted_hvs_reg[470][j], shifted_hvs_reg[471][j],shifted_hvs_reg[472][j], shifted_hvs_reg[473][j], shifted_hvs_reg[474][j],
												shifted_hvs_reg[475][j], shifted_hvs_reg[476][j],shifted_hvs_reg[477][j], shifted_hvs_reg[478][j], shifted_hvs_reg[479][j],
												shifted_hvs_reg[480][j], shifted_hvs_reg[481][j],shifted_hvs_reg[482][j], shifted_hvs_reg[483][j], shifted_hvs_reg[484][j],
												shifted_hvs_reg[485][j], shifted_hvs_reg[486][j],shifted_hvs_reg[487][j], shifted_hvs_reg[488][j], shifted_hvs_reg[489][j],
												shifted_hvs_reg[490][j], shifted_hvs_reg[491][j],shifted_hvs_reg[492][j], shifted_hvs_reg[493][j], shifted_hvs_reg[494][j],
												shifted_hvs_reg[495][j], shifted_hvs_reg[496][j],shifted_hvs_reg[497][j], shifted_hvs_reg[498][j], shifted_hvs_reg[499][j],
												shifted_hvs_reg[500][j], shifted_hvs_reg[501][j],shifted_hvs_reg[502][j], shifted_hvs_reg[503][j], shifted_hvs_reg[504][j],
												shifted_hvs_reg[505][j], shifted_hvs_reg[506][j],shifted_hvs_reg[507][j], shifted_hvs_reg[508][j], shifted_hvs_reg[509][j],
												shifted_hvs_reg[510][j], shifted_hvs_reg[511][j],shifted_hvs_reg[512][j], shifted_hvs_reg[513][j], shifted_hvs_reg[514][j],
												shifted_hvs_reg[515][j], shifted_hvs_reg[516][j],shifted_hvs_reg[517][j], shifted_hvs_reg[518][j], shifted_hvs_reg[519][j],
												shifted_hvs_reg[520][j], shifted_hvs_reg[521][j],shifted_hvs_reg[522][j], shifted_hvs_reg[523][j], shifted_hvs_reg[524][j],
												shifted_hvs_reg[525][j], shifted_hvs_reg[526][j],shifted_hvs_reg[527][j], shifted_hvs_reg[528][j], shifted_hvs_reg[529][j],
												shifted_hvs_reg[530][j], shifted_hvs_reg[531][j],shifted_hvs_reg[532][j], shifted_hvs_reg[533][j], shifted_hvs_reg[534][j],
												shifted_hvs_reg[535][j], shifted_hvs_reg[536][j],shifted_hvs_reg[537][j], shifted_hvs_reg[538][j], shifted_hvs_reg[539][j],
												shifted_hvs_reg[540][j], shifted_hvs_reg[541][j],shifted_hvs_reg[542][j], shifted_hvs_reg[543][j], shifted_hvs_reg[544][j],
												shifted_hvs_reg[545][j], shifted_hvs_reg[546][j],shifted_hvs_reg[547][j], shifted_hvs_reg[548][j], shifted_hvs_reg[549][j],
												shifted_hvs_reg[550][j], shifted_hvs_reg[551][j],shifted_hvs_reg[552][j], shifted_hvs_reg[553][j], shifted_hvs_reg[554][j],
												shifted_hvs_reg[555][j], shifted_hvs_reg[556][j],shifted_hvs_reg[557][j], shifted_hvs_reg[558][j], shifted_hvs_reg[559][j],
												shifted_hvs_reg[560][j], shifted_hvs_reg[561][j],shifted_hvs_reg[562][j], shifted_hvs_reg[563][j], shifted_hvs_reg[564][j],
												shifted_hvs_reg[565][j], shifted_hvs_reg[566][j],shifted_hvs_reg[567][j], shifted_hvs_reg[568][j], shifted_hvs_reg[569][j],
												shifted_hvs_reg[570][j], shifted_hvs_reg[571][j],shifted_hvs_reg[572][j], shifted_hvs_reg[573][j], shifted_hvs_reg[574][j],
												shifted_hvs_reg[575][j], shifted_hvs_reg[576][j],shifted_hvs_reg[577][j], shifted_hvs_reg[578][j], shifted_hvs_reg[579][j],
												shifted_hvs_reg[580][j], shifted_hvs_reg[581][j],shifted_hvs_reg[582][j], shifted_hvs_reg[583][j], shifted_hvs_reg[584][j],
												shifted_hvs_reg[585][j], shifted_hvs_reg[586][j],shifted_hvs_reg[587][j], shifted_hvs_reg[588][j], shifted_hvs_reg[589][j],
												shifted_hvs_reg[590][j], shifted_hvs_reg[591][j],shifted_hvs_reg[592][j], shifted_hvs_reg[593][j], shifted_hvs_reg[594][j],
												shifted_hvs_reg[595][j], shifted_hvs_reg[596][j],shifted_hvs_reg[597][j], shifted_hvs_reg[598][j], shifted_hvs_reg[599][j],
												shifted_hvs_reg[600][j], shifted_hvs_reg[601][j],shifted_hvs_reg[602][j], shifted_hvs_reg[603][j], shifted_hvs_reg[604][j],
												shifted_hvs_reg[605][j], shifted_hvs_reg[606][j],shifted_hvs_reg[607][j], shifted_hvs_reg[608][j], shifted_hvs_reg[609][j],
												shifted_hvs_reg[610][j], shifted_hvs_reg[611][j],shifted_hvs_reg[612][j], shifted_hvs_reg[613][j], shifted_hvs_reg[614][j],
												shifted_hvs_reg[615][j], shifted_hvs_reg[616][j]    
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