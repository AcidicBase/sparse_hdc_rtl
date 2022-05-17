// General params
parameter integer HV_DIM = 5000;
parameter integer FEATURE_COUNT = 617;
parameter integer FEATURES_PER_CC = 62;
parameter integer SEQ_CYCLE_COUNT = 10;    
parameter integer DIMS_PER_CC = 500;                                                         
parameter integer M = 10;

// Encoding params
parameter integer ENCODING_BIT_THR = 14;

// Class HV gen params
parameter integer CLASS_BIT_THR = 40; //1
parameter integer BITWIDTH_PER_DIM = 9;                           // 2^9 = 512 max value per dimension per class hv

// Testbench
parameter integer TRAINING_DATAPOINTS_COUNT = 6238; // 3
parameter integer TESTING_DATAPOINTS_COUNT  = 1559;  // 3
