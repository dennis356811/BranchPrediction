module Controller(
  input        clock,
  input        reset,
  input  [4:0] io_op,
  input  [2:0] io_f3,
  input  [4:0] io_rd,
  input  [4:0] io_rs1,
  input  [4:0] io_rs2,
  input        io_f7,
  input        io_alu_out,
  input        io_predict_miss,
  input        io_BTB_miss,
  output       io_stall,
  output       io_next_pc_sel,
  output [3:0] io_F_im_w_en,
  output       io_D_rs1_data_sel,
  output       io_D_rs2_data_sel,
  output [1:0] io_E_rs1_data_sel,
  output [1:0] io_E_rs2_data_sel,
  output       io_E_jb_op1_sel,
  output       io_E_alu_op1_sel,
  output       io_E_alu_op2_sel,
  output [4:0] io_E_op,
  output [2:0] io_E_f3,
  output       io_E_f7,
  output [3:0] io_M_dm_w_en,
  output       io_W_wb_en,
  output [4:0] io_W_rd_index,
  output [2:0] io_W_f3,
  output       io_W_wb_data_sel
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  reg [4:0] IN_E_OP_REG; // @[Controller.scala 51:38]
  reg [2:0] IN_E_F3_REG; // @[Controller.scala 52:38]
  reg [4:0] IN_E_RD_REG; // @[Controller.scala 53:38]
  reg [4:0] IN_E_RS1_REG; // @[Controller.scala 54:38]
  reg [4:0] IN_E_RS2_REG; // @[Controller.scala 55:38]
  reg  IN_E_F7_REG; // @[Controller.scala 56:38]
  reg [4:0] IN_M_OP_REG; // @[Controller.scala 58:38]
  reg [2:0] IN_M_F3_REG; // @[Controller.scala 59:38]
  reg [4:0] IN_M_RD_REG; // @[Controller.scala 60:38]
  reg [4:0] IN_W_OP_REG; // @[Controller.scala 62:38]
  reg [2:0] IN_W_F3_REG; // @[Controller.scala 63:38]
  reg [4:0] IN_W_RD_REG; // @[Controller.scala 64:38]
  wire  _T_4 = io_op == 5'h5; // @[Controller.scala 127:15]
  wire  _T_5 = io_op == 5'hd | _T_4; // @[Controller.scala 126:51]
  wire  _T_6 = io_op == 5'h1b; // @[Controller.scala 128:15]
  wire  _T_7 = _T_5 | _T_6; // @[Controller.scala 127:53]
  wire  is_D_use_rs1 = _T_7 ? 1'h0 : 1'h1; // @[Controller.scala 129:6 130:22 132:22]
  wire  _T_9 = io_op == 5'h8; // @[Controller.scala 138:15]
  wire  _T_10 = io_op == 5'hc | _T_9; // @[Controller.scala 137:49]
  wire  _T_11 = io_op == 5'h18; // @[Controller.scala 139:15]
  wire  is_D_use_rs2 = _T_10 | _T_11; // @[Controller.scala 138:49]
  wire  _T_14 = IN_E_OP_REG == 5'h5; // @[Controller.scala 149:21]
  wire  _T_15 = IN_E_OP_REG == 5'hd | _T_14; // @[Controller.scala 148:57]
  wire  _T_16 = IN_E_OP_REG == 5'h1b; // @[Controller.scala 150:21]
  wire  _T_17 = _T_15 | _T_16; // @[Controller.scala 149:59]
  wire  is_E_use_rs1 = _T_17 ? 1'h0 : 1'h1; // @[Controller.scala 151:6 152:22 154:22]
  wire  _T_19 = IN_E_OP_REG == 5'h8; // @[Controller.scala 160:21]
  wire  _T_20 = IN_E_OP_REG == 5'hc | _T_19; // @[Controller.scala 159:55]
  wire  _T_21 = IN_E_OP_REG == 5'h18; // @[Controller.scala 161:21]
  wire  is_E_use_rs2 = _T_20 | _T_21; // @[Controller.scala 160:55]
  wire  _T_24 = IN_M_OP_REG == 5'h8; // @[Controller.scala 171:21]
  wire  _T_25 = IN_M_OP_REG == 5'h18 | _T_24; // @[Controller.scala 170:55]
  wire  is_M_use_rd = _T_25 ? 1'h0 : 1'h1; // @[Controller.scala 172:7 173:21 175:21]
  wire  _T_27 = IN_W_OP_REG == 5'h8; // @[Controller.scala 181:21]
  wire  _T_28 = IN_W_OP_REG == 5'h18 | _T_27; // @[Controller.scala 180:55]
  wire  is_W_use_rd = _T_28 ? 1'h0 : 1'h1; // @[Controller.scala 182:7 183:21 185:21]
  wire  _is_D_rs1_W_rd_overlap_T_3 = IN_W_RD_REG != 5'h0; // @[Controller.scala 189:102]
  wire  is_E_rs1_W_rd_overlap = is_E_use_rs1 & is_W_use_rd & IN_E_RS1_REG == IN_W_RD_REG & _is_D_rs1_W_rd_overlap_T_3; // @[Controller.scala 195:92]
  wire  _is_E_rs1_M_rd_overlap_T_3 = IN_M_RD_REG != 5'h0; // @[Controller.scala 196:108]
  wire  is_E_rs1_M_rd_overlap = is_E_use_rs1 & is_M_use_rd & IN_E_RS1_REG == IN_M_RD_REG & IN_M_RD_REG != 5'h0; // @[Controller.scala 196:92]
  wire [1:0] _io_E_rs1_data_sel_T = is_E_rs1_W_rd_overlap ? 2'h0 : 2'h2; // @[Controller.scala 197:67]
  wire  is_E_rs2_W_rd_overlap = is_E_use_rs2 & is_W_use_rd & IN_E_RS2_REG == IN_W_RD_REG & _is_D_rs1_W_rd_overlap_T_3; // @[Controller.scala 198:92]
  wire  is_E_rs2_M_rd_overlap = is_E_use_rs2 & is_M_use_rd & IN_E_RS2_REG == IN_M_RD_REG & _is_E_rs1_M_rd_overlap_T_3; // @[Controller.scala 199:92]
  wire [1:0] _io_E_rs2_data_sel_T = is_E_rs2_W_rd_overlap ? 2'h0 : 2'h2; // @[Controller.scala 200:67]
  wire  _is_D_rs1_E_rd_overlap_T_2 = IN_E_RD_REG != 5'h0; // @[Controller.scala 203:87]
  wire  is_D_rs1_E_rd_overlap = is_D_use_rs1 & io_rs1 == IN_E_RD_REG & IN_E_RD_REG != 5'h0; // @[Controller.scala 203:71]
  wire  is_D_rs2_E_rd_overlap = is_D_use_rs2 & io_rs2 == IN_E_RD_REG & _is_D_rs1_E_rd_overlap_T_2; // @[Controller.scala 204:71]
  wire  is_DE_overlap = is_D_rs1_E_rd_overlap | is_D_rs2_E_rd_overlap; // @[Controller.scala 205:45]
  wire  _GEN_23 = 5'h0 == IN_E_OP_REG | 5'h8 == IN_E_OP_REG; // @[Controller.scala 222:24 256:33]
  wire  _GEN_25 = 5'h4 == IN_E_OP_REG | _GEN_23; // @[Controller.scala 222:24 250:33]
  wire  _GEN_27 = 5'hc == IN_E_OP_REG | _GEN_25; // @[Controller.scala 222:24 244:33]
  wire  _GEN_30 = 5'h18 == IN_E_OP_REG | _GEN_27; // @[Controller.scala 222:24 238:33]
  wire  _GEN_31 = 5'h18 == IN_E_OP_REG | 5'hc == IN_E_OP_REG; // @[Controller.scala 222:24 239:33]
  wire  _GEN_33 = 5'h19 == IN_E_OP_REG ? 1'h0 : _GEN_30; // @[Controller.scala 222:24 232:33]
  wire  _GEN_34 = 5'h19 == IN_E_OP_REG ? 1'h0 : _GEN_31; // @[Controller.scala 222:24 233:33]
  wire [3:0] _GEN_39 = 3'h2 == IN_M_F3_REG ? 4'hf : 4'h0; // @[Controller.scala 281:22 282:28 290:30]
  wire [3:0] _GEN_40 = 3'h1 == IN_M_F3_REG ? 4'h3 : _GEN_39; // @[Controller.scala 282:28 287:30]
  wire [3:0] _GEN_41 = 3'h0 == IN_M_F3_REG ? 4'h1 : _GEN_40; // @[Controller.scala 282:28 284:30]
  wire  _GEN_43 = IN_W_OP_REG == 5'h0 ? 1'h0 : 1'h1; // @[Controller.scala 309:61 310:30 312:30]
  assign io_stall = IN_E_OP_REG == 5'h0 & is_DE_overlap; // @[Controller.scala 206:66]
  assign io_next_pc_sel = 5'h1b == IN_E_OP_REG | 5'h19 == IN_E_OP_REG; // @[Controller.scala 222:24 224:33]
  assign io_F_im_w_en = 4'h0; // @[Controller.scala 315:18]
  assign io_D_rs1_data_sel = is_D_use_rs1 & is_W_use_rd & io_rs1 == IN_W_RD_REG & IN_W_RD_REG != 5'h0; // @[Controller.scala 189:86]
  assign io_D_rs2_data_sel = is_D_use_rs2 & is_W_use_rd & io_rs2 == IN_W_RD_REG & _is_D_rs1_W_rd_overlap_T_3; // @[Controller.scala 190:86]
  assign io_E_rs1_data_sel = is_E_rs1_M_rd_overlap ? 2'h1 : _io_E_rs1_data_sel_T; // @[Controller.scala 197:30]
  assign io_E_rs2_data_sel = is_E_rs2_M_rd_overlap ? 2'h1 : _io_E_rs2_data_sel_T; // @[Controller.scala 200:30]
  assign io_E_jb_op1_sel = 5'h1b == IN_E_OP_REG ? 1'h0 : 5'h19 == IN_E_OP_REG; // @[Controller.scala 222:24 225:33]
  assign io_E_alu_op1_sel = 5'h1b == IN_E_OP_REG ? 1'h0 : _GEN_33; // @[Controller.scala 222:24 226:33]
  assign io_E_alu_op2_sel = 5'h1b == IN_E_OP_REG ? 1'h0 : _GEN_34; // @[Controller.scala 222:24 227:33]
  assign io_E_op = IN_E_OP_REG; // @[Controller.scala 212:13]
  assign io_E_f3 = IN_E_F3_REG; // @[Controller.scala 213:13]
  assign io_E_f7 = IN_E_F7_REG; // @[Controller.scala 214:13]
  assign io_M_dm_w_en = _T_24 ? _GEN_41 : 4'h0; // @[Controller.scala 280:56 294:22]
  assign io_W_wb_en = _T_28 ? 1'h0 : 1'h1; // @[Controller.scala 304:6 305:20 308:20]
  assign io_W_rd_index = IN_W_RD_REG; // @[Controller.scala 298:21]
  assign io_W_f3 = IN_W_F3_REG; // @[Controller.scala 299:21]
  assign io_W_wb_data_sel = _T_28 ? 1'h0 : _GEN_43; // @[Controller.scala 304:6 306:26]
  always @(posedge clock) begin
    if (reset) begin // @[Controller.scala 51:38]
      IN_E_OP_REG <= 5'h0; // @[Controller.scala 51:38]
    end else if (io_stall | io_next_pc_sel | io_predict_miss | io_BTB_miss) begin // @[Controller.scala 66:71]
      IN_E_OP_REG <= 5'hc; // @[Controller.scala 68:25]
    end else begin
      IN_E_OP_REG <= io_op; // @[Controller.scala 86:25]
    end
    if (reset) begin // @[Controller.scala 52:38]
      IN_E_F3_REG <= 3'h0; // @[Controller.scala 52:38]
    end else if (io_stall | io_next_pc_sel | io_predict_miss | io_BTB_miss) begin // @[Controller.scala 66:71]
      IN_E_F3_REG <= 3'h0; // @[Controller.scala 69:25]
    end else begin
      IN_E_F3_REG <= io_f3; // @[Controller.scala 87:25]
    end
    if (reset) begin // @[Controller.scala 53:38]
      IN_E_RD_REG <= 5'h0; // @[Controller.scala 53:38]
    end else if (io_stall | io_next_pc_sel | io_predict_miss | io_BTB_miss) begin // @[Controller.scala 66:71]
      IN_E_RD_REG <= 5'h0; // @[Controller.scala 70:25]
    end else begin
      IN_E_RD_REG <= io_rd; // @[Controller.scala 88:25]
    end
    if (reset) begin // @[Controller.scala 54:38]
      IN_E_RS1_REG <= 5'h0; // @[Controller.scala 54:38]
    end else if (io_stall | io_next_pc_sel | io_predict_miss | io_BTB_miss) begin // @[Controller.scala 66:71]
      IN_E_RS1_REG <= 5'h0; // @[Controller.scala 71:25]
    end else begin
      IN_E_RS1_REG <= io_rs1; // @[Controller.scala 89:25]
    end
    if (reset) begin // @[Controller.scala 55:38]
      IN_E_RS2_REG <= 5'h0; // @[Controller.scala 55:38]
    end else if (io_stall | io_next_pc_sel | io_predict_miss | io_BTB_miss) begin // @[Controller.scala 66:71]
      IN_E_RS2_REG <= 5'h0; // @[Controller.scala 72:25]
    end else begin
      IN_E_RS2_REG <= io_rs2; // @[Controller.scala 90:25]
    end
    if (reset) begin // @[Controller.scala 56:38]
      IN_E_F7_REG <= 1'h0; // @[Controller.scala 56:38]
    end else if (io_stall | io_next_pc_sel | io_predict_miss | io_BTB_miss) begin // @[Controller.scala 66:71]
      IN_E_F7_REG <= 1'h0; // @[Controller.scala 73:25]
    end else begin
      IN_E_F7_REG <= io_f7; // @[Controller.scala 91:25]
    end
    if (reset) begin // @[Controller.scala 58:38]
      IN_M_OP_REG <= 5'h0; // @[Controller.scala 58:38]
    end else begin
      IN_M_OP_REG <= IN_E_OP_REG;
    end
    if (reset) begin // @[Controller.scala 59:38]
      IN_M_F3_REG <= 3'h0; // @[Controller.scala 59:38]
    end else begin
      IN_M_F3_REG <= IN_E_F3_REG;
    end
    if (reset) begin // @[Controller.scala 60:38]
      IN_M_RD_REG <= 5'h0; // @[Controller.scala 60:38]
    end else begin
      IN_M_RD_REG <= IN_E_RD_REG;
    end
    if (reset) begin // @[Controller.scala 62:38]
      IN_W_OP_REG <= 5'h0; // @[Controller.scala 62:38]
    end else begin
      IN_W_OP_REG <= IN_M_OP_REG;
    end
    if (reset) begin // @[Controller.scala 63:38]
      IN_W_F3_REG <= 3'h0; // @[Controller.scala 63:38]
    end else begin
      IN_W_F3_REG <= IN_M_F3_REG;
    end
    if (reset) begin // @[Controller.scala 64:38]
      IN_W_RD_REG <= 5'h0; // @[Controller.scala 64:38]
    end else begin
      IN_W_RD_REG <= IN_M_RD_REG;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  IN_E_OP_REG = _RAND_0[4:0];
  _RAND_1 = {1{`RANDOM}};
  IN_E_F3_REG = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  IN_E_RD_REG = _RAND_2[4:0];
  _RAND_3 = {1{`RANDOM}};
  IN_E_RS1_REG = _RAND_3[4:0];
  _RAND_4 = {1{`RANDOM}};
  IN_E_RS2_REG = _RAND_4[4:0];
  _RAND_5 = {1{`RANDOM}};
  IN_E_F7_REG = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  IN_M_OP_REG = _RAND_6[4:0];
  _RAND_7 = {1{`RANDOM}};
  IN_M_F3_REG = _RAND_7[2:0];
  _RAND_8 = {1{`RANDOM}};
  IN_M_RD_REG = _RAND_8[4:0];
  _RAND_9 = {1{`RANDOM}};
  IN_W_OP_REG = _RAND_9[4:0];
  _RAND_10 = {1{`RANDOM}};
  IN_W_F3_REG = _RAND_10[2:0];
  _RAND_11 = {1{`RANDOM}};
  IN_W_RD_REG = _RAND_11[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
