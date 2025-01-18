module IF_ID(
  input         clock,
  input         reset,
  input  [31:0] io_pc4_in,
  input  [31:0] io_SelectedPC,
  input  [31:0] io_SelectedInstr,
  output [31:0] io_pc4_out,
  output [31:0] io_SelectedPC_out,
  output [31:0] io_SelectedInstr_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] Pc4_In; // @[IF_ID.scala 20:39]
  reg [31:0] S_pc; // @[IF_ID.scala 21:39]
  reg [31:0] S_instr; // @[IF_ID.scala 22:39]
  assign io_pc4_out = Pc4_In; // @[IF_ID.scala 30:29]
  assign io_SelectedPC_out = S_pc; // @[IF_ID.scala 31:29]
  assign io_SelectedInstr_out = S_instr; // @[IF_ID.scala 32:29]
  always @(posedge clock) begin
    if (reset) begin // @[IF_ID.scala 20:39]
      Pc4_In <= 32'h0; // @[IF_ID.scala 20:39]
    end else begin
      Pc4_In <= io_pc4_in; // @[IF_ID.scala 25:29]
    end
    if (reset) begin // @[IF_ID.scala 21:39]
      S_pc <= 32'sh0; // @[IF_ID.scala 21:39]
    end else begin
      S_pc <= io_SelectedPC; // @[IF_ID.scala 26:29]
    end
    if (reset) begin // @[IF_ID.scala 22:39]
      S_instr <= 32'h0; // @[IF_ID.scala 22:39]
    end else begin
      S_instr <= io_SelectedInstr; // @[IF_ID.scala 27:29]
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
  Pc4_In = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  S_pc = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  S_instr = _RAND_2[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ID_EX(
  input         clock,
  input  [4:0]  io_rs1_in,
  input  [4:0]  io_rs2_in,
  input  [31:0] io_rs1_data_in,
  input  [31:0] io_rs2_data_in,
  input  [31:0] io_imm,
  input  [4:0]  io_rd_in,
  input  [2:0]  io_func3_in,
  input         io_func7_in,
  input         io_ctrl_MemWr_in,
  input         io_ctrl_MemRd_in,
  input         io_ctrl_Reg_W_in,
  input         io_ctrl_MemToReg_in,
  input  [2:0]  io_ctrl_AluOp_in,
  input  [1:0]  io_ctrl_OpA_in,
  input         io_ctrl_OpB_in,
  input  [31:0] io_IFID_pc4_in,
  output [4:0]  io_rs1_out,
  output [4:0]  io_rs2_out,
  output [31:0] io_rs1_data_out,
  output [31:0] io_rs2_data_out,
  output [4:0]  io_rd_out,
  output [31:0] io_imm_out,
  output [2:0]  io_func3_out,
  output        io_func7_out,
  output        io_ctrl_MemWr_out,
  output        io_ctrl_MemRd_out,
  output        io_ctrl_Reg_W_out,
  output        io_ctrl_MemToReg_out,
  output [2:0]  io_ctrl_AluOp_out,
  output [1:0]  io_ctrl_OpA_out,
  output        io_ctrl_OpB_out,
  output [31:0] io_IFID_pc4_out
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
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
`endif // RANDOMIZE_REG_INIT
  reg [4:0] io_rs1_out_REG; // @[ID_EX.scala 46:36]
  reg [4:0] io_rs2_out_REG; // @[ID_EX.scala 47:36]
  reg [31:0] io_rs1_data_out_REG; // @[ID_EX.scala 48:36]
  reg [31:0] io_rs2_data_out_REG; // @[ID_EX.scala 49:36]
  reg [31:0] io_imm_out_REG; // @[ID_EX.scala 50:36]
  reg [4:0] io_rd_out_REG; // @[ID_EX.scala 51:36]
  reg [2:0] io_func3_out_REG; // @[ID_EX.scala 52:36]
  reg  io_func7_out_REG; // @[ID_EX.scala 53:36]
  reg  io_ctrl_MemWr_out_REG; // @[ID_EX.scala 54:36]
  reg  io_ctrl_MemRd_out_REG; // @[ID_EX.scala 56:36]
  reg  io_ctrl_Reg_W_out_REG; // @[ID_EX.scala 57:36]
  reg  io_ctrl_MemToReg_out_REG; // @[ID_EX.scala 58:36]
  reg [2:0] io_ctrl_AluOp_out_REG; // @[ID_EX.scala 59:36]
  reg [1:0] io_ctrl_OpA_out_REG; // @[ID_EX.scala 60:36]
  reg  io_ctrl_OpB_out_REG; // @[ID_EX.scala 61:36]
  reg [31:0] io_IFID_pc4_out_REG; // @[ID_EX.scala 63:36]
  assign io_rs1_out = io_rs1_out_REG; // @[ID_EX.scala 46:25]
  assign io_rs2_out = io_rs2_out_REG; // @[ID_EX.scala 47:25]
  assign io_rs1_data_out = io_rs1_data_out_REG; // @[ID_EX.scala 48:25]
  assign io_rs2_data_out = io_rs2_data_out_REG; // @[ID_EX.scala 49:25]
  assign io_rd_out = io_rd_out_REG; // @[ID_EX.scala 51:25]
  assign io_imm_out = io_imm_out_REG; // @[ID_EX.scala 50:25]
  assign io_func3_out = io_func3_out_REG; // @[ID_EX.scala 52:25]
  assign io_func7_out = io_func7_out_REG; // @[ID_EX.scala 53:25]
  assign io_ctrl_MemWr_out = io_ctrl_MemWr_out_REG; // @[ID_EX.scala 54:25]
  assign io_ctrl_MemRd_out = io_ctrl_MemRd_out_REG; // @[ID_EX.scala 56:25]
  assign io_ctrl_Reg_W_out = io_ctrl_Reg_W_out_REG; // @[ID_EX.scala 57:25]
  assign io_ctrl_MemToReg_out = io_ctrl_MemToReg_out_REG; // @[ID_EX.scala 58:25]
  assign io_ctrl_AluOp_out = io_ctrl_AluOp_out_REG; // @[ID_EX.scala 59:25]
  assign io_ctrl_OpA_out = io_ctrl_OpA_out_REG; // @[ID_EX.scala 60:25]
  assign io_ctrl_OpB_out = io_ctrl_OpB_out_REG; // @[ID_EX.scala 61:25]
  assign io_IFID_pc4_out = io_IFID_pc4_out_REG; // @[ID_EX.scala 63:25]
  always @(posedge clock) begin
    io_rs1_out_REG <= io_rs1_in; // @[ID_EX.scala 46:36]
    io_rs2_out_REG <= io_rs2_in; // @[ID_EX.scala 47:36]
    io_rs1_data_out_REG <= io_rs1_data_in; // @[ID_EX.scala 48:36]
    io_rs2_data_out_REG <= io_rs2_data_in; // @[ID_EX.scala 49:36]
    io_imm_out_REG <= io_imm; // @[ID_EX.scala 50:36]
    io_rd_out_REG <= io_rd_in; // @[ID_EX.scala 51:36]
    io_func3_out_REG <= io_func3_in; // @[ID_EX.scala 52:36]
    io_func7_out_REG <= io_func7_in; // @[ID_EX.scala 53:36]
    io_ctrl_MemWr_out_REG <= io_ctrl_MemWr_in; // @[ID_EX.scala 54:36]
    io_ctrl_MemRd_out_REG <= io_ctrl_MemRd_in; // @[ID_EX.scala 56:36]
    io_ctrl_Reg_W_out_REG <= io_ctrl_Reg_W_in; // @[ID_EX.scala 57:36]
    io_ctrl_MemToReg_out_REG <= io_ctrl_MemToReg_in; // @[ID_EX.scala 58:36]
    io_ctrl_AluOp_out_REG <= io_ctrl_AluOp_in; // @[ID_EX.scala 59:36]
    io_ctrl_OpA_out_REG <= io_ctrl_OpA_in; // @[ID_EX.scala 60:36]
    io_ctrl_OpB_out_REG <= io_ctrl_OpB_in; // @[ID_EX.scala 61:36]
    io_IFID_pc4_out_REG <= io_IFID_pc4_in; // @[ID_EX.scala 63:36]
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
  io_rs1_out_REG = _RAND_0[4:0];
  _RAND_1 = {1{`RANDOM}};
  io_rs2_out_REG = _RAND_1[4:0];
  _RAND_2 = {1{`RANDOM}};
  io_rs1_data_out_REG = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  io_rs2_data_out_REG = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  io_imm_out_REG = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  io_rd_out_REG = _RAND_5[4:0];
  _RAND_6 = {1{`RANDOM}};
  io_func3_out_REG = _RAND_6[2:0];
  _RAND_7 = {1{`RANDOM}};
  io_func7_out_REG = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  io_ctrl_MemWr_out_REG = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  io_ctrl_MemRd_out_REG = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  io_ctrl_Reg_W_out_REG = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  io_ctrl_MemToReg_out_REG = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  io_ctrl_AluOp_out_REG = _RAND_12[2:0];
  _RAND_13 = {1{`RANDOM}};
  io_ctrl_OpA_out_REG = _RAND_13[1:0];
  _RAND_14 = {1{`RANDOM}};
  io_ctrl_OpB_out_REG = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  io_IFID_pc4_out_REG = _RAND_15[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module EX_MEM(
  input         clock,
  input         io_IDEX_MEMRD,
  input         io_IDEX_MEMWR,
  input         io_IDEX_MEMTOREG,
  input         io_IDEX_REG_W,
  input  [31:0] io_IDEX_rs2,
  input  [4:0]  io_IDEX_rd,
  input  [31:0] io_alu_out,
  output        io_EXMEM_memRd_out,
  output        io_EXMEM_memWr_out,
  output        io_EXMEM_memToReg_out,
  output        io_EXMEM_reg_w_out,
  output [31:0] io_EXMEM_rs2_out,
  output [4:0]  io_EXMEM_rd_out,
  output [31:0] io_EXMEM_alu_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  reg  io_EXMEM_memRd_out_REG; // @[EX_MEM.scala 25:39]
  reg  io_EXMEM_memWr_out_REG; // @[EX_MEM.scala 26:39]
  reg  io_EXMEM_memToReg_out_REG; // @[EX_MEM.scala 27:39]
  reg  io_EXMEM_reg_w_out_REG; // @[EX_MEM.scala 28:39]
  reg [31:0] io_EXMEM_rs2_out_REG; // @[EX_MEM.scala 29:39]
  reg [4:0] io_EXMEM_rd_out_REG; // @[EX_MEM.scala 30:39]
  reg [31:0] io_EXMEM_alu_out_REG; // @[EX_MEM.scala 31:39]
  assign io_EXMEM_memRd_out = io_EXMEM_memRd_out_REG; // @[EX_MEM.scala 25:29]
  assign io_EXMEM_memWr_out = io_EXMEM_memWr_out_REG; // @[EX_MEM.scala 26:29]
  assign io_EXMEM_memToReg_out = io_EXMEM_memToReg_out_REG; // @[EX_MEM.scala 27:29]
  assign io_EXMEM_reg_w_out = io_EXMEM_reg_w_out_REG; // @[EX_MEM.scala 28:29]
  assign io_EXMEM_rs2_out = io_EXMEM_rs2_out_REG; // @[EX_MEM.scala 29:29]
  assign io_EXMEM_rd_out = io_EXMEM_rd_out_REG; // @[EX_MEM.scala 30:29]
  assign io_EXMEM_alu_out = io_EXMEM_alu_out_REG; // @[EX_MEM.scala 31:29]
  always @(posedge clock) begin
    io_EXMEM_memRd_out_REG <= io_IDEX_MEMRD; // @[EX_MEM.scala 25:39]
    io_EXMEM_memWr_out_REG <= io_IDEX_MEMWR; // @[EX_MEM.scala 26:39]
    io_EXMEM_memToReg_out_REG <= io_IDEX_MEMTOREG; // @[EX_MEM.scala 27:39]
    io_EXMEM_reg_w_out_REG <= io_IDEX_REG_W; // @[EX_MEM.scala 28:39]
    io_EXMEM_rs2_out_REG <= io_IDEX_rs2; // @[EX_MEM.scala 29:39]
    io_EXMEM_rd_out_REG <= io_IDEX_rd; // @[EX_MEM.scala 30:39]
    io_EXMEM_alu_out_REG <= io_alu_out; // @[EX_MEM.scala 31:39]
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
  io_EXMEM_memRd_out_REG = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  io_EXMEM_memWr_out_REG = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  io_EXMEM_memToReg_out_REG = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  io_EXMEM_reg_w_out_REG = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  io_EXMEM_rs2_out_REG = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  io_EXMEM_rd_out_REG = _RAND_5[4:0];
  _RAND_6 = {1{`RANDOM}};
  io_EXMEM_alu_out_REG = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MEM_WB(
  input         clock,
  input         io_EXMEM_MEMTOREG,
  input         io_EXMEM_REG_W,
  input         io_EXMEM_MEMRD,
  input  [4:0]  io_EXMEM_rd,
  input  [31:0] io_in_dataMem_out,
  input  [31:0] io_in_alu_out,
  output        io_MEMWB_memToReg_out,
  output        io_MEMWB_reg_w_out,
  output        io_MEMWB_memRd_out,
  output [4:0]  io_MEMWB_rd_out,
  output [31:0] io_MEMWB_dataMem_out,
  output [31:0] io_MEMWB_alu_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  reg  io_MEMWB_memToReg_out_REG; // @[MEM_WB.scala 23:39]
  reg  io_MEMWB_reg_w_out_REG; // @[MEM_WB.scala 24:39]
  reg  io_MEMWB_memRd_out_REG; // @[MEM_WB.scala 25:39]
  reg [4:0] io_MEMWB_rd_out_REG; // @[MEM_WB.scala 26:39]
  reg [31:0] io_MEMWB_dataMem_out_REG; // @[MEM_WB.scala 27:39]
  reg [31:0] io_MEMWB_alu_out_REG; // @[MEM_WB.scala 28:39]
  assign io_MEMWB_memToReg_out = io_MEMWB_memToReg_out_REG; // @[MEM_WB.scala 23:29]
  assign io_MEMWB_reg_w_out = io_MEMWB_reg_w_out_REG; // @[MEM_WB.scala 24:29]
  assign io_MEMWB_memRd_out = io_MEMWB_memRd_out_REG; // @[MEM_WB.scala 25:29]
  assign io_MEMWB_rd_out = io_MEMWB_rd_out_REG; // @[MEM_WB.scala 26:29]
  assign io_MEMWB_dataMem_out = io_MEMWB_dataMem_out_REG; // @[MEM_WB.scala 27:29]
  assign io_MEMWB_alu_out = io_MEMWB_alu_out_REG; // @[MEM_WB.scala 28:29]
  always @(posedge clock) begin
    io_MEMWB_memToReg_out_REG <= io_EXMEM_MEMTOREG; // @[MEM_WB.scala 23:39]
    io_MEMWB_reg_w_out_REG <= io_EXMEM_REG_W; // @[MEM_WB.scala 24:39]
    io_MEMWB_memRd_out_REG <= io_EXMEM_MEMRD; // @[MEM_WB.scala 25:39]
    io_MEMWB_rd_out_REG <= io_EXMEM_rd; // @[MEM_WB.scala 26:39]
    io_MEMWB_dataMem_out_REG <= io_in_dataMem_out; // @[MEM_WB.scala 27:39]
    io_MEMWB_alu_out_REG <= io_in_alu_out; // @[MEM_WB.scala 28:39]
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
  io_MEMWB_memToReg_out_REG = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  io_MEMWB_reg_w_out_REG = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  io_MEMWB_memRd_out_REG = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  io_MEMWB_rd_out_REG = _RAND_3[4:0];
  _RAND_4 = {1{`RANDOM}};
  io_MEMWB_dataMem_out_REG = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  io_MEMWB_alu_out_REG = _RAND_5[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PC(
  input         clock,
  input         reset,
  input  [31:0] io_in,
  output [31:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] PC; // @[PC.scala 11:21]
  assign io_out = PC; // @[PC.scala 12:12]
  always @(posedge clock) begin
    if (reset) begin // @[PC.scala 11:21]
      PC <= 32'sh0; // @[PC.scala 11:21]
    end else begin
      PC <= io_in; // @[PC.scala 13:8]
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
  PC = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PC4(
  input  [31:0] io_pc,
  output [31:0] io_out
);
  assign io_out = io_pc + 32'h4; // @[PC4.scala 11:21]
endmodule
module InstMem(
  input         clock,
  input  [31:0] io_addr,
  output [31:0] io_data
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [31:0] imem [0:1023]; // @[InstMem.scala 12:17]
  wire [31:0] imem_io_data_MPORT_data; // @[InstMem.scala 12:17]
  wire [9:0] imem_io_data_MPORT_addr; // @[InstMem.scala 12:17]
  wire [31:0] _io_data_T = io_addr / 3'h4; // @[InstMem.scala 14:26]
  assign imem_io_data_MPORT_addr = _io_data_T[9:0];
  assign imem_io_data_MPORT_data = imem[imem_io_data_MPORT_addr]; // @[InstMem.scala 12:17]
  assign io_data = imem_io_data_MPORT_data; // @[InstMem.scala 14:11]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    imem[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module DataMemory(
  input         clock,
  input  [31:0] io_addr,
  input  [31:0] io_dataIn,
  input         io_mem_read,
  input         io_mem_write,
  output [31:0] io_dataOut
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [31:0] Dmemory [0:1023]; // @[DataMemory.scala 13:20]
  wire [31:0] Dmemory_io_dataOut_MPORT_data; // @[DataMemory.scala 13:20]
  wire [9:0] Dmemory_io_dataOut_MPORT_addr; // @[DataMemory.scala 13:20]
  wire [31:0] Dmemory_MPORT_data; // @[DataMemory.scala 13:20]
  wire [9:0] Dmemory_MPORT_addr; // @[DataMemory.scala 13:20]
  wire  Dmemory_MPORT_mask; // @[DataMemory.scala 13:20]
  wire  Dmemory_MPORT_en; // @[DataMemory.scala 13:20]
  assign Dmemory_io_dataOut_MPORT_addr = io_addr[9:0];
  assign Dmemory_io_dataOut_MPORT_data = Dmemory[Dmemory_io_dataOut_MPORT_addr]; // @[DataMemory.scala 13:20]
  assign Dmemory_MPORT_data = io_dataIn;
  assign Dmemory_MPORT_addr = io_addr[9:0];
  assign Dmemory_MPORT_mask = 1'h1;
  assign Dmemory_MPORT_en = io_mem_write;
  assign io_dataOut = io_mem_read ? $signed(Dmemory_io_dataOut_MPORT_data) : $signed(32'sh0); // @[DataMemory.scala 19:21 DataMemory.scala 20:16 DataMemory.scala 14:14]
  always @(posedge clock) begin
    if(Dmemory_MPORT_en & Dmemory_MPORT_mask) begin
      Dmemory[Dmemory_MPORT_addr] <= Dmemory_MPORT_data; // @[DataMemory.scala 13:20]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    Dmemory[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Control(
  input  [6:0] io_opcode,
  output       io_mem_write,
  output       io_branch,
  output       io_mem_read,
  output       io_reg_write,
  output       io_men_to_reg,
  output [2:0] io_alu_operation,
  output [1:0] io_operand_A,
  output       io_operand_B,
  output [1:0] io_extend,
  output [1:0] io_next_pc_sel
);
  wire  _T = 7'h33 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_1 = 7'h13 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_2 = 7'h23 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_3 = 7'h3 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_4 = 7'h63 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_5 = 7'h6f == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_6 = 7'h67 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_7 = 7'h37 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_8 = 7'h17 == io_opcode; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_2 = _T_8 ? 3'h7 : 3'h0; // @[Conditional.scala 39:67 Control.scala 152:24 Control.scala 26:20]
  wire [1:0] _GEN_3 = _T_8 ? 2'h2 : 2'h0; // @[Conditional.scala 39:67 Control.scala 153:20 Control.scala 27:16]
  wire  _GEN_5 = _T_7 | _T_8; // @[Conditional.scala 39:67 Control.scala 136:20]
  wire [2:0] _GEN_6 = _T_7 ? 3'h6 : _GEN_2; // @[Conditional.scala 39:67 Control.scala 138:24]
  wire [1:0] _GEN_7 = _T_7 ? 2'h3 : _GEN_3; // @[Conditional.scala 39:67 Control.scala 139:20]
  wire [1:0] _GEN_8 = _T_7 ? 2'h2 : _GEN_3; // @[Conditional.scala 39:67 Control.scala 141:17]
  wire  _GEN_10 = _T_6 | _GEN_5; // @[Conditional.scala 39:67 Control.scala 122:20]
  wire [2:0] _GEN_11 = _T_6 ? 3'h3 : _GEN_6; // @[Conditional.scala 39:67 Control.scala 124:24]
  wire [1:0] _GEN_12 = _T_6 ? 2'h1 : _GEN_7; // @[Conditional.scala 39:67 Control.scala 125:20]
  wire  _GEN_13 = _T_6 ? 1'h0 : _GEN_5; // @[Conditional.scala 39:67 Control.scala 126:20]
  wire [1:0] _GEN_14 = _T_6 ? 2'h0 : _GEN_8; // @[Conditional.scala 39:67 Control.scala 127:17]
  wire [1:0] _GEN_15 = _T_6 ? 2'h3 : 2'h0; // @[Conditional.scala 39:67 Control.scala 128:22]
  wire  _GEN_17 = _T_5 | _GEN_10; // @[Conditional.scala 39:67 Control.scala 108:20]
  wire [2:0] _GEN_18 = _T_5 ? 3'h3 : _GEN_11; // @[Conditional.scala 39:67 Control.scala 110:24]
  wire [1:0] _GEN_19 = _T_5 ? 2'h1 : _GEN_12; // @[Conditional.scala 39:67 Control.scala 111:20]
  wire  _GEN_20 = _T_5 ? 1'h0 : _GEN_13; // @[Conditional.scala 39:67 Control.scala 112:20]
  wire [1:0] _GEN_21 = _T_5 ? 2'h0 : _GEN_14; // @[Conditional.scala 39:67 Control.scala 113:17]
  wire [1:0] _GEN_22 = _T_5 ? 2'h2 : _GEN_15; // @[Conditional.scala 39:67 Control.scala 114:22]
  wire  _GEN_25 = _T_4 ? 1'h0 : _GEN_17; // @[Conditional.scala 39:67 Control.scala 94:20]
  wire [2:0] _GEN_26 = _T_4 ? 3'h2 : _GEN_18; // @[Conditional.scala 39:67 Control.scala 96:24]
  wire [1:0] _GEN_27 = _T_4 ? 2'h0 : _GEN_19; // @[Conditional.scala 39:67 Control.scala 97:20]
  wire  _GEN_28 = _T_4 ? 1'h0 : _GEN_20; // @[Conditional.scala 39:67 Control.scala 98:20]
  wire [1:0] _GEN_29 = _T_4 ? 2'h0 : _GEN_21; // @[Conditional.scala 39:67 Control.scala 99:17]
  wire [1:0] _GEN_30 = _T_4 ? 2'h1 : _GEN_22; // @[Conditional.scala 39:67 Control.scala 100:22]
  wire  _GEN_32 = _T_3 ? 1'h0 : _T_4; // @[Conditional.scala 39:67 Control.scala 78:17]
  wire  _GEN_34 = _T_3 | _GEN_25; // @[Conditional.scala 39:67 Control.scala 80:20]
  wire [2:0] _GEN_35 = _T_3 ? 3'h4 : _GEN_26; // @[Conditional.scala 39:67 Control.scala 82:24]
  wire [1:0] _GEN_36 = _T_3 ? 2'h0 : _GEN_27; // @[Conditional.scala 39:67 Control.scala 83:20]
  wire  _GEN_37 = _T_3 | _GEN_28; // @[Conditional.scala 39:67 Control.scala 84:20]
  wire [1:0] _GEN_38 = _T_3 ? 2'h0 : _GEN_29; // @[Conditional.scala 39:67 Control.scala 85:17]
  wire [1:0] _GEN_39 = _T_3 ? 2'h0 : _GEN_30; // @[Conditional.scala 39:67 Control.scala 86:22]
  wire  _GEN_41 = _T_2 ? 1'h0 : _GEN_32; // @[Conditional.scala 39:67 Control.scala 64:17]
  wire  _GEN_42 = _T_2 ? 1'h0 : _T_3; // @[Conditional.scala 39:67 Control.scala 65:19]
  wire  _GEN_43 = _T_2 ? 1'h0 : _GEN_34; // @[Conditional.scala 39:67 Control.scala 66:20]
  wire [2:0] _GEN_44 = _T_2 ? 3'h5 : _GEN_35; // @[Conditional.scala 39:67 Control.scala 68:24]
  wire [1:0] _GEN_45 = _T_2 ? 2'h0 : _GEN_36; // @[Conditional.scala 39:67 Control.scala 69:20]
  wire  _GEN_46 = _T_2 | _GEN_37; // @[Conditional.scala 39:67 Control.scala 70:20]
  wire [1:0] _GEN_47 = _T_2 ? 2'h1 : _GEN_38; // @[Conditional.scala 39:67 Control.scala 71:17]
  wire [1:0] _GEN_48 = _T_2 ? 2'h0 : _GEN_39; // @[Conditional.scala 39:67 Control.scala 72:22]
  wire  _GEN_49 = _T_1 ? 1'h0 : _T_2; // @[Conditional.scala 39:67 Control.scala 49:20]
  wire  _GEN_50 = _T_1 ? 1'h0 : _GEN_41; // @[Conditional.scala 39:67 Control.scala 50:17]
  wire  _GEN_51 = _T_1 ? 1'h0 : _GEN_42; // @[Conditional.scala 39:67 Control.scala 51:19]
  wire  _GEN_52 = _T_1 | _GEN_43; // @[Conditional.scala 39:67 Control.scala 52:20]
  wire [2:0] _GEN_53 = _T_1 ? 3'h1 : _GEN_44; // @[Conditional.scala 39:67 Control.scala 54:24]
  wire [1:0] _GEN_54 = _T_1 ? 2'h0 : _GEN_45; // @[Conditional.scala 39:67 Control.scala 55:20]
  wire  _GEN_55 = _T_1 | _GEN_46; // @[Conditional.scala 39:67 Control.scala 56:20]
  wire [1:0] _GEN_56 = _T_1 ? 2'h0 : _GEN_47; // @[Conditional.scala 39:67 Control.scala 57:17]
  wire [1:0] _GEN_57 = _T_1 ? 2'h0 : _GEN_48; // @[Conditional.scala 39:67 Control.scala 58:22]
  assign io_mem_write = _T ? 1'h0 : _GEN_49; // @[Conditional.scala 40:58 Control.scala 35:20]
  assign io_branch = _T ? 1'h0 : _GEN_50; // @[Conditional.scala 40:58 Control.scala 36:17]
  assign io_mem_read = _T ? 1'h0 : _GEN_51; // @[Conditional.scala 40:58 Control.scala 37:19]
  assign io_reg_write = _T | _GEN_52; // @[Conditional.scala 40:58 Control.scala 38:20]
  assign io_men_to_reg = _T ? 1'h0 : _GEN_51; // @[Conditional.scala 40:58 Control.scala 37:19]
  assign io_alu_operation = _T ? 3'h0 : _GEN_53; // @[Conditional.scala 40:58 Control.scala 40:24]
  assign io_operand_A = _T ? 2'h0 : _GEN_54; // @[Conditional.scala 40:58 Control.scala 41:20]
  assign io_operand_B = _T ? 1'h0 : _GEN_55; // @[Conditional.scala 40:58 Control.scala 42:20]
  assign io_extend = _T ? 2'h0 : _GEN_56; // @[Conditional.scala 40:58 Control.scala 43:17]
  assign io_next_pc_sel = _T ? 2'h0 : _GEN_57; // @[Conditional.scala 40:58 Control.scala 44:22]
endmodule
module ImmGenerator(
  input  [31:0] io_instr,
  input  [31:0] io_pc,
  output [31:0] io_I_type,
  output [31:0] io_S_type,
  output [31:0] io_SB_type,
  output [31:0] io_U_type,
  output [31:0] io_UJ_type
);
  wire [19:0] io_I_type_hi = io_instr[31] ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12]
  wire [11:0] io_I_type_lo = io_instr[31:20]; // @[ImmGenerator.scala 18:52]
  wire [6:0] io_S_type_hi_lo = io_instr[31:25]; // @[ImmGenerator.scala 21:52]
  wire [4:0] io_S_type_lo = io_instr[11:7]; // @[ImmGenerator.scala 21:70]
  wire [18:0] sbImm_hi_hi_hi = io_instr[31] ? 19'h7ffff : 19'h0; // @[Bitwise.scala 72:12]
  wire  sbImm_hi_lo = io_instr[7]; // @[ImmGenerator.scala 24:65]
  wire [5:0] sbImm_lo_hi_hi = io_instr[30:25]; // @[ImmGenerator.scala 24:78]
  wire [3:0] sbImm_lo_hi_lo = io_instr[11:8]; // @[ImmGenerator.scala 24:96]
  wire [31:0] sbImm = {sbImm_hi_hi_hi,io_instr[31],sbImm_hi_lo,sbImm_lo_hi_hi,sbImm_lo_hi_lo,1'h0}; // @[ImmGenerator.scala 24:115]
  wire [19:0] io_U_type_hi = io_instr[31:12]; // @[ImmGenerator.scala 28:28]
  wire [10:0] ujImm_hi_hi_hi = io_instr[31] ? 11'h7ff : 11'h0; // @[Bitwise.scala 72:12]
  wire [7:0] ujImm_hi_lo = io_instr[19:12]; // @[ImmGenerator.scala 31:65]
  wire  ujImm_lo_hi_hi = io_instr[20]; // @[ImmGenerator.scala 31:83]
  wire [9:0] ujImm_lo_hi_lo = io_instr[30:21]; // @[ImmGenerator.scala 31:97]
  wire [31:0] ujImm = {ujImm_hi_hi_hi,io_instr[31],ujImm_hi_lo,ujImm_lo_hi_hi,ujImm_lo_hi_lo,1'h0}; // @[ImmGenerator.scala 31:117]
  assign io_I_type = {io_I_type_hi,io_I_type_lo}; // @[ImmGenerator.scala 18:62]
  assign io_S_type = {io_I_type_hi,io_S_type_hi_lo,io_S_type_lo}; // @[ImmGenerator.scala 21:79]
  assign io_SB_type = $signed(sbImm) + $signed(io_pc); // @[ImmGenerator.scala 25:23]
  assign io_U_type = {io_U_type_hi,12'h0}; // @[ImmGenerator.scala 28:53]
  assign io_UJ_type = $signed(ujImm) + $signed(io_pc); // @[ImmGenerator.scala 32:23]
endmodule
module RegisterFile(
  input         clock,
  input         reset,
  input  [4:0]  io_rs1,
  input  [4:0]  io_rs2,
  input         io_reg_write,
  input  [4:0]  io_w_reg,
  input  [31:0] io_w_data,
  output [31:0] io_rdata1,
  output [31:0] io_rdata2
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
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] regfile_0; // @[RegisterFile.scala 15:24]
  reg [31:0] regfile_1; // @[RegisterFile.scala 15:24]
  reg [31:0] regfile_2; // @[RegisterFile.scala 15:24]
  reg [31:0] regfile_3; // @[RegisterFile.scala 15:24]
  reg [31:0] regfile_4; // @[RegisterFile.scala 15:24]
  reg [31:0] regfile_5; // @[RegisterFile.scala 15:24]
  reg [31:0] regfile_6; // @[RegisterFile.scala 15:24]
  reg [31:0] regfile_7; // @[RegisterFile.scala 15:24]
  reg [31:0] regfile_8; // @[RegisterFile.scala 15:24]
  reg [31:0] regfile_9; // @[RegisterFile.scala 15:24]
  reg [31:0] regfile_10; // @[RegisterFile.scala 15:24]
  reg [31:0] regfile_11; // @[RegisterFile.scala 15:24]
  reg [31:0] regfile_12; // @[RegisterFile.scala 15:24]
  reg [31:0] regfile_13; // @[RegisterFile.scala 15:24]
  reg [31:0] regfile_14; // @[RegisterFile.scala 15:24]
  reg [31:0] regfile_15; // @[RegisterFile.scala 15:24]
  reg [31:0] regfile_16; // @[RegisterFile.scala 15:24]
  reg [31:0] regfile_17; // @[RegisterFile.scala 15:24]
  reg [31:0] regfile_18; // @[RegisterFile.scala 15:24]
  reg [31:0] regfile_19; // @[RegisterFile.scala 15:24]
  reg [31:0] regfile_20; // @[RegisterFile.scala 15:24]
  reg [31:0] regfile_21; // @[RegisterFile.scala 15:24]
  reg [31:0] regfile_22; // @[RegisterFile.scala 15:24]
  reg [31:0] regfile_23; // @[RegisterFile.scala 15:24]
  reg [31:0] regfile_24; // @[RegisterFile.scala 15:24]
  reg [31:0] regfile_25; // @[RegisterFile.scala 15:24]
  reg [31:0] regfile_26; // @[RegisterFile.scala 15:24]
  reg [31:0] regfile_27; // @[RegisterFile.scala 15:24]
  reg [31:0] regfile_28; // @[RegisterFile.scala 15:24]
  reg [31:0] regfile_29; // @[RegisterFile.scala 15:24]
  reg [31:0] regfile_30; // @[RegisterFile.scala 15:24]
  reg [31:0] regfile_31; // @[RegisterFile.scala 15:24]
  wire [31:0] _GEN_1 = 5'h1 == io_rs1 ? $signed(regfile_1) : $signed(regfile_0); // @[RegisterFile.scala 17:19 RegisterFile.scala 17:19]
  wire [31:0] _GEN_2 = 5'h2 == io_rs1 ? $signed(regfile_2) : $signed(_GEN_1); // @[RegisterFile.scala 17:19 RegisterFile.scala 17:19]
  wire [31:0] _GEN_3 = 5'h3 == io_rs1 ? $signed(regfile_3) : $signed(_GEN_2); // @[RegisterFile.scala 17:19 RegisterFile.scala 17:19]
  wire [31:0] _GEN_4 = 5'h4 == io_rs1 ? $signed(regfile_4) : $signed(_GEN_3); // @[RegisterFile.scala 17:19 RegisterFile.scala 17:19]
  wire [31:0] _GEN_5 = 5'h5 == io_rs1 ? $signed(regfile_5) : $signed(_GEN_4); // @[RegisterFile.scala 17:19 RegisterFile.scala 17:19]
  wire [31:0] _GEN_6 = 5'h6 == io_rs1 ? $signed(regfile_6) : $signed(_GEN_5); // @[RegisterFile.scala 17:19 RegisterFile.scala 17:19]
  wire [31:0] _GEN_7 = 5'h7 == io_rs1 ? $signed(regfile_7) : $signed(_GEN_6); // @[RegisterFile.scala 17:19 RegisterFile.scala 17:19]
  wire [31:0] _GEN_8 = 5'h8 == io_rs1 ? $signed(regfile_8) : $signed(_GEN_7); // @[RegisterFile.scala 17:19 RegisterFile.scala 17:19]
  wire [31:0] _GEN_9 = 5'h9 == io_rs1 ? $signed(regfile_9) : $signed(_GEN_8); // @[RegisterFile.scala 17:19 RegisterFile.scala 17:19]
  wire [31:0] _GEN_10 = 5'ha == io_rs1 ? $signed(regfile_10) : $signed(_GEN_9); // @[RegisterFile.scala 17:19 RegisterFile.scala 17:19]
  wire [31:0] _GEN_11 = 5'hb == io_rs1 ? $signed(regfile_11) : $signed(_GEN_10); // @[RegisterFile.scala 17:19 RegisterFile.scala 17:19]
  wire [31:0] _GEN_12 = 5'hc == io_rs1 ? $signed(regfile_12) : $signed(_GEN_11); // @[RegisterFile.scala 17:19 RegisterFile.scala 17:19]
  wire [31:0] _GEN_13 = 5'hd == io_rs1 ? $signed(regfile_13) : $signed(_GEN_12); // @[RegisterFile.scala 17:19 RegisterFile.scala 17:19]
  wire [31:0] _GEN_14 = 5'he == io_rs1 ? $signed(regfile_14) : $signed(_GEN_13); // @[RegisterFile.scala 17:19 RegisterFile.scala 17:19]
  wire [31:0] _GEN_15 = 5'hf == io_rs1 ? $signed(regfile_15) : $signed(_GEN_14); // @[RegisterFile.scala 17:19 RegisterFile.scala 17:19]
  wire [31:0] _GEN_16 = 5'h10 == io_rs1 ? $signed(regfile_16) : $signed(_GEN_15); // @[RegisterFile.scala 17:19 RegisterFile.scala 17:19]
  wire [31:0] _GEN_17 = 5'h11 == io_rs1 ? $signed(regfile_17) : $signed(_GEN_16); // @[RegisterFile.scala 17:19 RegisterFile.scala 17:19]
  wire [31:0] _GEN_18 = 5'h12 == io_rs1 ? $signed(regfile_18) : $signed(_GEN_17); // @[RegisterFile.scala 17:19 RegisterFile.scala 17:19]
  wire [31:0] _GEN_19 = 5'h13 == io_rs1 ? $signed(regfile_19) : $signed(_GEN_18); // @[RegisterFile.scala 17:19 RegisterFile.scala 17:19]
  wire [31:0] _GEN_20 = 5'h14 == io_rs1 ? $signed(regfile_20) : $signed(_GEN_19); // @[RegisterFile.scala 17:19 RegisterFile.scala 17:19]
  wire [31:0] _GEN_21 = 5'h15 == io_rs1 ? $signed(regfile_21) : $signed(_GEN_20); // @[RegisterFile.scala 17:19 RegisterFile.scala 17:19]
  wire [31:0] _GEN_22 = 5'h16 == io_rs1 ? $signed(regfile_22) : $signed(_GEN_21); // @[RegisterFile.scala 17:19 RegisterFile.scala 17:19]
  wire [31:0] _GEN_23 = 5'h17 == io_rs1 ? $signed(regfile_23) : $signed(_GEN_22); // @[RegisterFile.scala 17:19 RegisterFile.scala 17:19]
  wire [31:0] _GEN_24 = 5'h18 == io_rs1 ? $signed(regfile_24) : $signed(_GEN_23); // @[RegisterFile.scala 17:19 RegisterFile.scala 17:19]
  wire [31:0] _GEN_25 = 5'h19 == io_rs1 ? $signed(regfile_25) : $signed(_GEN_24); // @[RegisterFile.scala 17:19 RegisterFile.scala 17:19]
  wire [31:0] _GEN_26 = 5'h1a == io_rs1 ? $signed(regfile_26) : $signed(_GEN_25); // @[RegisterFile.scala 17:19 RegisterFile.scala 17:19]
  wire [31:0] _GEN_27 = 5'h1b == io_rs1 ? $signed(regfile_27) : $signed(_GEN_26); // @[RegisterFile.scala 17:19 RegisterFile.scala 17:19]
  wire [31:0] _GEN_28 = 5'h1c == io_rs1 ? $signed(regfile_28) : $signed(_GEN_27); // @[RegisterFile.scala 17:19 RegisterFile.scala 17:19]
  wire [31:0] _GEN_29 = 5'h1d == io_rs1 ? $signed(regfile_29) : $signed(_GEN_28); // @[RegisterFile.scala 17:19 RegisterFile.scala 17:19]
  wire [31:0] _GEN_30 = 5'h1e == io_rs1 ? $signed(regfile_30) : $signed(_GEN_29); // @[RegisterFile.scala 17:19 RegisterFile.scala 17:19]
  wire [31:0] _GEN_31 = 5'h1f == io_rs1 ? $signed(regfile_31) : $signed(_GEN_30); // @[RegisterFile.scala 17:19 RegisterFile.scala 17:19]
  wire [31:0] _GEN_33 = 5'h1 == io_rs2 ? $signed(regfile_1) : $signed(regfile_0); // @[RegisterFile.scala 18:19 RegisterFile.scala 18:19]
  wire [31:0] _GEN_34 = 5'h2 == io_rs2 ? $signed(regfile_2) : $signed(_GEN_33); // @[RegisterFile.scala 18:19 RegisterFile.scala 18:19]
  wire [31:0] _GEN_35 = 5'h3 == io_rs2 ? $signed(regfile_3) : $signed(_GEN_34); // @[RegisterFile.scala 18:19 RegisterFile.scala 18:19]
  wire [31:0] _GEN_36 = 5'h4 == io_rs2 ? $signed(regfile_4) : $signed(_GEN_35); // @[RegisterFile.scala 18:19 RegisterFile.scala 18:19]
  wire [31:0] _GEN_37 = 5'h5 == io_rs2 ? $signed(regfile_5) : $signed(_GEN_36); // @[RegisterFile.scala 18:19 RegisterFile.scala 18:19]
  wire [31:0] _GEN_38 = 5'h6 == io_rs2 ? $signed(regfile_6) : $signed(_GEN_37); // @[RegisterFile.scala 18:19 RegisterFile.scala 18:19]
  wire [31:0] _GEN_39 = 5'h7 == io_rs2 ? $signed(regfile_7) : $signed(_GEN_38); // @[RegisterFile.scala 18:19 RegisterFile.scala 18:19]
  wire [31:0] _GEN_40 = 5'h8 == io_rs2 ? $signed(regfile_8) : $signed(_GEN_39); // @[RegisterFile.scala 18:19 RegisterFile.scala 18:19]
  wire [31:0] _GEN_41 = 5'h9 == io_rs2 ? $signed(regfile_9) : $signed(_GEN_40); // @[RegisterFile.scala 18:19 RegisterFile.scala 18:19]
  wire [31:0] _GEN_42 = 5'ha == io_rs2 ? $signed(regfile_10) : $signed(_GEN_41); // @[RegisterFile.scala 18:19 RegisterFile.scala 18:19]
  wire [31:0] _GEN_43 = 5'hb == io_rs2 ? $signed(regfile_11) : $signed(_GEN_42); // @[RegisterFile.scala 18:19 RegisterFile.scala 18:19]
  wire [31:0] _GEN_44 = 5'hc == io_rs2 ? $signed(regfile_12) : $signed(_GEN_43); // @[RegisterFile.scala 18:19 RegisterFile.scala 18:19]
  wire [31:0] _GEN_45 = 5'hd == io_rs2 ? $signed(regfile_13) : $signed(_GEN_44); // @[RegisterFile.scala 18:19 RegisterFile.scala 18:19]
  wire [31:0] _GEN_46 = 5'he == io_rs2 ? $signed(regfile_14) : $signed(_GEN_45); // @[RegisterFile.scala 18:19 RegisterFile.scala 18:19]
  wire [31:0] _GEN_47 = 5'hf == io_rs2 ? $signed(regfile_15) : $signed(_GEN_46); // @[RegisterFile.scala 18:19 RegisterFile.scala 18:19]
  wire [31:0] _GEN_48 = 5'h10 == io_rs2 ? $signed(regfile_16) : $signed(_GEN_47); // @[RegisterFile.scala 18:19 RegisterFile.scala 18:19]
  wire [31:0] _GEN_49 = 5'h11 == io_rs2 ? $signed(regfile_17) : $signed(_GEN_48); // @[RegisterFile.scala 18:19 RegisterFile.scala 18:19]
  wire [31:0] _GEN_50 = 5'h12 == io_rs2 ? $signed(regfile_18) : $signed(_GEN_49); // @[RegisterFile.scala 18:19 RegisterFile.scala 18:19]
  wire [31:0] _GEN_51 = 5'h13 == io_rs2 ? $signed(regfile_19) : $signed(_GEN_50); // @[RegisterFile.scala 18:19 RegisterFile.scala 18:19]
  wire [31:0] _GEN_52 = 5'h14 == io_rs2 ? $signed(regfile_20) : $signed(_GEN_51); // @[RegisterFile.scala 18:19 RegisterFile.scala 18:19]
  wire [31:0] _GEN_53 = 5'h15 == io_rs2 ? $signed(regfile_21) : $signed(_GEN_52); // @[RegisterFile.scala 18:19 RegisterFile.scala 18:19]
  wire [31:0] _GEN_54 = 5'h16 == io_rs2 ? $signed(regfile_22) : $signed(_GEN_53); // @[RegisterFile.scala 18:19 RegisterFile.scala 18:19]
  wire [31:0] _GEN_55 = 5'h17 == io_rs2 ? $signed(regfile_23) : $signed(_GEN_54); // @[RegisterFile.scala 18:19 RegisterFile.scala 18:19]
  wire [31:0] _GEN_56 = 5'h18 == io_rs2 ? $signed(regfile_24) : $signed(_GEN_55); // @[RegisterFile.scala 18:19 RegisterFile.scala 18:19]
  wire [31:0] _GEN_57 = 5'h19 == io_rs2 ? $signed(regfile_25) : $signed(_GEN_56); // @[RegisterFile.scala 18:19 RegisterFile.scala 18:19]
  wire [31:0] _GEN_58 = 5'h1a == io_rs2 ? $signed(regfile_26) : $signed(_GEN_57); // @[RegisterFile.scala 18:19 RegisterFile.scala 18:19]
  wire [31:0] _GEN_59 = 5'h1b == io_rs2 ? $signed(regfile_27) : $signed(_GEN_58); // @[RegisterFile.scala 18:19 RegisterFile.scala 18:19]
  wire [31:0] _GEN_60 = 5'h1c == io_rs2 ? $signed(regfile_28) : $signed(_GEN_59); // @[RegisterFile.scala 18:19 RegisterFile.scala 18:19]
  wire [31:0] _GEN_61 = 5'h1d == io_rs2 ? $signed(regfile_29) : $signed(_GEN_60); // @[RegisterFile.scala 18:19 RegisterFile.scala 18:19]
  wire [31:0] _GEN_62 = 5'h1e == io_rs2 ? $signed(regfile_30) : $signed(_GEN_61); // @[RegisterFile.scala 18:19 RegisterFile.scala 18:19]
  wire [31:0] _GEN_63 = 5'h1f == io_rs2 ? $signed(regfile_31) : $signed(_GEN_62); // @[RegisterFile.scala 18:19 RegisterFile.scala 18:19]
  assign io_rdata1 = io_rs1 == 5'h0 ? $signed(32'sh0) : $signed(_GEN_31); // @[RegisterFile.scala 17:19]
  assign io_rdata2 = io_rs2 == 5'h0 ? $signed(32'sh0) : $signed(_GEN_63); // @[RegisterFile.scala 18:19]
  always @(posedge clock) begin
    if (reset) begin // @[RegisterFile.scala 15:24]
      regfile_0 <= 32'sh0; // @[RegisterFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegisterFile.scala 20:42]
      if (5'h0 == io_w_reg) begin // @[RegisterFile.scala 21:23]
        regfile_0 <= io_w_data; // @[RegisterFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegisterFile.scala 15:24]
      regfile_1 <= 32'sh0; // @[RegisterFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegisterFile.scala 20:42]
      if (5'h1 == io_w_reg) begin // @[RegisterFile.scala 21:23]
        regfile_1 <= io_w_data; // @[RegisterFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegisterFile.scala 15:24]
      regfile_2 <= 32'sh0; // @[RegisterFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegisterFile.scala 20:42]
      if (5'h2 == io_w_reg) begin // @[RegisterFile.scala 21:23]
        regfile_2 <= io_w_data; // @[RegisterFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegisterFile.scala 15:24]
      regfile_3 <= 32'sh0; // @[RegisterFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegisterFile.scala 20:42]
      if (5'h3 == io_w_reg) begin // @[RegisterFile.scala 21:23]
        regfile_3 <= io_w_data; // @[RegisterFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegisterFile.scala 15:24]
      regfile_4 <= 32'sh0; // @[RegisterFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegisterFile.scala 20:42]
      if (5'h4 == io_w_reg) begin // @[RegisterFile.scala 21:23]
        regfile_4 <= io_w_data; // @[RegisterFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegisterFile.scala 15:24]
      regfile_5 <= 32'sh0; // @[RegisterFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegisterFile.scala 20:42]
      if (5'h5 == io_w_reg) begin // @[RegisterFile.scala 21:23]
        regfile_5 <= io_w_data; // @[RegisterFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegisterFile.scala 15:24]
      regfile_6 <= 32'sh0; // @[RegisterFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegisterFile.scala 20:42]
      if (5'h6 == io_w_reg) begin // @[RegisterFile.scala 21:23]
        regfile_6 <= io_w_data; // @[RegisterFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegisterFile.scala 15:24]
      regfile_7 <= 32'sh0; // @[RegisterFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegisterFile.scala 20:42]
      if (5'h7 == io_w_reg) begin // @[RegisterFile.scala 21:23]
        regfile_7 <= io_w_data; // @[RegisterFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegisterFile.scala 15:24]
      regfile_8 <= 32'sh0; // @[RegisterFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegisterFile.scala 20:42]
      if (5'h8 == io_w_reg) begin // @[RegisterFile.scala 21:23]
        regfile_8 <= io_w_data; // @[RegisterFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegisterFile.scala 15:24]
      regfile_9 <= 32'sh0; // @[RegisterFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegisterFile.scala 20:42]
      if (5'h9 == io_w_reg) begin // @[RegisterFile.scala 21:23]
        regfile_9 <= io_w_data; // @[RegisterFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegisterFile.scala 15:24]
      regfile_10 <= 32'sh0; // @[RegisterFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegisterFile.scala 20:42]
      if (5'ha == io_w_reg) begin // @[RegisterFile.scala 21:23]
        regfile_10 <= io_w_data; // @[RegisterFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegisterFile.scala 15:24]
      regfile_11 <= 32'sh0; // @[RegisterFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegisterFile.scala 20:42]
      if (5'hb == io_w_reg) begin // @[RegisterFile.scala 21:23]
        regfile_11 <= io_w_data; // @[RegisterFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegisterFile.scala 15:24]
      regfile_12 <= 32'sh0; // @[RegisterFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegisterFile.scala 20:42]
      if (5'hc == io_w_reg) begin // @[RegisterFile.scala 21:23]
        regfile_12 <= io_w_data; // @[RegisterFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegisterFile.scala 15:24]
      regfile_13 <= 32'sh0; // @[RegisterFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegisterFile.scala 20:42]
      if (5'hd == io_w_reg) begin // @[RegisterFile.scala 21:23]
        regfile_13 <= io_w_data; // @[RegisterFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegisterFile.scala 15:24]
      regfile_14 <= 32'sh0; // @[RegisterFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegisterFile.scala 20:42]
      if (5'he == io_w_reg) begin // @[RegisterFile.scala 21:23]
        regfile_14 <= io_w_data; // @[RegisterFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegisterFile.scala 15:24]
      regfile_15 <= 32'sh0; // @[RegisterFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegisterFile.scala 20:42]
      if (5'hf == io_w_reg) begin // @[RegisterFile.scala 21:23]
        regfile_15 <= io_w_data; // @[RegisterFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegisterFile.scala 15:24]
      regfile_16 <= 32'sh0; // @[RegisterFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegisterFile.scala 20:42]
      if (5'h10 == io_w_reg) begin // @[RegisterFile.scala 21:23]
        regfile_16 <= io_w_data; // @[RegisterFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegisterFile.scala 15:24]
      regfile_17 <= 32'sh0; // @[RegisterFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegisterFile.scala 20:42]
      if (5'h11 == io_w_reg) begin // @[RegisterFile.scala 21:23]
        regfile_17 <= io_w_data; // @[RegisterFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegisterFile.scala 15:24]
      regfile_18 <= 32'sh0; // @[RegisterFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegisterFile.scala 20:42]
      if (5'h12 == io_w_reg) begin // @[RegisterFile.scala 21:23]
        regfile_18 <= io_w_data; // @[RegisterFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegisterFile.scala 15:24]
      regfile_19 <= 32'sh0; // @[RegisterFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegisterFile.scala 20:42]
      if (5'h13 == io_w_reg) begin // @[RegisterFile.scala 21:23]
        regfile_19 <= io_w_data; // @[RegisterFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegisterFile.scala 15:24]
      regfile_20 <= 32'sh0; // @[RegisterFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegisterFile.scala 20:42]
      if (5'h14 == io_w_reg) begin // @[RegisterFile.scala 21:23]
        regfile_20 <= io_w_data; // @[RegisterFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegisterFile.scala 15:24]
      regfile_21 <= 32'sh0; // @[RegisterFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegisterFile.scala 20:42]
      if (5'h15 == io_w_reg) begin // @[RegisterFile.scala 21:23]
        regfile_21 <= io_w_data; // @[RegisterFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegisterFile.scala 15:24]
      regfile_22 <= 32'sh0; // @[RegisterFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegisterFile.scala 20:42]
      if (5'h16 == io_w_reg) begin // @[RegisterFile.scala 21:23]
        regfile_22 <= io_w_data; // @[RegisterFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegisterFile.scala 15:24]
      regfile_23 <= 32'sh0; // @[RegisterFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegisterFile.scala 20:42]
      if (5'h17 == io_w_reg) begin // @[RegisterFile.scala 21:23]
        regfile_23 <= io_w_data; // @[RegisterFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegisterFile.scala 15:24]
      regfile_24 <= 32'sh0; // @[RegisterFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegisterFile.scala 20:42]
      if (5'h18 == io_w_reg) begin // @[RegisterFile.scala 21:23]
        regfile_24 <= io_w_data; // @[RegisterFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegisterFile.scala 15:24]
      regfile_25 <= 32'sh0; // @[RegisterFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegisterFile.scala 20:42]
      if (5'h19 == io_w_reg) begin // @[RegisterFile.scala 21:23]
        regfile_25 <= io_w_data; // @[RegisterFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegisterFile.scala 15:24]
      regfile_26 <= 32'sh0; // @[RegisterFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegisterFile.scala 20:42]
      if (5'h1a == io_w_reg) begin // @[RegisterFile.scala 21:23]
        regfile_26 <= io_w_data; // @[RegisterFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegisterFile.scala 15:24]
      regfile_27 <= 32'sh0; // @[RegisterFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegisterFile.scala 20:42]
      if (5'h1b == io_w_reg) begin // @[RegisterFile.scala 21:23]
        regfile_27 <= io_w_data; // @[RegisterFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegisterFile.scala 15:24]
      regfile_28 <= 32'sh0; // @[RegisterFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegisterFile.scala 20:42]
      if (5'h1c == io_w_reg) begin // @[RegisterFile.scala 21:23]
        regfile_28 <= io_w_data; // @[RegisterFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegisterFile.scala 15:24]
      regfile_29 <= 32'sh0; // @[RegisterFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegisterFile.scala 20:42]
      if (5'h1d == io_w_reg) begin // @[RegisterFile.scala 21:23]
        regfile_29 <= io_w_data; // @[RegisterFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegisterFile.scala 15:24]
      regfile_30 <= 32'sh0; // @[RegisterFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegisterFile.scala 20:42]
      if (5'h1e == io_w_reg) begin // @[RegisterFile.scala 21:23]
        regfile_30 <= io_w_data; // @[RegisterFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegisterFile.scala 15:24]
      regfile_31 <= 32'sh0; // @[RegisterFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegisterFile.scala 20:42]
      if (5'h1f == io_w_reg) begin // @[RegisterFile.scala 21:23]
        regfile_31 <= io_w_data; // @[RegisterFile.scala 21:23]
      end
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
  regfile_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  regfile_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  regfile_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  regfile_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  regfile_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  regfile_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  regfile_6 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  regfile_7 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  regfile_8 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  regfile_9 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  regfile_10 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  regfile_11 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  regfile_12 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  regfile_13 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  regfile_14 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  regfile_15 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  regfile_16 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  regfile_17 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  regfile_18 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  regfile_19 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  regfile_20 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  regfile_21 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  regfile_22 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  regfile_23 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  regfile_24 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  regfile_25 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  regfile_26 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  regfile_27 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  regfile_28 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  regfile_29 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  regfile_30 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  regfile_31 = _RAND_31[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module AluControl(
  input  [2:0] io_func3,
  input        io_func7,
  input  [2:0] io_aluOp,
  output [4:0] io_out
);
  wire [5:0] _io_out_T = {2'h0,io_func7,io_func3}; // @[Cat.scala 30:58]
  wire [4:0] _io_out_T_1 = {2'h0,io_func3}; // @[Cat.scala 30:58]
  wire [5:0] _io_out_T_2 = {3'h2,io_func3}; // @[Cat.scala 30:58]
  wire [4:0] _GEN_1 = io_aluOp == 3'h3 ? 5'h1f : 5'h0; // @[Alu_Control.scala 27:32 Alu_Control.scala 28:12]
  wire [5:0] _GEN_2 = io_aluOp == 3'h2 ? _io_out_T_2 : {{1'd0}, _GEN_1}; // @[Alu_Control.scala 23:32 Alu_Control.scala 24:12]
  wire [5:0] _GEN_3 = io_aluOp == 3'h1 ? {{1'd0}, _io_out_T_1} : _GEN_2; // @[Alu_Control.scala 19:32 Alu_Control.scala 20:12]
  wire [5:0] _GEN_4 = io_aluOp == 3'h0 ? _io_out_T : _GEN_3; // @[Alu_Control.scala 15:26 Alu_Control.scala 16:12]
  assign io_out = _GEN_4[4:0];
endmodule
module ALU(
  input  [31:0] io_in_A,
  input  [31:0] io_in_B,
  input  [4:0]  io_alu_Op,
  output [31:0] io_out
);
  wire  _T_10 = 5'h0 == io_alu_Op | 5'h0 == io_alu_Op | 5'h0 == io_alu_Op | 5'h0 == io_alu_Op | 5'h0 == io_alu_Op | 5'h0
     == io_alu_Op; // @[Conditional.scala 37:55]
  wire [31:0] _result_T_2 = $signed(io_in_A) + $signed(io_in_B); // @[Alu.scala 45:25]
  wire  _T_13 = 5'h1 == io_alu_Op | 5'h1 == io_alu_Op; // @[Conditional.scala 37:55]
  wire [31:0] _result_T_3 = io_in_A; // @[Alu.scala 48:26]
  wire [62:0] _GEN_11 = {{31'd0}, _result_T_3}; // @[Alu.scala 48:33]
  wire [62:0] _result_T_6 = _GEN_11 << io_in_B[4:0]; // @[Alu.scala 48:51]
  wire  _T_16 = 5'h2 == io_alu_Op | 5'h2 == io_alu_Op; // @[Conditional.scala 37:55]
  wire [1:0] _result_T_8 = $signed(io_in_A) < $signed(io_in_B) ? $signed(2'sh1) : $signed(2'sh0); // @[Alu.scala 51:20]
  wire  _T_19 = 5'h3 == io_alu_Op | 5'h3 == io_alu_Op; // @[Conditional.scala 37:55]
  wire [1:0] _result_T_12 = io_in_A < io_in_B ? $signed(2'sh1) : $signed(2'sh0); // @[Alu.scala 54:20]
  wire  _T_22 = 5'h4 == io_alu_Op | 5'h4 == io_alu_Op; // @[Conditional.scala 37:55]
  wire [31:0] _result_T_14 = $signed(io_in_A) ^ $signed(io_in_B); // @[Alu.scala 57:25]
  wire  _T_25 = 5'h5 == io_alu_Op | 5'h5 == io_alu_Op; // @[Conditional.scala 37:55]
  wire [31:0] _result_T_18 = io_in_A >> io_in_B[4:0]; // @[Alu.scala 60:51]
  wire  _T_28 = 5'h6 == io_alu_Op | 5'h6 == io_alu_Op; // @[Conditional.scala 37:55]
  wire [31:0] _result_T_20 = $signed(io_in_A) | $signed(io_in_B); // @[Alu.scala 63:25]
  wire  _T_31 = 5'h7 == io_alu_Op | 5'h7 == io_alu_Op; // @[Conditional.scala 37:55]
  wire [31:0] _result_T_22 = $signed(io_in_A) & $signed(io_in_B); // @[Alu.scala 66:25]
  wire  _T_32 = 5'h8 == io_alu_Op; // @[Conditional.scala 37:30]
  wire [31:0] _result_T_25 = $signed(io_in_A) - $signed(io_in_B); // @[Alu.scala 69:25]
  wire  _T_35 = 5'hd == io_alu_Op | 5'hd == io_alu_Op; // @[Conditional.scala 37:55]
  wire [31:0] _result_T_27 = $signed(io_in_A) >>> io_in_B[4:0]; // @[Alu.scala 72:26]
  wire  _T_38 = 5'h1f == io_alu_Op | 5'h1f == io_alu_Op; // @[Conditional.scala 37:55]
  wire [31:0] _GEN_0 = _T_38 ? $signed(io_in_A) : $signed(32'sh0); // @[Conditional.scala 39:67 Alu.scala 75:14]
  wire [31:0] _GEN_1 = _T_35 ? $signed(_result_T_27) : $signed(_GEN_0); // @[Conditional.scala 39:67 Alu.scala 72:14]
  wire [31:0] _GEN_2 = _T_32 ? $signed(_result_T_25) : $signed(_GEN_1); // @[Conditional.scala 39:67 Alu.scala 69:14]
  wire [31:0] _GEN_3 = _T_31 ? $signed(_result_T_22) : $signed(_GEN_2); // @[Conditional.scala 39:67 Alu.scala 66:14]
  wire [31:0] _GEN_4 = _T_28 ? $signed(_result_T_20) : $signed(_GEN_3); // @[Conditional.scala 39:67 Alu.scala 63:14]
  wire [31:0] _GEN_5 = _T_25 ? $signed(_result_T_18) : $signed(_GEN_4); // @[Conditional.scala 39:67 Alu.scala 60:14]
  wire [31:0] _GEN_6 = _T_22 ? $signed(_result_T_14) : $signed(_GEN_5); // @[Conditional.scala 39:67 Alu.scala 57:14]
  wire [31:0] _GEN_7 = _T_19 ? $signed({{30{_result_T_12[1]}},_result_T_12}) : $signed(_GEN_6); // @[Conditional.scala 39:67 Alu.scala 54:14]
  wire [31:0] _GEN_8 = _T_16 ? $signed({{30{_result_T_8[1]}},_result_T_8}) : $signed(_GEN_7); // @[Conditional.scala 39:67 Alu.scala 51:14]
  wire [62:0] _GEN_9 = _T_13 ? $signed(_result_T_6) : $signed({{31{_GEN_8[31]}},_GEN_8}); // @[Conditional.scala 39:67 Alu.scala 48:14]
  wire [62:0] _GEN_10 = _T_10 ? $signed({{31{_result_T_2[31]}},_result_T_2}) : $signed(_GEN_9); // @[Conditional.scala 40:58 Alu.scala 45:14]
  assign io_out = _GEN_10[31:0]; // @[Alu.scala 79:10]
endmodule
module Branch(
  input  [2:0]  io_fnct3,
  input         io_branch,
  input  [31:0] io_arg_x,
  input  [31:0] io_arg_y,
  output        io_br_taken
);
  wire  _GEN_0 = io_fnct3 == 3'h7 & io_arg_x >= io_arg_y; // @[BRANCH.scala 37:33 BRANCH.scala 38:19 BRANCH.scala 13:15]
  wire  _GEN_1 = io_fnct3 == 3'h6 ? io_arg_x < io_arg_y : _GEN_0; // @[BRANCH.scala 33:33 BRANCH.scala 34:19]
  wire  _GEN_2 = io_fnct3 == 3'h5 ? $signed(io_arg_x) >= $signed(io_arg_y) : _GEN_1; // @[BRANCH.scala 29:33 BRANCH.scala 30:19]
  wire  _GEN_3 = io_fnct3 == 3'h4 ? $signed(io_arg_x) < $signed(io_arg_y) : _GEN_2; // @[BRANCH.scala 25:33 BRANCH.scala 26:19]
  wire  _GEN_4 = io_fnct3 == 3'h1 ? $signed(io_arg_x) != $signed(io_arg_y) : _GEN_3; // @[BRANCH.scala 21:33 BRANCH.scala 22:19]
  wire  _GEN_5 = io_fnct3 == 3'h0 ? $signed(io_arg_x) == $signed(io_arg_y) : _GEN_4; // @[BRANCH.scala 17:28 BRANCH.scala 18:19]
  assign io_br_taken = io_branch & _GEN_5; // @[BRANCH.scala 15:19 BRANCH.scala 13:15]
endmodule
module Jalr(
  input  [31:0] io_imme,
  input  [31:0] io_rdata1,
  output [31:0] io_out
);
  wire [31:0] computedAddr = io_imme + io_rdata1; // @[JALR.scala 12:30]
  assign io_out = computedAddr & 32'hfffffffe; // @[JALR.scala 15:26]
endmodule
module Forwarding(
  input  [4:0] io_IDEX_rs1,
  input  [4:0] io_IDEX_rs2,
  input  [4:0] io_EXMEM_rd,
  input        io_EXMEM_regWr,
  input  [4:0] io_MEMWB_rd,
  input        io_MEMWB_regWr,
  output [1:0] io_forward_a,
  output [1:0] io_forward_b
);
  wire  _T_2 = io_EXMEM_regWr & io_EXMEM_rd != 5'h0; // @[Forwarding.scala 23:36]
  wire  _T_3 = io_EXMEM_rd == io_IDEX_rs1; // @[Forwarding.scala 24:26]
  wire  _T_4 = io_EXMEM_regWr & io_EXMEM_rd != 5'h0 & _T_3; // @[Forwarding.scala 23:66]
  wire  _T_5 = io_EXMEM_rd == io_IDEX_rs2; // @[Forwarding.scala 24:66]
  wire  _T_6 = _T_4 & io_EXMEM_rd == io_IDEX_rs2; // @[Forwarding.scala 24:50]
  wire  _T_11 = _T_2 & _T_5; // @[Forwarding.scala 28:72]
  wire [1:0] _GEN_0 = _T_4 ? 2'h2 : 2'h0; // @[Forwarding.scala 33:44 Forwarding.scala 34:22 Forwarding.scala 19:18]
  wire [1:0] _GEN_1 = _T_11 ? 2'h2 : 2'h0; // @[Forwarding.scala 29:44 Forwarding.scala 30:22 Forwarding.scala 20:18]
  wire [1:0] _GEN_2 = _T_11 ? 2'h0 : _GEN_0; // @[Forwarding.scala 29:44 Forwarding.scala 19:18]
  wire [1:0] _GEN_3 = _T_4 & io_EXMEM_rd == io_IDEX_rs2 ? 2'h2 : _GEN_2; // @[Forwarding.scala 24:84 Forwarding.scala 25:22]
  wire [1:0] _GEN_4 = _T_4 & io_EXMEM_rd == io_IDEX_rs2 ? 2'h2 : _GEN_1; // @[Forwarding.scala 24:84 Forwarding.scala 26:22]
  wire  _T_19 = io_MEMWB_regWr & io_MEMWB_rd != 5'h0; // @[Forwarding.scala 38:38]
  wire  _T_21 = io_MEMWB_regWr & io_MEMWB_rd != 5'h0 & io_MEMWB_rd == io_IDEX_rs1; // @[Forwarding.scala 38:70]
  wire  _T_22 = io_MEMWB_rd == io_IDEX_rs2; // @[Forwarding.scala 38:119]
  wire  _T_31 = ~_T_6; // @[Forwarding.scala 39:13]
  wire  _T_32 = io_MEMWB_regWr & io_MEMWB_rd != 5'h0 & io_MEMWB_rd == io_IDEX_rs1 & io_MEMWB_rd == io_IDEX_rs2 & _T_31; // @[Forwarding.scala 38:136]
  wire  _T_43 = ~_T_11; // @[Forwarding.scala 44:13]
  wire  _T_44 = _T_19 & _T_22 & _T_43; // @[Forwarding.scala 43:109]
  wire  _T_55 = ~_T_4; // @[Forwarding.scala 48:13]
  wire  _T_56 = _T_21 & _T_55; // @[Forwarding.scala 47:109]
  wire [1:0] _GEN_5 = _T_56 ? 2'h1 : _GEN_3; // @[Forwarding.scala 48:105 Forwarding.scala 49:22]
  wire [1:0] _GEN_6 = _T_44 ? 2'h1 : _GEN_4; // @[Forwarding.scala 44:105 Forwarding.scala 45:22]
  wire [1:0] _GEN_7 = _T_44 ? _GEN_3 : _GEN_5; // @[Forwarding.scala 44:105]
  assign io_forward_a = _T_32 ? 2'h1 : _GEN_7; // @[Forwarding.scala 39:139 Forwarding.scala 40:22]
  assign io_forward_b = _T_32 ? 2'h1 : _GEN_6; // @[Forwarding.scala 39:139 Forwarding.scala 41:22]
endmodule
module HazardDetection(
  input  [31:0] io_IF_ID_inst,
  input         io_ID_EX_memRead,
  input  [4:0]  io_ID_EX_rd,
  input  [31:0] io_pc_in,
  input  [31:0] io_current_pc,
  output        io_inst_forward,
  output        io_pc_forward,
  output        io_ctrl_forward,
  output [31:0] io_inst_out,
  output [31:0] io_pc_out,
  output [31:0] io_current_pc_out
);
  wire [4:0] Rs1 = io_IF_ID_inst[19:15]; // @[HazardDetection.scala 21:26]
  wire [4:0] Rs2 = io_IF_ID_inst[24:20]; // @[HazardDetection.scala 22:26]
  assign io_inst_forward = io_ID_EX_memRead & (io_ID_EX_rd == Rs1 | io_ID_EX_rd == Rs2); // @[HazardDetection.scala 24:33]
  assign io_pc_forward = io_ID_EX_memRead & (io_ID_EX_rd == Rs1 | io_ID_EX_rd == Rs2); // @[HazardDetection.scala 24:33]
  assign io_ctrl_forward = io_ID_EX_memRead & (io_ID_EX_rd == Rs1 | io_ID_EX_rd == Rs2); // @[HazardDetection.scala 24:33]
  assign io_inst_out = io_IF_ID_inst; // @[HazardDetection.scala 33:15]
  assign io_pc_out = io_pc_in; // @[HazardDetection.scala 34:13]
  assign io_current_pc_out = io_current_pc; // @[HazardDetection.scala 35:21]
endmodule
module BranchForward(
  input  [4:0] io_ID_EX_RD,
  input  [4:0] io_EX_MEM_RD,
  input  [4:0] io_MEM_WB_RD,
  input        io_ID_EX_memRd,
  input        io_EX_MEM_memRd,
  input        io_MEM_WB_memRd,
  input  [4:0] io_rs1,
  input  [4:0] io_rs2,
  input        io_ctrl_branch,
  output [3:0] io_forward_rs1,
  output [3:0] io_forward_rs2
);
  wire  _T_1 = io_ID_EX_RD != 5'h0; // @[BranchForward.scala 27:22]
  wire  _T_3 = io_ID_EX_RD != 5'h0 & ~io_ID_EX_memRd; // @[BranchForward.scala 27:30]
  wire  _T_4 = io_ID_EX_RD == io_rs1; // @[BranchForward.scala 28:24]
  wire  _T_5 = io_ID_EX_RD == io_rs2; // @[BranchForward.scala 28:50]
  wire  _GEN_2 = _T_4 ? 1'h0 : _T_5; // @[BranchForward.scala 31:42 BranchForward.scala 22:18]
  wire  _GEN_3 = io_ID_EX_RD == io_rs1 & io_ID_EX_RD == io_rs2 | io_ID_EX_RD == io_rs1; // @[BranchForward.scala 28:62 BranchForward.scala 29:24]
  wire  _GEN_4 = io_ID_EX_RD == io_rs1 & io_ID_EX_RD == io_rs2 | _GEN_2; // @[BranchForward.scala 28:62 BranchForward.scala 30:24]
  wire  _GEN_5 = io_ID_EX_RD != 5'h0 & ~io_ID_EX_memRd & _GEN_3; // @[BranchForward.scala 27:57 BranchForward.scala 21:18]
  wire  _GEN_6 = io_ID_EX_RD != 5'h0 & ~io_ID_EX_memRd & _GEN_4; // @[BranchForward.scala 27:57 BranchForward.scala 22:18]
  wire  _T_9 = io_EX_MEM_RD != 5'h0; // @[BranchForward.scala 39:23]
  wire  _T_11 = io_EX_MEM_RD != 5'h0 & ~io_EX_MEM_memRd; // @[BranchForward.scala 39:31]
  wire  _T_12 = io_EX_MEM_RD == io_rs1; // @[BranchForward.scala 40:25]
  wire  _T_13 = io_EX_MEM_RD == io_rs2; // @[BranchForward.scala 40:52]
  wire  _T_17 = _T_1 & _T_4; // @[BranchForward.scala 40:88]
  wire  _T_20 = ~(_T_1 & _T_4 & _T_5); // @[BranchForward.scala 40:66]
  wire  _T_26 = ~_T_17; // @[BranchForward.scala 43:45]
  wire  _T_32 = ~(_T_1 & _T_5); // @[BranchForward.scala 45:45]
  wire [1:0] _GEN_7 = _T_13 & ~(_T_1 & _T_5) ? 2'h2 : {{1'd0}, _GEN_6}; // @[BranchForward.scala 45:95 BranchForward.scala 46:24]
  wire [1:0] _GEN_8 = _T_12 & ~_T_17 ? 2'h2 : {{1'd0}, _GEN_5}; // @[BranchForward.scala 43:95 BranchForward.scala 44:24]
  wire [1:0] _GEN_9 = _T_12 & ~_T_17 ? {{1'd0}, _GEN_6} : _GEN_7; // @[BranchForward.scala 43:95]
  wire [1:0] _GEN_10 = io_EX_MEM_RD == io_rs1 & io_EX_MEM_RD == io_rs2 & ~(_T_1 & _T_4 & _T_5) ? 2'h2 : _GEN_8; // @[BranchForward.scala 40:142 BranchForward.scala 41:24]
  wire [1:0] _GEN_11 = io_EX_MEM_RD == io_rs1 & io_EX_MEM_RD == io_rs2 & ~(_T_1 & _T_4 & _T_5) ? 2'h2 : _GEN_9; // @[BranchForward.scala 40:142 BranchForward.scala 42:24]
  wire [1:0] _GEN_12 = io_EX_MEM_RD != 5'h0 & ~io_EX_MEM_memRd ? _GEN_10 : {{1'd0}, _GEN_5}; // @[BranchForward.scala 39:59]
  wire [1:0] _GEN_13 = io_EX_MEM_RD != 5'h0 & ~io_EX_MEM_memRd ? _GEN_11 : {{1'd0}, _GEN_6}; // @[BranchForward.scala 39:59]
  wire  _T_34 = io_MEM_WB_RD != 5'h0; // @[BranchForward.scala 51:23]
  wire  _T_36 = io_MEM_WB_RD != 5'h0 & ~io_MEM_WB_memRd; // @[BranchForward.scala 51:31]
  wire  _T_37 = io_MEM_WB_RD == io_rs1; // @[BranchForward.scala 52:25]
  wire  _T_38 = io_MEM_WB_RD == io_rs2; // @[BranchForward.scala 52:52]
  wire  _T_49 = _T_9 & _T_12; // @[BranchForward.scala 52:167]
  wire  _T_63 = ~_T_49; // @[BranchForward.scala 55:97]
  wire [1:0] _GEN_14 = _T_38 & _T_32 & ~(_T_9 & _T_13) ? 2'h3 : _GEN_13; // @[BranchForward.scala 57:149 BranchForward.scala 58:24]
  wire [1:0] _GEN_15 = _T_37 & _T_26 & ~_T_49 ? 2'h3 : _GEN_12; // @[BranchForward.scala 55:149 BranchForward.scala 56:24]
  wire [1:0] _GEN_16 = _T_37 & _T_26 & ~_T_49 ? _GEN_13 : _GEN_14; // @[BranchForward.scala 55:149]
  wire [1:0] _GEN_17 = io_MEM_WB_RD == io_rs1 & io_MEM_WB_RD == io_rs2 & _T_20 & ~(_T_9 & _T_12 & _T_13) ? 2'h3 :
    _GEN_15; // @[BranchForward.scala 52:223 BranchForward.scala 53:24]
  wire [1:0] _GEN_18 = io_MEM_WB_RD == io_rs1 & io_MEM_WB_RD == io_rs2 & _T_20 & ~(_T_9 & _T_12 & _T_13) ? 2'h3 :
    _GEN_16; // @[BranchForward.scala 52:223 BranchForward.scala 54:24]
  wire [1:0] _GEN_19 = io_MEM_WB_RD != 5'h0 & ~io_MEM_WB_memRd ? _GEN_17 : _GEN_12; // @[BranchForward.scala 51:59]
  wire [1:0] _GEN_20 = io_MEM_WB_RD != 5'h0 & ~io_MEM_WB_memRd ? _GEN_18 : _GEN_13; // @[BranchForward.scala 51:59]
  wire [3:0] _GEN_21 = _T_34 & io_MEM_WB_memRd & _T_37 & _T_26 & _T_63 ? 4'ha : 4'h0; // @[BranchForward.scala 72:198 BranchForward.scala 73:22 BranchForward.scala 21:18]
  wire [3:0] _GEN_22 = _T_36 & _T_37 & _T_26 & _T_63 ? 4'h8 : _GEN_21; // @[BranchForward.scala 70:198 BranchForward.scala 71:22]
  wire [3:0] _GEN_23 = _T_9 & io_EX_MEM_memRd & _T_12 & _T_26 ? 4'h9 : _GEN_22; // @[BranchForward.scala 68:144 BranchForward.scala 69:22]
  wire [3:0] _GEN_24 = _T_11 & _T_12 & _T_26 ? 4'h7 : _GEN_23; // @[BranchForward.scala 66:144 BranchForward.scala 67:22]
  wire [3:0] _GEN_25 = _T_3 & _T_4 ? 4'h6 : _GEN_24; // @[BranchForward.scala 64:83 BranchForward.scala 65:22]
  wire [3:0] _GEN_26 = ~io_ctrl_branch ? _GEN_25 : 4'h0; // @[BranchForward.scala 63:38 BranchForward.scala 21:18]
  wire [1:0] _GEN_28 = io_ctrl_branch ? _GEN_20 : 2'h0; // @[BranchForward.scala 25:32 BranchForward.scala 22:18]
  assign io_forward_rs1 = io_ctrl_branch ? {{2'd0}, _GEN_19} : _GEN_26; // @[BranchForward.scala 25:32]
  assign io_forward_rs2 = {{2'd0}, _GEN_28}; // @[BranchForward.scala 25:32 BranchForward.scala 22:18]
endmodule
module StructuralHazard(
  input  [4:0] io_rs1,
  input  [4:0] io_rs2,
  input        io_MEM_WB_regWr,
  input  [4:0] io_MEM_WB_Rd,
  output       io_fwd_rs1,
  output       io_fwd_rs2
);
  assign io_fwd_rs1 = io_MEM_WB_regWr & io_MEM_WB_Rd == io_rs1; // @[StructuralHazard.scala 17:24]
  assign io_fwd_rs2 = io_MEM_WB_regWr & io_MEM_WB_Rd == io_rs2; // @[StructuralHazard.scala 24:24]
endmodule
module PIPELINE(
  input        clock,
  input        reset,
  output [3:0] io_out
);
  wire  IF_ID__clock; // @[Main.scala 10:39]
  wire  IF_ID__reset; // @[Main.scala 10:39]
  wire [31:0] IF_ID__io_pc4_in; // @[Main.scala 10:39]
  wire [31:0] IF_ID__io_SelectedPC; // @[Main.scala 10:39]
  wire [31:0] IF_ID__io_SelectedInstr; // @[Main.scala 10:39]
  wire [31:0] IF_ID__io_pc4_out; // @[Main.scala 10:39]
  wire [31:0] IF_ID__io_SelectedPC_out; // @[Main.scala 10:39]
  wire [31:0] IF_ID__io_SelectedInstr_out; // @[Main.scala 10:39]
  wire  ID_EX__clock; // @[Main.scala 11:39]
  wire [4:0] ID_EX__io_rs1_in; // @[Main.scala 11:39]
  wire [4:0] ID_EX__io_rs2_in; // @[Main.scala 11:39]
  wire [31:0] ID_EX__io_rs1_data_in; // @[Main.scala 11:39]
  wire [31:0] ID_EX__io_rs2_data_in; // @[Main.scala 11:39]
  wire [31:0] ID_EX__io_imm; // @[Main.scala 11:39]
  wire [4:0] ID_EX__io_rd_in; // @[Main.scala 11:39]
  wire [2:0] ID_EX__io_func3_in; // @[Main.scala 11:39]
  wire  ID_EX__io_func7_in; // @[Main.scala 11:39]
  wire  ID_EX__io_ctrl_MemWr_in; // @[Main.scala 11:39]
  wire  ID_EX__io_ctrl_MemRd_in; // @[Main.scala 11:39]
  wire  ID_EX__io_ctrl_Reg_W_in; // @[Main.scala 11:39]
  wire  ID_EX__io_ctrl_MemToReg_in; // @[Main.scala 11:39]
  wire [2:0] ID_EX__io_ctrl_AluOp_in; // @[Main.scala 11:39]
  wire [1:0] ID_EX__io_ctrl_OpA_in; // @[Main.scala 11:39]
  wire  ID_EX__io_ctrl_OpB_in; // @[Main.scala 11:39]
  wire [31:0] ID_EX__io_IFID_pc4_in; // @[Main.scala 11:39]
  wire [4:0] ID_EX__io_rs1_out; // @[Main.scala 11:39]
  wire [4:0] ID_EX__io_rs2_out; // @[Main.scala 11:39]
  wire [31:0] ID_EX__io_rs1_data_out; // @[Main.scala 11:39]
  wire [31:0] ID_EX__io_rs2_data_out; // @[Main.scala 11:39]
  wire [4:0] ID_EX__io_rd_out; // @[Main.scala 11:39]
  wire [31:0] ID_EX__io_imm_out; // @[Main.scala 11:39]
  wire [2:0] ID_EX__io_func3_out; // @[Main.scala 11:39]
  wire  ID_EX__io_func7_out; // @[Main.scala 11:39]
  wire  ID_EX__io_ctrl_MemWr_out; // @[Main.scala 11:39]
  wire  ID_EX__io_ctrl_MemRd_out; // @[Main.scala 11:39]
  wire  ID_EX__io_ctrl_Reg_W_out; // @[Main.scala 11:39]
  wire  ID_EX__io_ctrl_MemToReg_out; // @[Main.scala 11:39]
  wire [2:0] ID_EX__io_ctrl_AluOp_out; // @[Main.scala 11:39]
  wire [1:0] ID_EX__io_ctrl_OpA_out; // @[Main.scala 11:39]
  wire  ID_EX__io_ctrl_OpB_out; // @[Main.scala 11:39]
  wire [31:0] ID_EX__io_IFID_pc4_out; // @[Main.scala 11:39]
  wire  EX_MEM_M_clock; // @[Main.scala 12:39]
  wire  EX_MEM_M_io_IDEX_MEMRD; // @[Main.scala 12:39]
  wire  EX_MEM_M_io_IDEX_MEMWR; // @[Main.scala 12:39]
  wire  EX_MEM_M_io_IDEX_MEMTOREG; // @[Main.scala 12:39]
  wire  EX_MEM_M_io_IDEX_REG_W; // @[Main.scala 12:39]
  wire [31:0] EX_MEM_M_io_IDEX_rs2; // @[Main.scala 12:39]
  wire [4:0] EX_MEM_M_io_IDEX_rd; // @[Main.scala 12:39]
  wire [31:0] EX_MEM_M_io_alu_out; // @[Main.scala 12:39]
  wire  EX_MEM_M_io_EXMEM_memRd_out; // @[Main.scala 12:39]
  wire  EX_MEM_M_io_EXMEM_memWr_out; // @[Main.scala 12:39]
  wire  EX_MEM_M_io_EXMEM_memToReg_out; // @[Main.scala 12:39]
  wire  EX_MEM_M_io_EXMEM_reg_w_out; // @[Main.scala 12:39]
  wire [31:0] EX_MEM_M_io_EXMEM_rs2_out; // @[Main.scala 12:39]
  wire [4:0] EX_MEM_M_io_EXMEM_rd_out; // @[Main.scala 12:39]
  wire [31:0] EX_MEM_M_io_EXMEM_alu_out; // @[Main.scala 12:39]
  wire  MEM_WB_M_clock; // @[Main.scala 13:39]
  wire  MEM_WB_M_io_EXMEM_MEMTOREG; // @[Main.scala 13:39]
  wire  MEM_WB_M_io_EXMEM_REG_W; // @[Main.scala 13:39]
  wire  MEM_WB_M_io_EXMEM_MEMRD; // @[Main.scala 13:39]
  wire [4:0] MEM_WB_M_io_EXMEM_rd; // @[Main.scala 13:39]
  wire [31:0] MEM_WB_M_io_in_dataMem_out; // @[Main.scala 13:39]
  wire [31:0] MEM_WB_M_io_in_alu_out; // @[Main.scala 13:39]
  wire  MEM_WB_M_io_MEMWB_memToReg_out; // @[Main.scala 13:39]
  wire  MEM_WB_M_io_MEMWB_reg_w_out; // @[Main.scala 13:39]
  wire  MEM_WB_M_io_MEMWB_memRd_out; // @[Main.scala 13:39]
  wire [4:0] MEM_WB_M_io_MEMWB_rd_out; // @[Main.scala 13:39]
  wire [31:0] MEM_WB_M_io_MEMWB_dataMem_out; // @[Main.scala 13:39]
  wire [31:0] MEM_WB_M_io_MEMWB_alu_out; // @[Main.scala 13:39]
  wire  PC_clock; // @[Main.scala 16:39]
  wire  PC_reset; // @[Main.scala 16:39]
  wire [31:0] PC_io_in; // @[Main.scala 16:39]
  wire [31:0] PC_io_out; // @[Main.scala 16:39]
  wire [31:0] PC4_io_pc; // @[Main.scala 17:39]
  wire [31:0] PC4_io_out; // @[Main.scala 17:39]
  wire  InstMemory_clock; // @[Main.scala 20:39]
  wire [31:0] InstMemory_io_addr; // @[Main.scala 20:39]
  wire [31:0] InstMemory_io_data; // @[Main.scala 20:39]
  wire  DataMemory_clock; // @[Main.scala 21:39]
  wire [31:0] DataMemory_io_addr; // @[Main.scala 21:39]
  wire [31:0] DataMemory_io_dataIn; // @[Main.scala 21:39]
  wire  DataMemory_io_mem_read; // @[Main.scala 21:39]
  wire  DataMemory_io_mem_write; // @[Main.scala 21:39]
  wire [31:0] DataMemory_io_dataOut; // @[Main.scala 21:39]
  wire [6:0] control_module_io_opcode; // @[Main.scala 24:39]
  wire  control_module_io_mem_write; // @[Main.scala 24:39]
  wire  control_module_io_branch; // @[Main.scala 24:39]
  wire  control_module_io_mem_read; // @[Main.scala 24:39]
  wire  control_module_io_reg_write; // @[Main.scala 24:39]
  wire  control_module_io_men_to_reg; // @[Main.scala 24:39]
  wire [2:0] control_module_io_alu_operation; // @[Main.scala 24:39]
  wire [1:0] control_module_io_operand_A; // @[Main.scala 24:39]
  wire  control_module_io_operand_B; // @[Main.scala 24:39]
  wire [1:0] control_module_io_extend; // @[Main.scala 24:39]
  wire [1:0] control_module_io_next_pc_sel; // @[Main.scala 24:39]
  wire [31:0] ImmGen_io_instr; // @[Main.scala 25:39]
  wire [31:0] ImmGen_io_pc; // @[Main.scala 25:39]
  wire [31:0] ImmGen_io_I_type; // @[Main.scala 25:39]
  wire [31:0] ImmGen_io_S_type; // @[Main.scala 25:39]
  wire [31:0] ImmGen_io_SB_type; // @[Main.scala 25:39]
  wire [31:0] ImmGen_io_U_type; // @[Main.scala 25:39]
  wire [31:0] ImmGen_io_UJ_type; // @[Main.scala 25:39]
  wire  RegFile_clock; // @[Main.scala 26:39]
  wire  RegFile_reset; // @[Main.scala 26:39]
  wire [4:0] RegFile_io_rs1; // @[Main.scala 26:39]
  wire [4:0] RegFile_io_rs2; // @[Main.scala 26:39]
  wire  RegFile_io_reg_write; // @[Main.scala 26:39]
  wire [4:0] RegFile_io_w_reg; // @[Main.scala 26:39]
  wire [31:0] RegFile_io_w_data; // @[Main.scala 26:39]
  wire [31:0] RegFile_io_rdata1; // @[Main.scala 26:39]
  wire [31:0] RegFile_io_rdata2; // @[Main.scala 26:39]
  wire [2:0] ALU_Control_io_func3; // @[Main.scala 27:39]
  wire  ALU_Control_io_func7; // @[Main.scala 27:39]
  wire [2:0] ALU_Control_io_aluOp; // @[Main.scala 27:39]
  wire [4:0] ALU_Control_io_out; // @[Main.scala 27:39]
  wire [31:0] ALU_io_in_A; // @[Main.scala 29:39]
  wire [31:0] ALU_io_in_B; // @[Main.scala 29:39]
  wire [4:0] ALU_io_alu_Op; // @[Main.scala 29:39]
  wire [31:0] ALU_io_out; // @[Main.scala 29:39]
  wire [2:0] Branch_M_io_fnct3; // @[Main.scala 31:39]
  wire  Branch_M_io_branch; // @[Main.scala 31:39]
  wire [31:0] Branch_M_io_arg_x; // @[Main.scala 31:39]
  wire [31:0] Branch_M_io_arg_y; // @[Main.scala 31:39]
  wire  Branch_M_io_br_taken; // @[Main.scala 31:39]
  wire [31:0] JALR_io_imme; // @[Main.scala 32:39]
  wire [31:0] JALR_io_rdata1; // @[Main.scala 32:39]
  wire [31:0] JALR_io_out; // @[Main.scala 32:39]
  wire [4:0] Forwarding_io_IDEX_rs1; // @[Main.scala 35:39]
  wire [4:0] Forwarding_io_IDEX_rs2; // @[Main.scala 35:39]
  wire [4:0] Forwarding_io_EXMEM_rd; // @[Main.scala 35:39]
  wire  Forwarding_io_EXMEM_regWr; // @[Main.scala 35:39]
  wire [4:0] Forwarding_io_MEMWB_rd; // @[Main.scala 35:39]
  wire  Forwarding_io_MEMWB_regWr; // @[Main.scala 35:39]
  wire [1:0] Forwarding_io_forward_a; // @[Main.scala 35:39]
  wire [1:0] Forwarding_io_forward_b; // @[Main.scala 35:39]
  wire [31:0] HazardDetect_io_IF_ID_inst; // @[Main.scala 36:39]
  wire  HazardDetect_io_ID_EX_memRead; // @[Main.scala 36:39]
  wire [4:0] HazardDetect_io_ID_EX_rd; // @[Main.scala 36:39]
  wire [31:0] HazardDetect_io_pc_in; // @[Main.scala 36:39]
  wire [31:0] HazardDetect_io_current_pc; // @[Main.scala 36:39]
  wire  HazardDetect_io_inst_forward; // @[Main.scala 36:39]
  wire  HazardDetect_io_pc_forward; // @[Main.scala 36:39]
  wire  HazardDetect_io_ctrl_forward; // @[Main.scala 36:39]
  wire [31:0] HazardDetect_io_inst_out; // @[Main.scala 36:39]
  wire [31:0] HazardDetect_io_pc_out; // @[Main.scala 36:39]
  wire [31:0] HazardDetect_io_current_pc_out; // @[Main.scala 36:39]
  wire [4:0] Branch_Forward_io_ID_EX_RD; // @[Main.scala 37:39]
  wire [4:0] Branch_Forward_io_EX_MEM_RD; // @[Main.scala 37:39]
  wire [4:0] Branch_Forward_io_MEM_WB_RD; // @[Main.scala 37:39]
  wire  Branch_Forward_io_ID_EX_memRd; // @[Main.scala 37:39]
  wire  Branch_Forward_io_EX_MEM_memRd; // @[Main.scala 37:39]
  wire  Branch_Forward_io_MEM_WB_memRd; // @[Main.scala 37:39]
  wire [4:0] Branch_Forward_io_rs1; // @[Main.scala 37:39]
  wire [4:0] Branch_Forward_io_rs2; // @[Main.scala 37:39]
  wire  Branch_Forward_io_ctrl_branch; // @[Main.scala 37:39]
  wire [3:0] Branch_Forward_io_forward_rs1; // @[Main.scala 37:39]
  wire [3:0] Branch_Forward_io_forward_rs2; // @[Main.scala 37:39]
  wire [4:0] Structural_io_rs1; // @[Main.scala 38:39]
  wire [4:0] Structural_io_rs2; // @[Main.scala 38:39]
  wire  Structural_io_MEM_WB_regWr; // @[Main.scala 38:39]
  wire [4:0] Structural_io_MEM_WB_Rd; // @[Main.scala 38:39]
  wire  Structural_io_fwd_rs1; // @[Main.scala 38:39]
  wire  Structural_io_fwd_rs2; // @[Main.scala 38:39]
  wire  _PC_F_T_1 = HazardDetect_io_pc_forward; // @[Mux.scala 80:60]
  wire [31:0] PC_for = HazardDetect_io_inst_forward ? $signed(HazardDetect_io_current_pc_out) : $signed(PC_io_out); // @[Mux.scala 80:57]
  wire [31:0] Instruction_F = HazardDetect_io_inst_forward ? HazardDetect_io_inst_out : InstMemory_io_data; // @[Mux.scala 80:57]
  wire  _RegFile_io_rs1_T = control_module_io_opcode == 7'h33; // @[Main.scala 69:30]
  wire  _RegFile_io_rs1_T_1 = control_module_io_opcode == 7'h13; // @[Main.scala 70:30]
  wire  _RegFile_io_rs1_T_2 = control_module_io_opcode == 7'h33 | _RegFile_io_rs1_T_1; // @[Main.scala 69:39]
  wire  _RegFile_io_rs1_T_3 = control_module_io_opcode == 7'h23; // @[Main.scala 71:30]
  wire  _RegFile_io_rs1_T_4 = _RegFile_io_rs1_T_2 | _RegFile_io_rs1_T_3; // @[Main.scala 70:39]
  wire  _RegFile_io_rs1_T_5 = control_module_io_opcode == 7'h3; // @[Main.scala 72:30]
  wire  _RegFile_io_rs1_T_6 = _RegFile_io_rs1_T_4 | _RegFile_io_rs1_T_5; // @[Main.scala 71:39]
  wire  _RegFile_io_rs1_T_7 = control_module_io_opcode == 7'h63; // @[Main.scala 73:30]
  wire  _RegFile_io_rs1_T_8 = _RegFile_io_rs1_T_6 | _RegFile_io_rs1_T_7; // @[Main.scala 72:38]
  wire  _RegFile_io_rs1_T_9 = control_module_io_opcode == 7'h67; // @[Main.scala 74:30]
  wire  _RegFile_io_rs1_T_10 = _RegFile_io_rs1_T_8 | _RegFile_io_rs1_T_9; // @[Main.scala 73:39]
  wire  _RegFile_io_rs2_T_2 = _RegFile_io_rs1_T | _RegFile_io_rs1_T_3; // @[Main.scala 78:39]
  wire  _RegFile_io_rs2_T_4 = _RegFile_io_rs2_T_2 | _RegFile_io_rs1_T_7; // @[Main.scala 79:39]
  wire [31:0] _ImmValue_T_1 = 2'h0 == control_module_io_extend ? $signed(ImmGen_io_I_type) : $signed(32'sh0); // @[Mux.scala 80:57]
  wire [31:0] _ImmValue_T_3 = 2'h1 == control_module_io_extend ? $signed(ImmGen_io_S_type) : $signed(_ImmValue_T_1); // @[Mux.scala 80:57]
  wire [31:0] _GEN_0 = Structural_io_fwd_rs1 ? $signed(RegFile_io_w_data) : $signed(32'sh0); // @[Main.scala 100:48 Main.scala 101:19 Main.scala 103:19]
  wire [31:0] _GEN_2 = Structural_io_fwd_rs2 ? $signed(RegFile_io_w_data) : $signed(32'sh0); // @[Main.scala 108:48 Main.scala 109:19 Main.scala 111:19]
  wire [31:0] _Branch_M_io_arg_x_T_1 = 4'h0 == Branch_Forward_io_forward_rs1 ? $signed(RegFile_io_rdata1) : $signed(32'sh0
    ); // @[Mux.scala 80:57]
  wire [31:0] _Branch_M_io_arg_x_T_3 = 4'h1 == Branch_Forward_io_forward_rs1 ? $signed(ALU_io_out) : $signed(
    _Branch_M_io_arg_x_T_1); // @[Mux.scala 80:57]
  wire [31:0] _Branch_M_io_arg_x_T_5 = 4'h2 == Branch_Forward_io_forward_rs1 ? $signed(EX_MEM_M_io_EXMEM_alu_out) :
    $signed(_Branch_M_io_arg_x_T_3); // @[Mux.scala 80:57]
  wire [31:0] _Branch_M_io_arg_x_T_7 = 4'h3 == Branch_Forward_io_forward_rs1 ? $signed(RegFile_io_w_data) : $signed(
    _Branch_M_io_arg_x_T_5); // @[Mux.scala 80:57]
  wire [31:0] _Branch_M_io_arg_x_T_9 = 4'h4 == Branch_Forward_io_forward_rs1 ? $signed(DataMemory_io_dataOut) : $signed(
    _Branch_M_io_arg_x_T_7); // @[Mux.scala 80:57]
  wire [31:0] _Branch_M_io_arg_x_T_11 = 4'h5 == Branch_Forward_io_forward_rs1 ? $signed(RegFile_io_w_data) : $signed(
    _Branch_M_io_arg_x_T_9); // @[Mux.scala 80:57]
  wire [31:0] _Branch_M_io_arg_x_T_13 = 4'h6 == Branch_Forward_io_forward_rs1 ? $signed(RegFile_io_rdata1) : $signed(
    _Branch_M_io_arg_x_T_11); // @[Mux.scala 80:57]
  wire [31:0] _Branch_M_io_arg_x_T_15 = 4'h7 == Branch_Forward_io_forward_rs1 ? $signed(RegFile_io_rdata1) : $signed(
    _Branch_M_io_arg_x_T_13); // @[Mux.scala 80:57]
  wire [31:0] _Branch_M_io_arg_x_T_17 = 4'h8 == Branch_Forward_io_forward_rs1 ? $signed(RegFile_io_rdata1) : $signed(
    _Branch_M_io_arg_x_T_15); // @[Mux.scala 80:57]
  wire [31:0] _Branch_M_io_arg_x_T_19 = 4'h9 == Branch_Forward_io_forward_rs1 ? $signed(RegFile_io_rdata1) : $signed(
    _Branch_M_io_arg_x_T_17); // @[Mux.scala 80:57]
  wire [31:0] _JALR_io_rdata1_T_12 = 4'h0 == Branch_Forward_io_forward_rs1 ? RegFile_io_rdata1 : 32'h0; // @[Mux.scala 80:57]
  wire [31:0] _JALR_io_rdata1_T_14 = 4'h1 == Branch_Forward_io_forward_rs1 ? RegFile_io_rdata1 : _JALR_io_rdata1_T_12; // @[Mux.scala 80:57]
  wire [31:0] _JALR_io_rdata1_T_16 = 4'h2 == Branch_Forward_io_forward_rs1 ? RegFile_io_rdata1 : _JALR_io_rdata1_T_14; // @[Mux.scala 80:57]
  wire [31:0] _JALR_io_rdata1_T_18 = 4'h3 == Branch_Forward_io_forward_rs1 ? RegFile_io_rdata1 : _JALR_io_rdata1_T_16; // @[Mux.scala 80:57]
  wire [31:0] _JALR_io_rdata1_T_20 = 4'h4 == Branch_Forward_io_forward_rs1 ? RegFile_io_rdata1 : _JALR_io_rdata1_T_18; // @[Mux.scala 80:57]
  wire [31:0] _JALR_io_rdata1_T_22 = 4'h5 == Branch_Forward_io_forward_rs1 ? RegFile_io_rdata1 : _JALR_io_rdata1_T_20; // @[Mux.scala 80:57]
  wire [31:0] _JALR_io_rdata1_T_24 = 4'h6 == Branch_Forward_io_forward_rs1 ? ALU_io_out : _JALR_io_rdata1_T_22; // @[Mux.scala 80:57]
  wire [31:0] _JALR_io_rdata1_T_26 = 4'h7 == Branch_Forward_io_forward_rs1 ? EX_MEM_M_io_EXMEM_alu_out :
    _JALR_io_rdata1_T_24; // @[Mux.scala 80:57]
  wire [31:0] _JALR_io_rdata1_T_28 = 4'h8 == Branch_Forward_io_forward_rs1 ? RegFile_io_w_data : _JALR_io_rdata1_T_26; // @[Mux.scala 80:57]
  wire [31:0] _JALR_io_rdata1_T_30 = 4'h9 == Branch_Forward_io_forward_rs1 ? DataMemory_io_dataOut :
    _JALR_io_rdata1_T_28; // @[Mux.scala 80:57]
  wire [31:0] _Branch_M_io_arg_y_T_1 = 4'h0 == Branch_Forward_io_forward_rs2 ? $signed(RegFile_io_rdata2) : $signed(32'sh0
    ); // @[Mux.scala 80:57]
  wire [31:0] _Branch_M_io_arg_y_T_3 = 4'h1 == Branch_Forward_io_forward_rs2 ? $signed(ALU_io_out) : $signed(
    _Branch_M_io_arg_y_T_1); // @[Mux.scala 80:57]
  wire [31:0] _Branch_M_io_arg_y_T_5 = 4'h2 == Branch_Forward_io_forward_rs2 ? $signed(EX_MEM_M_io_EXMEM_alu_out) :
    $signed(_Branch_M_io_arg_y_T_3); // @[Mux.scala 80:57]
  wire [31:0] _Branch_M_io_arg_y_T_7 = 4'h3 == Branch_Forward_io_forward_rs2 ? $signed(RegFile_io_w_data) : $signed(
    _Branch_M_io_arg_y_T_5); // @[Mux.scala 80:57]
  wire [31:0] _Branch_M_io_arg_y_T_9 = 4'h4 == Branch_Forward_io_forward_rs2 ? $signed(DataMemory_io_dataOut) : $signed(
    _Branch_M_io_arg_y_T_7); // @[Mux.scala 80:57]
  wire [31:0] _GEN_12 = Branch_M_io_br_taken & control_module_io_branch ? $signed(ImmGen_io_SB_type) : $signed(
    PC4_io_out); // @[Main.scala 201:84 Main.scala 202:26 Main.scala 208:26]
  wire [31:0] _GEN_14 = Branch_M_io_br_taken & control_module_io_branch ? 32'h0 : PC4_io_out; // @[Main.scala 201:84 Main.scala 204:34 Main.scala 57:29]
  wire [31:0] _GEN_15 = Branch_M_io_br_taken & control_module_io_branch ? $signed(32'sh0) : $signed(PC_for); // @[Main.scala 201:84 Main.scala 205:37 Main.scala 58:29]
  wire [31:0] _GEN_16 = Branch_M_io_br_taken & control_module_io_branch ? 32'h0 : Instruction_F; // @[Main.scala 201:84 Main.scala 206:41 Main.scala 59:29]
  wire [31:0] _GEN_17 = control_module_io_next_pc_sel == 2'h3 ? $signed(JALR_io_out) : $signed(PC4_io_out); // @[Main.scala 216:63 Main.scala 217:22 Main.scala 223:22]
  wire [31:0] _GEN_19 = control_module_io_next_pc_sel == 2'h3 ? 32'h0 : PC4_io_out; // @[Main.scala 216:63 Main.scala 219:30 Main.scala 57:29]
  wire [31:0] _GEN_20 = control_module_io_next_pc_sel == 2'h3 ? $signed(32'sh0) : $signed(PC_for); // @[Main.scala 216:63 Main.scala 220:33 Main.scala 58:29]
  wire [31:0] _GEN_21 = control_module_io_next_pc_sel == 2'h3 ? 32'h0 : Instruction_F; // @[Main.scala 216:63 Main.scala 221:37 Main.scala 59:29]
  wire [31:0] _GEN_22 = control_module_io_next_pc_sel == 2'h2 ? $signed(ImmGen_io_UJ_type) : $signed(_GEN_17); // @[Main.scala 210:63 Main.scala 211:22]
  wire [31:0] _GEN_24 = control_module_io_next_pc_sel == 2'h2 ? 32'h0 : _GEN_19; // @[Main.scala 210:63 Main.scala 213:30]
  wire [31:0] _GEN_25 = control_module_io_next_pc_sel == 2'h2 ? $signed(32'sh0) : $signed(_GEN_20); // @[Main.scala 210:63 Main.scala 214:33]
  wire [31:0] _GEN_26 = control_module_io_next_pc_sel == 2'h2 ? 32'h0 : _GEN_21; // @[Main.scala 210:63 Main.scala 215:37]
  wire [31:0] _GEN_27 = control_module_io_next_pc_sel == 2'h1 ? $signed(_GEN_12) : $signed(_GEN_22); // @[Main.scala 200:57]
  wire [31:0] _GEN_29 = control_module_io_next_pc_sel == 2'h1 ? _GEN_14 : _GEN_24; // @[Main.scala 200:57]
  wire [31:0] _GEN_30 = control_module_io_next_pc_sel == 2'h1 ? $signed(_GEN_15) : $signed(_GEN_25); // @[Main.scala 200:57]
  wire [31:0] _GEN_31 = control_module_io_next_pc_sel == 2'h1 ? _GEN_16 : _GEN_26; // @[Main.scala 200:57]
  wire [31:0] _GEN_37 = Forwarding_io_forward_a == 2'h2 ? $signed(EX_MEM_M_io_EXMEM_alu_out) : $signed(
    ID_EX__io_rs1_data_out); // @[Main.scala 261:57 Main.scala 262:25 Main.scala 264:25]
  wire [31:0] _GEN_45 = MEM_WB_M_io_MEMWB_memToReg_out ? $signed(MEM_WB_M_io_MEMWB_dataMem_out) : $signed(32'sh0); // @[Main.scala 312:57 Main.scala 313:9 Main.scala 315:9]
  wire [31:0] d = ~MEM_WB_M_io_MEMWB_memToReg_out ? $signed(MEM_WB_M_io_MEMWB_alu_out) : $signed(_GEN_45); // @[Main.scala 310:51 Main.scala 311:9]
  wire [31:0] _GEN_38 = Forwarding_io_forward_a == 2'h1 ? $signed(d) : $signed(_GEN_37); // @[Main.scala 259:57 Main.scala 260:25]
  wire [31:0] _GEN_39 = Forwarding_io_forward_a == 2'h0 ? $signed(ID_EX__io_rs1_data_out) : $signed(_GEN_38); // @[Main.scala 257:51 Main.scala 258:25]
  wire [31:0] _GEN_41 = Forwarding_io_forward_b == 2'h2 ? $signed(EX_MEM_M_io_EXMEM_alu_out) : $signed(32'sh0); // @[Main.scala 273:50 Main.scala 274:17 Main.scala 276:17]
  wire [31:0] _GEN_42 = Forwarding_io_forward_b == 2'h1 ? $signed(d) : $signed(_GEN_41); // @[Main.scala 271:50 Main.scala 272:17]
  wire [31:0] RS2_value = Forwarding_io_forward_b == 2'h0 ? $signed(ID_EX__io_rs2_data_out) : $signed(_GEN_42); // @[Main.scala 269:44 Main.scala 270:17]
  IF_ID IF_ID_ ( // @[Main.scala 10:39]
    .clock(IF_ID__clock),
    .reset(IF_ID__reset),
    .io_pc4_in(IF_ID__io_pc4_in),
    .io_SelectedPC(IF_ID__io_SelectedPC),
    .io_SelectedInstr(IF_ID__io_SelectedInstr),
    .io_pc4_out(IF_ID__io_pc4_out),
    .io_SelectedPC_out(IF_ID__io_SelectedPC_out),
    .io_SelectedInstr_out(IF_ID__io_SelectedInstr_out)
  );
  ID_EX ID_EX_ ( // @[Main.scala 11:39]
    .clock(ID_EX__clock),
    .io_rs1_in(ID_EX__io_rs1_in),
    .io_rs2_in(ID_EX__io_rs2_in),
    .io_rs1_data_in(ID_EX__io_rs1_data_in),
    .io_rs2_data_in(ID_EX__io_rs2_data_in),
    .io_imm(ID_EX__io_imm),
    .io_rd_in(ID_EX__io_rd_in),
    .io_func3_in(ID_EX__io_func3_in),
    .io_func7_in(ID_EX__io_func7_in),
    .io_ctrl_MemWr_in(ID_EX__io_ctrl_MemWr_in),
    .io_ctrl_MemRd_in(ID_EX__io_ctrl_MemRd_in),
    .io_ctrl_Reg_W_in(ID_EX__io_ctrl_Reg_W_in),
    .io_ctrl_MemToReg_in(ID_EX__io_ctrl_MemToReg_in),
    .io_ctrl_AluOp_in(ID_EX__io_ctrl_AluOp_in),
    .io_ctrl_OpA_in(ID_EX__io_ctrl_OpA_in),
    .io_ctrl_OpB_in(ID_EX__io_ctrl_OpB_in),
    .io_IFID_pc4_in(ID_EX__io_IFID_pc4_in),
    .io_rs1_out(ID_EX__io_rs1_out),
    .io_rs2_out(ID_EX__io_rs2_out),
    .io_rs1_data_out(ID_EX__io_rs1_data_out),
    .io_rs2_data_out(ID_EX__io_rs2_data_out),
    .io_rd_out(ID_EX__io_rd_out),
    .io_imm_out(ID_EX__io_imm_out),
    .io_func3_out(ID_EX__io_func3_out),
    .io_func7_out(ID_EX__io_func7_out),
    .io_ctrl_MemWr_out(ID_EX__io_ctrl_MemWr_out),
    .io_ctrl_MemRd_out(ID_EX__io_ctrl_MemRd_out),
    .io_ctrl_Reg_W_out(ID_EX__io_ctrl_Reg_W_out),
    .io_ctrl_MemToReg_out(ID_EX__io_ctrl_MemToReg_out),
    .io_ctrl_AluOp_out(ID_EX__io_ctrl_AluOp_out),
    .io_ctrl_OpA_out(ID_EX__io_ctrl_OpA_out),
    .io_ctrl_OpB_out(ID_EX__io_ctrl_OpB_out),
    .io_IFID_pc4_out(ID_EX__io_IFID_pc4_out)
  );
  EX_MEM EX_MEM_M ( // @[Main.scala 12:39]
    .clock(EX_MEM_M_clock),
    .io_IDEX_MEMRD(EX_MEM_M_io_IDEX_MEMRD),
    .io_IDEX_MEMWR(EX_MEM_M_io_IDEX_MEMWR),
    .io_IDEX_MEMTOREG(EX_MEM_M_io_IDEX_MEMTOREG),
    .io_IDEX_REG_W(EX_MEM_M_io_IDEX_REG_W),
    .io_IDEX_rs2(EX_MEM_M_io_IDEX_rs2),
    .io_IDEX_rd(EX_MEM_M_io_IDEX_rd),
    .io_alu_out(EX_MEM_M_io_alu_out),
    .io_EXMEM_memRd_out(EX_MEM_M_io_EXMEM_memRd_out),
    .io_EXMEM_memWr_out(EX_MEM_M_io_EXMEM_memWr_out),
    .io_EXMEM_memToReg_out(EX_MEM_M_io_EXMEM_memToReg_out),
    .io_EXMEM_reg_w_out(EX_MEM_M_io_EXMEM_reg_w_out),
    .io_EXMEM_rs2_out(EX_MEM_M_io_EXMEM_rs2_out),
    .io_EXMEM_rd_out(EX_MEM_M_io_EXMEM_rd_out),
    .io_EXMEM_alu_out(EX_MEM_M_io_EXMEM_alu_out)
  );
  MEM_WB MEM_WB_M ( // @[Main.scala 13:39]
    .clock(MEM_WB_M_clock),
    .io_EXMEM_MEMTOREG(MEM_WB_M_io_EXMEM_MEMTOREG),
    .io_EXMEM_REG_W(MEM_WB_M_io_EXMEM_REG_W),
    .io_EXMEM_MEMRD(MEM_WB_M_io_EXMEM_MEMRD),
    .io_EXMEM_rd(MEM_WB_M_io_EXMEM_rd),
    .io_in_dataMem_out(MEM_WB_M_io_in_dataMem_out),
    .io_in_alu_out(MEM_WB_M_io_in_alu_out),
    .io_MEMWB_memToReg_out(MEM_WB_M_io_MEMWB_memToReg_out),
    .io_MEMWB_reg_w_out(MEM_WB_M_io_MEMWB_reg_w_out),
    .io_MEMWB_memRd_out(MEM_WB_M_io_MEMWB_memRd_out),
    .io_MEMWB_rd_out(MEM_WB_M_io_MEMWB_rd_out),
    .io_MEMWB_dataMem_out(MEM_WB_M_io_MEMWB_dataMem_out),
    .io_MEMWB_alu_out(MEM_WB_M_io_MEMWB_alu_out)
  );
  PC PC ( // @[Main.scala 16:39]
    .clock(PC_clock),
    .reset(PC_reset),
    .io_in(PC_io_in),
    .io_out(PC_io_out)
  );
  PC4 PC4 ( // @[Main.scala 17:39]
    .io_pc(PC4_io_pc),
    .io_out(PC4_io_out)
  );
  InstMem InstMemory ( // @[Main.scala 20:39]
    .clock(InstMemory_clock),
    .io_addr(InstMemory_io_addr),
    .io_data(InstMemory_io_data)
  );
  DataMemory DataMemory ( // @[Main.scala 21:39]
    .clock(DataMemory_clock),
    .io_addr(DataMemory_io_addr),
    .io_dataIn(DataMemory_io_dataIn),
    .io_mem_read(DataMemory_io_mem_read),
    .io_mem_write(DataMemory_io_mem_write),
    .io_dataOut(DataMemory_io_dataOut)
  );
  Control control_module ( // @[Main.scala 24:39]
    .io_opcode(control_module_io_opcode),
    .io_mem_write(control_module_io_mem_write),
    .io_branch(control_module_io_branch),
    .io_mem_read(control_module_io_mem_read),
    .io_reg_write(control_module_io_reg_write),
    .io_men_to_reg(control_module_io_men_to_reg),
    .io_alu_operation(control_module_io_alu_operation),
    .io_operand_A(control_module_io_operand_A),
    .io_operand_B(control_module_io_operand_B),
    .io_extend(control_module_io_extend),
    .io_next_pc_sel(control_module_io_next_pc_sel)
  );
  ImmGenerator ImmGen ( // @[Main.scala 25:39]
    .io_instr(ImmGen_io_instr),
    .io_pc(ImmGen_io_pc),
    .io_I_type(ImmGen_io_I_type),
    .io_S_type(ImmGen_io_S_type),
    .io_SB_type(ImmGen_io_SB_type),
    .io_U_type(ImmGen_io_U_type),
    .io_UJ_type(ImmGen_io_UJ_type)
  );
  RegisterFile RegFile ( // @[Main.scala 26:39]
    .clock(RegFile_clock),
    .reset(RegFile_reset),
    .io_rs1(RegFile_io_rs1),
    .io_rs2(RegFile_io_rs2),
    .io_reg_write(RegFile_io_reg_write),
    .io_w_reg(RegFile_io_w_reg),
    .io_w_data(RegFile_io_w_data),
    .io_rdata1(RegFile_io_rdata1),
    .io_rdata2(RegFile_io_rdata2)
  );
  AluControl ALU_Control ( // @[Main.scala 27:39]
    .io_func3(ALU_Control_io_func3),
    .io_func7(ALU_Control_io_func7),
    .io_aluOp(ALU_Control_io_aluOp),
    .io_out(ALU_Control_io_out)
  );
  ALU ALU ( // @[Main.scala 29:39]
    .io_in_A(ALU_io_in_A),
    .io_in_B(ALU_io_in_B),
    .io_alu_Op(ALU_io_alu_Op),
    .io_out(ALU_io_out)
  );
  Branch Branch_M ( // @[Main.scala 31:39]
    .io_fnct3(Branch_M_io_fnct3),
    .io_branch(Branch_M_io_branch),
    .io_arg_x(Branch_M_io_arg_x),
    .io_arg_y(Branch_M_io_arg_y),
    .io_br_taken(Branch_M_io_br_taken)
  );
  Jalr JALR ( // @[Main.scala 32:39]
    .io_imme(JALR_io_imme),
    .io_rdata1(JALR_io_rdata1),
    .io_out(JALR_io_out)
  );
  Forwarding Forwarding ( // @[Main.scala 35:39]
    .io_IDEX_rs1(Forwarding_io_IDEX_rs1),
    .io_IDEX_rs2(Forwarding_io_IDEX_rs2),
    .io_EXMEM_rd(Forwarding_io_EXMEM_rd),
    .io_EXMEM_regWr(Forwarding_io_EXMEM_regWr),
    .io_MEMWB_rd(Forwarding_io_MEMWB_rd),
    .io_MEMWB_regWr(Forwarding_io_MEMWB_regWr),
    .io_forward_a(Forwarding_io_forward_a),
    .io_forward_b(Forwarding_io_forward_b)
  );
  HazardDetection HazardDetect ( // @[Main.scala 36:39]
    .io_IF_ID_inst(HazardDetect_io_IF_ID_inst),
    .io_ID_EX_memRead(HazardDetect_io_ID_EX_memRead),
    .io_ID_EX_rd(HazardDetect_io_ID_EX_rd),
    .io_pc_in(HazardDetect_io_pc_in),
    .io_current_pc(HazardDetect_io_current_pc),
    .io_inst_forward(HazardDetect_io_inst_forward),
    .io_pc_forward(HazardDetect_io_pc_forward),
    .io_ctrl_forward(HazardDetect_io_ctrl_forward),
    .io_inst_out(HazardDetect_io_inst_out),
    .io_pc_out(HazardDetect_io_pc_out),
    .io_current_pc_out(HazardDetect_io_current_pc_out)
  );
  BranchForward Branch_Forward ( // @[Main.scala 37:39]
    .io_ID_EX_RD(Branch_Forward_io_ID_EX_RD),
    .io_EX_MEM_RD(Branch_Forward_io_EX_MEM_RD),
    .io_MEM_WB_RD(Branch_Forward_io_MEM_WB_RD),
    .io_ID_EX_memRd(Branch_Forward_io_ID_EX_memRd),
    .io_EX_MEM_memRd(Branch_Forward_io_EX_MEM_memRd),
    .io_MEM_WB_memRd(Branch_Forward_io_MEM_WB_memRd),
    .io_rs1(Branch_Forward_io_rs1),
    .io_rs2(Branch_Forward_io_rs2),
    .io_ctrl_branch(Branch_Forward_io_ctrl_branch),
    .io_forward_rs1(Branch_Forward_io_forward_rs1),
    .io_forward_rs2(Branch_Forward_io_forward_rs2)
  );
  StructuralHazard Structural ( // @[Main.scala 38:39]
    .io_rs1(Structural_io_rs1),
    .io_rs2(Structural_io_rs2),
    .io_MEM_WB_regWr(Structural_io_MEM_WB_regWr),
    .io_MEM_WB_Rd(Structural_io_MEM_WB_Rd),
    .io_fwd_rs1(Structural_io_fwd_rs1),
    .io_fwd_rs2(Structural_io_fwd_rs2)
  );
  assign io_out = 4'sh0; // @[Main.scala 319:12]
  assign IF_ID__clock = clock;
  assign IF_ID__reset = reset;
  assign IF_ID__io_pc4_in = _PC_F_T_1 ? PC4_io_out : _GEN_29; // @[Main.scala 197:46 Main.scala 57:29]
  assign IF_ID__io_SelectedPC = _PC_F_T_1 ? $signed(PC_for) : $signed(_GEN_30); // @[Main.scala 197:46 Main.scala 58:29]
  assign IF_ID__io_SelectedInstr = _PC_F_T_1 ? Instruction_F : _GEN_31; // @[Main.scala 197:46 Main.scala 59:29]
  assign ID_EX__clock = clock;
  assign ID_EX__io_rs1_in = RegFile_io_rs1; // @[Main.scala 227:33]
  assign ID_EX__io_rs2_in = RegFile_io_rs2; // @[Main.scala 228:33]
  assign ID_EX__io_rs1_data_in = ~Structural_io_fwd_rs1 ? $signed(RegFile_io_rdata1) : $signed(_GEN_0); // @[Main.scala 98:42 Main.scala 99:19]
  assign ID_EX__io_rs2_data_in = ~Structural_io_fwd_rs2 ? $signed(RegFile_io_rdata2) : $signed(_GEN_2); // @[Main.scala 106:42 Main.scala 107:19]
  assign ID_EX__io_imm = 2'h2 == control_module_io_extend ? $signed(ImmGen_io_U_type) : $signed(_ImmValue_T_3); // @[Mux.scala 80:57]
  assign ID_EX__io_rd_in = IF_ID__io_SelectedInstr_out[11:7]; // @[Main.scala 232:63]
  assign ID_EX__io_func3_in = IF_ID__io_SelectedInstr_out[14:12]; // @[Main.scala 230:63]
  assign ID_EX__io_func7_in = IF_ID__io_SelectedInstr_out[30]; // @[Main.scala 231:63]
  assign ID_EX__io_ctrl_MemWr_in = HazardDetect_io_ctrl_forward ? 1'h0 : control_module_io_mem_write; // @[Main.scala 118:51 Main.scala 119:39 Main.scala 128:38]
  assign ID_EX__io_ctrl_MemRd_in = HazardDetect_io_ctrl_forward ? 1'h0 : control_module_io_mem_read; // @[Main.scala 118:51 Main.scala 120:39 Main.scala 129:38]
  assign ID_EX__io_ctrl_Reg_W_in = HazardDetect_io_ctrl_forward ? 1'h0 : control_module_io_reg_write; // @[Main.scala 118:51 Main.scala 122:39 Main.scala 131:38]
  assign ID_EX__io_ctrl_MemToReg_in = HazardDetect_io_ctrl_forward ? 1'h0 : control_module_io_men_to_reg; // @[Main.scala 118:51 Main.scala 121:39 Main.scala 130:38]
  assign ID_EX__io_ctrl_AluOp_in = HazardDetect_io_ctrl_forward ? 3'h0 : control_module_io_alu_operation; // @[Main.scala 118:51 Main.scala 123:39 Main.scala 132:38]
  assign ID_EX__io_ctrl_OpA_in = control_module_io_operand_A; // @[Main.scala 248:27]
  assign ID_EX__io_ctrl_OpB_in = HazardDetect_io_ctrl_forward ? 1'h0 : control_module_io_operand_B; // @[Main.scala 118:51 Main.scala 124:39 Main.scala 133:38]
  assign ID_EX__io_IFID_pc4_in = IF_ID__io_pc4_out; // @[Main.scala 249:27]
  assign EX_MEM_M_clock = clock;
  assign EX_MEM_M_io_IDEX_MEMRD = ID_EX__io_ctrl_MemRd_out; // @[Main.scala 286:37]
  assign EX_MEM_M_io_IDEX_MEMWR = ID_EX__io_ctrl_MemWr_out; // @[Main.scala 287:37]
  assign EX_MEM_M_io_IDEX_MEMTOREG = ID_EX__io_ctrl_MemToReg_out; // @[Main.scala 288:37]
  assign EX_MEM_M_io_IDEX_REG_W = ID_EX__io_ctrl_Reg_W_out; // @[Main.scala 289:37]
  assign EX_MEM_M_io_IDEX_rs2 = Forwarding_io_forward_b == 2'h0 ? $signed(ID_EX__io_rs2_data_out) : $signed(_GEN_42); // @[Main.scala 269:44 Main.scala 270:17]
  assign EX_MEM_M_io_IDEX_rd = ID_EX__io_rd_out; // @[Main.scala 238:37]
  assign EX_MEM_M_io_alu_out = ALU_io_out; // @[Main.scala 291:37]
  assign MEM_WB_M_clock = clock;
  assign MEM_WB_M_io_EXMEM_MEMTOREG = EX_MEM_M_io_EXMEM_memToReg_out; // @[Main.scala 299:37]
  assign MEM_WB_M_io_EXMEM_REG_W = EX_MEM_M_io_EXMEM_reg_w_out; // @[Main.scala 300:37]
  assign MEM_WB_M_io_EXMEM_MEMRD = EX_MEM_M_io_EXMEM_memRd_out; // @[Main.scala 144:37]
  assign MEM_WB_M_io_EXMEM_rd = EX_MEM_M_io_EXMEM_rd_out; // @[Main.scala 301:37]
  assign MEM_WB_M_io_in_dataMem_out = DataMemory_io_dataOut; // @[Main.scala 302:37]
  assign MEM_WB_M_io_in_alu_out = EX_MEM_M_io_EXMEM_alu_out; // @[Main.scala 303:37]
  assign PC_clock = clock;
  assign PC_reset = reset;
  assign PC_io_in = _PC_F_T_1 ? $signed(HazardDetect_io_pc_out) : $signed(_GEN_27); // @[Main.scala 197:46 Main.scala 198:18]
  assign PC4_io_pc = PC_io_out; // @[Main.scala 45:28]
  assign InstMemory_clock = clock;
  assign InstMemory_io_addr = PC_io_out; // @[Main.scala 46:37]
  assign DataMemory_clock = clock;
  assign DataMemory_io_addr = EX_MEM_M_io_EXMEM_alu_out; // @[Main.scala 297:66]
  assign DataMemory_io_dataIn = EX_MEM_M_io_EXMEM_rs2_out; // @[Main.scala 296:37]
  assign DataMemory_io_mem_read = EX_MEM_M_io_EXMEM_memRd_out; // @[Main.scala 294:37]
  assign DataMemory_io_mem_write = EX_MEM_M_io_EXMEM_memWr_out; // @[Main.scala 295:37]
  assign control_module_io_opcode = IF_ID__io_SelectedInstr_out[6:0]; // @[Main.scala 66:60]
  assign ImmGen_io_instr = IF_ID__io_SelectedInstr_out; // @[Main.scala 62:29]
  assign ImmGen_io_pc = IF_ID__io_SelectedPC_out; // @[Main.scala 63:57]
  assign RegFile_clock = clock;
  assign RegFile_reset = reset;
  assign RegFile_io_rs1 = _RegFile_io_rs1_T_10 ? IF_ID__io_SelectedInstr_out[19:15] : 5'h0; // @[Main.scala 68:26]
  assign RegFile_io_rs2 = _RegFile_io_rs2_T_4 ? IF_ID__io_SelectedInstr_out[24:20] : 5'h0; // @[Main.scala 77:26]
  assign RegFile_io_reg_write = MEM_WB_M_io_MEMWB_reg_w_out; // @[Main.scala 307:37]
  assign RegFile_io_w_reg = MEM_WB_M_io_MEMWB_rd_out; // @[Main.scala 306:37]
  assign RegFile_io_w_data = ~MEM_WB_M_io_MEMWB_memToReg_out ? $signed(MEM_WB_M_io_MEMWB_alu_out) : $signed(_GEN_45); // @[Main.scala 310:51 Main.scala 311:9]
  assign ALU_Control_io_func3 = ID_EX__io_func3_out; // @[Main.scala 236:37]
  assign ALU_Control_io_func7 = ID_EX__io_func7_out; // @[Main.scala 237:37]
  assign ALU_Control_io_aluOp = ID_EX__io_ctrl_AluOp_out; // @[Main.scala 234:37]
  assign ALU_io_in_A = ID_EX__io_ctrl_OpA_out == 2'h1 ? $signed(ID_EX__io_IFID_pc4_out) : $signed(_GEN_39); // @[Main.scala 253:47 Main.scala 254:21]
  assign ALU_io_in_B = ~ID_EX__io_ctrl_OpB_out ? $signed(RS2_value) : $signed(ID_EX__io_imm_out); // @[Main.scala 278:43 Main.scala 279:21 Main.scala 281:21]
  assign ALU_io_alu_Op = ALU_Control_io_out; // @[Main.scala 235:37]
  assign Branch_M_io_fnct3 = IF_ID__io_SelectedInstr_out[14:12]; // @[Main.scala 194:53]
  assign Branch_M_io_branch = control_module_io_branch; // @[Main.scala 195:24]
  assign Branch_M_io_arg_x = 4'ha == Branch_Forward_io_forward_rs1 ? $signed(RegFile_io_rdata1) : $signed(
    _Branch_M_io_arg_x_T_19); // @[Mux.scala 80:57]
  assign Branch_M_io_arg_y = 4'h5 == Branch_Forward_io_forward_rs2 ? $signed(RegFile_io_w_data) : $signed(
    _Branch_M_io_arg_y_T_9); // @[Mux.scala 80:57]
  assign JALR_io_imme = 2'h2 == control_module_io_extend ? $signed(ImmGen_io_U_type) : $signed(_ImmValue_T_3); // @[Main.scala 184:30]
  assign JALR_io_rdata1 = 4'ha == Branch_Forward_io_forward_rs1 ? RegFile_io_w_data : _JALR_io_rdata1_T_30; // @[Mux.scala 80:57]
  assign Forwarding_io_IDEX_rs1 = ID_EX__io_rs1_out; // @[Main.scala 241:35]
  assign Forwarding_io_IDEX_rs2 = ID_EX__io_rs2_out; // @[Main.scala 242:35]
  assign Forwarding_io_EXMEM_rd = EX_MEM_M_io_EXMEM_rd_out; // @[Main.scala 243:35]
  assign Forwarding_io_EXMEM_regWr = EX_MEM_M_io_EXMEM_reg_w_out; // @[Main.scala 244:35]
  assign Forwarding_io_MEMWB_rd = MEM_WB_M_io_MEMWB_rd_out; // @[Main.scala 245:35]
  assign Forwarding_io_MEMWB_regWr = MEM_WB_M_io_MEMWB_reg_w_out; // @[Main.scala 246:35]
  assign HazardDetect_io_IF_ID_inst = IF_ID__io_SelectedInstr_out; // @[Main.scala 138:37]
  assign HazardDetect_io_ID_EX_memRead = ID_EX__io_ctrl_MemRd_out; // @[Main.scala 139:37]
  assign HazardDetect_io_ID_EX_rd = ID_EX__io_rd_out; // @[Main.scala 140:37]
  assign HazardDetect_io_pc_in = IF_ID__io_pc4_out; // @[Main.scala 141:58]
  assign HazardDetect_io_current_pc = IF_ID__io_SelectedPC_out; // @[Main.scala 142:37]
  assign Branch_Forward_io_ID_EX_RD = ID_EX__io_rd_out; // @[Main.scala 147:37]
  assign Branch_Forward_io_EX_MEM_RD = EX_MEM_M_io_EXMEM_rd_out; // @[Main.scala 148:37]
  assign Branch_Forward_io_MEM_WB_RD = MEM_WB_M_io_MEMWB_rd_out; // @[Main.scala 149:37]
  assign Branch_Forward_io_ID_EX_memRd = ID_EX__io_ctrl_MemRd_out; // @[Main.scala 150:37]
  assign Branch_Forward_io_EX_MEM_memRd = EX_MEM_M_io_EXMEM_memRd_out; // @[Main.scala 151:37]
  assign Branch_Forward_io_MEM_WB_memRd = MEM_WB_M_io_MEMWB_memRd_out; // @[Main.scala 152:37]
  assign Branch_Forward_io_rs1 = IF_ID__io_SelectedInstr_out[19:15]; // @[Main.scala 153:67]
  assign Branch_Forward_io_rs2 = IF_ID__io_SelectedInstr_out[24:20]; // @[Main.scala 154:67]
  assign Branch_Forward_io_ctrl_branch = control_module_io_branch; // @[Main.scala 155:37]
  assign Structural_io_rs1 = IF_ID__io_SelectedInstr_out[19:15]; // @[Main.scala 89:67]
  assign Structural_io_rs2 = IF_ID__io_SelectedInstr_out[24:20]; // @[Main.scala 90:67]
  assign Structural_io_MEM_WB_regWr = MEM_WB_M_io_EXMEM_REG_W; // @[Main.scala 91:37]
  assign Structural_io_MEM_WB_Rd = MEM_WB_M_io_MEMWB_rd_out; // @[Main.scala 92:37]
endmodule
