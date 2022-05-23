set_db init_lib_search_path /cad/tools/st/cmos28fdsoi_13a/C28SOI_SC_12_CORE_LL/5.1-06.82/libs
set_db script_search_path hdc_dryrun/hdc_dryrun
set_db init_hdl_search_path hdc_dryrun/hdc_dryrun
set_db library C28SOI_SC_12_CORE_LL_tt28_1.00V_0.00V_0.00V_0.00V_25C.lib.gz
#set_db lp_insert_clock_gating true
#set_db lp_insert_discrete_clock_gating_logic true
set_db hdl_track_filename_row_col true
set_db lp_power_unit nW
read_hdl -sv { header.vh header_shift_vals.vh am_fsm.sv am_and_array.sv am_tree_adder.sv am_tree_comparator.sv class_bundler.sv class_thresholder.sv class_fsm.sv class_reg_nonbin.sv class_reg_bin.sv class_mux_in.sv enc_reg_out.sv enc_nets.sv enc_mux_in.sv enc_binder.sv enc_bundler.sv enc_fsm.sv qtz_reg_out.sv qtz_im.sv quantizer.sv qtz_im_fetch.sv qtz_mux_in.sv qtz_fsm.sv am_top.sv class_hv_gen_top.sv encoding_top.sv quantizing_top.sv oneshot_fsm.sv oneshot_hdc_top.sv}
#elaborate oneshot_hdc_top
elaborate assoc_mem_top
#constraints
set_time_unit -nanoseconds
create_clock -name {clk} -period 100.0 -waveform {0.0 50.0}
#REMOVE set_input_delay set_output_delay set_driving_cell set_load_unit and set_load if we are synthesizing the whole thing at once. These are only needed if we synthesize by parts
set_input_delay 30 -clock clk [all_inputs]
set_output_delay 50 -clock clk [all_outputs]
set_driving_cell -lib_cell C12T28SOI_LL_IVX4_P0 [all_inputs] 
set_load_unit -femtofarads
set_load 500 [all_outputs]
set_db design_power_effort low
syn_gen
syn_map
syn_opt
write_hdl > assoc_mem_top_netlist.v 
write_script > assoc_mem_top_constraints.g 
write_sdc > assoc_mem_top_constraints.sdc
write_sdf > assoc_mem_top_sdf.sdf
report_area
report_gates
report_timing
report_power
#report_clock_gating
get_db real_runtime
