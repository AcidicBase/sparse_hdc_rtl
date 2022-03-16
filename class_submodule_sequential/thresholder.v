`timescale 1ns / 1ps

module thresholder (adder_output,thresholded_hv);
    input [39:0] adder_output; //500*8 in full width application
    output wire [4:0] thresholded_hv; //500 in full width application
    
    //FOR NOW, THRESHOLD IS 4
    assign thresholded_hv[0] = (adder_output[7:0] > 8'd3) ? 1'b1:1'b0;
    assign thresholded_hv[1] = (adder_output[15:8] > 8'd3) ? 1'b1:1'b0;
    assign thresholded_hv[2] = (adder_output[23:16] > 8'd3) ? 1'b1:1'b0;
    assign thresholded_hv[3] = (adder_output[31:24] > 8'd3) ? 1'b1:1'b0;
    assign thresholded_hv[4] = (adder_output[39:32] > 8'd3) ? 1'b1:1'b0;
endmodule