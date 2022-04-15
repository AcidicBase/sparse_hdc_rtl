`include "header_lvl_hvs.vh"
`include "quantizer.sv"
`include "im_fetch.sv"
`include "map_fsm.sv"

module mapping_top(
    input wire clk,
    input wire nrst,
    input wire en,
    input wire start_mapping,
    input wire [15:0] input_values [0:FEATURE_COUNT-1],
    output wire mapping_done,
    output logic [HV_DIM-1:0] level_hvs [0:FEATURE_COUNT-1] 
    );

    wire [3:0] sel;
    wire [3:0] quantized_value_levels [0:FEATURES_PER_CC-1];
    wire [HV_DIM-1:0] im_fetch_outputs [0:FEATURES_PER_CC-1];  
    logic [HV_DIM-1:0] im_hvs [0:M-1]; 
    logic [15:0] mux_out [0:FEATURES_PER_CC-1];    

    // fsm
    map_fsm FSM_0(
        .clk(clk),
        .nrst(nrst),
        .en(en),
        .start_mapping(start_mapping),
        .ctr(sel),
        .mapping_done(mapping_done)
    ); 
    
    // quantizers  
    generate 
        genvar i;
        for (i = 0; i < FEATURES_PER_CC; i++) begin : qtzs
            quantizer QTZ(
                .nrst(nrst),
                .en(en),
                .input_value(mux_out[i]),
                .quantized_value_level(quantized_value_levels[i])
            );
        end
    endgenerate  

    // im fetch
    generate
        genvar j;
        for (j = 0; j < FEATURES_PER_CC; j++) begin : ims
            im_fetch IM(
                .nrst(nrst),
                .en(en),
                .qlevel(quantized_value_levels[j]),
                .im1(im_hvs[0]),
                .im2(im_hvs[1]),
                .im3(im_hvs[2]),
                .im4(im_hvs[3]),
                .im5(im_hvs[4]),
                .im6(im_hvs[5]),
                .im7(im_hvs[6]),
                .im8(im_hvs[7]),
                .im9(im_hvs[8]),
                .im10(im_hvs[9]),          
                .level_hv(im_fetch_outputs[j])
            );
        end
    endgenerate

    // item memory
    always_comb begin
        im_hvs[0] = `LVL_HV_1;
        im_hvs[1] = `LVL_HV_2;
        im_hvs[2] = `LVL_HV_3;
        im_hvs[3] = `LVL_HV_4;
        im_hvs[4] = `LVL_HV_5;
        im_hvs[5] = `LVL_HV_6;
        im_hvs[6] = `LVL_HV_7;
        im_hvs[7] = `LVL_HV_8;
        im_hvs[8] = `LVL_HV_9;
        im_hvs[9] = `LVL_HV_10;
    end

    // input mux  
    always_comb begin
        case(sel)
            4'd0:    mux_out = input_values[0:3];             // change to input_values[0:61] if F = 617
            4'd1:    mux_out = input_values[4:7];
            4'd2:    mux_out = input_values[8:11];
            4'd3:    mux_out = input_values[12:15];
            4'd4:    mux_out = input_values[16:19];
            4'd5:    mux_out = input_values[20:23];
            4'd6:    mux_out = input_values[24:27];
            4'd7:    mux_out = input_values[28:31];
            4'd8:    mux_out = input_values[32:35];
            default: mux_out = input_values[36:39];            
        endcase
    end 

    // output demux 
    always_ff @(posedge clk or negedge nrst) begin
        if (!nrst) begin
            for(int i = 0; i < FEATURE_COUNT; i++) begin
                level_hvs[i] = 0;
            end        
        end    
        else if (en) begin
            case(sel) 
                4'd0: level_hvs[0:3] = im_fetch_outputs;     // change to level_hvs[0:61] if F = 617                          
                4'd1: level_hvs[4:7] = im_fetch_outputs; 
                4'd2: level_hvs[8:11] = im_fetch_outputs;       
                4'd3: level_hvs[12:15] = im_fetch_outputs;
                4'd4: level_hvs[16:19] = im_fetch_outputs;                                              
                4'd5: level_hvs[20:23] = im_fetch_outputs;                                    
                4'd6: level_hvs[24:27] = im_fetch_outputs;  
                4'd7: level_hvs[28:31] = im_fetch_outputs; 
                4'd8: level_hvs[32:35] = im_fetch_outputs;
                default: level_hvs[36:39] = im_fetch_outputs; 
            endcase
        end 
        else begin
            level_hvs = level_hvs;
        end
    end 
    
endmodule