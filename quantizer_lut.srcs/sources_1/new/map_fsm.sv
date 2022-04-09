module map_fsm(
    input wire clk,
    input wire nrst,
    input wire en,
    input wire start_mapping,
    output logic [3:0] ctr,
    output logic mapping_done
    );
      
    wire hv_fetch_done;  
      
    typedef enum logic [1:0] {S_IDLE, S_MAP, S_MAP_DONE} STATE;
    STATE state; 
                
    // state transition
    always_ff @(posedge clk or negedge nrst) begin
        if (!nrst) begin
            state <= S_IDLE;
        end
        else begin
            case(state) 
                S_IDLE:
                    if(start_mapping && en) begin
                        state <= S_MAP;
                    end
                    else begin
                        state <= S_IDLE;
                    end 
                S_MAP: 
                    if(hv_fetch_done) begin         
                        state <= S_MAP_DONE;
                    end 
                    else begin
                        state <= S_MAP;
                    end            
                default:   state <= S_IDLE; 
            endcase
        end 
     end 
          
     
     // output control signals (fully comb.)
     always_comb begin
        case(state)
            S_IDLE:  mapping_done = 0;          
            S_MAP:   mapping_done = 0;
            default: mapping_done = 1;      
        endcase
     end
     
    // update bundling_done    
    assign hv_fetch_done = (ctr == SEQ_CYCLE_COUNT-1) ? 1'b1 : 1'b0;
     
     // update ctr (select-bit of  MUX & DEMUX) 
     always_ff @(posedge clk or negedge nrst) begin
        if (!nrst) begin
           ctr <= 0;
        end 
        else begin
            if((state == S_MAP) && en) begin                   
                ctr <= ctr + 1;
            end
            else begin                    
                ctr <= 0;
            end 
        end      
    end    
          
endmodule
