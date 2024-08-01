
`include "dump_file_agent.svh"
`include "csv_file_dump.svh"
`include "sample_agent.svh"
`include "loop_sample_agent.svh"
`include "sample_manager.svh"
`include "nodf_module_interface.svh"
`include "nodf_module_monitor.svh"
`include "pp_loop_interface.svh"
`include "pp_loop_monitor.svh"
`include "seq_loop_interface.svh"
`include "seq_loop_monitor.svh"
`timescale 1ns/1ps

// top module for dataflow related monitors
module dataflow_monitor(
input logic clock,
input logic reset,
input logic finish
);




    nodf_module_intf module_intf_1(clock,reset);
    assign module_intf_1.ap_start = AESL_inst_event_history_kernel.ap_start;
    assign module_intf_1.ap_ready = AESL_inst_event_history_kernel.ap_ready;
    assign module_intf_1.ap_done = AESL_inst_event_history_kernel.ap_done;
    assign module_intf_1.ap_continue = 1'b1;
    assign module_intf_1.finish = finish;
    csv_file_dump mstatus_csv_dumper_1;
    nodf_module_monitor module_monitor_1;
    nodf_module_intf module_intf_2(clock,reset);
    assign module_intf_2.ap_start = AESL_inst_event_history_kernel.grp_rollback_fu_426.ap_start;
    assign module_intf_2.ap_ready = AESL_inst_event_history_kernel.grp_rollback_fu_426.ap_ready;
    assign module_intf_2.ap_done = AESL_inst_event_history_kernel.grp_rollback_fu_426.ap_done;
    assign module_intf_2.ap_continue = 1'b1;
    assign module_intf_2.finish = finish;
    csv_file_dump mstatus_csv_dumper_2;
    nodf_module_monitor module_monitor_2;
    nodf_module_intf module_intf_3(clock,reset);
    assign module_intf_3.ap_start = AESL_inst_event_history_kernel.grp_rollback_fu_426.grp_rollback_Pipeline_VITIS_LOOP_35_1_fu_353.ap_start;
    assign module_intf_3.ap_ready = AESL_inst_event_history_kernel.grp_rollback_fu_426.grp_rollback_Pipeline_VITIS_LOOP_35_1_fu_353.ap_ready;
    assign module_intf_3.ap_done = AESL_inst_event_history_kernel.grp_rollback_fu_426.grp_rollback_Pipeline_VITIS_LOOP_35_1_fu_353.ap_done;
    assign module_intf_3.ap_continue = 1'b1;
    assign module_intf_3.finish = finish;
    csv_file_dump mstatus_csv_dumper_3;
    nodf_module_monitor module_monitor_3;
    nodf_module_intf module_intf_4(clock,reset);
    assign module_intf_4.ap_start = AESL_inst_event_history_kernel.grp_event_history_kernel_Pipeline_VITIS_LOOP_94_2_fu_469.ap_start;
    assign module_intf_4.ap_ready = AESL_inst_event_history_kernel.grp_event_history_kernel_Pipeline_VITIS_LOOP_94_2_fu_469.ap_ready;
    assign module_intf_4.ap_done = AESL_inst_event_history_kernel.grp_event_history_kernel_Pipeline_VITIS_LOOP_94_2_fu_469.ap_done;
    assign module_intf_4.ap_continue = 1'b1;
    assign module_intf_4.finish = finish;
    csv_file_dump mstatus_csv_dumper_4;
    nodf_module_monitor module_monitor_4;

    pp_loop_intf #(5) pp_loop_intf_1(clock,reset);
    assign pp_loop_intf_1.pre_loop_state0 = AESL_inst_event_history_kernel.grp_rollback_fu_426.grp_rollback_Pipeline_VITIS_LOOP_35_1_fu_353.ap_ST_fsm_state1;
    assign pp_loop_intf_1.pre_states_valid = 1'b1;
    assign pp_loop_intf_1.post_loop_state0 = AESL_inst_event_history_kernel.grp_rollback_fu_426.grp_rollback_Pipeline_VITIS_LOOP_35_1_fu_353.ap_ST_fsm_state5;
    assign pp_loop_intf_1.post_states_valid[0] = 1'b1;
    assign pp_loop_intf_1.post_loop_state1 = AESL_inst_event_history_kernel.grp_rollback_fu_426.grp_rollback_Pipeline_VITIS_LOOP_35_1_fu_353.ap_ST_fsm_state6;
    assign pp_loop_intf_1.post_states_valid[1] = 1'b1;
    assign pp_loop_intf_1.iter_start_state = AESL_inst_event_history_kernel.grp_rollback_fu_426.grp_rollback_Pipeline_VITIS_LOOP_35_1_fu_353.ap_ST_fsm_pp0_stage0;
    assign pp_loop_intf_1.iter_start_enable = AESL_inst_event_history_kernel.grp_rollback_fu_426.grp_rollback_Pipeline_VITIS_LOOP_35_1_fu_353.ap_enable_reg_pp0_iter0;
    assign pp_loop_intf_1.iter_start_block = AESL_inst_event_history_kernel.grp_rollback_fu_426.grp_rollback_Pipeline_VITIS_LOOP_35_1_fu_353.ap_block_pp0_stage0_subdone;
    assign pp_loop_intf_1.iter_end_state = AESL_inst_event_history_kernel.grp_rollback_fu_426.grp_rollback_Pipeline_VITIS_LOOP_35_1_fu_353.ap_ST_fsm_pp0_stage0;
    assign pp_loop_intf_1.iter_end_enable = AESL_inst_event_history_kernel.grp_rollback_fu_426.grp_rollback_Pipeline_VITIS_LOOP_35_1_fu_353.ap_enable_reg_pp0_iter1;
    assign pp_loop_intf_1.iter_end_block = AESL_inst_event_history_kernel.grp_rollback_fu_426.grp_rollback_Pipeline_VITIS_LOOP_35_1_fu_353.ap_block_pp0_stage0_subdone;
    assign pp_loop_intf_1.loop_quit_state = AESL_inst_event_history_kernel.grp_rollback_fu_426.grp_rollback_Pipeline_VITIS_LOOP_35_1_fu_353.ap_ST_fsm_pp0_stage0;
    assign pp_loop_intf_1.quit_at_end = 1'b1;
    assign pp_loop_intf_1.cur_state = AESL_inst_event_history_kernel.grp_rollback_fu_426.grp_rollback_Pipeline_VITIS_LOOP_35_1_fu_353.ap_CS_fsm;
    assign pp_loop_intf_1.finish = finish;
    csv_file_dump pp_loop_csv_dumper_1;
    pp_loop_monitor #(5) pp_loop_monitor_1;
    seq_loop_intf#(11) seq_loop_intf_1(clock,reset);
    assign seq_loop_intf_1.pre_loop_state0 = AESL_inst_event_history_kernel.ap_ST_fsm_state1;
    assign seq_loop_intf_1.pre_states_valid = 1'b1;
    assign seq_loop_intf_1.post_loop_state0 = AESL_inst_event_history_kernel.ap_ST_fsm_state5;
    assign seq_loop_intf_1.post_states_valid = 1'b1;
    assign seq_loop_intf_1.quit_loop_state0 = AESL_inst_event_history_kernel.ap_ST_fsm_state8;
    assign seq_loop_intf_1.quit_states_valid = 1'b1;
    assign seq_loop_intf_1.cur_state = AESL_inst_event_history_kernel.ap_CS_fsm;
    assign seq_loop_intf_1.iter_start_state = AESL_inst_event_history_kernel.ap_ST_fsm_state8;
    assign seq_loop_intf_1.iter_end_state0 = AESL_inst_event_history_kernel.ap_ST_fsm_state11;
    assign seq_loop_intf_1.iter_end_states_valid = 1'b1;
    assign seq_loop_intf_1.one_state_loop = 1'b0;
    assign seq_loop_intf_1.one_state_block = 1'b0;
    assign seq_loop_intf_1.finish = finish;
    csv_file_dump seq_loop_csv_dumper_1;
    seq_loop_monitor #(11) seq_loop_monitor_1;
    seq_loop_intf#(9) seq_loop_intf_2(clock,reset);
    assign seq_loop_intf_2.pre_loop_state0 = AESL_inst_event_history_kernel.grp_rollback_fu_426.ap_ST_fsm_state2;
    assign seq_loop_intf_2.pre_states_valid = 1'b1;
    assign seq_loop_intf_2.post_loop_state0 = AESL_inst_event_history_kernel.grp_rollback_fu_426.ap_ST_fsm_state9;
    assign seq_loop_intf_2.post_states_valid = 1'b1;
    assign seq_loop_intf_2.quit_loop_state0 = AESL_inst_event_history_kernel.grp_rollback_fu_426.ap_ST_fsm_state4;
    assign seq_loop_intf_2.quit_states_valid = 1'b1;
    assign seq_loop_intf_2.cur_state = AESL_inst_event_history_kernel.grp_rollback_fu_426.ap_CS_fsm;
    assign seq_loop_intf_2.iter_start_state = AESL_inst_event_history_kernel.grp_rollback_fu_426.ap_ST_fsm_state3;
    assign seq_loop_intf_2.iter_end_state0 = AESL_inst_event_history_kernel.grp_rollback_fu_426.ap_ST_fsm_state8;
    assign seq_loop_intf_2.iter_end_states_valid = 1'b1;
    assign seq_loop_intf_2.one_state_loop = 1'b0;
    assign seq_loop_intf_2.one_state_block = 1'b0;
    assign seq_loop_intf_2.finish = finish;
    csv_file_dump seq_loop_csv_dumper_2;
    seq_loop_monitor #(9) seq_loop_monitor_2;

    sample_manager sample_manager_inst;

initial begin
    sample_manager_inst = new;



    mstatus_csv_dumper_1 = new("./module_status1.csv");
    module_monitor_1 = new(module_intf_1,mstatus_csv_dumper_1);
    mstatus_csv_dumper_2 = new("./module_status2.csv");
    module_monitor_2 = new(module_intf_2,mstatus_csv_dumper_2);
    mstatus_csv_dumper_3 = new("./module_status3.csv");
    module_monitor_3 = new(module_intf_3,mstatus_csv_dumper_3);
    mstatus_csv_dumper_4 = new("./module_status4.csv");
    module_monitor_4 = new(module_intf_4,mstatus_csv_dumper_4);

    pp_loop_csv_dumper_1 = new("./pp_loop_status1.csv");
    pp_loop_monitor_1 = new(pp_loop_intf_1,pp_loop_csv_dumper_1);


    seq_loop_csv_dumper_1 = new("./seq_loop_status1.csv");
    seq_loop_monitor_1 = new(seq_loop_intf_1,seq_loop_csv_dumper_1);
    seq_loop_csv_dumper_2 = new("./seq_loop_status2.csv");
    seq_loop_monitor_2 = new(seq_loop_intf_2,seq_loop_csv_dumper_2);


    sample_manager_inst.add_one_monitor(module_monitor_1);
    sample_manager_inst.add_one_monitor(module_monitor_2);
    sample_manager_inst.add_one_monitor(module_monitor_3);
    sample_manager_inst.add_one_monitor(module_monitor_4);
    sample_manager_inst.add_one_monitor(pp_loop_monitor_1);
    sample_manager_inst.add_one_monitor(seq_loop_monitor_1);
    sample_manager_inst.add_one_monitor(seq_loop_monitor_2);
    
    fork
        sample_manager_inst.start_monitor();
        last_transaction_done;
    join
    disable fork;

    sample_manager_inst.start_dump();
end

    task last_transaction_done();
        wait(reset == 0);
        while(1) begin
            if (finish == 1'b1) begin
                @(negedge clock);
                break;
            end
            else
                @(posedge clock);
        end
    endtask


endmodule
