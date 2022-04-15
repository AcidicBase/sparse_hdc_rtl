// General params
parameter integer HV_DIM = 80;                                     // change to 5k
parameter integer FEATURE_COUNT = 40;                              // change to 617
parameter integer FEATURES_PER_CC = 4;                             // change to 62
parameter integer SEQ_CYCLE_COUNT = 10;    
parameter integer DIMS_PER_CC = 8;                                 // change to 500                                        
parameter integer M = 10;

// Encoding params
parameter integer ENCODING_BIT_THR = 14;                          // minimum bits to get 1

// Class HV gen params
parameter integer CLASS_BIT_THR = 4;                              // change to 40
parameter integer BITWIDTH_PER_DIM = 9;                           // 2^9 = 512 max value per dimension per class hv

// Testbench
parameter integer TRAINING_DATAPOINTS_COUNT = 26;                 // change to 6238
parameter integer TESTING_DATAPOINTS_COUNT  = 26;                 // change to 1559