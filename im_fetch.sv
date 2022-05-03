module im_fetch(
    input wire nrst,
    input wire en,
	input wire mapping_hv_segment,
    input wire [3:0] qlevel,
    input wire [HV_DIM-1:0] im_hvs [0:M-1],
    output logic [HV_DIM-1:0] level_hv
    ); 
  
    always_comb begin
        if (!nrst)
            level_hv = 5000'b0;
        else begin
            if(mapping_hv_segment && en) begin
                case(qlevel)
                    1 : level_hv = im_hvs[0];
                    2 : level_hv = im_hvs[1];
                    3 : level_hv = im_hvs[2];
                    4 : level_hv = im_hvs[3];
                    5 : level_hv = im_hvs[4];
                    6 : level_hv = im_hvs[5];
                    7 : level_hv = im_hvs[6];
                    8 : level_hv = im_hvs[7];
                    9 : level_hv = im_hvs[8];
                    10: level_hv = im_hvs[9];
                   default : level_hv = 5000'b0;
                endcase
            end
            else begin
                level_hv = level_hv;
            end
        end
    end
  
  endmodule
