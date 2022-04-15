`include "assoc_mem_fsm.sv"
`include "am_and_array.sv"
`include "am_tree_adder.sv"
`include "am_tree_comparator.sv"
`include "am_accuracy_tally.sv"

module assoc_mem_top(
    input wire clk,
    input wire nrst,
    input wire en,
    input wire start_querying,
    input wire testing_hdc_model,
    input wire testing_dataset_finished,
    input wire [HV_DIM-1:0] query_hv,
    input wire [SEQ_CYCLE_COUNT-1:0][DIMS_PER_CC-1:0] binary_class_hvs [0:25],
    input wire [4:0] correct_class,
    output wire [4:0] class_inference,
    output wire [10:0] number_of_correct_inferences
    );
    
    // FSM signals
    wire [3:0] query_ctr;
    wire comparing_query_hv_with_class_hv;
    wire inferring_class;
    wire tallying_accuracy;
    
    // AND array output
    logic [DIMS_PER_CC-1:0] query_hv_segment;
    wire [DIMS_PER_CC-1:0] and_array_out [0:25];
    
    // Tree adder outputs
    wire [12:0] similarity_values [0:25];           // 13 bits to represent 5k-dim hvs
    
    // FSM
    assoc_mem_fsm AM_FSM_1(
        .clk(clk),
        .nrst(nrst),
        .en(en),
        .start_querying(start_querying),
        .testing_hdc_model(testing_hdc_model),
        .testing_dataset_finished(testing_dataset_finished),
        .query_ctr(query_ctr),
        .comparing_query_hv_with_class_hv(comparing_query_hv_with_class_hv),
        .inferring_class(inferring_class),
        .tallying_accuracy(tallying_accuracy)
    );
    
    // AND array
    am_and_array AM_AND1(
        .comparing_query_hv_with_class_hv(comparing_query_hv_with_class_hv),
        .query_ctr(query_ctr),
        .query_hv_segment(query_hv_segment),
        .binary_class_hvs(binary_class_hvs),
        .and_array_out(and_array_out)
    );
    
    // Tree Adders
    for (genvar i = 0; i < 26; i++) begin
        am_tree_adder AM_TREE_ADD1(
            .clk(clk),
            .nrst(nrst),
            .comparing_query_hv_with_class_hv(comparing_query_hv_with_class_hv),
            .inferring_class(inferring_class),
            .and_array_out(and_array_out[i]),
            .similarity_value(similarity_values[i])
        );
    end

    // Tree Comparator
    am_tree_comparator AM_COMP1(
        .clk(clk),
        .nrst(nrst),
        .inferring_class(inferring_class),
        .similarity_values(similarity_values),
        .class_inference(class_inference)
    );
    
    // Tally
    am_accuracy_tally TALLY_1(
        .clk(clk),
        .nrst(nrst),
        .tallying_accuracy(tallying_accuracy),
        .correct_class(correct_class),
        .class_inference(class_inference),
        .number_of_correct_inferences(number_of_correct_inferences)
    );
    
    // input mux
    always_comb begin
        case(query_ctr)
            4'd0: query_hv_segment = query_hv[7:0];                         // extend to 500 later
            4'd1: query_hv_segment = query_hv[15:8];
            4'd2: query_hv_segment = query_hv[23:16];
            4'd3: query_hv_segment = query_hv[31:24];
            4'd4: query_hv_segment = query_hv[39:32];
            4'd5: query_hv_segment = query_hv[47:40];
            4'd6: query_hv_segment = query_hv[55:48];
            4'd7: query_hv_segment = query_hv[63:56];
            4'd8: query_hv_segment = query_hv[71:64];
            default: query_hv_segment = query_hv[79:72];
        endcase
    end  

endmodule