module class_reg_nonbin(
    input  wire  											clk,
    input  wire  											nrst,
    input  wire  											adjusting_nonbin_class_hvs,
	input  wire  [3:0] 										class_ctr, 
    input  wire  [3:0] 										nonbin_ctr,    
    input  wire  [DIMS_PER_CC-1:0][BITWIDTH_PER_DIM-1:0] 	nonbin_class_reg_in,
    output logic [DIMS_PER_CC-1:0][BITWIDTH_PER_DIM-1:0] 	nonbin_class_reg_out
    );  
   
    // This register holds one nonbinary class hv for training. 5000-dim x 9-bit wide.
    // Equal to "logic [9:0][499:0][8:0] nonbin_class_hvs"

    logic [SEQ_CYCLE_COUNT-1:0][DIMS_PER_CC-1:0][BITWIDTH_PER_DIM-1:0] nonbin_class_hvs;
  
    // class hvs & input nonbinary class demux
    always_ff @(posedge clk or negedge nrst) begin
        if (!nrst) begin
            nonbin_class_hvs <= '0;
        end    
        else if (adjusting_nonbin_class_hvs) begin
            case(nonbin_ctr)
                5'd0	: nonbin_class_hvs[0] <= nonbin_class_reg_in;
                5'd1	: nonbin_class_hvs[1] <= nonbin_class_reg_in;
                5'd2	: nonbin_class_hvs[2] <= nonbin_class_reg_in;
                5'd3	: nonbin_class_hvs[3] <= nonbin_class_reg_in;
                5'd4	: nonbin_class_hvs[4] <= nonbin_class_reg_in;
                5'd5	: nonbin_class_hvs[5] <= nonbin_class_reg_in;
                5'd6	: nonbin_class_hvs[6] <= nonbin_class_reg_in;
                5'd7	: nonbin_class_hvs[7] <= nonbin_class_reg_in;
                5'd8   	: nonbin_class_hvs[8] <= nonbin_class_reg_in;
                default	: nonbin_class_hvs[9] <= nonbin_class_reg_in;
            endcase            
        end 
        else begin
            nonbin_class_hvs <= nonbin_class_hvs;
        end
    end 
  
    // output nonbinary class mux 
    always_comb begin
        case(class_ctr) //class_ctr
            5'd0	: nonbin_class_reg_out = nonbin_class_hvs[0];
            5'd1	: nonbin_class_reg_out = nonbin_class_hvs[1];
            5'd2	: nonbin_class_reg_out = nonbin_class_hvs[2];
            5'd3	: nonbin_class_reg_out = nonbin_class_hvs[3];
            5'd4	: nonbin_class_reg_out = nonbin_class_hvs[4];
            5'd5	: nonbin_class_reg_out = nonbin_class_hvs[5];
            5'd6	: nonbin_class_reg_out = nonbin_class_hvs[6];
            5'd7	: nonbin_class_reg_out = nonbin_class_hvs[7];
            5'd8	: nonbin_class_reg_out = nonbin_class_hvs[8];
            default	: nonbin_class_reg_out = nonbin_class_hvs[9];
        endcase            
    end 

endmodule
