// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
 `timescale 1ns/1ps


`define AUTOTB_DUT      event_queue_kernel
`define AUTOTB_DUT_INST AESL_inst_event_queue_kernel
`define AUTOTB_TOP      apatb_event_queue_kernel_top
`define AUTOTB_LAT_RESULT_FILE "event_queue_kernel.result.lat.rb"
`define AUTOTB_PER_RESULT_TRANS_FILE "event_queue_kernel.performance.result.transaction.xml"
`define AUTOTB_TOP_INST AESL_inst_apatb_event_queue_kernel_top
`define AUTOTB_MAX_ALLOW_LATENCY  15000000
`define AUTOTB_CLOCK_PERIOD_DIV2 2.50

`define AESL_DEPTH_op 1
`define AESL_DEPTH_event_r 1
`define AESL_DEPTH_lp_id 1
`define AESL_DEPTH_time_r 1
`define AESL_DEPTH_result_entry 1
`define AESL_DEPTH_success 1
`define AUTOTB_TVIN_op  "../tv/cdatafile/c.event_queue_kernel.autotvin_op.dat"
`define AUTOTB_TVIN_event_r  "../tv/cdatafile/c.event_queue_kernel.autotvin_event_r.dat"
`define AUTOTB_TVIN_lp_id  "../tv/cdatafile/c.event_queue_kernel.autotvin_lp_id.dat"
`define AUTOTB_TVIN_time_r  "../tv/cdatafile/c.event_queue_kernel.autotvin_time_r.dat"
`define AUTOTB_TVIN_result_entry  "../tv/cdatafile/c.event_queue_kernel.autotvin_result_entry.dat"
`define AUTOTB_TVIN_op_out_wrapc  "../tv/rtldatafile/rtl.event_queue_kernel.autotvin_op.dat"
`define AUTOTB_TVIN_event_r_out_wrapc  "../tv/rtldatafile/rtl.event_queue_kernel.autotvin_event_r.dat"
`define AUTOTB_TVIN_lp_id_out_wrapc  "../tv/rtldatafile/rtl.event_queue_kernel.autotvin_lp_id.dat"
`define AUTOTB_TVIN_time_r_out_wrapc  "../tv/rtldatafile/rtl.event_queue_kernel.autotvin_time_r.dat"
`define AUTOTB_TVIN_result_entry_out_wrapc  "../tv/rtldatafile/rtl.event_queue_kernel.autotvin_result_entry.dat"
`define AUTOTB_TVOUT_result_entry  "../tv/cdatafile/c.event_queue_kernel.autotvout_result_entry.dat"
`define AUTOTB_TVOUT_success  "../tv/cdatafile/c.event_queue_kernel.autotvout_success.dat"
`define AUTOTB_TVOUT_result_entry_out_wrapc  "../tv/rtldatafile/rtl.event_queue_kernel.autotvout_result_entry.dat"
`define AUTOTB_TVOUT_success_out_wrapc  "../tv/rtldatafile/rtl.event_queue_kernel.autotvout_success.dat"
module `AUTOTB_TOP;

parameter AUTOTB_TRANSACTION_NUM = 200;
parameter PROGRESS_TIMEOUT = 10000000;
parameter LATENCY_ESTIMATION = -1;
parameter LENGTH_op = 1;
parameter LENGTH_event_r = 1;
parameter LENGTH_lp_id = 1;
parameter LENGTH_time_r = 1;
parameter LENGTH_result_entry = 1;
parameter LENGTH_success = 1;

task read_token;
    input integer fp;
    output reg [343 : 0] token;
    integer ret;
    begin
        token = "";
        ret = 0;
        ret = $fscanf(fp,"%s",token);
    end
endtask

reg AESL_clock;
reg rst;
reg dut_rst;
reg start;
reg ce;
reg tb_continue;
wire AESL_start;
wire AESL_reset;
wire AESL_ce;
wire AESL_ready;
wire AESL_idle;
wire AESL_continue;
wire AESL_done;
reg AESL_done_delay = 0;
reg AESL_done_delay2 = 0;
reg AESL_ready_delay = 0;
wire ready;
wire ready_wire;
wire ap_start;
wire ap_done;
wire ap_continue;
wire ap_idle;
wire ap_ready;
wire [2 : 0] op;
wire  op_ap_vld;
wire [159 : 0] event_r;
wire  event_r_ap_vld;
wire [15 : 0] lp_id;
wire  lp_id_ap_vld;
wire [31 : 0] time_r;
wire  time_r_ap_vld;
wire [145 : 0] result_entry_i;
wire [145 : 0] result_entry_o;
wire  result_entry_i_ap_vld;
wire  result_entry_o_ap_vld;
wire  success;
wire  success_ap_vld;
integer done_cnt = 0;
integer AESL_ready_cnt = 0;
integer ready_cnt = 0;
reg ready_initial;
reg ready_initial_n;
reg ready_last_n;
reg ready_delay_last_n;
reg done_delay_last_n;
reg interface_done = 0;


wire ap_clk;
wire ap_rst;
wire ap_rst_n;

`AUTOTB_DUT `AUTOTB_DUT_INST(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_continue(ap_continue),
    .ap_idle(ap_idle),
    .ap_ready(ap_ready),
    .op(op),
    .op_ap_vld(op_ap_vld),
    .event_r(event_r),
    .event_r_ap_vld(event_r_ap_vld),
    .lp_id(lp_id),
    .lp_id_ap_vld(lp_id_ap_vld),
    .time_r(time_r),
    .time_r_ap_vld(time_r_ap_vld),
    .result_entry_i(result_entry_i),
    .result_entry_o(result_entry_o),
    .result_entry_i_ap_vld(result_entry_i_ap_vld),
    .result_entry_o_ap_vld(result_entry_o_ap_vld),
    .success(success),
    .success_ap_vld(success_ap_vld));

// Assignment for control signal
assign ap_clk = AESL_clock;
assign ap_rst = dut_rst;
assign ap_rst_n = ~dut_rst;
assign AESL_reset = rst;
assign ap_start = AESL_start;
assign AESL_start = start;
assign AESL_done = ap_done;
assign ap_continue = AESL_continue;
assign AESL_continue = tb_continue;
assign AESL_idle = ap_idle;
assign AESL_ready = ap_ready;
assign AESL_ce = ce;
    always @(posedge AESL_clock) begin
        if (AESL_reset) begin
        end else begin
            if (AESL_done !== 1 && AESL_done !== 0) begin
                $display("ERROR: Control signal AESL_done is invalid!");
                $finish;
            end
        end
    end
    always @(posedge AESL_clock) begin
        if (AESL_reset) begin
        end else begin
            if (AESL_ready !== 1 && AESL_ready !== 0) begin
                $display("ERROR: Control signal AESL_ready is invalid!");
                $finish;
            end
        end
    end
reg AESL_REG_op_ap_vld;
// The signal of port op
reg [2: 0] AESL_REG_op = 0;
assign op = AESL_REG_op;
assign op_ap_vld = AESL_REG_op_ap_vld;
initial begin : read_file_process_op
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [343  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    AESL_REG_op_ap_vld <= 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_op,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_op);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            AESL_REG_op_ap_vld <= 1;
            ret = $sscanf(token, "0x%x", AESL_REG_op);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
   @(posedge AESL_clock);
   AESL_REG_op_ap_vld <= 1;
end


reg AESL_REG_event_r_ap_vld;
// The signal of port event_r
reg [159: 0] AESL_REG_event_r = 0;
assign event_r = AESL_REG_event_r;
assign event_r_ap_vld = AESL_REG_event_r_ap_vld;
initial begin : read_file_process_event_r
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [343  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    AESL_REG_event_r_ap_vld <= 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_event_r,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_event_r);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            AESL_REG_event_r_ap_vld <= 1;
            ret = $sscanf(token, "0x%x", AESL_REG_event_r);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
   @(posedge AESL_clock);
   AESL_REG_event_r_ap_vld <= 1;
end


reg AESL_REG_lp_id_ap_vld;
// The signal of port lp_id
reg [15: 0] AESL_REG_lp_id = 0;
assign lp_id = AESL_REG_lp_id;
assign lp_id_ap_vld = AESL_REG_lp_id_ap_vld;
initial begin : read_file_process_lp_id
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [343  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    AESL_REG_lp_id_ap_vld <= 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_lp_id,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_lp_id);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            AESL_REG_lp_id_ap_vld <= 1;
            ret = $sscanf(token, "0x%x", AESL_REG_lp_id);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
   @(posedge AESL_clock);
   AESL_REG_lp_id_ap_vld <= 1;
end


reg AESL_REG_time_r_ap_vld;
// The signal of port time_r
reg [31: 0] AESL_REG_time_r = 0;
assign time_r = AESL_REG_time_r;
assign time_r_ap_vld = AESL_REG_time_r_ap_vld;
initial begin : read_file_process_time_r
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [343  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    AESL_REG_time_r_ap_vld <= 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_time_r,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_time_r);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            AESL_REG_time_r_ap_vld <= 1;
            ret = $sscanf(token, "0x%x", AESL_REG_time_r);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
   @(posedge AESL_clock);
   AESL_REG_time_r_ap_vld <= 1;
end


reg AESL_REG_result_entry_i_ap_vld;
// The signal of port result_entry_i
reg [145: 0] AESL_REG_result_entry_i = 0;
assign result_entry_i = AESL_REG_result_entry_i;
always @(posedge AESL_clock)
begin
    if(result_entry_o_ap_vld === 1)
        AESL_REG_result_entry_i <= result_entry_o;
end

assign result_entry_i_ap_vld = AESL_REG_result_entry_i_ap_vld;
initial begin : read_file_process_result_entry
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [343  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    AESL_REG_result_entry_i_ap_vld <= 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_result_entry,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_result_entry);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            AESL_REG_result_entry_i_ap_vld <= 1;
            ret = $sscanf(token, "0x%x", AESL_REG_result_entry_i);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
   @(posedge AESL_clock);
   AESL_REG_result_entry_i_ap_vld <= 1;
end

reg AESL_REG_result_entry_o_ap_vld = 0;
// The signal of port result_entry_o
reg [145: 0] AESL_REG_result_entry_o = 0;
always @(posedge AESL_clock)
begin
    if(AESL_reset)
        AESL_REG_result_entry_o = 0; 
    else if(result_entry_o_ap_vld) begin
        AESL_REG_result_entry_o <= result_entry_o;
        AESL_REG_result_entry_o_ap_vld <= 1;
    end
end 

initial begin : write_file_process_result_entry
    integer fp;
    integer fp_size;
    integer err;
    integer ret;
    integer i;
    integer hls_stream_size;
    integer proc_rand;
    integer result_entry_count;
    reg [343:0] token;
    integer transaction_idx;
    reg [8 * 5:1] str;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVOUT_result_entry_out_wrapc,"w");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_result_entry_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[runtime]]]");
    transaction_idx = 0;
    while (transaction_idx != AUTOTB_TRANSACTION_NUM) begin
        @(posedge AESL_clock);
          while(AESL_done !== 1) begin
              @(posedge AESL_clock);
          end
        # 0.4;
        $fdisplay(fp,"[[transaction]] %d", transaction_idx);
        if(AESL_REG_result_entry_o_ap_vld)  begin
          $fdisplay(fp,"0x%x", AESL_REG_result_entry_o);
        AESL_REG_result_entry_o_ap_vld = 0;
        end
    transaction_idx = transaction_idx + 1;
      $fdisplay(fp,"[[/transaction]]");
    end
    $fdisplay(fp,"[[[/runtime]]]");
    $fclose(fp);
end


reg AESL_REG_success_ap_vld = 0;
// The signal of port success
reg [0: 0] AESL_REG_success = 0;
always @(posedge AESL_clock)
begin
    if(AESL_reset)
        AESL_REG_success = 0; 
    else if(success_ap_vld) begin
        AESL_REG_success <= success;
        AESL_REG_success_ap_vld <= 1;
    end
end 

initial begin : write_file_process_success
    integer fp;
    integer fp_size;
    integer err;
    integer ret;
    integer i;
    integer hls_stream_size;
    integer proc_rand;
    integer success_count;
    reg [343:0] token;
    integer transaction_idx;
    reg [8 * 5:1] str;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVOUT_success_out_wrapc,"w");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_success_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[runtime]]]");
    transaction_idx = 0;
    while (transaction_idx != AUTOTB_TRANSACTION_NUM) begin
        @(posedge AESL_clock);
          while(AESL_done !== 1) begin
              @(posedge AESL_clock);
          end
        # 0.4;
        $fdisplay(fp,"[[transaction]] %d", transaction_idx);
        if(AESL_REG_success_ap_vld)  begin
          $fdisplay(fp,"0x%x", AESL_REG_success);
        AESL_REG_success_ap_vld = 0;
        end
    transaction_idx = transaction_idx + 1;
      $fdisplay(fp,"[[/transaction]]");
    end
    $fdisplay(fp,"[[[/runtime]]]");
    $fclose(fp);
end


initial begin : generate_AESL_ready_cnt_proc
    AESL_ready_cnt = 0;
    wait(AESL_reset === 0);
    while(AESL_ready_cnt != AUTOTB_TRANSACTION_NUM) begin
        while(AESL_ready !== 1) begin
            @(posedge AESL_clock);
            # 0.4;
        end
        @(negedge AESL_clock);
        AESL_ready_cnt = AESL_ready_cnt + 1;
        @(posedge AESL_clock);
        # 0.4;
    end
end

    event next_trigger_ready_cnt;
    
    initial begin : gen_ready_cnt
        ready_cnt = 0;
        wait (AESL_reset === 0);
        forever begin
            @ (posedge AESL_clock);
            if (ready == 1) begin
                if (ready_cnt < AUTOTB_TRANSACTION_NUM) begin
                    ready_cnt = ready_cnt + 1;
                end
            end
            -> next_trigger_ready_cnt;
        end
    end
    
    wire all_finish = (done_cnt == AUTOTB_TRANSACTION_NUM);
    
    // done_cnt
    always @ (posedge AESL_clock) begin
        if (AESL_reset) begin
            done_cnt <= 0;
        end else begin
            if (AESL_done == 1) begin
                if (done_cnt < AUTOTB_TRANSACTION_NUM) begin
                    done_cnt <= done_cnt + 1;
                end
            end
        end
    end
    
    initial begin : finish_simulation
        wait (all_finish == 1);
        // last transaction is saved at negedge right after last done
        repeat(6) @ (posedge AESL_clock);
        $finish;
    end
    
initial begin
    AESL_clock = 0;
    forever #`AUTOTB_CLOCK_PERIOD_DIV2 AESL_clock = ~AESL_clock;
end


reg end_op;
reg [31:0] size_op;
reg [31:0] size_op_backup;
reg end_event_r;
reg [31:0] size_event_r;
reg [31:0] size_event_r_backup;
reg end_lp_id;
reg [31:0] size_lp_id;
reg [31:0] size_lp_id_backup;
reg end_time_r;
reg [31:0] size_time_r;
reg [31:0] size_time_r_backup;
reg end_result_entry;
reg [31:0] size_result_entry;
reg [31:0] size_result_entry_backup;
reg end_success;
reg [31:0] size_success;
reg [31:0] size_success_backup;

initial begin : initial_process
    integer proc_rand;
    rst = 1;
    # 100;
    repeat(0+3) @ (posedge AESL_clock);
    rst = 0;
end
initial begin : initial_process_for_dut_rst
    integer proc_rand;
    dut_rst = 1;
    # 100;
    repeat(3) @ (posedge AESL_clock);
    dut_rst = 0;
end
initial begin : start_process
    integer proc_rand;
    reg [31:0] start_cnt;
    ce = 1;
    start = 0;
    start_cnt = 0;
    wait (AESL_reset === 0);
    @ (posedge AESL_clock);
    #0 start = 1;
    start_cnt = start_cnt + 1;
    forever begin
        if (start_cnt >= AUTOTB_TRANSACTION_NUM + 1) begin
            #0 start = 0;
        end
        @ (posedge AESL_clock);
        if (AESL_ready) begin
            start_cnt = start_cnt + 1;
        end
    end
end

always @(AESL_done)
begin
    tb_continue = AESL_done;
end

initial begin : ready_initial_process
    ready_initial = 0;
    wait (AESL_start === 1);
    ready_initial = 1;
    @(posedge AESL_clock);
    ready_initial = 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset)
      AESL_ready_delay = 0;
  else
      AESL_ready_delay = AESL_ready;
end
initial begin : ready_last_n_process
  ready_last_n = 1;
  wait(ready_cnt == AUTOTB_TRANSACTION_NUM)
  @(posedge AESL_clock);
  ready_last_n <= 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset)
      ready_delay_last_n = 0;
  else
      ready_delay_last_n <= ready_last_n;
end
assign ready = (ready_initial | AESL_ready_delay);
assign ready_wire = ready_initial | AESL_ready_delay;
initial begin : done_delay_last_n_process
  done_delay_last_n = 1;
  while(done_cnt < AUTOTB_TRANSACTION_NUM)
      @(posedge AESL_clock);
  # 0.1;
  done_delay_last_n = 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset)
  begin
      AESL_done_delay <= 0;
      AESL_done_delay2 <= 0;
  end
  else begin
      AESL_done_delay <= AESL_done & done_delay_last_n;
      AESL_done_delay2 <= AESL_done_delay;
  end
end
always @(posedge AESL_clock)
begin
    if(AESL_reset)
      interface_done = 0;
  else begin
      # 0.01;
      if(ready === 1 && ready_cnt > 0 && ready_cnt < AUTOTB_TRANSACTION_NUM)
          interface_done = 1;
      else if(AESL_done_delay === 1 && done_cnt == AUTOTB_TRANSACTION_NUM)
          interface_done = 1;
      else
          interface_done = 0;
  end
end
task write_binary;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;

////////////////////////////////////////////
// progress and performance
////////////////////////////////////////////

task wait_start();
    while (~AESL_start) begin
        @ (posedge AESL_clock);
    end
endtask

reg [31:0] clk_cnt = 0;
reg AESL_ready_p1;
reg AESL_start_p1;

always @ (posedge AESL_clock) begin
    if (AESL_reset == 1) begin
        clk_cnt <= 32'h0;
        AESL_ready_p1 <= 1'b0;
        AESL_start_p1 <= 1'b0;
    end
    else begin
        clk_cnt <= clk_cnt + 1;
        AESL_ready_p1 <= AESL_ready;
        AESL_start_p1 <= AESL_start;
    end
end

reg [31:0] start_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] start_cnt;
reg [31:0] ready_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] ap_ready_cnt;
reg [31:0] finish_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] finish_cnt;
reg [31:0] lat_total;
event report_progress;

always @(posedge AESL_clock)
begin
    if (finish_cnt == AUTOTB_TRANSACTION_NUM - 1 && AESL_done == 1'b1)
        lat_total = clk_cnt - start_timestamp[0];
end

initial begin
    start_cnt = 0;
    finish_cnt = 0;
    ap_ready_cnt = 0;
    wait (AESL_reset == 0);
    wait_start();
    start_timestamp[start_cnt] = clk_cnt;
    start_cnt = start_cnt + 1;
    if (AESL_done) begin
        finish_timestamp[finish_cnt] = clk_cnt;
        finish_cnt = finish_cnt + 1;
    end
    -> report_progress;
    forever begin
        @ (posedge AESL_clock);
        if (start_cnt < AUTOTB_TRANSACTION_NUM) begin
            if ((AESL_start && AESL_ready_p1)||(AESL_start && ~AESL_start_p1)) begin
                start_timestamp[start_cnt] = clk_cnt;
                start_cnt = start_cnt + 1;
            end
        end
        if (ap_ready_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_start_p1 && AESL_ready_p1) begin
                ready_timestamp[ap_ready_cnt] = clk_cnt;
                ap_ready_cnt = ap_ready_cnt + 1;
            end
        end
        if (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_done) begin
                finish_timestamp[finish_cnt] = clk_cnt;
                finish_cnt = finish_cnt + 1;
            end
        end
        -> report_progress;
    end
end

reg [31:0] progress_timeout;

initial begin : simulation_progress
    real intra_progress;
    wait (AESL_reset == 0);
    progress_timeout = PROGRESS_TIMEOUT;
    $display("////////////////////////////////////////////////////////////////////////////////////");
    $display("// Inter-Transaction Progress: Completed Transaction / Total Transaction");
    $display("// Intra-Transaction Progress: Measured Latency / Latency Estimation * 100%%");
    $display("//");
    $display("// RTL Simulation : \"Inter-Transaction Progress\" [\"Intra-Transaction Progress\"] @ \"Simulation Time\"");
    $display("////////////////////////////////////////////////////////////////////////////////////");
    print_progress();
    while (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
        @ (report_progress);
        if (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_done) begin
                print_progress();
                progress_timeout = PROGRESS_TIMEOUT;
            end else begin
                if (progress_timeout == 0) begin
                    print_progress();
                    progress_timeout = PROGRESS_TIMEOUT;
                end else begin
                    progress_timeout = progress_timeout - 1;
                end
            end
        end
    end
    print_progress();
    $display("////////////////////////////////////////////////////////////////////////////////////");
    calculate_performance();
end

task get_intra_progress(output real intra_progress);
    begin
        if (start_cnt > finish_cnt) begin
            intra_progress = clk_cnt - start_timestamp[finish_cnt];
        end else if(finish_cnt > 0) begin
            intra_progress = LATENCY_ESTIMATION;
        end else begin
            intra_progress = 0;
        end
        intra_progress = intra_progress / LATENCY_ESTIMATION;
    end
endtask

task print_progress();
    real intra_progress;
    begin
        if (LATENCY_ESTIMATION > 0) begin
            get_intra_progress(intra_progress);
            $display("// RTL Simulation : %0d / %0d [%2.2f%%] @ \"%0t\"", finish_cnt, AUTOTB_TRANSACTION_NUM, intra_progress * 100, $time);
        end else begin
            $display("// RTL Simulation : %0d / %0d [n/a] @ \"%0t\"", finish_cnt, AUTOTB_TRANSACTION_NUM, $time);
        end
    end
endtask

task calculate_performance();
    integer i;
    integer fp;
    reg [31:0] latency [0:AUTOTB_TRANSACTION_NUM - 1];
    reg [31:0] latency_min;
    reg [31:0] latency_max;
    reg [31:0] latency_total;
    reg [31:0] latency_average;
    reg [31:0] interval [0:AUTOTB_TRANSACTION_NUM - 2];
    reg [31:0] interval_min;
    reg [31:0] interval_max;
    reg [31:0] interval_total;
    reg [31:0] interval_average;
    reg [31:0] total_execute_time;
    begin
        latency_min = -1;
        latency_max = 0;
        latency_total = 0;
        interval_min = -1;
        interval_max = 0;
        interval_total = 0;
        total_execute_time = lat_total;

        for (i = 0; i < AUTOTB_TRANSACTION_NUM; i = i + 1) begin
            // calculate latency
            latency[i] = finish_timestamp[i] - start_timestamp[i];
            if (latency[i] > latency_max) latency_max = latency[i];
            if (latency[i] < latency_min) latency_min = latency[i];
            latency_total = latency_total + latency[i];
            // calculate interval
            if (AUTOTB_TRANSACTION_NUM == 1) begin
                interval[i] = 0;
                interval_max = 0;
                interval_min = 0;
                interval_total = 0;
            end else if (i < AUTOTB_TRANSACTION_NUM - 1) begin
                interval[i] = start_timestamp[i + 1] - start_timestamp[i];
                if (interval[i] > interval_max) interval_max = interval[i];
                if (interval[i] < interval_min) interval_min = interval[i];
                interval_total = interval_total + interval[i];
            end
        end

        latency_average = latency_total / AUTOTB_TRANSACTION_NUM;
        if (AUTOTB_TRANSACTION_NUM == 1) begin
            interval_average = 0;
        end else begin
            interval_average = interval_total / (AUTOTB_TRANSACTION_NUM - 1);
        end

        fp = $fopen(`AUTOTB_LAT_RESULT_FILE, "w");

        $fdisplay(fp, "$MAX_LATENCY = \"%0d\"", latency_max);
        $fdisplay(fp, "$MIN_LATENCY = \"%0d\"", latency_min);
        $fdisplay(fp, "$AVER_LATENCY = \"%0d\"", latency_average);
        $fdisplay(fp, "$MAX_THROUGHPUT = \"%0d\"", interval_max);
        $fdisplay(fp, "$MIN_THROUGHPUT = \"%0d\"", interval_min);
        $fdisplay(fp, "$AVER_THROUGHPUT = \"%0d\"", interval_average);
        $fdisplay(fp, "$TOTAL_EXECUTE_TIME = \"%0d\"", total_execute_time);

        $fclose(fp);

        fp = $fopen(`AUTOTB_PER_RESULT_TRANS_FILE, "w");

        $fdisplay(fp, "%20s%16s%16s", "", "latency", "interval");
        if (AUTOTB_TRANSACTION_NUM == 1) begin
            i = 0;
            $fdisplay(fp, "transaction%8d:%16d%16d", i, latency[i], interval[i]);
        end else begin
            for (i = 0; i < AUTOTB_TRANSACTION_NUM; i = i + 1) begin
                if (i < AUTOTB_TRANSACTION_NUM - 1) begin
                    $fdisplay(fp, "transaction%8d:%16d%16d", i, latency[i], interval[i]);
                end else begin
                    $fdisplay(fp, "transaction%8d:%16d               x", i, latency[i]);
                end
            end
        end

        $fclose(fp);
    end
endtask


////////////////////////////////////////////
// Dependence Check
////////////////////////////////////////////

`ifndef POST_SYN

// Dependence Check (WAR) "ap_enable_operation_31"(R:SV1-2) -> "ap_enable_operation_33"(W:SV2-2) @ `AUTOTB_DUT_INST.grp_event_queue_kernel_Pipeline_VITIS_LOOP_330_1_fu_641

// Dependence Check (RAW) "ap_enable_operation_33"(W:SV2-2) -> "ap_enable_operation_27"(R:SV1-2) @ `AUTOTB_DUT_INST.grp_event_queue_kernel_Pipeline_VITIS_LOOP_330_1_fu_641
reg [7:0] DEP_address_1_to [1 - 1:0];
time DEP_time_1_to [1 - 1:0];
reg [7:0] DEP_address_1_from [1 - 1:0];
time DEP_time_1_from [1 - 1:0];
reg DEP_error_1 = 0;
integer DEP_i_1;

initial begin
    DEP_address_1_to[0] = 0;
    DEP_time_1_to[0] = 0;
    DEP_address_1_from[0] = 0;
    DEP_time_1_from[0] = 0;
end

always @ (negedge AESL_clock) begin
    if (~`AUTOTB_DUT_INST.grp_event_queue_kernel_Pipeline_VITIS_LOOP_330_1_fu_641.ap_block_pp0) begin 
        // record "to" access
        if (`AUTOTB_DUT_INST.grp_event_queue_kernel_Pipeline_VITIS_LOOP_330_1_fu_641.ap_enable_state2_pp0_iter1_stage0
            &&  `AUTOTB_DUT_INST.grp_event_queue_kernel_Pipeline_VITIS_LOOP_330_1_fu_641.ap_enable_reg_pp0_iter1) begin 
            if (`AUTOTB_DUT_INST.grp_event_queue_kernel_Pipeline_VITIS_LOOP_330_1_fu_641.ap_enable_operation_27) begin
                DEP_address_1_to[0] = {1'b1, `AUTOTB_DUT_INST.grp_event_queue_kernel_Pipeline_VITIS_LOOP_330_1_fu_641.g_event_queue_buffer_is_issued_V_address1};
                DEP_time_1_to[0] = $time;
            end else begin
                DEP_address_1_to[0] = {1'b0, 7'b0};
                DEP_time_1_to[0] = $time;
            end
        end // of record to access
        else if( (`AUTOTB_DUT_INST.grp_event_queue_kernel_Pipeline_VITIS_LOOP_330_1_fu_641.ap_enable_state2_pp0_iter1_stage0||
            `AUTOTB_DUT_INST.grp_event_queue_kernel_Pipeline_VITIS_LOOP_330_1_fu_641.ap_enable_state2_pp0_iter1_stage0||
            `AUTOTB_DUT_INST.grp_event_queue_kernel_Pipeline_VITIS_LOOP_330_1_fu_641.ap_enable_state3_pp0_iter2_stage0)
            &&  ~`AUTOTB_DUT_INST.grp_event_queue_kernel_Pipeline_VITIS_LOOP_330_1_fu_641.ap_enable_reg_pp0_iter1) begin
            DEP_address_1_to[0] = {1'b0, 7'b0};
            DEP_time_1_to[0] = $time;
        end
        // record "from" access
        if (`AUTOTB_DUT_INST.grp_event_queue_kernel_Pipeline_VITIS_LOOP_330_1_fu_641.ap_enable_state3_pp0_iter2_stage0
            &&  `AUTOTB_DUT_INST.grp_event_queue_kernel_Pipeline_VITIS_LOOP_330_1_fu_641.ap_enable_reg_pp0_iter2) begin
            if (`AUTOTB_DUT_INST.grp_event_queue_kernel_Pipeline_VITIS_LOOP_330_1_fu_641.ap_enable_operation_33) begin
                if (DEP_address_1_from[0][7]) begin
                    $display("// ERROR : \"DEP_address_1_from[0]\" is overwritten @ \"%0t\"", $time);
                    $display("// autotb LINE:%d", `__LINE__);
                    $display("////////////////////////////////////////////////////////////////////////////////////");
                end
                DEP_address_1_from[0] = {1'b1, `AUTOTB_DUT_INST.grp_event_queue_kernel_Pipeline_VITIS_LOOP_330_1_fu_641.g_event_queue_buffer_is_issued_V_address0};
                DEP_time_1_from[0] = $time;
            end
        end // of record from access
        // check access
        if (`AUTOTB_DUT_INST.grp_event_queue_kernel_Pipeline_VITIS_LOOP_330_1_fu_641.ap_enable_state3_pp0_iter2_stage0
            &&  `AUTOTB_DUT_INST.grp_event_queue_kernel_Pipeline_VITIS_LOOP_330_1_fu_641.ap_enable_reg_pp0_iter2) begin
            if (`AUTOTB_DUT_INST.grp_event_queue_kernel_Pipeline_VITIS_LOOP_330_1_fu_641.ap_enable_operation_33) begin
                DEP_i_1 = 0;
                if (DEP_address_1_to[0][7]) begin
                    DEP_error_1 = (DEP_address_1_to[0][6:0] == DEP_address_1_from[DEP_i_1][6:0]);
                    if (DEP_error_1) begin
                        $display("//Critical WARNING: Due to pragma (cpp/EventQueue.hpp:332:9), dependence access (loop distance = 1) is detected in \"`AUTOTB_DUT_INST.grp_event_queue_kernel_Pipeline_VITIS_LOOP_330_1_fu_641\"");
                        $display("//                : From memory access \"g_event_queue_buffer_is_issued_V_address0\" = 0x%0h @ \"%0t\"", DEP_address_1_from[DEP_i_1][6:0], DEP_time_1_from[DEP_i_1]);
                        $display("//                : To memory access \"g_event_queue_buffer_is_issued_V_address1\" = DEP_address_1_to[0][6:0] = 0x%0h @ \"%0t\"", DEP_address_1_to[0][6:0], DEP_time_1_to[0]);
                        $display("//If cosim fails, the WARNING should be checked. autotb LINE:%d", `__LINE__);
                        $display("////////////////////////////////////////////////////////////////////////////////////");
// (RAW) "ap_enable_operation_33"(W:SV2-2) -> "ap_enable_operation_27"(R:SV1-2) @ `AUTOTB_DUT_INST.grp_event_queue_kernel_Pipeline_VITIS_LOOP_330_1_fu_641
                    end
                end
                DEP_address_1_from[DEP_i_1] = {1'b0, 7'b0};
                DEP_time_1_from[DEP_i_1] = 0;
            end
        end // of check access
    end 
end

`endif
///////////////////////////////////////////////////////
// dataflow status monitor
///////////////////////////////////////////////////////
dataflow_monitor U_dataflow_monitor(
    .clock(AESL_clock),
    .reset(rst),
    .finish(all_finish));

`include "fifo_para.vh"

endmodule
