module Reg_PC(
  input         clock,
  input         reset,
  input         io_stall,
  input  [31:0] io_next_pc,
  output [31:0] io_current_pc
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] PC_REG; // @[Reg_PC.scala 11:35]
  assign io_current_pc = PC_REG; // @[Reg_PC.scala 19:24]
  always @(posedge clock) begin
    if (reset) begin // @[Reg_PC.scala 11:35]
      PC_REG <= 32'h0; // @[Reg_PC.scala 11:35]
    end else if (!(io_stall)) begin // @[Reg_PC.scala 13:17]
      PC_REG <= io_next_pc; // @[Reg_PC.scala 16:12]
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
  PC_REG = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SRAM(
  input         clock,
  input  [3:0]  io_w_en,
  input  [15:0] io_address,
  input  [31:0] io_write_data,
  output [31:0] io_read_data
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [7:0] mem [0:65535]; // @[SRAM.scala 12:16]
  wire  mem_read_data_bytes_0_MPORT_en; // @[SRAM.scala 12:16]
  wire [15:0] mem_read_data_bytes_0_MPORT_addr; // @[SRAM.scala 12:16]
  wire [7:0] mem_read_data_bytes_0_MPORT_data; // @[SRAM.scala 12:16]
  wire  mem_read_data_bytes_1_MPORT_en; // @[SRAM.scala 12:16]
  wire [15:0] mem_read_data_bytes_1_MPORT_addr; // @[SRAM.scala 12:16]
  wire [7:0] mem_read_data_bytes_1_MPORT_data; // @[SRAM.scala 12:16]
  wire  mem_read_data_bytes_2_MPORT_en; // @[SRAM.scala 12:16]
  wire [15:0] mem_read_data_bytes_2_MPORT_addr; // @[SRAM.scala 12:16]
  wire [7:0] mem_read_data_bytes_2_MPORT_data; // @[SRAM.scala 12:16]
  wire  mem_read_data_bytes_3_MPORT_en; // @[SRAM.scala 12:16]
  wire [15:0] mem_read_data_bytes_3_MPORT_addr; // @[SRAM.scala 12:16]
  wire [7:0] mem_read_data_bytes_3_MPORT_data; // @[SRAM.scala 12:16]
  wire [7:0] mem_MPORT_data; // @[SRAM.scala 12:16]
  wire [15:0] mem_MPORT_addr; // @[SRAM.scala 12:16]
  wire  mem_MPORT_mask; // @[SRAM.scala 12:16]
  wire  mem_MPORT_en; // @[SRAM.scala 12:16]
  wire [7:0] mem_MPORT_1_data; // @[SRAM.scala 12:16]
  wire [15:0] mem_MPORT_1_addr; // @[SRAM.scala 12:16]
  wire  mem_MPORT_1_mask; // @[SRAM.scala 12:16]
  wire  mem_MPORT_1_en; // @[SRAM.scala 12:16]
  wire [7:0] mem_MPORT_2_data; // @[SRAM.scala 12:16]
  wire [15:0] mem_MPORT_2_addr; // @[SRAM.scala 12:16]
  wire  mem_MPORT_2_mask; // @[SRAM.scala 12:16]
  wire  mem_MPORT_2_en; // @[SRAM.scala 12:16]
  wire [7:0] mem_MPORT_3_data; // @[SRAM.scala 12:16]
  wire [15:0] mem_MPORT_3_addr; // @[SRAM.scala 12:16]
  wire  mem_MPORT_3_mask; // @[SRAM.scala 12:16]
  wire  mem_MPORT_3_en; // @[SRAM.scala 12:16]
  wire  _T = io_w_en != 4'h0; // @[SRAM.scala 15:16]
  wire [7:0] read_data_bytes_1 = mem_read_data_bytes_1_MPORT_data; // @[SRAM.scala 23:32 25:22]
  wire [7:0] read_data_bytes_0 = mem_read_data_bytes_0_MPORT_data; // @[SRAM.scala 23:32 24:22]
  wire [15:0] io_read_data_lo = {read_data_bytes_1,read_data_bytes_0}; // @[Cat.scala 31:58]
  wire [7:0] read_data_bytes_3 = mem_read_data_bytes_3_MPORT_data; // @[SRAM.scala 23:32 27:22]
  wire [7:0] read_data_bytes_2 = mem_read_data_bytes_2_MPORT_data; // @[SRAM.scala 23:32 26:22]
  wire [15:0] io_read_data_hi = {read_data_bytes_3,read_data_bytes_2}; // @[Cat.scala 31:58]
  assign mem_read_data_bytes_0_MPORT_en = 1'h1;
  assign mem_read_data_bytes_0_MPORT_addr = io_address;
  assign mem_read_data_bytes_0_MPORT_data = mem[mem_read_data_bytes_0_MPORT_addr]; // @[SRAM.scala 12:16]
  assign mem_read_data_bytes_1_MPORT_en = 1'h1;
  assign mem_read_data_bytes_1_MPORT_addr = io_address + 16'h1;
  assign mem_read_data_bytes_1_MPORT_data = mem[mem_read_data_bytes_1_MPORT_addr]; // @[SRAM.scala 12:16]
  assign mem_read_data_bytes_2_MPORT_en = 1'h1;
  assign mem_read_data_bytes_2_MPORT_addr = io_address + 16'h2;
  assign mem_read_data_bytes_2_MPORT_data = mem[mem_read_data_bytes_2_MPORT_addr]; // @[SRAM.scala 12:16]
  assign mem_read_data_bytes_3_MPORT_en = 1'h1;
  assign mem_read_data_bytes_3_MPORT_addr = io_address + 16'h3;
  assign mem_read_data_bytes_3_MPORT_data = mem[mem_read_data_bytes_3_MPORT_addr]; // @[SRAM.scala 12:16]
  assign mem_MPORT_data = io_write_data[7:0];
  assign mem_MPORT_addr = io_address;
  assign mem_MPORT_mask = 1'h1;
  assign mem_MPORT_en = _T & io_w_en[0];
  assign mem_MPORT_1_data = io_write_data[15:8];
  assign mem_MPORT_1_addr = io_address + 16'h1;
  assign mem_MPORT_1_mask = 1'h1;
  assign mem_MPORT_1_en = _T & io_w_en[1];
  assign mem_MPORT_2_data = io_write_data[23:16];
  assign mem_MPORT_2_addr = io_address + 16'h2;
  assign mem_MPORT_2_mask = 1'h1;
  assign mem_MPORT_2_en = _T & io_w_en[2];
  assign mem_MPORT_3_data = io_write_data[31:24];
  assign mem_MPORT_3_addr = io_address + 16'h3;
  assign mem_MPORT_3_mask = 1'h1;
  assign mem_MPORT_3_en = _T & io_w_en[3];
  assign io_read_data = {io_read_data_hi,io_read_data_lo}; // @[Cat.scala 31:58]
  always @(posedge clock) begin
    if (mem_MPORT_en & mem_MPORT_mask) begin
      mem[mem_MPORT_addr] <= mem_MPORT_data; // @[SRAM.scala 12:16]
    end
    if (mem_MPORT_1_en & mem_MPORT_1_mask) begin
      mem[mem_MPORT_1_addr] <= mem_MPORT_1_data; // @[SRAM.scala 12:16]
    end
    if (mem_MPORT_2_en & mem_MPORT_2_mask) begin
      mem[mem_MPORT_2_addr] <= mem_MPORT_2_data; // @[SRAM.scala 12:16]
    end
    if (mem_MPORT_3_en & mem_MPORT_3_mask) begin
      mem[mem_MPORT_3_addr] <= mem_MPORT_3_data; // @[SRAM.scala 12:16]
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
  for (initvar = 0; initvar < 65536; initvar = initvar+1)
    mem[initvar] = _RAND_0[7:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Reg_D(
  input         clock,
  input         reset,
  input         io_stall,
  input         io_jb,
  input  [31:0] io_pc,
  input  [31:0] io_inst,
  output [31:0] io_out_Reg_D_pc,
  output [31:0] io_out_Reg_D_inst
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] PC_REG; // @[Reg_D.scala 14:35]
  reg [31:0] INST_REG; // @[Reg_D.scala 15:35]
  assign io_out_Reg_D_pc = PC_REG; // @[Reg_D.scala 27:25]
  assign io_out_Reg_D_inst = INST_REG; // @[Reg_D.scala 28:25]
  always @(posedge clock) begin
    if (reset) begin // @[Reg_D.scala 14:35]
      PC_REG <= 32'h0; // @[Reg_D.scala 14:35]
    end else if (io_jb) begin // @[Reg_D.scala 17:14]
      PC_REG <= 32'h0; // @[Reg_D.scala 18:17]
    end else if (!(io_stall)) begin // @[Reg_D.scala 20:23]
      PC_REG <= io_pc; // @[Reg_D.scala 24:17]
    end
    if (reset) begin // @[Reg_D.scala 15:35]
      INST_REG <= 32'h0; // @[Reg_D.scala 15:35]
    end else if (io_jb) begin // @[Reg_D.scala 17:14]
      INST_REG <= 32'h0; // @[Reg_D.scala 19:17]
    end else if (!(io_stall)) begin // @[Reg_D.scala 20:23]
      INST_REG <= io_inst; // @[Reg_D.scala 25:17]
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
  PC_REG = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  INST_REG = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Decoder(
  input  [31:0] io_inst,
  output [4:0]  io_dc_out_opcode,
  output [2:0]  io_dc_out_func3,
  output        io_dc_out_func7,
  output [4:0]  io_dc_out_rs1_index,
  output [4:0]  io_dc_out_rs2_index,
  output [4:0]  io_dc_out_rd_index
);
  assign io_dc_out_opcode = io_inst[6:2]; // @[Deocder.scala 14:30]
  assign io_dc_out_func3 = io_inst[14:12]; // @[Deocder.scala 15:29]
  assign io_dc_out_func7 = io_inst[30]; // @[Deocder.scala 16:29]
  assign io_dc_out_rs1_index = io_inst[19:15]; // @[Deocder.scala 17:33]
  assign io_dc_out_rs2_index = io_inst[24:20]; // @[Deocder.scala 18:33]
  assign io_dc_out_rd_index = io_inst[11:7]; // @[Deocder.scala 19:32]
endmodule
module Imm_Ext(
  input  [31:0] io_inst,
  output [31:0] io_imm_ext_out
);
  wire [19:0] _io_imm_ext_out_T_2 = io_inst[31] ? 20'hfffff : 20'h0; // @[Bitwise.scala 74:12]
  wire [31:0] _io_imm_ext_out_T_4 = {_io_imm_ext_out_T_2,io_inst[31:20]}; // @[Cat.scala 31:58]
  wire [31:0] _io_imm_ext_out_T_20 = {_io_imm_ext_out_T_2,io_inst[31:25],io_inst[11:7]}; // @[Cat.scala 31:58]
  wire [31:0] _io_imm_ext_out_T_27 = {_io_imm_ext_out_T_2,io_inst[7],io_inst[30:25],io_inst[11:8],1'h0}; // @[Cat.scala 31:58]
  wire [31:0] _io_imm_ext_out_T_29 = {io_inst[31:12],12'h0}; // @[Cat.scala 31:58]
  wire [11:0] _io_imm_ext_out_T_34 = io_inst[31] ? 12'hfff : 12'h0; // @[Bitwise.scala 74:12]
  wire [31:0] _io_imm_ext_out_T_38 = {_io_imm_ext_out_T_34,io_inst[19:12],io_inst[20],io_inst[30:21],1'h0}; // @[Cat.scala 31:58]
  wire [31:0] _GEN_0 = 5'h1b == io_inst[6:2] ? _io_imm_ext_out_T_38 : 32'h0; // @[Imm_Ext.scala 12:24 15:26 38:33]
  wire [31:0] _GEN_1 = 5'h5 == io_inst[6:2] ? _io_imm_ext_out_T_29 : _GEN_0; // @[Imm_Ext.scala 15:26 35:33]
  wire [31:0] _GEN_2 = 5'hd == io_inst[6:2] ? _io_imm_ext_out_T_29 : _GEN_1; // @[Imm_Ext.scala 15:26 32:33]
  wire [31:0] _GEN_3 = 5'h18 == io_inst[6:2] ? _io_imm_ext_out_T_27 : _GEN_2; // @[Imm_Ext.scala 15:26 29:33]
  wire [31:0] _GEN_4 = 5'h8 == io_inst[6:2] ? _io_imm_ext_out_T_20 : _GEN_3; // @[Imm_Ext.scala 15:26 26:33]
  wire [31:0] _GEN_5 = 5'h19 == io_inst[6:2] ? _io_imm_ext_out_T_4 : _GEN_4; // @[Imm_Ext.scala 15:26 23:33]
  wire [31:0] _GEN_6 = 5'h4 == io_inst[6:2] ? _io_imm_ext_out_T_4 : _GEN_5; // @[Imm_Ext.scala 15:26 20:33]
  assign io_imm_ext_out = 5'h0 == io_inst[6:2] ? _io_imm_ext_out_T_4 : _GEN_6; // @[Imm_Ext.scala 15:26 17:33]
endmodule
module RegFile(
  input         clock,
  input         reset,
  input         io_wb_en,
  input  [31:0] io_wb_data,
  input  [4:0]  io_rd_index,
  input  [4:0]  io_rs1_index,
  input  [4:0]  io_rs2_index,
  output [31:0] io_rs1_data_out,
  output [31:0] io_rs2_data_out
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
  reg [31:0] registers_0; // @[RegFile.scala 51:26]
  reg [31:0] registers_1; // @[RegFile.scala 51:26]
  reg [31:0] registers_2; // @[RegFile.scala 51:26]
  reg [31:0] registers_3; // @[RegFile.scala 51:26]
  reg [31:0] registers_4; // @[RegFile.scala 51:26]
  reg [31:0] registers_5; // @[RegFile.scala 51:26]
  reg [31:0] registers_6; // @[RegFile.scala 51:26]
  reg [31:0] registers_7; // @[RegFile.scala 51:26]
  reg [31:0] registers_8; // @[RegFile.scala 51:26]
  reg [31:0] registers_9; // @[RegFile.scala 51:26]
  reg [31:0] registers_10; // @[RegFile.scala 51:26]
  reg [31:0] registers_11; // @[RegFile.scala 51:26]
  reg [31:0] registers_12; // @[RegFile.scala 51:26]
  reg [31:0] registers_13; // @[RegFile.scala 51:26]
  reg [31:0] registers_14; // @[RegFile.scala 51:26]
  reg [31:0] registers_15; // @[RegFile.scala 51:26]
  reg [31:0] registers_16; // @[RegFile.scala 51:26]
  reg [31:0] registers_17; // @[RegFile.scala 51:26]
  reg [31:0] registers_18; // @[RegFile.scala 51:26]
  reg [31:0] registers_19; // @[RegFile.scala 51:26]
  reg [31:0] registers_20; // @[RegFile.scala 51:26]
  reg [31:0] registers_21; // @[RegFile.scala 51:26]
  reg [31:0] registers_22; // @[RegFile.scala 51:26]
  reg [31:0] registers_23; // @[RegFile.scala 51:26]
  reg [31:0] registers_24; // @[RegFile.scala 51:26]
  reg [31:0] registers_25; // @[RegFile.scala 51:26]
  reg [31:0] registers_26; // @[RegFile.scala 51:26]
  reg [31:0] registers_27; // @[RegFile.scala 51:26]
  reg [31:0] registers_28; // @[RegFile.scala 51:26]
  reg [31:0] registers_29; // @[RegFile.scala 51:26]
  reg [31:0] registers_30; // @[RegFile.scala 51:26]
  reg [31:0] registers_31; // @[RegFile.scala 51:26]
  wire [31:0] _GEN_65 = 5'h1 == io_rs1_index ? registers_1 : registers_0; // @[RegFile.scala 57:{25,25}]
  wire [31:0] _GEN_66 = 5'h2 == io_rs1_index ? registers_2 : _GEN_65; // @[RegFile.scala 57:{25,25}]
  wire [31:0] _GEN_67 = 5'h3 == io_rs1_index ? registers_3 : _GEN_66; // @[RegFile.scala 57:{25,25}]
  wire [31:0] _GEN_68 = 5'h4 == io_rs1_index ? registers_4 : _GEN_67; // @[RegFile.scala 57:{25,25}]
  wire [31:0] _GEN_69 = 5'h5 == io_rs1_index ? registers_5 : _GEN_68; // @[RegFile.scala 57:{25,25}]
  wire [31:0] _GEN_70 = 5'h6 == io_rs1_index ? registers_6 : _GEN_69; // @[RegFile.scala 57:{25,25}]
  wire [31:0] _GEN_71 = 5'h7 == io_rs1_index ? registers_7 : _GEN_70; // @[RegFile.scala 57:{25,25}]
  wire [31:0] _GEN_72 = 5'h8 == io_rs1_index ? registers_8 : _GEN_71; // @[RegFile.scala 57:{25,25}]
  wire [31:0] _GEN_73 = 5'h9 == io_rs1_index ? registers_9 : _GEN_72; // @[RegFile.scala 57:{25,25}]
  wire [31:0] _GEN_74 = 5'ha == io_rs1_index ? registers_10 : _GEN_73; // @[RegFile.scala 57:{25,25}]
  wire [31:0] _GEN_75 = 5'hb == io_rs1_index ? registers_11 : _GEN_74; // @[RegFile.scala 57:{25,25}]
  wire [31:0] _GEN_76 = 5'hc == io_rs1_index ? registers_12 : _GEN_75; // @[RegFile.scala 57:{25,25}]
  wire [31:0] _GEN_77 = 5'hd == io_rs1_index ? registers_13 : _GEN_76; // @[RegFile.scala 57:{25,25}]
  wire [31:0] _GEN_78 = 5'he == io_rs1_index ? registers_14 : _GEN_77; // @[RegFile.scala 57:{25,25}]
  wire [31:0] _GEN_79 = 5'hf == io_rs1_index ? registers_15 : _GEN_78; // @[RegFile.scala 57:{25,25}]
  wire [31:0] _GEN_80 = 5'h10 == io_rs1_index ? registers_16 : _GEN_79; // @[RegFile.scala 57:{25,25}]
  wire [31:0] _GEN_81 = 5'h11 == io_rs1_index ? registers_17 : _GEN_80; // @[RegFile.scala 57:{25,25}]
  wire [31:0] _GEN_82 = 5'h12 == io_rs1_index ? registers_18 : _GEN_81; // @[RegFile.scala 57:{25,25}]
  wire [31:0] _GEN_83 = 5'h13 == io_rs1_index ? registers_19 : _GEN_82; // @[RegFile.scala 57:{25,25}]
  wire [31:0] _GEN_84 = 5'h14 == io_rs1_index ? registers_20 : _GEN_83; // @[RegFile.scala 57:{25,25}]
  wire [31:0] _GEN_85 = 5'h15 == io_rs1_index ? registers_21 : _GEN_84; // @[RegFile.scala 57:{25,25}]
  wire [31:0] _GEN_86 = 5'h16 == io_rs1_index ? registers_22 : _GEN_85; // @[RegFile.scala 57:{25,25}]
  wire [31:0] _GEN_87 = 5'h17 == io_rs1_index ? registers_23 : _GEN_86; // @[RegFile.scala 57:{25,25}]
  wire [31:0] _GEN_88 = 5'h18 == io_rs1_index ? registers_24 : _GEN_87; // @[RegFile.scala 57:{25,25}]
  wire [31:0] _GEN_89 = 5'h19 == io_rs1_index ? registers_25 : _GEN_88; // @[RegFile.scala 57:{25,25}]
  wire [31:0] _GEN_90 = 5'h1a == io_rs1_index ? registers_26 : _GEN_89; // @[RegFile.scala 57:{25,25}]
  wire [31:0] _GEN_91 = 5'h1b == io_rs1_index ? registers_27 : _GEN_90; // @[RegFile.scala 57:{25,25}]
  wire [31:0] _GEN_92 = 5'h1c == io_rs1_index ? registers_28 : _GEN_91; // @[RegFile.scala 57:{25,25}]
  wire [31:0] _GEN_93 = 5'h1d == io_rs1_index ? registers_29 : _GEN_92; // @[RegFile.scala 57:{25,25}]
  wire [31:0] _GEN_94 = 5'h1e == io_rs1_index ? registers_30 : _GEN_93; // @[RegFile.scala 57:{25,25}]
  wire [31:0] _GEN_95 = 5'h1f == io_rs1_index ? registers_31 : _GEN_94; // @[RegFile.scala 57:{25,25}]
  wire [31:0] _GEN_97 = 5'h1 == io_rs2_index ? registers_1 : registers_0; // @[RegFile.scala 58:{25,25}]
  wire [31:0] _GEN_98 = 5'h2 == io_rs2_index ? registers_2 : _GEN_97; // @[RegFile.scala 58:{25,25}]
  wire [31:0] _GEN_99 = 5'h3 == io_rs2_index ? registers_3 : _GEN_98; // @[RegFile.scala 58:{25,25}]
  wire [31:0] _GEN_100 = 5'h4 == io_rs2_index ? registers_4 : _GEN_99; // @[RegFile.scala 58:{25,25}]
  wire [31:0] _GEN_101 = 5'h5 == io_rs2_index ? registers_5 : _GEN_100; // @[RegFile.scala 58:{25,25}]
  wire [31:0] _GEN_102 = 5'h6 == io_rs2_index ? registers_6 : _GEN_101; // @[RegFile.scala 58:{25,25}]
  wire [31:0] _GEN_103 = 5'h7 == io_rs2_index ? registers_7 : _GEN_102; // @[RegFile.scala 58:{25,25}]
  wire [31:0] _GEN_104 = 5'h8 == io_rs2_index ? registers_8 : _GEN_103; // @[RegFile.scala 58:{25,25}]
  wire [31:0] _GEN_105 = 5'h9 == io_rs2_index ? registers_9 : _GEN_104; // @[RegFile.scala 58:{25,25}]
  wire [31:0] _GEN_106 = 5'ha == io_rs2_index ? registers_10 : _GEN_105; // @[RegFile.scala 58:{25,25}]
  wire [31:0] _GEN_107 = 5'hb == io_rs2_index ? registers_11 : _GEN_106; // @[RegFile.scala 58:{25,25}]
  wire [31:0] _GEN_108 = 5'hc == io_rs2_index ? registers_12 : _GEN_107; // @[RegFile.scala 58:{25,25}]
  wire [31:0] _GEN_109 = 5'hd == io_rs2_index ? registers_13 : _GEN_108; // @[RegFile.scala 58:{25,25}]
  wire [31:0] _GEN_110 = 5'he == io_rs2_index ? registers_14 : _GEN_109; // @[RegFile.scala 58:{25,25}]
  wire [31:0] _GEN_111 = 5'hf == io_rs2_index ? registers_15 : _GEN_110; // @[RegFile.scala 58:{25,25}]
  wire [31:0] _GEN_112 = 5'h10 == io_rs2_index ? registers_16 : _GEN_111; // @[RegFile.scala 58:{25,25}]
  wire [31:0] _GEN_113 = 5'h11 == io_rs2_index ? registers_17 : _GEN_112; // @[RegFile.scala 58:{25,25}]
  wire [31:0] _GEN_114 = 5'h12 == io_rs2_index ? registers_18 : _GEN_113; // @[RegFile.scala 58:{25,25}]
  wire [31:0] _GEN_115 = 5'h13 == io_rs2_index ? registers_19 : _GEN_114; // @[RegFile.scala 58:{25,25}]
  wire [31:0] _GEN_116 = 5'h14 == io_rs2_index ? registers_20 : _GEN_115; // @[RegFile.scala 58:{25,25}]
  wire [31:0] _GEN_117 = 5'h15 == io_rs2_index ? registers_21 : _GEN_116; // @[RegFile.scala 58:{25,25}]
  wire [31:0] _GEN_118 = 5'h16 == io_rs2_index ? registers_22 : _GEN_117; // @[RegFile.scala 58:{25,25}]
  wire [31:0] _GEN_119 = 5'h17 == io_rs2_index ? registers_23 : _GEN_118; // @[RegFile.scala 58:{25,25}]
  wire [31:0] _GEN_120 = 5'h18 == io_rs2_index ? registers_24 : _GEN_119; // @[RegFile.scala 58:{25,25}]
  wire [31:0] _GEN_121 = 5'h19 == io_rs2_index ? registers_25 : _GEN_120; // @[RegFile.scala 58:{25,25}]
  wire [31:0] _GEN_122 = 5'h1a == io_rs2_index ? registers_26 : _GEN_121; // @[RegFile.scala 58:{25,25}]
  wire [31:0] _GEN_123 = 5'h1b == io_rs2_index ? registers_27 : _GEN_122; // @[RegFile.scala 58:{25,25}]
  wire [31:0] _GEN_124 = 5'h1c == io_rs2_index ? registers_28 : _GEN_123; // @[RegFile.scala 58:{25,25}]
  wire [31:0] _GEN_125 = 5'h1d == io_rs2_index ? registers_29 : _GEN_124; // @[RegFile.scala 58:{25,25}]
  wire [31:0] _GEN_126 = 5'h1e == io_rs2_index ? registers_30 : _GEN_125; // @[RegFile.scala 58:{25,25}]
  wire [31:0] _GEN_127 = 5'h1f == io_rs2_index ? registers_31 : _GEN_126; // @[RegFile.scala 58:{25,25}]
  assign io_rs1_data_out = io_rs1_index == 5'h0 ? 32'h0 : _GEN_95; // @[RegFile.scala 57:25]
  assign io_rs2_data_out = io_rs2_index == 5'h0 ? 32'h0 : _GEN_127; // @[RegFile.scala 58:25]
  always @(posedge clock) begin
    if (reset) begin // @[RegFile.scala 51:26]
      registers_0 <= 32'h0; // @[RegFile.scala 51:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 53:41]
      if (5'h0 == io_rd_index) begin // @[RegFile.scala 54:28]
        registers_0 <= io_wb_data; // @[RegFile.scala 54:28]
      end
    end
    if (reset) begin // @[RegFile.scala 51:26]
      registers_1 <= 32'h0; // @[RegFile.scala 51:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 53:41]
      if (5'h1 == io_rd_index) begin // @[RegFile.scala 54:28]
        registers_1 <= io_wb_data; // @[RegFile.scala 54:28]
      end
    end
    if (reset) begin // @[RegFile.scala 51:26]
      registers_2 <= 32'h0; // @[RegFile.scala 51:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 53:41]
      if (5'h2 == io_rd_index) begin // @[RegFile.scala 54:28]
        registers_2 <= io_wb_data; // @[RegFile.scala 54:28]
      end
    end
    if (reset) begin // @[RegFile.scala 51:26]
      registers_3 <= 32'h0; // @[RegFile.scala 51:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 53:41]
      if (5'h3 == io_rd_index) begin // @[RegFile.scala 54:28]
        registers_3 <= io_wb_data; // @[RegFile.scala 54:28]
      end
    end
    if (reset) begin // @[RegFile.scala 51:26]
      registers_4 <= 32'h0; // @[RegFile.scala 51:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 53:41]
      if (5'h4 == io_rd_index) begin // @[RegFile.scala 54:28]
        registers_4 <= io_wb_data; // @[RegFile.scala 54:28]
      end
    end
    if (reset) begin // @[RegFile.scala 51:26]
      registers_5 <= 32'h0; // @[RegFile.scala 51:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 53:41]
      if (5'h5 == io_rd_index) begin // @[RegFile.scala 54:28]
        registers_5 <= io_wb_data; // @[RegFile.scala 54:28]
      end
    end
    if (reset) begin // @[RegFile.scala 51:26]
      registers_6 <= 32'h0; // @[RegFile.scala 51:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 53:41]
      if (5'h6 == io_rd_index) begin // @[RegFile.scala 54:28]
        registers_6 <= io_wb_data; // @[RegFile.scala 54:28]
      end
    end
    if (reset) begin // @[RegFile.scala 51:26]
      registers_7 <= 32'h0; // @[RegFile.scala 51:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 53:41]
      if (5'h7 == io_rd_index) begin // @[RegFile.scala 54:28]
        registers_7 <= io_wb_data; // @[RegFile.scala 54:28]
      end
    end
    if (reset) begin // @[RegFile.scala 51:26]
      registers_8 <= 32'h0; // @[RegFile.scala 51:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 53:41]
      if (5'h8 == io_rd_index) begin // @[RegFile.scala 54:28]
        registers_8 <= io_wb_data; // @[RegFile.scala 54:28]
      end
    end
    if (reset) begin // @[RegFile.scala 51:26]
      registers_9 <= 32'h0; // @[RegFile.scala 51:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 53:41]
      if (5'h9 == io_rd_index) begin // @[RegFile.scala 54:28]
        registers_9 <= io_wb_data; // @[RegFile.scala 54:28]
      end
    end
    if (reset) begin // @[RegFile.scala 51:26]
      registers_10 <= 32'h0; // @[RegFile.scala 51:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 53:41]
      if (5'ha == io_rd_index) begin // @[RegFile.scala 54:28]
        registers_10 <= io_wb_data; // @[RegFile.scala 54:28]
      end
    end
    if (reset) begin // @[RegFile.scala 51:26]
      registers_11 <= 32'h0; // @[RegFile.scala 51:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 53:41]
      if (5'hb == io_rd_index) begin // @[RegFile.scala 54:28]
        registers_11 <= io_wb_data; // @[RegFile.scala 54:28]
      end
    end
    if (reset) begin // @[RegFile.scala 51:26]
      registers_12 <= 32'h0; // @[RegFile.scala 51:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 53:41]
      if (5'hc == io_rd_index) begin // @[RegFile.scala 54:28]
        registers_12 <= io_wb_data; // @[RegFile.scala 54:28]
      end
    end
    if (reset) begin // @[RegFile.scala 51:26]
      registers_13 <= 32'h0; // @[RegFile.scala 51:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 53:41]
      if (5'hd == io_rd_index) begin // @[RegFile.scala 54:28]
        registers_13 <= io_wb_data; // @[RegFile.scala 54:28]
      end
    end
    if (reset) begin // @[RegFile.scala 51:26]
      registers_14 <= 32'h0; // @[RegFile.scala 51:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 53:41]
      if (5'he == io_rd_index) begin // @[RegFile.scala 54:28]
        registers_14 <= io_wb_data; // @[RegFile.scala 54:28]
      end
    end
    if (reset) begin // @[RegFile.scala 51:26]
      registers_15 <= 32'h0; // @[RegFile.scala 51:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 53:41]
      if (5'hf == io_rd_index) begin // @[RegFile.scala 54:28]
        registers_15 <= io_wb_data; // @[RegFile.scala 54:28]
      end
    end
    if (reset) begin // @[RegFile.scala 51:26]
      registers_16 <= 32'h0; // @[RegFile.scala 51:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 53:41]
      if (5'h10 == io_rd_index) begin // @[RegFile.scala 54:28]
        registers_16 <= io_wb_data; // @[RegFile.scala 54:28]
      end
    end
    if (reset) begin // @[RegFile.scala 51:26]
      registers_17 <= 32'h0; // @[RegFile.scala 51:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 53:41]
      if (5'h11 == io_rd_index) begin // @[RegFile.scala 54:28]
        registers_17 <= io_wb_data; // @[RegFile.scala 54:28]
      end
    end
    if (reset) begin // @[RegFile.scala 51:26]
      registers_18 <= 32'h0; // @[RegFile.scala 51:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 53:41]
      if (5'h12 == io_rd_index) begin // @[RegFile.scala 54:28]
        registers_18 <= io_wb_data; // @[RegFile.scala 54:28]
      end
    end
    if (reset) begin // @[RegFile.scala 51:26]
      registers_19 <= 32'h0; // @[RegFile.scala 51:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 53:41]
      if (5'h13 == io_rd_index) begin // @[RegFile.scala 54:28]
        registers_19 <= io_wb_data; // @[RegFile.scala 54:28]
      end
    end
    if (reset) begin // @[RegFile.scala 51:26]
      registers_20 <= 32'h0; // @[RegFile.scala 51:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 53:41]
      if (5'h14 == io_rd_index) begin // @[RegFile.scala 54:28]
        registers_20 <= io_wb_data; // @[RegFile.scala 54:28]
      end
    end
    if (reset) begin // @[RegFile.scala 51:26]
      registers_21 <= 32'h0; // @[RegFile.scala 51:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 53:41]
      if (5'h15 == io_rd_index) begin // @[RegFile.scala 54:28]
        registers_21 <= io_wb_data; // @[RegFile.scala 54:28]
      end
    end
    if (reset) begin // @[RegFile.scala 51:26]
      registers_22 <= 32'h0; // @[RegFile.scala 51:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 53:41]
      if (5'h16 == io_rd_index) begin // @[RegFile.scala 54:28]
        registers_22 <= io_wb_data; // @[RegFile.scala 54:28]
      end
    end
    if (reset) begin // @[RegFile.scala 51:26]
      registers_23 <= 32'h0; // @[RegFile.scala 51:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 53:41]
      if (5'h17 == io_rd_index) begin // @[RegFile.scala 54:28]
        registers_23 <= io_wb_data; // @[RegFile.scala 54:28]
      end
    end
    if (reset) begin // @[RegFile.scala 51:26]
      registers_24 <= 32'h0; // @[RegFile.scala 51:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 53:41]
      if (5'h18 == io_rd_index) begin // @[RegFile.scala 54:28]
        registers_24 <= io_wb_data; // @[RegFile.scala 54:28]
      end
    end
    if (reset) begin // @[RegFile.scala 51:26]
      registers_25 <= 32'h0; // @[RegFile.scala 51:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 53:41]
      if (5'h19 == io_rd_index) begin // @[RegFile.scala 54:28]
        registers_25 <= io_wb_data; // @[RegFile.scala 54:28]
      end
    end
    if (reset) begin // @[RegFile.scala 51:26]
      registers_26 <= 32'h0; // @[RegFile.scala 51:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 53:41]
      if (5'h1a == io_rd_index) begin // @[RegFile.scala 54:28]
        registers_26 <= io_wb_data; // @[RegFile.scala 54:28]
      end
    end
    if (reset) begin // @[RegFile.scala 51:26]
      registers_27 <= 32'h0; // @[RegFile.scala 51:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 53:41]
      if (5'h1b == io_rd_index) begin // @[RegFile.scala 54:28]
        registers_27 <= io_wb_data; // @[RegFile.scala 54:28]
      end
    end
    if (reset) begin // @[RegFile.scala 51:26]
      registers_28 <= 32'h0; // @[RegFile.scala 51:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 53:41]
      if (5'h1c == io_rd_index) begin // @[RegFile.scala 54:28]
        registers_28 <= io_wb_data; // @[RegFile.scala 54:28]
      end
    end
    if (reset) begin // @[RegFile.scala 51:26]
      registers_29 <= 32'h0; // @[RegFile.scala 51:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 53:41]
      if (5'h1d == io_rd_index) begin // @[RegFile.scala 54:28]
        registers_29 <= io_wb_data; // @[RegFile.scala 54:28]
      end
    end
    if (reset) begin // @[RegFile.scala 51:26]
      registers_30 <= 32'h0; // @[RegFile.scala 51:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 53:41]
      if (5'h1e == io_rd_index) begin // @[RegFile.scala 54:28]
        registers_30 <= io_wb_data; // @[RegFile.scala 54:28]
      end
    end
    if (reset) begin // @[RegFile.scala 51:26]
      registers_31 <= 32'h0; // @[RegFile.scala 51:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 53:41]
      if (5'h1f == io_rd_index) begin // @[RegFile.scala 54:28]
        registers_31 <= io_wb_data; // @[RegFile.scala 54:28]
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
  registers_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  registers_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  registers_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  registers_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  registers_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  registers_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  registers_6 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  registers_7 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  registers_8 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  registers_9 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  registers_10 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  registers_11 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  registers_12 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  registers_13 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  registers_14 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  registers_15 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  registers_16 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  registers_17 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  registers_18 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  registers_19 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  registers_20 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  registers_21 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  registers_22 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  registers_23 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  registers_24 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  registers_25 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  registers_26 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  registers_27 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  registers_28 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  registers_29 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  registers_30 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  registers_31 = _RAND_31[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Reg_E(
  input         clock,
  input         reset,
  input         io_stall,
  input         io_jb,
  input  [31:0] io_pc,
  input  [31:0] io_rs1_data,
  input  [31:0] io_rs2_data,
  input  [31:0] io_sext_imme,
  output [31:0] io_out_Reg_E_pc,
  output [31:0] io_out_Reg_E_rs1_data,
  output [31:0] io_out_Reg_E_rs2_data,
  output [31:0] io_out_Reg_E_sext_imme
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] E_PC_REG; // @[Reg_E.scala 18:43]
  reg [31:0] E_RS1_DATA_REG; // @[Reg_E.scala 19:43]
  reg [31:0] E_RS2_DATA_REG; // @[Reg_E.scala 20:43]
  reg [31:0] E_SEXT_IMME_REG; // @[Reg_E.scala 21:43]
  assign io_out_Reg_E_pc = E_PC_REG; // @[Reg_E.scala 35:28]
  assign io_out_Reg_E_rs1_data = E_RS1_DATA_REG; // @[Reg_E.scala 36:28]
  assign io_out_Reg_E_rs2_data = E_RS2_DATA_REG; // @[Reg_E.scala 37:28]
  assign io_out_Reg_E_sext_imme = E_SEXT_IMME_REG; // @[Reg_E.scala 38:28]
  always @(posedge clock) begin
    if (reset) begin // @[Reg_E.scala 18:43]
      E_PC_REG <= 32'h0; // @[Reg_E.scala 18:43]
    end else if (io_jb | io_stall) begin // @[Reg_E.scala 23:26]
      E_PC_REG <= 32'h0; // @[Reg_E.scala 24:23]
    end else begin
      E_PC_REG <= io_pc; // @[Reg_E.scala 29:23]
    end
    if (reset) begin // @[Reg_E.scala 19:43]
      E_RS1_DATA_REG <= 32'h0; // @[Reg_E.scala 19:43]
    end else if (io_jb | io_stall) begin // @[Reg_E.scala 23:26]
      E_RS1_DATA_REG <= 32'h0; // @[Reg_E.scala 25:23]
    end else begin
      E_RS1_DATA_REG <= io_rs1_data; // @[Reg_E.scala 30:23]
    end
    if (reset) begin // @[Reg_E.scala 20:43]
      E_RS2_DATA_REG <= 32'h0; // @[Reg_E.scala 20:43]
    end else if (io_jb | io_stall) begin // @[Reg_E.scala 23:26]
      E_RS2_DATA_REG <= 32'h0; // @[Reg_E.scala 26:23]
    end else begin
      E_RS2_DATA_REG <= io_rs2_data; // @[Reg_E.scala 31:23]
    end
    if (reset) begin // @[Reg_E.scala 21:43]
      E_SEXT_IMME_REG <= 32'h0; // @[Reg_E.scala 21:43]
    end else if (io_jb | io_stall) begin // @[Reg_E.scala 23:26]
      E_SEXT_IMME_REG <= 32'h0; // @[Reg_E.scala 27:23]
    end else begin
      E_SEXT_IMME_REG <= io_sext_imme; // @[Reg_E.scala 32:23]
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
  E_PC_REG = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  E_RS1_DATA_REG = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  E_RS2_DATA_REG = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  E_SEXT_IMME_REG = _RAND_3[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ALU(
  input  [4:0]  io_opcode,
  input  [2:0]  io_func3,
  input         io_func7,
  input  [31:0] io_operand1,
  input  [31:0] io_operand2,
  output [31:0] io_alu_out
);
  wire [3:0] func7_and_func3 = {io_func7,io_func3}; // @[Cat.scala 31:58]
  wire [31:0] _io_alu_out_T = io_operand1; // @[ALU.scala 19:44]
  wire [31:0] _io_alu_out_T_1 = io_operand2; // @[ALU.scala 19:65]
  wire [31:0] _io_alu_out_T_5 = $signed(io_operand1) + $signed(io_operand2); // @[ALU.scala 19:73]
  wire [31:0] _io_alu_out_T_11 = $signed(io_operand1) - $signed(io_operand2); // @[ALU.scala 22:74]
  wire [62:0] _GEN_31 = {{31'd0}, io_operand1}; // @[ALU.scala 25:44]
  wire [62:0] _io_alu_out_T_13 = _GEN_31 << io_operand2[4:0]; // @[ALU.scala 25:44]
  wire  _io_alu_out_T_16 = $signed(io_operand1) < $signed(io_operand2); // @[ALU.scala 28:51]
  wire  _io_alu_out_T_17 = io_operand1 < io_operand2; // @[ALU.scala 31:44]
  wire [31:0] _io_alu_out_T_18 = io_operand1 ^ io_operand2; // @[ALU.scala 34:44]
  wire [31:0] _io_alu_out_T_20 = io_operand1 >> io_operand2[4:0]; // @[ALU.scala 37:44]
  wire [31:0] _io_alu_out_T_24 = $signed(io_operand1) >>> io_operand2[4:0]; // @[ALU.scala 40:73]
  wire [31:0] _io_alu_out_T_25 = io_operand1 | io_operand2; // @[ALU.scala 43:44]
  wire [31:0] _io_alu_out_T_26 = io_operand1 & io_operand2; // @[ALU.scala 46:44]
  wire [31:0] _GEN_0 = 4'h7 == func7_and_func3 ? _io_alu_out_T_26 : 32'h0; // @[ALU.scala 15:16 17:33 46:28]
  wire [31:0] _GEN_1 = 4'h6 == func7_and_func3 ? _io_alu_out_T_25 : _GEN_0; // @[ALU.scala 17:33 43:28]
  wire [31:0] _GEN_2 = 4'hd == func7_and_func3 ? _io_alu_out_T_24 : _GEN_1; // @[ALU.scala 17:33 40:28]
  wire [31:0] _GEN_3 = 4'h5 == func7_and_func3 ? _io_alu_out_T_20 : _GEN_2; // @[ALU.scala 17:33 37:28]
  wire [31:0] _GEN_4 = 4'h4 == func7_and_func3 ? _io_alu_out_T_18 : _GEN_3; // @[ALU.scala 17:33 34:28]
  wire [31:0] _GEN_5 = 4'h3 == func7_and_func3 ? {{31'd0}, io_operand1 < io_operand2} : _GEN_4; // @[ALU.scala 17:33 31:28]
  wire [31:0] _GEN_6 = 4'h2 == func7_and_func3 ? {{31'd0}, $signed(_io_alu_out_T) < $signed(_io_alu_out_T_1)} : _GEN_5; // @[ALU.scala 17:33 28:28]
  wire [62:0] _GEN_7 = 4'h1 == func7_and_func3 ? _io_alu_out_T_13 : {{31'd0}, _GEN_6}; // @[ALU.scala 17:33 25:28]
  wire [62:0] _GEN_8 = 4'h8 == func7_and_func3 ? {{31'd0}, _io_alu_out_T_11} : _GEN_7; // @[ALU.scala 17:33 22:28]
  wire [62:0] _GEN_9 = 4'h0 == func7_and_func3 ? {{31'd0}, _io_alu_out_T_5} : _GEN_8; // @[ALU.scala 17:33 19:28]
  wire  _T_12 = 3'h0 == io_func3; // @[ALU.scala 51:26]
  wire  _T_15 = 3'h4 == io_func3; // @[ALU.scala 51:26]
  wire  _T_16 = 3'h6 == io_func3; // @[ALU.scala 51:26]
  wire  _T_17 = 3'h7 == io_func3; // @[ALU.scala 51:26]
  wire  _T_18 = 3'h1 == io_func3; // @[ALU.scala 51:26]
  wire  _T_19 = 3'h5 == io_func3; // @[ALU.scala 51:26]
  wire [31:0] _GEN_10 = io_func7 ? _io_alu_out_T_24 : _io_alu_out_T_20; // @[ALU.scala 74:39 75:32 77:32]
  wire [31:0] _GEN_11 = 3'h5 == io_func3 ? _GEN_10 : 32'h0; // @[ALU.scala 15:16 51:26]
  wire [62:0] _GEN_12 = 3'h1 == io_func3 ? _io_alu_out_T_13 : {{31'd0}, _GEN_11}; // @[ALU.scala 51:26 71:28]
  wire [62:0] _GEN_13 = 3'h7 == io_func3 ? {{31'd0}, _io_alu_out_T_26} : _GEN_12; // @[ALU.scala 51:26 68:28]
  wire [62:0] _GEN_14 = 3'h6 == io_func3 ? {{31'd0}, _io_alu_out_T_25} : _GEN_13; // @[ALU.scala 51:26 65:28]
  wire [62:0] _GEN_15 = 3'h4 == io_func3 ? {{31'd0}, _io_alu_out_T_18} : _GEN_14; // @[ALU.scala 51:26 62:28]
  wire [62:0] _GEN_16 = 3'h3 == io_func3 ? {{62'd0}, _io_alu_out_T_17} : _GEN_15; // @[ALU.scala 51:26 59:28]
  wire [62:0] _GEN_17 = 3'h2 == io_func3 ? {{62'd0}, _io_alu_out_T_16} : _GEN_16; // @[ALU.scala 51:26 56:28]
  wire [62:0] _GEN_18 = 3'h0 == io_func3 ? {{31'd0}, _io_alu_out_T_5} : _GEN_17; // @[ALU.scala 51:26 53:28]
  wire [31:0] _GEN_19 = _T_17 ? {{31'd0}, io_operand1 >= io_operand2} : 32'h0; // @[ALU.scala 83:26 100:28 15:16]
  wire [31:0] _GEN_20 = _T_16 ? {{31'd0}, _io_alu_out_T_17} : _GEN_19; // @[ALU.scala 83:26 97:28]
  wire [31:0] _GEN_21 = _T_19 ? {{31'd0}, $signed(_io_alu_out_T) >= $signed(_io_alu_out_T_1)} : _GEN_20; // @[ALU.scala 83:26 94:28]
  wire [31:0] _GEN_22 = _T_15 ? {{31'd0}, _io_alu_out_T_16} : _GEN_21; // @[ALU.scala 83:26 91:28]
  wire [31:0] _GEN_23 = _T_18 ? {{31'd0}, io_operand1 != io_operand2} : _GEN_22; // @[ALU.scala 83:26 88:28]
  wire [31:0] _GEN_24 = _T_12 ? {{31'd0}, io_operand1 == io_operand2} : _GEN_23; // @[ALU.scala 83:26 85:28]
  wire [31:0] _io_alu_out_T_59 = io_operand1 + io_operand2; // @[ALU.scala 109:36]
  wire [31:0] _io_alu_out_T_61 = io_operand1 + 32'h4; // @[ALU.scala 111:36]
  wire [31:0] _GEN_25 = io_opcode == 5'h1b | io_opcode == 5'h19 ? _io_alu_out_T_61 : 32'h0; // @[ALU.scala 110:110 111:20 113:20]
  wire [31:0] _GEN_26 = io_opcode == 5'h5 | io_opcode == 5'h8 | io_opcode == 5'h0 ? _io_alu_out_T_59 : _GEN_25; // @[ALU.scala 108:155 109:20]
  wire [31:0] _GEN_27 = io_opcode == 5'hd ? io_operand2 : _GEN_26; // @[ALU.scala 106:62 107:20]
  wire [31:0] _GEN_28 = io_opcode == 5'h18 ? _GEN_24 : _GEN_27; // @[ALU.scala 82:60]
  wire [62:0] _GEN_29 = io_opcode == 5'h4 ? _GEN_18 : {{31'd0}, _GEN_28}; // @[ALU.scala 50:61]
  wire [62:0] _GEN_30 = io_opcode == 5'hc ? _GEN_9 : _GEN_29; // @[ALU.scala 16:53]
  assign io_alu_out = _GEN_30[31:0];
endmodule
module JB_Unit(
  input  [31:0] io_operand1,
  input  [31:0] io_operand2,
  output [31:0] io_jb_out
);
  assign io_jb_out = io_operand1 + io_operand2; // @[JB_Unit.scala 11:32]
endmodule
module Reg_M(
  input         clock,
  input         reset,
  input  [31:0] io_alu_out,
  input  [31:0] io_rs2_data,
  output [31:0] io_out_Reg_M_alu_out,
  output [31:0] io_out_Reg_M_rs2_data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] ALU_OUT_REG; // @[Reg_M.scala 12:40]
  reg [31:0] RS2_DATA_REG; // @[Reg_M.scala 13:40]
  assign io_out_Reg_M_alu_out = ALU_OUT_REG; // @[Reg_M.scala 18:31]
  assign io_out_Reg_M_rs2_data = RS2_DATA_REG; // @[Reg_M.scala 19:31]
  always @(posedge clock) begin
    if (reset) begin // @[Reg_M.scala 12:40]
      ALU_OUT_REG <= 32'h0; // @[Reg_M.scala 12:40]
    end else begin
      ALU_OUT_REG <= io_alu_out; // @[Reg_M.scala 15:19]
    end
    if (reset) begin // @[Reg_M.scala 13:40]
      RS2_DATA_REG <= 32'h0; // @[Reg_M.scala 13:40]
    end else begin
      RS2_DATA_REG <= io_rs2_data; // @[Reg_M.scala 16:19]
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
  ALU_OUT_REG = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  RS2_DATA_REG = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module LD_Filter(
  input  [2:0]  io_func3,
  input  [31:0] io_ld_data,
  output [31:0] io_ld_data_f
);
  wire [23:0] _io_ld_data_f_T_2 = io_ld_data[7] ? 24'hffffff : 24'h0; // @[Bitwise.scala 74:12]
  wire [31:0] _io_ld_data_f_T_4 = {_io_ld_data_f_T_2,io_ld_data[7:0]}; // @[Cat.scala 31:58]
  wire [15:0] _io_ld_data_f_T_7 = io_ld_data[15] ? 16'hffff : 16'h0; // @[Bitwise.scala 74:12]
  wire [31:0] _io_ld_data_f_T_9 = {_io_ld_data_f_T_7,io_ld_data[15:0]}; // @[Cat.scala 31:58]
  wire [31:0] _io_ld_data_f_T_11 = {24'h0,io_ld_data[7:0]}; // @[Cat.scala 31:58]
  wire [31:0] _io_ld_data_f_T_13 = {16'h0,io_ld_data[15:0]}; // @[Cat.scala 31:58]
  wire [31:0] _GEN_0 = 3'h5 == io_func3 ? _io_ld_data_f_T_13 : 32'h0; // @[LD_Filter.scala 13:21 12:25 27:29]
  wire [31:0] _GEN_1 = 3'h4 == io_func3 ? _io_ld_data_f_T_11 : _GEN_0; // @[LD_Filter.scala 13:21 24:29]
  wire [31:0] _GEN_2 = 3'h2 == io_func3 ? io_ld_data : _GEN_1; // @[LD_Filter.scala 13:21 21:29]
  wire [31:0] _GEN_3 = 3'h1 == io_func3 ? _io_ld_data_f_T_9 : _GEN_2; // @[LD_Filter.scala 13:21 18:29]
  assign io_ld_data_f = 3'h0 == io_func3 ? _io_ld_data_f_T_4 : _GEN_3; // @[LD_Filter.scala 13:21 15:29]
endmodule
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
  output       io_stall,
  output       io_next_pc_sel,
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
  reg [4:0] IN_E_OP_REG; // @[Controller.scala 46:38]
  reg [2:0] IN_E_F3_REG; // @[Controller.scala 47:38]
  reg [4:0] IN_E_RD_REG; // @[Controller.scala 48:38]
  reg [4:0] IN_E_RS1_REG; // @[Controller.scala 49:38]
  reg [4:0] IN_E_RS2_REG; // @[Controller.scala 50:38]
  reg  IN_E_F7_REG; // @[Controller.scala 51:38]
  reg [4:0] IN_M_OP_REG; // @[Controller.scala 53:38]
  reg [2:0] IN_M_F3_REG; // @[Controller.scala 54:38]
  reg [4:0] IN_M_RD_REG; // @[Controller.scala 55:38]
  reg [4:0] IN_W_OP_REG; // @[Controller.scala 57:38]
  reg [2:0] IN_W_F3_REG; // @[Controller.scala 58:38]
  reg [4:0] IN_W_RD_REG; // @[Controller.scala 59:38]
  wire  _T_2 = io_op == 5'h5; // @[Controller.scala 122:15]
  wire  _T_3 = io_op == 5'hd | _T_2; // @[Controller.scala 121:49]
  wire  _T_4 = io_op == 5'h1b; // @[Controller.scala 123:15]
  wire  _T_5 = _T_3 | _T_4; // @[Controller.scala 122:51]
  wire  is_D_use_rs1 = _T_5 ? 1'h0 : 1'h1; // @[Controller.scala 124:6 125:22 127:22]
  wire  _T_7 = io_op == 5'h8; // @[Controller.scala 133:15]
  wire  _T_8 = io_op == 5'hc | _T_7; // @[Controller.scala 132:47]
  wire  _T_9 = io_op == 5'h18; // @[Controller.scala 134:15]
  wire  is_D_use_rs2 = _T_8 | _T_9; // @[Controller.scala 133:47]
  wire  _T_12 = IN_E_OP_REG == 5'h5; // @[Controller.scala 144:21]
  wire  _T_13 = IN_E_OP_REG == 5'hd | _T_12; // @[Controller.scala 143:55]
  wire  _T_14 = IN_E_OP_REG == 5'h1b; // @[Controller.scala 145:21]
  wire  _T_15 = _T_13 | _T_14; // @[Controller.scala 144:57]
  wire  is_E_use_rs1 = _T_15 ? 1'h0 : 1'h1; // @[Controller.scala 146:6 147:22 149:22]
  wire  _T_17 = IN_E_OP_REG == 5'h8; // @[Controller.scala 155:21]
  wire  _T_18 = IN_E_OP_REG == 5'hc | _T_17; // @[Controller.scala 154:53]
  wire  _T_19 = IN_E_OP_REG == 5'h18; // @[Controller.scala 156:21]
  wire  is_E_use_rs2 = _T_18 | _T_19; // @[Controller.scala 155:53]
  wire  _T_22 = IN_M_OP_REG == 5'h8; // @[Controller.scala 166:21]
  wire  _T_23 = IN_M_OP_REG == 5'h18 | _T_22; // @[Controller.scala 165:53]
  wire  is_M_use_rd = _T_23 ? 1'h0 : 1'h1; // @[Controller.scala 167:7 168:21 170:21]
  wire  _T_25 = IN_W_OP_REG == 5'h8; // @[Controller.scala 176:21]
  wire  _T_26 = IN_W_OP_REG == 5'h18 | _T_25; // @[Controller.scala 175:53]
  wire  is_W_use_rd = _T_26 ? 1'h0 : 1'h1; // @[Controller.scala 177:7 178:21 180:21]
  wire  _is_D_rs1_W_rd_overlap_T_3 = IN_W_RD_REG != 5'h0; // @[Controller.scala 184:102]
  wire  is_E_rs1_W_rd_overlap = is_E_use_rs1 & is_W_use_rd & IN_E_RS1_REG == IN_W_RD_REG & _is_D_rs1_W_rd_overlap_T_3; // @[Controller.scala 190:92]
  wire  _is_E_rs1_M_rd_overlap_T_3 = IN_M_RD_REG != 5'h0; // @[Controller.scala 191:108]
  wire  is_E_rs1_M_rd_overlap = is_E_use_rs1 & is_M_use_rd & IN_E_RS1_REG == IN_M_RD_REG & IN_M_RD_REG != 5'h0; // @[Controller.scala 191:92]
  wire [1:0] _io_E_rs1_data_sel_T = is_E_rs1_W_rd_overlap ? 2'h0 : 2'h2; // @[Controller.scala 192:67]
  wire  is_E_rs2_W_rd_overlap = is_E_use_rs2 & is_W_use_rd & IN_E_RS2_REG == IN_W_RD_REG & _is_D_rs1_W_rd_overlap_T_3; // @[Controller.scala 193:92]
  wire  is_E_rs2_M_rd_overlap = is_E_use_rs2 & is_M_use_rd & IN_E_RS2_REG == IN_M_RD_REG & _is_E_rs1_M_rd_overlap_T_3; // @[Controller.scala 194:92]
  wire [1:0] _io_E_rs2_data_sel_T = is_E_rs2_W_rd_overlap ? 2'h0 : 2'h2; // @[Controller.scala 195:67]
  wire  _is_D_rs1_E_rd_overlap_T_2 = IN_E_RD_REG != 5'h0; // @[Controller.scala 198:87]
  wire  is_D_rs1_E_rd_overlap = is_D_use_rs1 & io_rs1 == IN_E_RD_REG & IN_E_RD_REG != 5'h0; // @[Controller.scala 198:71]
  wire  is_D_rs2_E_rd_overlap = is_D_use_rs2 & io_rs2 == IN_E_RD_REG & _is_D_rs1_E_rd_overlap_T_2; // @[Controller.scala 199:71]
  wire  is_DE_overlap = is_D_rs1_E_rd_overlap | is_D_rs2_E_rd_overlap; // @[Controller.scala 200:45]
  wire  _GEN_23 = 5'h0 == IN_E_OP_REG | 5'h8 == IN_E_OP_REG; // @[Controller.scala 217:24 251:33]
  wire  _GEN_25 = 5'h4 == IN_E_OP_REG | _GEN_23; // @[Controller.scala 217:24 245:33]
  wire  _GEN_27 = 5'hc == IN_E_OP_REG | _GEN_25; // @[Controller.scala 217:24 239:33]
  wire  _GEN_29 = 5'h18 == IN_E_OP_REG & io_alu_out; // @[Controller.scala 217:24 231:33]
  wire  _GEN_31 = 5'h18 == IN_E_OP_REG | _GEN_27; // @[Controller.scala 217:24 233:33]
  wire  _GEN_32 = 5'h18 == IN_E_OP_REG | 5'hc == IN_E_OP_REG; // @[Controller.scala 217:24 234:33]
  wire  _GEN_33 = 5'h19 == IN_E_OP_REG | _GEN_29; // @[Controller.scala 217:24 225:33]
  wire  _GEN_35 = 5'h19 == IN_E_OP_REG ? 1'h0 : _GEN_31; // @[Controller.scala 217:24 227:33]
  wire  _GEN_36 = 5'h19 == IN_E_OP_REG ? 1'h0 : _GEN_32; // @[Controller.scala 217:24 228:33]
  wire [3:0] _GEN_41 = 3'h2 == IN_M_F3_REG ? 4'hf : 4'h0; // @[Controller.scala 276:22 277:28 285:30]
  wire [3:0] _GEN_42 = 3'h1 == IN_M_F3_REG ? 4'h3 : _GEN_41; // @[Controller.scala 277:28 282:30]
  wire [3:0] _GEN_43 = 3'h0 == IN_M_F3_REG ? 4'h1 : _GEN_42; // @[Controller.scala 277:28 279:30]
  wire  _GEN_45 = IN_W_OP_REG == 5'h0 ? 1'h0 : 1'h1; // @[Controller.scala 304:59 305:30 307:30]
  assign io_stall = IN_E_OP_REG == 5'h0 & is_DE_overlap; // @[Controller.scala 201:64]
  assign io_next_pc_sel = 5'h1b == IN_E_OP_REG | _GEN_33; // @[Controller.scala 217:24 219:33]
  assign io_D_rs1_data_sel = is_D_use_rs1 & is_W_use_rd & io_rs1 == IN_W_RD_REG & IN_W_RD_REG != 5'h0; // @[Controller.scala 184:86]
  assign io_D_rs2_data_sel = is_D_use_rs2 & is_W_use_rd & io_rs2 == IN_W_RD_REG & _is_D_rs1_W_rd_overlap_T_3; // @[Controller.scala 185:86]
  assign io_E_rs1_data_sel = is_E_rs1_M_rd_overlap ? 2'h1 : _io_E_rs1_data_sel_T; // @[Controller.scala 192:30]
  assign io_E_rs2_data_sel = is_E_rs2_M_rd_overlap ? 2'h1 : _io_E_rs2_data_sel_T; // @[Controller.scala 195:30]
  assign io_E_jb_op1_sel = 5'h1b == IN_E_OP_REG ? 1'h0 : 5'h19 == IN_E_OP_REG; // @[Controller.scala 217:24 220:33]
  assign io_E_alu_op1_sel = 5'h1b == IN_E_OP_REG ? 1'h0 : _GEN_35; // @[Controller.scala 217:24 221:33]
  assign io_E_alu_op2_sel = 5'h1b == IN_E_OP_REG ? 1'h0 : _GEN_36; // @[Controller.scala 217:24 222:33]
  assign io_E_op = IN_E_OP_REG; // @[Controller.scala 207:13]
  assign io_E_f3 = IN_E_F3_REG; // @[Controller.scala 208:13]
  assign io_E_f7 = IN_E_F7_REG; // @[Controller.scala 209:13]
  assign io_M_dm_w_en = _T_22 ? _GEN_43 : 4'h0; // @[Controller.scala 275:54 289:22]
  assign io_W_wb_en = _T_26 ? 1'h0 : 1'h1; // @[Controller.scala 299:6 300:20 303:20]
  assign io_W_rd_index = IN_W_RD_REG; // @[Controller.scala 293:21]
  assign io_W_f3 = IN_W_F3_REG; // @[Controller.scala 294:21]
  assign io_W_wb_data_sel = _T_26 ? 1'h0 : _GEN_45; // @[Controller.scala 299:6 301:26]
  always @(posedge clock) begin
    if (reset) begin // @[Controller.scala 46:38]
      IN_E_OP_REG <= 5'h0; // @[Controller.scala 46:38]
    end else if (io_stall | io_next_pc_sel) begin // @[Controller.scala 61:37]
      IN_E_OP_REG <= 5'hc; // @[Controller.scala 63:25]
    end else begin
      IN_E_OP_REG <= io_op; // @[Controller.scala 81:25]
    end
    if (reset) begin // @[Controller.scala 47:38]
      IN_E_F3_REG <= 3'h0; // @[Controller.scala 47:38]
    end else if (io_stall | io_next_pc_sel) begin // @[Controller.scala 61:37]
      IN_E_F3_REG <= 3'h0; // @[Controller.scala 64:25]
    end else begin
      IN_E_F3_REG <= io_f3; // @[Controller.scala 82:25]
    end
    if (reset) begin // @[Controller.scala 48:38]
      IN_E_RD_REG <= 5'h0; // @[Controller.scala 48:38]
    end else if (io_stall | io_next_pc_sel) begin // @[Controller.scala 61:37]
      IN_E_RD_REG <= 5'h0; // @[Controller.scala 65:25]
    end else begin
      IN_E_RD_REG <= io_rd; // @[Controller.scala 83:25]
    end
    if (reset) begin // @[Controller.scala 49:38]
      IN_E_RS1_REG <= 5'h0; // @[Controller.scala 49:38]
    end else if (io_stall | io_next_pc_sel) begin // @[Controller.scala 61:37]
      IN_E_RS1_REG <= 5'h0; // @[Controller.scala 66:25]
    end else begin
      IN_E_RS1_REG <= io_rs1; // @[Controller.scala 84:25]
    end
    if (reset) begin // @[Controller.scala 50:38]
      IN_E_RS2_REG <= 5'h0; // @[Controller.scala 50:38]
    end else if (io_stall | io_next_pc_sel) begin // @[Controller.scala 61:37]
      IN_E_RS2_REG <= 5'h0; // @[Controller.scala 67:25]
    end else begin
      IN_E_RS2_REG <= io_rs2; // @[Controller.scala 85:25]
    end
    if (reset) begin // @[Controller.scala 51:38]
      IN_E_F7_REG <= 1'h0; // @[Controller.scala 51:38]
    end else if (io_stall | io_next_pc_sel) begin // @[Controller.scala 61:37]
      IN_E_F7_REG <= 1'h0; // @[Controller.scala 68:25]
    end else begin
      IN_E_F7_REG <= io_f7; // @[Controller.scala 86:25]
    end
    if (reset) begin // @[Controller.scala 53:38]
      IN_M_OP_REG <= 5'h0; // @[Controller.scala 53:38]
    end else begin
      IN_M_OP_REG <= IN_E_OP_REG;
    end
    if (reset) begin // @[Controller.scala 54:38]
      IN_M_F3_REG <= 3'h0; // @[Controller.scala 54:38]
    end else begin
      IN_M_F3_REG <= IN_E_F3_REG;
    end
    if (reset) begin // @[Controller.scala 55:38]
      IN_M_RD_REG <= 5'h0; // @[Controller.scala 55:38]
    end else begin
      IN_M_RD_REG <= IN_E_RD_REG;
    end
    if (reset) begin // @[Controller.scala 57:38]
      IN_W_OP_REG <= 5'h0; // @[Controller.scala 57:38]
    end else begin
      IN_W_OP_REG <= IN_M_OP_REG;
    end
    if (reset) begin // @[Controller.scala 58:38]
      IN_W_F3_REG <= 3'h0; // @[Controller.scala 58:38]
    end else begin
      IN_W_F3_REG <= IN_M_F3_REG;
    end
    if (reset) begin // @[Controller.scala 59:38]
      IN_W_RD_REG <= 5'h0; // @[Controller.scala 59:38]
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
module Top(
  input         clock,
  input         reset,
  output [31:0] io_pc_out
);
  wire  reg_pc_clock; // @[Top.scala 9:33]
  wire  reg_pc_reset; // @[Top.scala 9:33]
  wire  reg_pc_io_stall; // @[Top.scala 9:33]
  wire [31:0] reg_pc_io_next_pc; // @[Top.scala 9:33]
  wire [31:0] reg_pc_io_current_pc; // @[Top.scala 9:33]
  wire  im_clock; // @[Top.scala 10:33]
  wire [3:0] im_io_w_en; // @[Top.scala 10:33]
  wire [15:0] im_io_address; // @[Top.scala 10:33]
  wire [31:0] im_io_write_data; // @[Top.scala 10:33]
  wire [31:0] im_io_read_data; // @[Top.scala 10:33]
  wire  reg_d_clock; // @[Top.scala 11:33]
  wire  reg_d_reset; // @[Top.scala 11:33]
  wire  reg_d_io_stall; // @[Top.scala 11:33]
  wire  reg_d_io_jb; // @[Top.scala 11:33]
  wire [31:0] reg_d_io_pc; // @[Top.scala 11:33]
  wire [31:0] reg_d_io_inst; // @[Top.scala 11:33]
  wire [31:0] reg_d_io_out_Reg_D_pc; // @[Top.scala 11:33]
  wire [31:0] reg_d_io_out_Reg_D_inst; // @[Top.scala 11:33]
  wire [31:0] decoder_io_inst; // @[Top.scala 12:33]
  wire [4:0] decoder_io_dc_out_opcode; // @[Top.scala 12:33]
  wire [2:0] decoder_io_dc_out_func3; // @[Top.scala 12:33]
  wire  decoder_io_dc_out_func7; // @[Top.scala 12:33]
  wire [4:0] decoder_io_dc_out_rs1_index; // @[Top.scala 12:33]
  wire [4:0] decoder_io_dc_out_rs2_index; // @[Top.scala 12:33]
  wire [4:0] decoder_io_dc_out_rd_index; // @[Top.scala 12:33]
  wire [31:0] imm_ext_io_inst; // @[Top.scala 13:33]
  wire [31:0] imm_ext_io_imm_ext_out; // @[Top.scala 13:33]
  wire  regfile_clock; // @[Top.scala 14:33]
  wire  regfile_reset; // @[Top.scala 14:33]
  wire  regfile_io_wb_en; // @[Top.scala 14:33]
  wire [31:0] regfile_io_wb_data; // @[Top.scala 14:33]
  wire [4:0] regfile_io_rd_index; // @[Top.scala 14:33]
  wire [4:0] regfile_io_rs1_index; // @[Top.scala 14:33]
  wire [4:0] regfile_io_rs2_index; // @[Top.scala 14:33]
  wire [31:0] regfile_io_rs1_data_out; // @[Top.scala 14:33]
  wire [31:0] regfile_io_rs2_data_out; // @[Top.scala 14:33]
  wire  reg_e_clock; // @[Top.scala 15:33]
  wire  reg_e_reset; // @[Top.scala 15:33]
  wire  reg_e_io_stall; // @[Top.scala 15:33]
  wire  reg_e_io_jb; // @[Top.scala 15:33]
  wire [31:0] reg_e_io_pc; // @[Top.scala 15:33]
  wire [31:0] reg_e_io_rs1_data; // @[Top.scala 15:33]
  wire [31:0] reg_e_io_rs2_data; // @[Top.scala 15:33]
  wire [31:0] reg_e_io_sext_imme; // @[Top.scala 15:33]
  wire [31:0] reg_e_io_out_Reg_E_pc; // @[Top.scala 15:33]
  wire [31:0] reg_e_io_out_Reg_E_rs1_data; // @[Top.scala 15:33]
  wire [31:0] reg_e_io_out_Reg_E_rs2_data; // @[Top.scala 15:33]
  wire [31:0] reg_e_io_out_Reg_E_sext_imme; // @[Top.scala 15:33]
  wire [4:0] alu_io_opcode; // @[Top.scala 16:33]
  wire [2:0] alu_io_func3; // @[Top.scala 16:33]
  wire  alu_io_func7; // @[Top.scala 16:33]
  wire [31:0] alu_io_operand1; // @[Top.scala 16:33]
  wire [31:0] alu_io_operand2; // @[Top.scala 16:33]
  wire [31:0] alu_io_alu_out; // @[Top.scala 16:33]
  wire [31:0] jb_unit_io_operand1; // @[Top.scala 17:33]
  wire [31:0] jb_unit_io_operand2; // @[Top.scala 17:33]
  wire [31:0] jb_unit_io_jb_out; // @[Top.scala 17:33]
  wire  reg_m_clock; // @[Top.scala 18:33]
  wire  reg_m_reset; // @[Top.scala 18:33]
  wire [31:0] reg_m_io_alu_out; // @[Top.scala 18:33]
  wire [31:0] reg_m_io_rs2_data; // @[Top.scala 18:33]
  wire [31:0] reg_m_io_out_Reg_M_alu_out; // @[Top.scala 18:33]
  wire [31:0] reg_m_io_out_Reg_M_rs2_data; // @[Top.scala 18:33]
  wire  dm_clock; // @[Top.scala 19:33]
  wire [3:0] dm_io_w_en; // @[Top.scala 19:33]
  wire [15:0] dm_io_address; // @[Top.scala 19:33]
  wire [31:0] dm_io_write_data; // @[Top.scala 19:33]
  wire [31:0] dm_io_read_data; // @[Top.scala 19:33]
  wire  reg_w_clock; // @[Top.scala 20:33]
  wire  reg_w_reset; // @[Top.scala 20:33]
  wire [31:0] reg_w_io_alu_out; // @[Top.scala 20:33]
  wire [31:0] reg_w_io_rs2_data; // @[Top.scala 20:33]
  wire [31:0] reg_w_io_out_Reg_M_alu_out; // @[Top.scala 20:33]
  wire [31:0] reg_w_io_out_Reg_M_rs2_data; // @[Top.scala 20:33]
  wire [2:0] Ld_filter_io_func3; // @[Top.scala 21:33]
  wire [31:0] Ld_filter_io_ld_data; // @[Top.scala 21:33]
  wire [31:0] Ld_filter_io_ld_data_f; // @[Top.scala 21:33]
  wire  controller_clock; // @[Top.scala 22:33]
  wire  controller_reset; // @[Top.scala 22:33]
  wire [4:0] controller_io_op; // @[Top.scala 22:33]
  wire [2:0] controller_io_f3; // @[Top.scala 22:33]
  wire [4:0] controller_io_rd; // @[Top.scala 22:33]
  wire [4:0] controller_io_rs1; // @[Top.scala 22:33]
  wire [4:0] controller_io_rs2; // @[Top.scala 22:33]
  wire  controller_io_f7; // @[Top.scala 22:33]
  wire  controller_io_alu_out; // @[Top.scala 22:33]
  wire  controller_io_stall; // @[Top.scala 22:33]
  wire  controller_io_next_pc_sel; // @[Top.scala 22:33]
  wire  controller_io_D_rs1_data_sel; // @[Top.scala 22:33]
  wire  controller_io_D_rs2_data_sel; // @[Top.scala 22:33]
  wire [1:0] controller_io_E_rs1_data_sel; // @[Top.scala 22:33]
  wire [1:0] controller_io_E_rs2_data_sel; // @[Top.scala 22:33]
  wire  controller_io_E_jb_op1_sel; // @[Top.scala 22:33]
  wire  controller_io_E_alu_op1_sel; // @[Top.scala 22:33]
  wire  controller_io_E_alu_op2_sel; // @[Top.scala 22:33]
  wire [4:0] controller_io_E_op; // @[Top.scala 22:33]
  wire [2:0] controller_io_E_f3; // @[Top.scala 22:33]
  wire  controller_io_E_f7; // @[Top.scala 22:33]
  wire [3:0] controller_io_M_dm_w_en; // @[Top.scala 22:33]
  wire  controller_io_W_wb_en; // @[Top.scala 22:33]
  wire [4:0] controller_io_W_rd_index; // @[Top.scala 22:33]
  wire [2:0] controller_io_W_f3; // @[Top.scala 22:33]
  wire  controller_io_W_wb_data_sel; // @[Top.scala 22:33]
  wire [31:0] out_pc_reg = reg_pc_io_current_pc; // @[Top.scala 27:39 96:33]
  wire [31:0] _to_pc_reg_T_1 = out_pc_reg + 32'h4; // @[Top.scala 93:71]
  wire  next_pc_sel = controller_io_next_pc_sel; // @[Top.scala 210:33 70:39]
  wire [31:0] jb_pc = jb_unit_io_jb_out; // @[Top.scala 176:33 64:39]
  wire  W_wb_sel = controller_io_W_wb_data_sel; // @[Top.scala 226:33 90:39]
  wire [31:0] out_Reg_W_alu_out = reg_w_io_out_Reg_M_alu_out; // @[Top.scala 193:33 61:39]
  wire [31:0] ld_data_f = Ld_filter_io_ld_data_f; // @[Top.scala 199:33 62:39]
  wire [31:0] wb_data = W_wb_sel ? out_Reg_W_alu_out : ld_data_f; // @[Top.scala 126:39]
  wire  D_rs1_data_sel = controller_io_D_rs1_data_sel; // @[Top.scala 212:33 73:39]
  wire [31:0] out_reg_file_rs1_data = regfile_io_rs1_data_out; // @[Top.scala 132:33 44:39]
  wire  D_rs2_data_sel = controller_io_D_rs2_data_sel; // @[Top.scala 213:33 74:39]
  wire [31:0] out_reg_file_rs2_data = regfile_io_rs2_data_out; // @[Top.scala 133:33 45:39]
  wire [1:0] E_rs1_data_sel = controller_io_E_rs1_data_sel; // @[Top.scala 214:33 76:39]
  wire [31:0] alu_out_forward = reg_m_io_out_Reg_M_alu_out; // @[Top.scala 181:33 55:39]
  wire [31:0] _rs1_data_final_T_3 = 2'h1 == E_rs1_data_sel ? alu_out_forward : wb_data; // @[Mux.scala 81:58]
  wire [31:0] rs1_data = reg_e_io_out_Reg_E_rs1_data; // @[Top.scala 145:33 48:39]
  wire [31:0] rs1_data_final = 2'h2 == E_rs1_data_sel ? rs1_data : _rs1_data_final_T_3; // @[Mux.scala 81:58]
  wire [1:0] E_rs2_data_sel = controller_io_E_rs2_data_sel; // @[Top.scala 215:33 77:39]
  wire [31:0] _rs2_data_final_T_3 = 2'h1 == E_rs2_data_sel ? alu_out_forward : wb_data; // @[Mux.scala 81:58]
  wire [31:0] rs2_data = reg_e_io_out_Reg_E_rs2_data; // @[Top.scala 146:33 49:39]
  wire [31:0] rs2_data_final = 2'h2 == E_rs2_data_sel ? rs2_data : _rs2_data_final_T_3; // @[Mux.scala 81:58]
  wire  E_alu_op1_sel = controller_io_E_alu_op1_sel; // @[Top.scala 217:33 79:39]
  wire [31:0] out_Reg_E_pc = reg_e_io_out_Reg_E_pc; // @[Top.scala 144:33 29:39]
  wire  E_alu_op2_sel = controller_io_E_alu_op2_sel; // @[Top.scala 218:33 80:39]
  wire [31:0] out_Reg_E_sext_imme = reg_e_io_out_Reg_E_sext_imme; // @[Top.scala 147:33 42:39]
  wire  E_jb_op1_sel = controller_io_E_jb_op1_sel; // @[Top.scala 216:33 78:39]
  wire [31:0] alu_out = alu_io_alu_out; // @[Top.scala 169:33 54:39]
  Reg_PC reg_pc ( // @[Top.scala 9:33]
    .clock(reg_pc_clock),
    .reset(reg_pc_reset),
    .io_stall(reg_pc_io_stall),
    .io_next_pc(reg_pc_io_next_pc),
    .io_current_pc(reg_pc_io_current_pc)
  );
  SRAM im ( // @[Top.scala 10:33]
    .clock(im_clock),
    .io_w_en(im_io_w_en),
    .io_address(im_io_address),
    .io_write_data(im_io_write_data),
    .io_read_data(im_io_read_data)
  );
  Reg_D reg_d ( // @[Top.scala 11:33]
    .clock(reg_d_clock),
    .reset(reg_d_reset),
    .io_stall(reg_d_io_stall),
    .io_jb(reg_d_io_jb),
    .io_pc(reg_d_io_pc),
    .io_inst(reg_d_io_inst),
    .io_out_Reg_D_pc(reg_d_io_out_Reg_D_pc),
    .io_out_Reg_D_inst(reg_d_io_out_Reg_D_inst)
  );
  Decoder decoder ( // @[Top.scala 12:33]
    .io_inst(decoder_io_inst),
    .io_dc_out_opcode(decoder_io_dc_out_opcode),
    .io_dc_out_func3(decoder_io_dc_out_func3),
    .io_dc_out_func7(decoder_io_dc_out_func7),
    .io_dc_out_rs1_index(decoder_io_dc_out_rs1_index),
    .io_dc_out_rs2_index(decoder_io_dc_out_rs2_index),
    .io_dc_out_rd_index(decoder_io_dc_out_rd_index)
  );
  Imm_Ext imm_ext ( // @[Top.scala 13:33]
    .io_inst(imm_ext_io_inst),
    .io_imm_ext_out(imm_ext_io_imm_ext_out)
  );
  RegFile regfile ( // @[Top.scala 14:33]
    .clock(regfile_clock),
    .reset(regfile_reset),
    .io_wb_en(regfile_io_wb_en),
    .io_wb_data(regfile_io_wb_data),
    .io_rd_index(regfile_io_rd_index),
    .io_rs1_index(regfile_io_rs1_index),
    .io_rs2_index(regfile_io_rs2_index),
    .io_rs1_data_out(regfile_io_rs1_data_out),
    .io_rs2_data_out(regfile_io_rs2_data_out)
  );
  Reg_E reg_e ( // @[Top.scala 15:33]
    .clock(reg_e_clock),
    .reset(reg_e_reset),
    .io_stall(reg_e_io_stall),
    .io_jb(reg_e_io_jb),
    .io_pc(reg_e_io_pc),
    .io_rs1_data(reg_e_io_rs1_data),
    .io_rs2_data(reg_e_io_rs2_data),
    .io_sext_imme(reg_e_io_sext_imme),
    .io_out_Reg_E_pc(reg_e_io_out_Reg_E_pc),
    .io_out_Reg_E_rs1_data(reg_e_io_out_Reg_E_rs1_data),
    .io_out_Reg_E_rs2_data(reg_e_io_out_Reg_E_rs2_data),
    .io_out_Reg_E_sext_imme(reg_e_io_out_Reg_E_sext_imme)
  );
  ALU alu ( // @[Top.scala 16:33]
    .io_opcode(alu_io_opcode),
    .io_func3(alu_io_func3),
    .io_func7(alu_io_func7),
    .io_operand1(alu_io_operand1),
    .io_operand2(alu_io_operand2),
    .io_alu_out(alu_io_alu_out)
  );
  JB_Unit jb_unit ( // @[Top.scala 17:33]
    .io_operand1(jb_unit_io_operand1),
    .io_operand2(jb_unit_io_operand2),
    .io_jb_out(jb_unit_io_jb_out)
  );
  Reg_M reg_m ( // @[Top.scala 18:33]
    .clock(reg_m_clock),
    .reset(reg_m_reset),
    .io_alu_out(reg_m_io_alu_out),
    .io_rs2_data(reg_m_io_rs2_data),
    .io_out_Reg_M_alu_out(reg_m_io_out_Reg_M_alu_out),
    .io_out_Reg_M_rs2_data(reg_m_io_out_Reg_M_rs2_data)
  );
  SRAM dm ( // @[Top.scala 19:33]
    .clock(dm_clock),
    .io_w_en(dm_io_w_en),
    .io_address(dm_io_address),
    .io_write_data(dm_io_write_data),
    .io_read_data(dm_io_read_data)
  );
  Reg_M reg_w ( // @[Top.scala 20:33]
    .clock(reg_w_clock),
    .reset(reg_w_reset),
    .io_alu_out(reg_w_io_alu_out),
    .io_rs2_data(reg_w_io_rs2_data),
    .io_out_Reg_M_alu_out(reg_w_io_out_Reg_M_alu_out),
    .io_out_Reg_M_rs2_data(reg_w_io_out_Reg_M_rs2_data)
  );
  LD_Filter Ld_filter ( // @[Top.scala 21:33]
    .io_func3(Ld_filter_io_func3),
    .io_ld_data(Ld_filter_io_ld_data),
    .io_ld_data_f(Ld_filter_io_ld_data_f)
  );
  Controller controller ( // @[Top.scala 22:33]
    .clock(controller_clock),
    .reset(controller_reset),
    .io_op(controller_io_op),
    .io_f3(controller_io_f3),
    .io_rd(controller_io_rd),
    .io_rs1(controller_io_rs1),
    .io_rs2(controller_io_rs2),
    .io_f7(controller_io_f7),
    .io_alu_out(controller_io_alu_out),
    .io_stall(controller_io_stall),
    .io_next_pc_sel(controller_io_next_pc_sel),
    .io_D_rs1_data_sel(controller_io_D_rs1_data_sel),
    .io_D_rs2_data_sel(controller_io_D_rs2_data_sel),
    .io_E_rs1_data_sel(controller_io_E_rs1_data_sel),
    .io_E_rs2_data_sel(controller_io_E_rs2_data_sel),
    .io_E_jb_op1_sel(controller_io_E_jb_op1_sel),
    .io_E_alu_op1_sel(controller_io_E_alu_op1_sel),
    .io_E_alu_op2_sel(controller_io_E_alu_op2_sel),
    .io_E_op(controller_io_E_op),
    .io_E_f3(controller_io_E_f3),
    .io_E_f7(controller_io_E_f7),
    .io_M_dm_w_en(controller_io_M_dm_w_en),
    .io_W_wb_en(controller_io_W_wb_en),
    .io_W_rd_index(controller_io_W_rd_index),
    .io_W_f3(controller_io_W_f3),
    .io_W_wb_data_sel(controller_io_W_wb_data_sel)
  );
  assign io_pc_out = reg_pc_io_current_pc; // @[Top.scala 229:33]
  assign reg_pc_clock = clock;
  assign reg_pc_reset = reset;
  assign reg_pc_io_stall = controller_io_stall; // @[Top.scala 209:33 71:39]
  assign reg_pc_io_next_pc = next_pc_sel ? jb_pc : _to_pc_reg_T_1; // @[Top.scala 93:39]
  assign im_clock = clock;
  assign im_io_w_en = 4'h0; // @[Top.scala 211:33 72:39]
  assign im_io_address = out_pc_reg[15:0]; // @[Top.scala 100:46]
  assign im_io_write_data = 32'h0; // @[Top.scala 101:33]
  assign reg_d_clock = clock;
  assign reg_d_reset = reset;
  assign reg_d_io_stall = controller_io_stall; // @[Top.scala 209:33 71:39]
  assign reg_d_io_jb = controller_io_next_pc_sel; // @[Top.scala 210:33 70:39]
  assign reg_d_io_pc = reg_pc_io_current_pc; // @[Top.scala 27:39 96:33]
  assign reg_d_io_inst = im_io_read_data; // @[Top.scala 102:33 31:39]
  assign decoder_io_inst = reg_d_io_out_Reg_D_inst; // @[Top.scala 110:33 32:39]
  assign imm_ext_io_inst = reg_d_io_out_Reg_D_inst; // @[Top.scala 110:33 32:39]
  assign regfile_clock = clock;
  assign regfile_reset = reset;
  assign regfile_io_wb_en = controller_io_W_wb_en; // @[Top.scala 223:33 87:39]
  assign regfile_io_wb_data = W_wb_sel ? out_Reg_W_alu_out : ld_data_f; // @[Top.scala 126:39]
  assign regfile_io_rd_index = controller_io_W_rd_index; // @[Top.scala 224:33 88:39]
  assign regfile_io_rs1_index = decoder_io_dc_out_rs1_index; // @[Top.scala 117:33 37:39]
  assign regfile_io_rs2_index = decoder_io_dc_out_rs2_index; // @[Top.scala 118:33 38:39]
  assign reg_e_clock = clock;
  assign reg_e_reset = reset;
  assign reg_e_io_stall = controller_io_stall; // @[Top.scala 209:33 71:39]
  assign reg_e_io_jb = controller_io_next_pc_sel; // @[Top.scala 210:33 70:39]
  assign reg_e_io_pc = reg_d_io_out_Reg_D_pc; // @[Top.scala 109:33 28:39]
  assign reg_e_io_rs1_data = D_rs1_data_sel ? wb_data : out_reg_file_rs1_data; // @[Top.scala 136:39]
  assign reg_e_io_rs2_data = D_rs2_data_sel ? wb_data : out_reg_file_rs2_data; // @[Top.scala 137:39]
  assign reg_e_io_sext_imme = imm_ext_io_imm_ext_out; // @[Top.scala 123:33 41:39]
  assign alu_io_opcode = controller_io_E_op; // @[Top.scala 219:33 81:39]
  assign alu_io_func3 = controller_io_E_f3; // @[Top.scala 220:33 82:39]
  assign alu_io_func7 = controller_io_E_f7; // @[Top.scala 221:33 83:39]
  assign alu_io_operand1 = E_alu_op1_sel ? rs1_data_final : out_Reg_E_pc; // @[Top.scala 160:39]
  assign alu_io_operand2 = E_alu_op2_sel ? rs2_data_final : out_Reg_E_sext_imme; // @[Top.scala 161:39]
  assign jb_unit_io_operand1 = E_jb_op1_sel ? rs1_data_final : out_Reg_E_pc; // @[Top.scala 171:39]
  assign jb_unit_io_operand2 = reg_e_io_out_Reg_E_sext_imme; // @[Top.scala 147:33 42:39]
  assign reg_m_clock = clock;
  assign reg_m_reset = reset;
  assign reg_m_io_alu_out = alu_io_alu_out; // @[Top.scala 169:33 54:39]
  assign reg_m_io_rs2_data = 2'h2 == E_rs2_data_sel ? rs2_data : _rs2_data_final_T_3; // @[Mux.scala 81:58]
  assign dm_clock = clock;
  assign dm_io_w_en = controller_io_M_dm_w_en; // @[Top.scala 222:33 85:39]
  assign dm_io_address = alu_out_forward[15:0]; // @[Top.scala 186:51]
  assign dm_io_write_data = reg_m_io_out_Reg_M_rs2_data; // @[Top.scala 182:33 57:39]
  assign reg_w_clock = clock;
  assign reg_w_reset = reset;
  assign reg_w_io_alu_out = reg_m_io_out_Reg_M_alu_out; // @[Top.scala 181:33 55:39]
  assign reg_w_io_rs2_data = dm_io_read_data; // @[Top.scala 188:33 59:39]
  assign Ld_filter_io_func3 = controller_io_W_f3; // @[Top.scala 225:33 89:39]
  assign Ld_filter_io_ld_data = reg_w_io_out_Reg_M_rs2_data; // @[Top.scala 194:33 60:39]
  assign controller_clock = clock;
  assign controller_reset = reset;
  assign controller_io_op = decoder_io_dc_out_opcode; // @[Top.scala 114:33 34:39]
  assign controller_io_f3 = decoder_io_dc_out_func3; // @[Top.scala 115:33 35:39]
  assign controller_io_rd = decoder_io_dc_out_rd_index; // @[Top.scala 119:33 39:39]
  assign controller_io_rs1 = decoder_io_dc_out_rs1_index; // @[Top.scala 117:33 37:39]
  assign controller_io_rs2 = decoder_io_dc_out_rs2_index; // @[Top.scala 118:33 38:39]
  assign controller_io_f7 = decoder_io_dc_out_func7; // @[Top.scala 116:33 36:39]
  assign controller_io_alu_out = alu_out[0]; // @[Top.scala 208:43]
endmodule
