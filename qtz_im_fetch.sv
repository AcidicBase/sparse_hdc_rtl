module qtz_im_fetch(
    input wire [3:0] qlevel,
    input wire [HV_DIM-1:0] im_hvs [0:M-1],
    output logic [HV_DIM-1:0] level_hv
    ); 
  
    always_comb begin
        case(qlevel)
            0       : level_hv = im_hvs[0];
            1       : level_hv = im_hvs[1];
            2       : level_hv = im_hvs[2];
            3       : level_hv = im_hvs[3];
            4       : level_hv = im_hvs[4];
            5       : level_hv = im_hvs[5];
            6       : level_hv = im_hvs[6];
            7       : level_hv = im_hvs[7];
            8       : level_hv = im_hvs[8];
            default : level_hv = im_hvs[9];
        endcase
    end
  
  endmodule
