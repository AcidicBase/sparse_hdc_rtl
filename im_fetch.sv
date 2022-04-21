module im_fetch(
    input wire nrst,
    input wire en,
    input wire [3:0] qlevel,
    input wire [HV_DIM-1:0] im1,
    input wire [HV_DIM-1:0] im2,
    input wire [HV_DIM-1:0] im3,
    input wire [HV_DIM-1:0] im4,
    input wire [HV_DIM-1:0] im5,
    input wire [HV_DIM-1:0] im6,
    input wire [HV_DIM-1:0] im7,
    input wire [HV_DIM-1:0] im8,
    input wire [HV_DIM-1:0] im9,
    input wire [HV_DIM-1:0] im10,
    output logic [HV_DIM-1:0] level_hv
    ); 
  
    always_comb begin
        if (!nrst)
            level_hv = 5000'b0;
        else begin
            if(en) begin
                case(qlevel)
                    1 : level_hv = im1;
                    2 : level_hv = im2;
                    3 : level_hv = im3;
                    4 : level_hv = im4;
                    5 : level_hv = im5;
                    6 : level_hv = im6;
                    7 : level_hv = im7;
                    8 : level_hv = im8;
                    9 : level_hv = im9;
                   10 : level_hv = im10;
                   default : level_hv = 5000'b0;
                endcase
            end
            else begin
                level_hv = level_hv;
            end
        end
    end
  
  endmodule
