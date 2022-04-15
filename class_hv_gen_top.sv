`include "class_bundler.sv"
`include "class_thresholder.sv"
`include "class_fsm.sv"
`include "nonbinary_class_reg.sv"
`include "binary_class_reg.sv"

module class_hv_gen_top(
    input wire clk,
    input wire nrst,
    input wire en,
    input wire start_class_gen,
    input wire training_hdc_model,
    input wire training_dataset_finished,       // assert (6,238*10) CCs after start_class_gen = 1  
    input wire [HV_DIM-1:0] encoded_hv,
    input wire [4:0] class_select_bits,
    output wire [SEQ_CYCLE_COUNT-1:0][DIMS_PER_CC-1:0] bin_class_hvs [0:25],
    output wire class_gen_done
    );
    
    // FSM internal signals
    wire [3:0] nonbin_ctr;
    wire [3:0] bin_ctr;
    wire [3:0] class_hv_gen_ctr;
    wire [4:0] binarized_class_counter;
    wire adjusting_nonbin_class_hvs;
    wire binarizing_class_hvs;
    
    // Bundler internal signals
    logic [DIMS_PER_CC-1:0] input_hv_chunk;
    
    // nonbinary_class_reg internal signals
    wire [DIMS_PER_CC-1:0][BITWIDTH_PER_DIM-1:0] nonbin_class_reg_out;
    wire [DIMS_PER_CC-1:0][BITWIDTH_PER_DIM-1:0] nonbin_class_reg_in;
    
    // binary_class_reg internal signals
    wire [DIMS_PER_CC-1:0] bin_class_reg_in;

    
    // instantiate fsm
    class_fsm C_FSM_1(
        .clk(clk),
        .nrst(nrst),
        .en(en),
        .start_class_gen(start_class_gen),
        .training_hdc_model(training_hdc_model),
        .training_dataset_finished(training_dataset_finished),
        .nonbin_ctr(nonbin_ctr),
        .bin_ctr(bin_ctr),
        .class_hv_gen_ctr(class_hv_gen_ctr),
        .binarized_class_counter(binarized_class_counter),
        .adjusting_nonbin_class_hvs(adjusting_nonbin_class_hvs),
        .binarizing_class_hvs(binarizing_class_hvs),
        .class_gen_done(class_gen_done)
    );
    
    // instantiate class_bundler
    class_bundler C_BUNDLE_1(
        .input_hv_chunk(input_hv_chunk),
        .stored_hv_chunk(nonbin_class_reg_out),
        .sum(nonbin_class_reg_in)
    );
    
    // instantiate class_thresholder
    class_thresholder C_THR_1(
        .clk(clk),
        .nrst(nrst),
        .en(en),
        .binarizing_class_hvs(binarizing_class_hvs),
        .nonbin_class_reg_out(nonbin_class_reg_out),
        .thresholded_hv(bin_class_reg_in)
    );
    
    // instantiate nonbinary_class_reg
    nonbinary_class_reg NONBIN_CLASS_1(
        .clk(clk),
        .nrst(nrst),
        .en(en),
        .adjusting_nonbin_class_hvs(adjusting_nonbin_class_hvs),
        .class_select_bits(class_select_bits),
        .nonbin_ctr(nonbin_ctr),
        .class_hv_gen_ctr(class_hv_gen_ctr),
        .nonbin_class_reg_in(nonbin_class_reg_in),
        .nonbin_class_reg_out(nonbin_class_reg_out)
    );
    
    // instantiate binary_class_reg
    binary_class_reg BIN_CLASS_1(
        .clk(clk),
        .nrst(nrst),
        .en(en),
        .binarizing_class_hvs(binarizing_class_hvs),
        .class_select_bits(binarized_class_counter),
        .bin_ctr(bin_ctr),
        .bin_class_reg_in(bin_class_reg_in),
        .bin_class_hvs(bin_class_hvs)
    );
    
    // input mux
    always_comb begin
        case(nonbin_ctr)
            4'd0: input_hv_chunk = encoded_hv[7:0];                         // extend to 500 later
            4'd1: input_hv_chunk = encoded_hv[15:8];
            4'd2: input_hv_chunk = encoded_hv[23:16];
            4'd3: input_hv_chunk = encoded_hv[31:24];
            4'd4: input_hv_chunk = encoded_hv[39:32];
            4'd5: input_hv_chunk = encoded_hv[47:40];
            4'd6: input_hv_chunk = encoded_hv[55:48];
            4'd7: input_hv_chunk = encoded_hv[63:56];
            4'd8: input_hv_chunk = encoded_hv[71:64];
            default: input_hv_chunk = encoded_hv[79:72];
        endcase
    end   
    
endmodule
