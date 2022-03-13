`include "header.vh"
`include "binder.sv"
`include "bundler.sv"  
`include "fsm_control.sv"
  
module encoding_top(
    input wire clk, 
    input wire nrst, 
    input wire en, 
    input wire start_encoding,
    input wire [HV_DIM-1:0] level_HVs [0:FEATURE_COUNT-1],
    output wire encoding_done,
    output wire [HV_DIM-1:0] encoded_HV
    );
    
    wire start_binding;
    wire start_bundling;
    wire [3:0] ctr;
    wire [HV_DIM-1:0] shifted_hvs [0:FEATURE_COUNT-1];                     // for the binders' outputs
    logic [FEATURE_COUNT-1:0] bits_to_bundle_arr [0:HV_DIM-1];               // for the bundlers' inputs
    
    //instantiate FSM
    fsm_control FSM_CONTROL_0(
        .clk(clk),
        .nrst(nrst),
        .en(en),
        .start_encoding(start_encoding),
        .start_binding(start_binding),
        .start_bundling(start_bundling),
        .ctr(ctr),
        .encoding_done(encoding_done)
    );  
       
       
    // ayusin yung shift values      
    //instantiate FEATURE_COUNT=40 binders 
    generate
        genvar i;
            for (i = 0; i < FEATURE_COUNT; i++) begin : binders
                binder #(.SHIFT(SHIFTS[i])) DUT_BINDER(
                    .clk(clk),
                    .nrst(nrst),
                    .en(en),
                    .start_binding(start_binding),
                    .level_hv(level_HVs[i]),
                    .shifted_hv(shifted_hvs[i])
                );
            end
    endgenerate                
                     
    //instantiate bundlers   
    generate
        genvar j;
            for (j = 0; j < HV_DIM; j++) begin : bundlers
               bundler DUT_BUNDLER(
                   .clk(clk),
                   .nrst(nrst),
                   .en(en),
                   .start_bundling(start_bundling),
                   .bits_to_bundle(bits_to_bundle_arr[j]), 
                   .sel(ctr),  
                   .thresholded_bit(encoded_HV[j])
                ); 
            end
    endgenerate 
             
    // bits_to_bundle_arr assignment
    // Possible ba na gawing always_ff na lang to, like wala nang bits_to_bundle_arr na array
    // Kasi sequential lang naman mga bagay-bagay, di ba?
    always_comb begin
        for (int j = 0; j < HV_DIM; j++) begin  // extend to 617 later
            bits_to_bundle_arr[j] = {
                shifted_hvs[0][j], shifted_hvs[1][j],shifted_hvs[2][j], shifted_hvs[3][j], shifted_hvs[4][j],
                shifted_hvs[5][j], shifted_hvs[6][j],shifted_hvs[7][j], shifted_hvs[8][j], shifted_hvs[9][j],
                shifted_hvs[10][j], shifted_hvs[11][j],shifted_hvs[12][j], shifted_hvs[13][j], shifted_hvs[14][j],
                shifted_hvs[15][j], shifted_hvs[16][j],shifted_hvs[17][j], shifted_hvs[18][j], shifted_hvs[19][j],
                shifted_hvs[20][j], shifted_hvs[21][j],shifted_hvs[22][j], shifted_hvs[23][j], shifted_hvs[24][j],
                shifted_hvs[25][j], shifted_hvs[26][j],shifted_hvs[27][j], shifted_hvs[28][j], shifted_hvs[29][j],
                shifted_hvs[30][j], shifted_hvs[31][j],shifted_hvs[32][j], shifted_hvs[33][j], shifted_hvs[34][j],
                shifted_hvs[35][j], shifted_hvs[36][j],shifted_hvs[37][j], shifted_hvs[38][j], shifted_hvs[39][j]        
            };
        end
    end
                 
 endmodule