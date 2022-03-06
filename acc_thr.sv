module acc_thr(
    input wire clk,
    input wire nrst,
    input wire en,
    input wire start_acc_thr,
    input wire [FEATURE_COUNT-1:0] HV_bits_per_dim,
    output logic thresholded_bit
    );
    
    wire [9:0] accumulated_sum;

    // accumulator
    assign accumulated_sum =
        HV_bits_per_dim[0] + HV_bits_per_dim[1] + HV_bits_per_dim[2] + HV_bits_per_dim[3] + HV_bits_per_dim[4] + 
        HV_bits_per_dim[5] + HV_bits_per_dim[6] + HV_bits_per_dim[7] + HV_bits_per_dim[8] + HV_bits_per_dim[9] + 
        HV_bits_per_dim[10] + HV_bits_per_dim[11] + HV_bits_per_dim[12] + HV_bits_per_dim[13] + HV_bits_per_dim[14] + 
        HV_bits_per_dim[15] + HV_bits_per_dim[16] + HV_bits_per_dim[17] + HV_bits_per_dim[18] + HV_bits_per_dim[19] + 
        HV_bits_per_dim[20] + HV_bits_per_dim[21] + HV_bits_per_dim[22] + HV_bits_per_dim[23] + HV_bits_per_dim[24] + 
        HV_bits_per_dim[25] + HV_bits_per_dim[26] + HV_bits_per_dim[27] + HV_bits_per_dim[28] + HV_bits_per_dim[29] + 
        HV_bits_per_dim[30] + HV_bits_per_dim[31] + HV_bits_per_dim[32] + HV_bits_per_dim[33] + HV_bits_per_dim[34] + 
        HV_bits_per_dim[35] + HV_bits_per_dim[36] + HV_bits_per_dim[37] + HV_bits_per_dim[38] + HV_bits_per_dim[39] + 
        HV_bits_per_dim[40] + HV_bits_per_dim[41] + HV_bits_per_dim[42] + HV_bits_per_dim[43] + HV_bits_per_dim[44] + 
        HV_bits_per_dim[45] + HV_bits_per_dim[46] + HV_bits_per_dim[47] + HV_bits_per_dim[48] + HV_bits_per_dim[49] + 
        HV_bits_per_dim[50] + HV_bits_per_dim[51] + HV_bits_per_dim[52] + HV_bits_per_dim[53] + HV_bits_per_dim[54] + 
        HV_bits_per_dim[55] + HV_bits_per_dim[56] + HV_bits_per_dim[57] + HV_bits_per_dim[58] + HV_bits_per_dim[59] + 
        HV_bits_per_dim[60] + HV_bits_per_dim[61] + HV_bits_per_dim[62] + HV_bits_per_dim[63] + HV_bits_per_dim[64] + 
        HV_bits_per_dim[65] + HV_bits_per_dim[66] + HV_bits_per_dim[67] + HV_bits_per_dim[68] + HV_bits_per_dim[69] + 
        HV_bits_per_dim[70] + HV_bits_per_dim[71] + HV_bits_per_dim[72] + HV_bits_per_dim[73] + HV_bits_per_dim[74] + 
        HV_bits_per_dim[75] + HV_bits_per_dim[76] + HV_bits_per_dim[77] + HV_bits_per_dim[78] + HV_bits_per_dim[79] + 
        HV_bits_per_dim[80] + HV_bits_per_dim[81] + HV_bits_per_dim[82] + HV_bits_per_dim[83] + HV_bits_per_dim[84] + 
        HV_bits_per_dim[85] + HV_bits_per_dim[86] + HV_bits_per_dim[87] + HV_bits_per_dim[88] + HV_bits_per_dim[89] + 
        HV_bits_per_dim[90] + HV_bits_per_dim[91] + HV_bits_per_dim[92] + HV_bits_per_dim[93] + HV_bits_per_dim[94] + 
        HV_bits_per_dim[95] + HV_bits_per_dim[96] + HV_bits_per_dim[97] + HV_bits_per_dim[98] + HV_bits_per_dim[99] + 
        HV_bits_per_dim[100] + HV_bits_per_dim[101] + HV_bits_per_dim[102] + HV_bits_per_dim[103] + HV_bits_per_dim[104] + 
        HV_bits_per_dim[105] + HV_bits_per_dim[106] + HV_bits_per_dim[107] + HV_bits_per_dim[108] + HV_bits_per_dim[109] + 
        HV_bits_per_dim[110] + HV_bits_per_dim[111] + HV_bits_per_dim[112] + HV_bits_per_dim[113] + HV_bits_per_dim[114] + 
        HV_bits_per_dim[115] + HV_bits_per_dim[116] + HV_bits_per_dim[117] + HV_bits_per_dim[118] + HV_bits_per_dim[119] + 
        HV_bits_per_dim[120] + HV_bits_per_dim[121] + HV_bits_per_dim[122] + HV_bits_per_dim[123] + HV_bits_per_dim[124] + 
        HV_bits_per_dim[125] + HV_bits_per_dim[126] + HV_bits_per_dim[127] + HV_bits_per_dim[128] + HV_bits_per_dim[129] + 
        HV_bits_per_dim[130] + HV_bits_per_dim[131] + HV_bits_per_dim[132] + HV_bits_per_dim[133] + HV_bits_per_dim[134] + 
        HV_bits_per_dim[135] + HV_bits_per_dim[136] + HV_bits_per_dim[137] + HV_bits_per_dim[138] + HV_bits_per_dim[139] + 
        HV_bits_per_dim[140] + HV_bits_per_dim[141] + HV_bits_per_dim[142] + HV_bits_per_dim[143] + HV_bits_per_dim[144] + 
        HV_bits_per_dim[145] + HV_bits_per_dim[146] + HV_bits_per_dim[147] + HV_bits_per_dim[148] + HV_bits_per_dim[149] + 
        HV_bits_per_dim[150] + HV_bits_per_dim[151] + HV_bits_per_dim[152] + HV_bits_per_dim[153] + HV_bits_per_dim[154] + 
        HV_bits_per_dim[155] + HV_bits_per_dim[156] + HV_bits_per_dim[157] + HV_bits_per_dim[158] + HV_bits_per_dim[159] + 
        HV_bits_per_dim[160] + HV_bits_per_dim[161] + HV_bits_per_dim[162] + HV_bits_per_dim[163] + HV_bits_per_dim[164] + 
        HV_bits_per_dim[165] + HV_bits_per_dim[166] + HV_bits_per_dim[167] + HV_bits_per_dim[168] + HV_bits_per_dim[169] + 
        HV_bits_per_dim[170] + HV_bits_per_dim[171] + HV_bits_per_dim[172] + HV_bits_per_dim[173] + HV_bits_per_dim[174] + 
        HV_bits_per_dim[175] + HV_bits_per_dim[176] + HV_bits_per_dim[177] + HV_bits_per_dim[178] + HV_bits_per_dim[179] + 
        HV_bits_per_dim[180] + HV_bits_per_dim[181] + HV_bits_per_dim[182] + HV_bits_per_dim[183] + HV_bits_per_dim[184] + 
        HV_bits_per_dim[185] + HV_bits_per_dim[186] + HV_bits_per_dim[187] + HV_bits_per_dim[188] + HV_bits_per_dim[189] + 
        HV_bits_per_dim[190] + HV_bits_per_dim[191] + HV_bits_per_dim[192] + HV_bits_per_dim[193] + HV_bits_per_dim[194] + 
        HV_bits_per_dim[195] + HV_bits_per_dim[196] + HV_bits_per_dim[197] + HV_bits_per_dim[198] + HV_bits_per_dim[199] + 
        HV_bits_per_dim[200] + HV_bits_per_dim[201] + HV_bits_per_dim[202] + HV_bits_per_dim[203] + HV_bits_per_dim[204] + 
        HV_bits_per_dim[205] + HV_bits_per_dim[206] + HV_bits_per_dim[207] + HV_bits_per_dim[208] + HV_bits_per_dim[209] + 
        HV_bits_per_dim[210] + HV_bits_per_dim[211] + HV_bits_per_dim[212] + HV_bits_per_dim[213] + HV_bits_per_dim[214] + 
        HV_bits_per_dim[215] + HV_bits_per_dim[216] + HV_bits_per_dim[217] + HV_bits_per_dim[218] + HV_bits_per_dim[219] + 
        HV_bits_per_dim[220] + HV_bits_per_dim[221] + HV_bits_per_dim[222] + HV_bits_per_dim[223] + HV_bits_per_dim[224] + 
        HV_bits_per_dim[225] + HV_bits_per_dim[226] + HV_bits_per_dim[227] + HV_bits_per_dim[228] + HV_bits_per_dim[229] + 
        HV_bits_per_dim[230] + HV_bits_per_dim[231] + HV_bits_per_dim[232] + HV_bits_per_dim[233] + HV_bits_per_dim[234] + 
        HV_bits_per_dim[235] + HV_bits_per_dim[236] + HV_bits_per_dim[237] + HV_bits_per_dim[238] + HV_bits_per_dim[239] + 
        HV_bits_per_dim[240] + HV_bits_per_dim[241] + HV_bits_per_dim[242] + HV_bits_per_dim[243] + HV_bits_per_dim[244] + 
        HV_bits_per_dim[245] + HV_bits_per_dim[246] + HV_bits_per_dim[247] + HV_bits_per_dim[248] + HV_bits_per_dim[249] + 
        HV_bits_per_dim[250] + HV_bits_per_dim[251] + HV_bits_per_dim[252] + HV_bits_per_dim[253] + HV_bits_per_dim[254] + 
        HV_bits_per_dim[255] + HV_bits_per_dim[256] + HV_bits_per_dim[257] + HV_bits_per_dim[258] + HV_bits_per_dim[259] + 
        HV_bits_per_dim[260] + HV_bits_per_dim[261] + HV_bits_per_dim[262] + HV_bits_per_dim[263] + HV_bits_per_dim[264] + 
        HV_bits_per_dim[265] + HV_bits_per_dim[266] + HV_bits_per_dim[267] + HV_bits_per_dim[268] + HV_bits_per_dim[269] + 
        HV_bits_per_dim[270] + HV_bits_per_dim[271] + HV_bits_per_dim[272] + HV_bits_per_dim[273] + HV_bits_per_dim[274] + 
        HV_bits_per_dim[275] + HV_bits_per_dim[276] + HV_bits_per_dim[277] + HV_bits_per_dim[278] + HV_bits_per_dim[279] + 
        HV_bits_per_dim[280] + HV_bits_per_dim[281] + HV_bits_per_dim[282] + HV_bits_per_dim[283] + HV_bits_per_dim[284] + 
        HV_bits_per_dim[285] + HV_bits_per_dim[286] + HV_bits_per_dim[287] + HV_bits_per_dim[288] + HV_bits_per_dim[289] + 
        HV_bits_per_dim[290] + HV_bits_per_dim[291] + HV_bits_per_dim[292] + HV_bits_per_dim[293] + HV_bits_per_dim[294] + 
        HV_bits_per_dim[295] + HV_bits_per_dim[296] + HV_bits_per_dim[297] + HV_bits_per_dim[298] + HV_bits_per_dim[299] + 
        HV_bits_per_dim[300] + HV_bits_per_dim[301] + HV_bits_per_dim[302] + HV_bits_per_dim[303] + HV_bits_per_dim[304] + 
        HV_bits_per_dim[305] + HV_bits_per_dim[306] + HV_bits_per_dim[307] + HV_bits_per_dim[308] + HV_bits_per_dim[309] + 
        HV_bits_per_dim[310] + HV_bits_per_dim[311] + HV_bits_per_dim[312] + HV_bits_per_dim[313] + HV_bits_per_dim[314] + 
        HV_bits_per_dim[315] + HV_bits_per_dim[316] + HV_bits_per_dim[317] + HV_bits_per_dim[318] + HV_bits_per_dim[319] + 
        HV_bits_per_dim[320] + HV_bits_per_dim[321] + HV_bits_per_dim[322] + HV_bits_per_dim[323] + HV_bits_per_dim[324] + 
        HV_bits_per_dim[325] + HV_bits_per_dim[326] + HV_bits_per_dim[327] + HV_bits_per_dim[328] + HV_bits_per_dim[329] + 
        HV_bits_per_dim[330] + HV_bits_per_dim[331] + HV_bits_per_dim[332] + HV_bits_per_dim[333] + HV_bits_per_dim[334] + 
        HV_bits_per_dim[335] + HV_bits_per_dim[336] + HV_bits_per_dim[337] + HV_bits_per_dim[338] + HV_bits_per_dim[339] + 
        HV_bits_per_dim[340] + HV_bits_per_dim[341] + HV_bits_per_dim[342] + HV_bits_per_dim[343] + HV_bits_per_dim[344] + 
        HV_bits_per_dim[345] + HV_bits_per_dim[346] + HV_bits_per_dim[347] + HV_bits_per_dim[348] + HV_bits_per_dim[349] + 
        HV_bits_per_dim[350] + HV_bits_per_dim[351] + HV_bits_per_dim[352] + HV_bits_per_dim[353] + HV_bits_per_dim[354] + 
        HV_bits_per_dim[355] + HV_bits_per_dim[356] + HV_bits_per_dim[357] + HV_bits_per_dim[358] + HV_bits_per_dim[359] + 
        HV_bits_per_dim[360] + HV_bits_per_dim[361] + HV_bits_per_dim[362] + HV_bits_per_dim[363] + HV_bits_per_dim[364] + 
        HV_bits_per_dim[365] + HV_bits_per_dim[366] + HV_bits_per_dim[367] + HV_bits_per_dim[368] + HV_bits_per_dim[369] + 
        HV_bits_per_dim[370] + HV_bits_per_dim[371] + HV_bits_per_dim[372] + HV_bits_per_dim[373] + HV_bits_per_dim[374] + 
        HV_bits_per_dim[375] + HV_bits_per_dim[376] + HV_bits_per_dim[377] + HV_bits_per_dim[378] + HV_bits_per_dim[379] + 
        HV_bits_per_dim[380] + HV_bits_per_dim[381] + HV_bits_per_dim[382] + HV_bits_per_dim[383] + HV_bits_per_dim[384] + 
        HV_bits_per_dim[385] + HV_bits_per_dim[386] + HV_bits_per_dim[387] + HV_bits_per_dim[388] + HV_bits_per_dim[389] + 
        HV_bits_per_dim[390] + HV_bits_per_dim[391] + HV_bits_per_dim[392] + HV_bits_per_dim[393] + HV_bits_per_dim[394] + 
        HV_bits_per_dim[395] + HV_bits_per_dim[396] + HV_bits_per_dim[397] + HV_bits_per_dim[398] + HV_bits_per_dim[399] + 
        HV_bits_per_dim[400] + HV_bits_per_dim[401] + HV_bits_per_dim[402] + HV_bits_per_dim[403] + HV_bits_per_dim[404] + 
        HV_bits_per_dim[405] + HV_bits_per_dim[406] + HV_bits_per_dim[407] + HV_bits_per_dim[408] + HV_bits_per_dim[409] + 
        HV_bits_per_dim[410] + HV_bits_per_dim[411] + HV_bits_per_dim[412] + HV_bits_per_dim[413] + HV_bits_per_dim[414] + 
        HV_bits_per_dim[415] + HV_bits_per_dim[416] + HV_bits_per_dim[417] + HV_bits_per_dim[418] + HV_bits_per_dim[419] + 
        HV_bits_per_dim[420] + HV_bits_per_dim[421] + HV_bits_per_dim[422] + HV_bits_per_dim[423] + HV_bits_per_dim[424] + 
        HV_bits_per_dim[425] + HV_bits_per_dim[426] + HV_bits_per_dim[427] + HV_bits_per_dim[428] + HV_bits_per_dim[429] + 
        HV_bits_per_dim[430] + HV_bits_per_dim[431] + HV_bits_per_dim[432] + HV_bits_per_dim[433] + HV_bits_per_dim[434] + 
        HV_bits_per_dim[435] + HV_bits_per_dim[436] + HV_bits_per_dim[437] + HV_bits_per_dim[438] + HV_bits_per_dim[439] + 
        HV_bits_per_dim[440] + HV_bits_per_dim[441] + HV_bits_per_dim[442] + HV_bits_per_dim[443] + HV_bits_per_dim[444] + 
        HV_bits_per_dim[445] + HV_bits_per_dim[446] + HV_bits_per_dim[447] + HV_bits_per_dim[448] + HV_bits_per_dim[449] + 
        HV_bits_per_dim[450] + HV_bits_per_dim[451] + HV_bits_per_dim[452] + HV_bits_per_dim[453] + HV_bits_per_dim[454] + 
        HV_bits_per_dim[455] + HV_bits_per_dim[456] + HV_bits_per_dim[457] + HV_bits_per_dim[458] + HV_bits_per_dim[459] + 
        HV_bits_per_dim[460] + HV_bits_per_dim[461] + HV_bits_per_dim[462] + HV_bits_per_dim[463] + HV_bits_per_dim[464] + 
        HV_bits_per_dim[465] + HV_bits_per_dim[466] + HV_bits_per_dim[467] + HV_bits_per_dim[468] + HV_bits_per_dim[469] + 
        HV_bits_per_dim[470] + HV_bits_per_dim[471] + HV_bits_per_dim[472] + HV_bits_per_dim[473] + HV_bits_per_dim[474] + 
        HV_bits_per_dim[475] + HV_bits_per_dim[476] + HV_bits_per_dim[477] + HV_bits_per_dim[478] + HV_bits_per_dim[479] + 
        HV_bits_per_dim[480] + HV_bits_per_dim[481] + HV_bits_per_dim[482] + HV_bits_per_dim[483] + HV_bits_per_dim[484] + 
        HV_bits_per_dim[485] + HV_bits_per_dim[486] + HV_bits_per_dim[487] + HV_bits_per_dim[488] + HV_bits_per_dim[489] + 
        HV_bits_per_dim[490] + HV_bits_per_dim[491] + HV_bits_per_dim[492] + HV_bits_per_dim[493] + HV_bits_per_dim[494] + 
        HV_bits_per_dim[495] + HV_bits_per_dim[496] + HV_bits_per_dim[497] + HV_bits_per_dim[498] + HV_bits_per_dim[499] + 
        HV_bits_per_dim[500] + HV_bits_per_dim[501] + HV_bits_per_dim[502] + HV_bits_per_dim[503] + HV_bits_per_dim[504] + 
        HV_bits_per_dim[505] + HV_bits_per_dim[506] + HV_bits_per_dim[507] + HV_bits_per_dim[508] + HV_bits_per_dim[509] + 
        HV_bits_per_dim[510] + HV_bits_per_dim[511] + HV_bits_per_dim[512] + HV_bits_per_dim[513] + HV_bits_per_dim[514] + 
        HV_bits_per_dim[515] + HV_bits_per_dim[516] + HV_bits_per_dim[517] + HV_bits_per_dim[518] + HV_bits_per_dim[519] + 
        HV_bits_per_dim[520] + HV_bits_per_dim[521] + HV_bits_per_dim[522] + HV_bits_per_dim[523] + HV_bits_per_dim[524] + 
        HV_bits_per_dim[525] + HV_bits_per_dim[526] + HV_bits_per_dim[527] + HV_bits_per_dim[528] + HV_bits_per_dim[529] + 
        HV_bits_per_dim[530] + HV_bits_per_dim[531] + HV_bits_per_dim[532] + HV_bits_per_dim[533] + HV_bits_per_dim[534] + 
        HV_bits_per_dim[535] + HV_bits_per_dim[536] + HV_bits_per_dim[537] + HV_bits_per_dim[538] + HV_bits_per_dim[539] + 
        HV_bits_per_dim[540] + HV_bits_per_dim[541] + HV_bits_per_dim[542] + HV_bits_per_dim[543] + HV_bits_per_dim[544] + 
        HV_bits_per_dim[545] + HV_bits_per_dim[546] + HV_bits_per_dim[547] + HV_bits_per_dim[548] + HV_bits_per_dim[549] + 
        HV_bits_per_dim[550] + HV_bits_per_dim[551] + HV_bits_per_dim[552] + HV_bits_per_dim[553] + HV_bits_per_dim[554] + 
        HV_bits_per_dim[555] + HV_bits_per_dim[556] + HV_bits_per_dim[557] + HV_bits_per_dim[558] + HV_bits_per_dim[559] + 
        HV_bits_per_dim[560] + HV_bits_per_dim[561] + HV_bits_per_dim[562] + HV_bits_per_dim[563] + HV_bits_per_dim[564] + 
        HV_bits_per_dim[565] + HV_bits_per_dim[566] + HV_bits_per_dim[567] + HV_bits_per_dim[568] + HV_bits_per_dim[569] + 
        HV_bits_per_dim[570] + HV_bits_per_dim[571] + HV_bits_per_dim[572] + HV_bits_per_dim[573] + HV_bits_per_dim[574] + 
        HV_bits_per_dim[575] + HV_bits_per_dim[576] + HV_bits_per_dim[577] + HV_bits_per_dim[578] + HV_bits_per_dim[579] + 
        HV_bits_per_dim[580] + HV_bits_per_dim[581] + HV_bits_per_dim[582] + HV_bits_per_dim[583] + HV_bits_per_dim[584] + 
        HV_bits_per_dim[585] + HV_bits_per_dim[586] + HV_bits_per_dim[587] + HV_bits_per_dim[588] + HV_bits_per_dim[589] + 
        HV_bits_per_dim[590] + HV_bits_per_dim[591] + HV_bits_per_dim[592] + HV_bits_per_dim[593] + HV_bits_per_dim[594] + 
        HV_bits_per_dim[595] + HV_bits_per_dim[596] + HV_bits_per_dim[597] + HV_bits_per_dim[598] + HV_bits_per_dim[599] + 
        HV_bits_per_dim[600] + HV_bits_per_dim[601] + HV_bits_per_dim[602] + HV_bits_per_dim[603] + HV_bits_per_dim[604] + 
        HV_bits_per_dim[605] + HV_bits_per_dim[606] + HV_bits_per_dim[607] + HV_bits_per_dim[608] + HV_bits_per_dim[609] + 
        HV_bits_per_dim[610] + HV_bits_per_dim[611] + HV_bits_per_dim[612] + HV_bits_per_dim[613] + HV_bits_per_dim[614] + 
        HV_bits_per_dim[615] + HV_bits_per_dim[616];

 
    // comparator
    always_ff @(posedge clk or negedge nrst) begin
        if (!nrst) begin
           thresholded_bit <= 1'b0;
        end 
        else begin
            if (en) begin
                if(start_acc_thr) begin
                    thresholded_bit <= (accumulated_sum >= ENCODING_BIT_THR);
                end 
                else begin
                    thresholded_bit <= thresholded_bit;
                end
            end 
            else begin
                thresholded_bit <= thresholded_bit;
            end
        end      
    end   
            
endmodule  