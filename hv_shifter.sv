module hv_shifter(
    input wire clk,
    input wire nrst,
    input wire en,
    input wire start_shifting,
    input wire [HV_DIM-1:0] level_hv,
    output logic [HV_DIM-1:0] shifted_hv
    );
       
    parameter SHIFT = 1;  
         
    always_ff @(posedge clk or negedge nrst) begin
        if (!nrst) begin
            shifted_hv <= '0;                               // set all bits to 0;
        end
        else begin
            if (en) begin 
                if (start_shifting) begin
                    shifted_hv <= {level_hv[SHIFT-1:0], level_hv[HV_DIM-1:SHIFT]};
                end 
                else begin
                    shifted_hv <= shifted_hv;
                end
            end
            else begin
                shifted_hv <= shifted_hv;
            end
        end    
    end
    
endmodule