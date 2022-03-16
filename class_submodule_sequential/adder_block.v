`timescale 1ns / 1ps
`define THRESHOLD 30
//TODO: MAKE IT SO THAT ADDER ONLY ADDS STUFF LESS THAN THRESHOLD
module adder_block(
    input_hv_chunk,
    stored_hv_chunk,
    sum
    );
    input [4:0] input_hv_chunk; //500 wide in full-width application (10CC)
    input [39:0] stored_hv_chunk; //500*8 wide in full-width application (10CC)
    output wire [39:0] sum; //500*8 wide in full-width application (10CC)
    
    assign sum[7:0] = stored_hv_chunk[7:0] + {7'd0,input_hv_chunk[0]};
    assign sum[15:8] = stored_hv_chunk[15:8] + {7'd0,input_hv_chunk[1]};
    assign sum[23:16] = stored_hv_chunk[23:16] + {7'd0,input_hv_chunk[2]};
    assign sum[31:24] = stored_hv_chunk[31:24] + {7'd0,input_hv_chunk[3]};
    assign sum[39:32] = stored_hv_chunk[39:32] + {7'd0,input_hv_chunk[4]};
    
    
    
endmodule
