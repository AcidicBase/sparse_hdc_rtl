module fsm_control(
    input wire clk,
    input wire nrst,
    input wire en,
    input wire start_encoding,              // change at negedge of the clk for 1 period
    output logic start_binding,
    output logic start_bundling,
    output logic [3:0] ctr,
    output logic encoding_done
    );
       
    wire bundling_done;  
    
    typedef enum logic [1:0] {S_IDLE, S_BIND, S_BUNDLE, S_ENC_DONE} STATE;
    STATE state;  
                
    // state transition
    always_ff @(posedge clk or negedge nrst) begin
        if (!nrst) begin
            state <= S_IDLE;
        end
        else begin
            case(state) 
                S_IDLE:
                    if(start_encoding && en) begin
                        state <= S_BIND;
                    end
                    else begin
                        state <= S_IDLE;
                    end
                S_BIND:   state <= S_BUNDLE;   
                S_BUNDLE: 
                    if(bundling_done) begin         
                        state <= S_ENC_DONE;
                    end 
                    else begin
                        state <= S_BUNDLE;
                    end            
                default:   state <= S_IDLE; 
            endcase
        end 
     end 
     
     // output control signals (fully comb.)
     always @(*) begin
        case(state)
            S_IDLE:     {start_binding, start_bundling, encoding_done} = {1'b0, 1'b0, 1'b0};          
            S_BIND:     {start_binding, start_bundling, encoding_done} = {1'b1, 1'b0, 1'b0};
            S_BUNDLE:   {start_binding, start_bundling, encoding_done} = {1'b0, 1'b1, 1'b0};
            default:    {start_binding, start_bundling, encoding_done} = {1'b0, 1'b0, 1'b1};      
        endcase
     end
     
     // update ctr (select-bit of the encoding MUX) 
     always_ff @(posedge clk or negedge nrst) begin
        if (!nrst) begin
           ctr <= 0;
        end 
        else begin
            if((state == S_BUNDLE) && en) begin                   
                ctr <= ctr + 1;
            end
            else begin                    
                ctr <= 0;
            end 
        end      
    end    
    
    // update bundling_done    
    assign bundling_done = (ctr == SEQ_BUNDLER_CYCLES) ? 1'b1 : 1'b0;
    
endmodule
