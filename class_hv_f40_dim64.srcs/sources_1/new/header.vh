// General params
parameter integer HV_DIM = 80;                                                        // change to 5k
parameter integer FEATURE_COUNT = 40;                                                 // change to 617
parameter integer SEQ_CYCLE_COUNT = 10; 
                                            
// Class submodule
parameter integer DIMS_PER_CC = 8;                                                   // same with BUNDLE_COUNT; 7x10 > 64; change to 500 or 512 later.
parameter integer CLASS_BIT_THR = 4;                                                 // change to 40
parameter integer BITWIDTH_PER_DIM = 9;                                              // 2^9 = 512 max value per dimension per class hv

// Testbench 
parameter integer TRAINING_DATAPOINTS_COUNT = 26;                                    // change to 6238