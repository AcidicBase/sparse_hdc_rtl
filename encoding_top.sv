`include "header_shift_vals.vh"
`include "binder.sv"
`include "bundler.sv"  
`include "fsm_control.sv"
  
module encoding_top(
    input wire clk, 
    input wire nrst, 
    input wire en, 
    input wire start_encoding,
    input wire [HV_DIM-1:0] level_hvs [0:FEATURE_COUNT-1],
    output wire encoding_done,
    output logic [HV_DIM-1:0] encoded_hv
    );
    
    wire start_binding;
    wire [3:0] ctr;
    wire [HV_DIM-1:0] shifted_hvs [0:FEATURE_COUNT-1];
    logic [FEATURE_COUNT-1:0] bits_to_bundle_arr [0:HV_DIM-1];
    
    // for mux & demux 
    logic [FEATURE_COUNT-1:0] mux_out [0:DIMS_PER_CC-1];
    wire [DIMS_PER_CC-1:0] thresholded_bits ;
    
    //instantiate FSM
    fsm_control FSM_CONTROL_0(
        .clk(clk),
        .nrst(nrst),
        .en(en),
        .start_encoding(start_encoding),
        .start_binding(start_binding),
        .ctr(ctr),
        .encoding_done(encoding_done)
    );  
         
    //instantiate FEATURE_COUNT=40 binders 
    for (genvar i = 0; i < FEATURE_COUNT; i++) begin : binders
        binder #(.SHIFT(SHIFTS[i]))
        DUT_BINDER(
            .clk(clk),
            .nrst(nrst),
            .en(en),
            .start_binding(start_binding),
            .level_hv(level_hvs[i]),
            .shifted_hv(shifted_hvs[i])
        );
    end            
                     
    // instantiate DIMS_PER_CC=8 bundlers   
    for (genvar j = 0; j < DIMS_PER_CC; j++) begin : bundlers
       bundler DUT_BUNDLER(
           .bits_to_bundle(mux_out[j]), 
           .thresholded_bit(thresholded_bits[j])
        ); 
    end
 
    // input mux for bundlers
    always_comb begin
        case(ctr)
            4'd0:    mux_out = bits_to_bundle_arr[0:7];                          // change to bits_to_bundle_arr[0:61] if F = 617
            4'd1:    mux_out = bits_to_bundle_arr[8:15];
            4'd2:    mux_out = bits_to_bundle_arr[16:23];
            4'd3:    mux_out = bits_to_bundle_arr[24:31];
            4'd4:    mux_out = bits_to_bundle_arr[32:39];
            4'd5:    mux_out = bits_to_bundle_arr[40:47];
            4'd6:    mux_out = bits_to_bundle_arr[48:55];
            4'd7:    mux_out = bits_to_bundle_arr[56:63];
            4'd8:    mux_out = bits_to_bundle_arr[64:71];
            default: mux_out = bits_to_bundle_arr[72:79];
        endcase
    end 
    
    // output demux for bundlers
    always_ff @(posedge clk or negedge nrst) begin
        if (!nrst) begin
            encoded_hv <= 0;
        end    
        else if (en) begin
            case(ctr) 
                4'd0:    encoded_hv[7:0]   <= thresholded_bits;         // change to input_values[63:0] if F = 617
                4'd1:    encoded_hv[15:8]  <= thresholded_bits;
                4'd2:    encoded_hv[23:16] <= thresholded_bits;
                4'd3:    encoded_hv[31:24] <= thresholded_bits;
                4'd4:    encoded_hv[39:32] <= thresholded_bits;
                4'd5:    encoded_hv[47:40] <= thresholded_bits;
                4'd6:    encoded_hv[55:48] <= thresholded_bits;
                4'd7:    encoded_hv[63:56] <= thresholded_bits;
                4'd8:    encoded_hv[71:64] <= thresholded_bits;
                4'd9:    encoded_hv[79:72]    <= thresholded_bits;
                default: encoded_hv <= encoded_hv;    
            endcase
        end 
        else begin
            encoded_hv <= encoded_hv;
        end
    end 
         
    // bits_to_bundle_arr assignment
    always_comb begin
        for (int j = 0; j < HV_DIM; j++) begin                                      // extend to 617 later; make this sequential
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