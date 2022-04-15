module oneshot_fsm(
    input wire clk,
    input wire nrst,
    input wire en,
    input wire start_mapping,
    input wire training_dataset_finished,
    input wire testing_dataset_finished,
    output logic training_hdc_model,
    output logic testing_hdc_model,
    output logic oneshot_hdc_done
    );
    
    typedef enum logic [1:0] {S_IDLE, S_TRAIN, S_TEST, S_HDC_DONE} STATE;
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
                        state <= S_TRAIN;
                    end
                    else begin
                        state <= S_IDLE;
                    end
                S_TRAIN: 
                    if(training_dataset_finished) begin         
                        state <= S_TEST;
                    end 
                    else begin
                        state <= S_TRAIN;
                    end  
                S_TEST:    
                    if(testing_dataset_finished) begin
                        state <= S_HDC_DONE;
                    end
                    else begin
                        state <= S_TEST;
                    end   
               default:   state <= S_IDLE;          
            endcase
        end 
    end 
        
    // output control signals (fully comb.)
    always_comb begin
        case(state)    
            S_IDLE:  {training_hdc_model, testing_hdc_model, oneshot_hdc_done} = {1'b0, 1'b0, 1'b0};
            S_TRAIN: {training_hdc_model, testing_hdc_model, oneshot_hdc_done} = {1'b1, 1'b0, 1'b0};
            S_TEST:  {training_hdc_model, testing_hdc_model, oneshot_hdc_done} = {1'b0, 1'b1, 1'b0};
            default: {training_hdc_model, testing_hdc_model, oneshot_hdc_done} = {1'b0, 1'b0, 1'b1};
        endcase
    end    

endmodule
