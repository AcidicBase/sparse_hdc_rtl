module binder(
    input wire clk,
    input wire nrst,
    input wire en,
    input wire start_binding,
    input wire [HV_DIM-1:0] level_hv,
    output logic [HV_DIM-1:0] shifted_hv
);

    parameter SHIFT = 1;            // default shift value; this is changed when instantiated

    always_ff @(posedge clk or negedge nrst) begin
        if (!nrst) begin
            shifted_hv <= 0;
        end
        else if ((start_binding == 1'b1) && en) begin
            shifted_hv <= {level_hv[SHIFT-1:0], level_hv[HV_DIM-1:SHIFT]};
        end
        else begin
            shifted_hv <= shifted_hv;
        end
    end

endmodule