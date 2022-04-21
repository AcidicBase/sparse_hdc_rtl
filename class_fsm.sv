module class_fsm(
    input wire clk,
    input wire nrst,
    input wire en,
    input wire start_class_gen,
    input wire training_dataset_finished,       // assert (6,238*10) CCs after start_class_gen = 1
    output logic [3:0] nonbin_ctr,
    output logic [3:0] bin_ctr,
    output logic [3:0] class_hv_gen_ctr,
    output logic [4:0] binarized_class_counter,
    output logic adjusting_nonbin_class_hvs,
    output logic binarizing_class_hvs,
    output logic class_gen_done
    );
       
    wire binarizing_done;  
    
    
    typedef enum logic [1:0] {S_IDLE, S_TRAIN_NONBIN, S_BINARIZE, S_CLASS_DONE} STATE;
    STATE state;  
                
    // state transition
    always_ff @(posedge clk or negedge nrst) begin
        if (!nrst) begin
            state <= S_IDLE;
        end
        else begin
            case(state) 
                S_IDLE:
                    if (en) begin        
                        if(training_dataset_finished) begin
                            state <= S_BINARIZE;
                        end
                        else if(start_class_gen) begin
                            state <= S_TRAIN_NONBIN;
                        end
                        else begin
                            state <= S_IDLE;
                        end              
                    end
                    else begin
                        state <= S_IDLE;
                    end                
                S_TRAIN_NONBIN: 
                    if(nonbin_ctr == SEQ_CYCLE_COUNT-1) begin         
                        state <= S_IDLE;
                    end 
                    else begin
                        state <= S_TRAIN_NONBIN;
                    end                  
                S_BINARIZE: 
                    if(binarizing_done) begin         
                        state <= S_CLASS_DONE;
                    end 
                    else begin
                        state <= S_BINARIZE;
                    end                            
                default:   state <= S_IDLE; 
            endcase
        end 
    end 
        
    // output control signals (fully comb.)
    always_comb begin
        case(state)    
            S_IDLE:         {adjusting_nonbin_class_hvs, binarizing_class_hvs, class_gen_done} = {1'b0, 1'b0, 1'b0};
            S_TRAIN_NONBIN: {adjusting_nonbin_class_hvs, binarizing_class_hvs, class_gen_done} = {1'b1, 1'b0, 1'b0};
            S_BINARIZE:     {adjusting_nonbin_class_hvs, binarizing_class_hvs, class_gen_done} = {1'b0, 1'b1, 1'b0};
            default:        {adjusting_nonbin_class_hvs, binarizing_class_hvs, class_gen_done} = {1'b0, 1'b0, 1'b1};
        endcase
    end
     
    // update nonbin_ctr (select bit of all nonbinary class DEMUX) 
    always_ff @(posedge clk or negedge nrst) begin
        if (!nrst) begin
           nonbin_ctr <= 0;
        end      
        else if((state == S_TRAIN_NONBIN) && en) begin 
            if (nonbin_ctr < SEQ_CYCLE_COUNT-1) begin
                nonbin_ctr <= nonbin_ctr + 1;               // count from 0 to 9                                  
            end 
            else begin
                nonbin_ctr <= 0;                            // reset counter to 0
            end
        end
        else begin
            nonbin_ctr <= 0;
        end    
    end  
    
    // update bin_ctr (select bit of all binary class DEMUX) 
    always_ff @(posedge clk or negedge nrst) begin
        if (!nrst) begin
           bin_ctr <= 0;
        end      
        else if((state == S_BINARIZE) && en) begin 
            if (bin_ctr < SEQ_CYCLE_COUNT-1) begin
                bin_ctr <= bin_ctr + 1;     // count from 0 to 9                                  
            end 
            else begin
                bin_ctr <= 0;               // reset counter to 0
            end
        end
        else begin
            bin_ctr <= 0;
        end    
    end  
    
    // update class_hv_gen_ctr (select bit of all nonbinary MUX)   
    always_ff @(posedge clk or negedge nrst) begin
        if (!nrst) begin
           class_hv_gen_ctr <= 0;
        end      
        else if(((state == S_TRAIN_NONBIN) || (state == S_BINARIZE)) && en) begin 
            if (class_hv_gen_ctr < SEQ_CYCLE_COUNT-1) begin
                class_hv_gen_ctr <= class_hv_gen_ctr + 1;     // count from 0 to 9                                  
            end 
            else begin
                class_hv_gen_ctr <= 0;               // reset counter to 0
            end
        end
        else begin
            class_hv_gen_ctr <= 0;
        end    
    end     

    // update binarized_class_counter (counts from 0 to 25) 
    always_ff @(posedge clk or negedge nrst) begin
        if (!nrst) begin
           binarized_class_counter <= 0;
        end      
        else if((state == S_BINARIZE) && en) begin
            if (bin_ctr == SEQ_CYCLE_COUNT-1) begin              // if ctr == 9, increment
                binarized_class_counter <= binarized_class_counter + 1;
            end
            else begin 
                binarized_class_counter <= binarized_class_counter;
            end
        end           
        else begin
            binarized_class_counter <= 0;
        end        
    end      
    
    // update binarizing_done (after 26 iterations, all nonbinary class hvs have already been binarized)  
    assign binarizing_done = ((binarized_class_counter == 25) && (bin_ctr == SEQ_CYCLE_COUNT-1)) ? 1'b1 : 1'b0;
    
endmodule
