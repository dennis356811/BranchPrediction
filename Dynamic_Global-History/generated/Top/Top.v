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
  reg [31:0] PC_REG; // @[Reg_PC.scala 12:35]
  assign io_current_pc = PC_REG; // @[Reg_PC.scala 20:24]
  always @(posedge clock) begin
    if (reset) begin // @[Reg_PC.scala 12:35]
      PC_REG <= 32'h0; // @[Reg_PC.scala 12:35]
    end else if (!(io_stall)) begin // @[Reg_PC.scala 14:17]
      PC_REG <= io_next_pc; // @[Reg_PC.scala 17:12]
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
  input  [15:0] io_address,
  output [31:0] io_read_data
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [7:0] mem [0:65535]; // @[SRAM.scala 13:16]
  wire  mem_read_data_bytes_0_MPORT_en; // @[SRAM.scala 13:16]
  wire [15:0] mem_read_data_bytes_0_MPORT_addr; // @[SRAM.scala 13:16]
  wire [7:0] mem_read_data_bytes_0_MPORT_data; // @[SRAM.scala 13:16]
  wire  mem_read_data_bytes_1_MPORT_en; // @[SRAM.scala 13:16]
  wire [15:0] mem_read_data_bytes_1_MPORT_addr; // @[SRAM.scala 13:16]
  wire [7:0] mem_read_data_bytes_1_MPORT_data; // @[SRAM.scala 13:16]
  wire  mem_read_data_bytes_2_MPORT_en; // @[SRAM.scala 13:16]
  wire [15:0] mem_read_data_bytes_2_MPORT_addr; // @[SRAM.scala 13:16]
  wire [7:0] mem_read_data_bytes_2_MPORT_data; // @[SRAM.scala 13:16]
  wire  mem_read_data_bytes_3_MPORT_en; // @[SRAM.scala 13:16]
  wire [15:0] mem_read_data_bytes_3_MPORT_addr; // @[SRAM.scala 13:16]
  wire [7:0] mem_read_data_bytes_3_MPORT_data; // @[SRAM.scala 13:16]
  wire [7:0] mem_MPORT_data; // @[SRAM.scala 13:16]
  wire [15:0] mem_MPORT_addr; // @[SRAM.scala 13:16]
  wire  mem_MPORT_mask; // @[SRAM.scala 13:16]
  wire  mem_MPORT_en; // @[SRAM.scala 13:16]
  wire [7:0] mem_MPORT_1_data; // @[SRAM.scala 13:16]
  wire [15:0] mem_MPORT_1_addr; // @[SRAM.scala 13:16]
  wire  mem_MPORT_1_mask; // @[SRAM.scala 13:16]
  wire  mem_MPORT_1_en; // @[SRAM.scala 13:16]
  wire [7:0] mem_MPORT_2_data; // @[SRAM.scala 13:16]
  wire [15:0] mem_MPORT_2_addr; // @[SRAM.scala 13:16]
  wire  mem_MPORT_2_mask; // @[SRAM.scala 13:16]
  wire  mem_MPORT_2_en; // @[SRAM.scala 13:16]
  wire [7:0] mem_MPORT_3_data; // @[SRAM.scala 13:16]
  wire [15:0] mem_MPORT_3_addr; // @[SRAM.scala 13:16]
  wire  mem_MPORT_3_mask; // @[SRAM.scala 13:16]
  wire  mem_MPORT_3_en; // @[SRAM.scala 13:16]
  wire [7:0] read_data_bytes_1 = mem_read_data_bytes_1_MPORT_data; // @[SRAM.scala 24:32 26:22]
  wire [7:0] read_data_bytes_0 = mem_read_data_bytes_0_MPORT_data; // @[SRAM.scala 24:32 25:22]
  wire [15:0] io_read_data_lo = {read_data_bytes_1,read_data_bytes_0}; // @[Cat.scala 31:58]
  wire [7:0] read_data_bytes_3 = mem_read_data_bytes_3_MPORT_data; // @[SRAM.scala 24:32 28:22]
  wire [7:0] read_data_bytes_2 = mem_read_data_bytes_2_MPORT_data; // @[SRAM.scala 24:32 27:22]
  wire [15:0] io_read_data_hi = {read_data_bytes_3,read_data_bytes_2}; // @[Cat.scala 31:58]
  assign mem_read_data_bytes_0_MPORT_en = 1'h1;
  assign mem_read_data_bytes_0_MPORT_addr = io_address;
  assign mem_read_data_bytes_0_MPORT_data = mem[mem_read_data_bytes_0_MPORT_addr]; // @[SRAM.scala 13:16]
  assign mem_read_data_bytes_1_MPORT_en = 1'h1;
  assign mem_read_data_bytes_1_MPORT_addr = io_address + 16'h1;
  assign mem_read_data_bytes_1_MPORT_data = mem[mem_read_data_bytes_1_MPORT_addr]; // @[SRAM.scala 13:16]
  assign mem_read_data_bytes_2_MPORT_en = 1'h1;
  assign mem_read_data_bytes_2_MPORT_addr = io_address + 16'h2;
  assign mem_read_data_bytes_2_MPORT_data = mem[mem_read_data_bytes_2_MPORT_addr]; // @[SRAM.scala 13:16]
  assign mem_read_data_bytes_3_MPORT_en = 1'h1;
  assign mem_read_data_bytes_3_MPORT_addr = io_address + 16'h3;
  assign mem_read_data_bytes_3_MPORT_data = mem[mem_read_data_bytes_3_MPORT_addr]; // @[SRAM.scala 13:16]
  assign mem_MPORT_data = 8'h0;
  assign mem_MPORT_addr = io_address;
  assign mem_MPORT_mask = 1'h1;
  assign mem_MPORT_en = 1'h0;
  assign mem_MPORT_1_data = 8'h0;
  assign mem_MPORT_1_addr = io_address + 16'h1;
  assign mem_MPORT_1_mask = 1'h1;
  assign mem_MPORT_1_en = 1'h0;
  assign mem_MPORT_2_data = 8'h0;
  assign mem_MPORT_2_addr = io_address + 16'h2;
  assign mem_MPORT_2_mask = 1'h1;
  assign mem_MPORT_2_en = 1'h0;
  assign mem_MPORT_3_data = 8'h0;
  assign mem_MPORT_3_addr = io_address + 16'h3;
  assign mem_MPORT_3_mask = 1'h1;
  assign mem_MPORT_3_en = 1'h0;
  assign io_read_data = {io_read_data_hi,io_read_data_lo}; // @[Cat.scala 31:58]
  always @(posedge clock) begin
    if (mem_MPORT_en & mem_MPORT_mask) begin
      mem[mem_MPORT_addr] <= mem_MPORT_data; // @[SRAM.scala 13:16]
    end
    if (mem_MPORT_1_en & mem_MPORT_1_mask) begin
      mem[mem_MPORT_1_addr] <= mem_MPORT_1_data; // @[SRAM.scala 13:16]
    end
    if (mem_MPORT_2_en & mem_MPORT_2_mask) begin
      mem[mem_MPORT_2_addr] <= mem_MPORT_2_data; // @[SRAM.scala 13:16]
    end
    if (mem_MPORT_3_en & mem_MPORT_3_mask) begin
      mem[mem_MPORT_3_addr] <= mem_MPORT_3_data; // @[SRAM.scala 13:16]
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
  reg [31:0] PC_REG; // @[Reg_D.scala 15:35]
  reg [31:0] INST_REG; // @[Reg_D.scala 16:35]
  assign io_out_Reg_D_pc = PC_REG; // @[Reg_D.scala 28:25]
  assign io_out_Reg_D_inst = INST_REG; // @[Reg_D.scala 29:25]
  always @(posedge clock) begin
    if (reset) begin // @[Reg_D.scala 15:35]
      PC_REG <= 32'h0; // @[Reg_D.scala 15:35]
    end else if (io_jb) begin // @[Reg_D.scala 18:14]
      PC_REG <= 32'h0; // @[Reg_D.scala 19:17]
    end else if (!(io_stall)) begin // @[Reg_D.scala 21:23]
      PC_REG <= io_pc; // @[Reg_D.scala 25:17]
    end
    if (reset) begin // @[Reg_D.scala 16:35]
      INST_REG <= 32'h0; // @[Reg_D.scala 16:35]
    end else if (io_jb) begin // @[Reg_D.scala 18:14]
      INST_REG <= 32'h0; // @[Reg_D.scala 20:17]
    end else if (!(io_stall)) begin // @[Reg_D.scala 21:23]
      INST_REG <= io_inst; // @[Reg_D.scala 26:17]
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
  assign io_dc_out_opcode = io_inst[6:2]; // @[Decoder.scala 15:30]
  assign io_dc_out_func3 = io_inst[14:12]; // @[Decoder.scala 16:29]
  assign io_dc_out_func7 = io_inst[30]; // @[Decoder.scala 17:29]
  assign io_dc_out_rs1_index = io_inst[19:15]; // @[Decoder.scala 18:33]
  assign io_dc_out_rs2_index = io_inst[24:20]; // @[Decoder.scala 19:33]
  assign io_dc_out_rd_index = io_inst[11:7]; // @[Decoder.scala 20:32]
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
  reg [31:0] registers_0; // @[RegFile.scala 16:26]
  reg [31:0] registers_1; // @[RegFile.scala 16:26]
  reg [31:0] registers_2; // @[RegFile.scala 16:26]
  reg [31:0] registers_3; // @[RegFile.scala 16:26]
  reg [31:0] registers_4; // @[RegFile.scala 16:26]
  reg [31:0] registers_5; // @[RegFile.scala 16:26]
  reg [31:0] registers_6; // @[RegFile.scala 16:26]
  reg [31:0] registers_7; // @[RegFile.scala 16:26]
  reg [31:0] registers_8; // @[RegFile.scala 16:26]
  reg [31:0] registers_9; // @[RegFile.scala 16:26]
  reg [31:0] registers_10; // @[RegFile.scala 16:26]
  reg [31:0] registers_11; // @[RegFile.scala 16:26]
  reg [31:0] registers_12; // @[RegFile.scala 16:26]
  reg [31:0] registers_13; // @[RegFile.scala 16:26]
  reg [31:0] registers_14; // @[RegFile.scala 16:26]
  reg [31:0] registers_15; // @[RegFile.scala 16:26]
  reg [31:0] registers_16; // @[RegFile.scala 16:26]
  reg [31:0] registers_17; // @[RegFile.scala 16:26]
  reg [31:0] registers_18; // @[RegFile.scala 16:26]
  reg [31:0] registers_19; // @[RegFile.scala 16:26]
  reg [31:0] registers_20; // @[RegFile.scala 16:26]
  reg [31:0] registers_21; // @[RegFile.scala 16:26]
  reg [31:0] registers_22; // @[RegFile.scala 16:26]
  reg [31:0] registers_23; // @[RegFile.scala 16:26]
  reg [31:0] registers_24; // @[RegFile.scala 16:26]
  reg [31:0] registers_25; // @[RegFile.scala 16:26]
  reg [31:0] registers_26; // @[RegFile.scala 16:26]
  reg [31:0] registers_27; // @[RegFile.scala 16:26]
  reg [31:0] registers_28; // @[RegFile.scala 16:26]
  reg [31:0] registers_29; // @[RegFile.scala 16:26]
  reg [31:0] registers_30; // @[RegFile.scala 16:26]
  reg [31:0] registers_31; // @[RegFile.scala 16:26]
  wire [31:0] _GEN_65 = 5'h1 == io_rs1_index ? registers_1 : registers_0; // @[RegFile.scala 22:{25,25}]
  wire [31:0] _GEN_66 = 5'h2 == io_rs1_index ? registers_2 : _GEN_65; // @[RegFile.scala 22:{25,25}]
  wire [31:0] _GEN_67 = 5'h3 == io_rs1_index ? registers_3 : _GEN_66; // @[RegFile.scala 22:{25,25}]
  wire [31:0] _GEN_68 = 5'h4 == io_rs1_index ? registers_4 : _GEN_67; // @[RegFile.scala 22:{25,25}]
  wire [31:0] _GEN_69 = 5'h5 == io_rs1_index ? registers_5 : _GEN_68; // @[RegFile.scala 22:{25,25}]
  wire [31:0] _GEN_70 = 5'h6 == io_rs1_index ? registers_6 : _GEN_69; // @[RegFile.scala 22:{25,25}]
  wire [31:0] _GEN_71 = 5'h7 == io_rs1_index ? registers_7 : _GEN_70; // @[RegFile.scala 22:{25,25}]
  wire [31:0] _GEN_72 = 5'h8 == io_rs1_index ? registers_8 : _GEN_71; // @[RegFile.scala 22:{25,25}]
  wire [31:0] _GEN_73 = 5'h9 == io_rs1_index ? registers_9 : _GEN_72; // @[RegFile.scala 22:{25,25}]
  wire [31:0] _GEN_74 = 5'ha == io_rs1_index ? registers_10 : _GEN_73; // @[RegFile.scala 22:{25,25}]
  wire [31:0] _GEN_75 = 5'hb == io_rs1_index ? registers_11 : _GEN_74; // @[RegFile.scala 22:{25,25}]
  wire [31:0] _GEN_76 = 5'hc == io_rs1_index ? registers_12 : _GEN_75; // @[RegFile.scala 22:{25,25}]
  wire [31:0] _GEN_77 = 5'hd == io_rs1_index ? registers_13 : _GEN_76; // @[RegFile.scala 22:{25,25}]
  wire [31:0] _GEN_78 = 5'he == io_rs1_index ? registers_14 : _GEN_77; // @[RegFile.scala 22:{25,25}]
  wire [31:0] _GEN_79 = 5'hf == io_rs1_index ? registers_15 : _GEN_78; // @[RegFile.scala 22:{25,25}]
  wire [31:0] _GEN_80 = 5'h10 == io_rs1_index ? registers_16 : _GEN_79; // @[RegFile.scala 22:{25,25}]
  wire [31:0] _GEN_81 = 5'h11 == io_rs1_index ? registers_17 : _GEN_80; // @[RegFile.scala 22:{25,25}]
  wire [31:0] _GEN_82 = 5'h12 == io_rs1_index ? registers_18 : _GEN_81; // @[RegFile.scala 22:{25,25}]
  wire [31:0] _GEN_83 = 5'h13 == io_rs1_index ? registers_19 : _GEN_82; // @[RegFile.scala 22:{25,25}]
  wire [31:0] _GEN_84 = 5'h14 == io_rs1_index ? registers_20 : _GEN_83; // @[RegFile.scala 22:{25,25}]
  wire [31:0] _GEN_85 = 5'h15 == io_rs1_index ? registers_21 : _GEN_84; // @[RegFile.scala 22:{25,25}]
  wire [31:0] _GEN_86 = 5'h16 == io_rs1_index ? registers_22 : _GEN_85; // @[RegFile.scala 22:{25,25}]
  wire [31:0] _GEN_87 = 5'h17 == io_rs1_index ? registers_23 : _GEN_86; // @[RegFile.scala 22:{25,25}]
  wire [31:0] _GEN_88 = 5'h18 == io_rs1_index ? registers_24 : _GEN_87; // @[RegFile.scala 22:{25,25}]
  wire [31:0] _GEN_89 = 5'h19 == io_rs1_index ? registers_25 : _GEN_88; // @[RegFile.scala 22:{25,25}]
  wire [31:0] _GEN_90 = 5'h1a == io_rs1_index ? registers_26 : _GEN_89; // @[RegFile.scala 22:{25,25}]
  wire [31:0] _GEN_91 = 5'h1b == io_rs1_index ? registers_27 : _GEN_90; // @[RegFile.scala 22:{25,25}]
  wire [31:0] _GEN_92 = 5'h1c == io_rs1_index ? registers_28 : _GEN_91; // @[RegFile.scala 22:{25,25}]
  wire [31:0] _GEN_93 = 5'h1d == io_rs1_index ? registers_29 : _GEN_92; // @[RegFile.scala 22:{25,25}]
  wire [31:0] _GEN_94 = 5'h1e == io_rs1_index ? registers_30 : _GEN_93; // @[RegFile.scala 22:{25,25}]
  wire [31:0] _GEN_95 = 5'h1f == io_rs1_index ? registers_31 : _GEN_94; // @[RegFile.scala 22:{25,25}]
  wire [31:0] _GEN_97 = 5'h1 == io_rs2_index ? registers_1 : registers_0; // @[RegFile.scala 23:{25,25}]
  wire [31:0] _GEN_98 = 5'h2 == io_rs2_index ? registers_2 : _GEN_97; // @[RegFile.scala 23:{25,25}]
  wire [31:0] _GEN_99 = 5'h3 == io_rs2_index ? registers_3 : _GEN_98; // @[RegFile.scala 23:{25,25}]
  wire [31:0] _GEN_100 = 5'h4 == io_rs2_index ? registers_4 : _GEN_99; // @[RegFile.scala 23:{25,25}]
  wire [31:0] _GEN_101 = 5'h5 == io_rs2_index ? registers_5 : _GEN_100; // @[RegFile.scala 23:{25,25}]
  wire [31:0] _GEN_102 = 5'h6 == io_rs2_index ? registers_6 : _GEN_101; // @[RegFile.scala 23:{25,25}]
  wire [31:0] _GEN_103 = 5'h7 == io_rs2_index ? registers_7 : _GEN_102; // @[RegFile.scala 23:{25,25}]
  wire [31:0] _GEN_104 = 5'h8 == io_rs2_index ? registers_8 : _GEN_103; // @[RegFile.scala 23:{25,25}]
  wire [31:0] _GEN_105 = 5'h9 == io_rs2_index ? registers_9 : _GEN_104; // @[RegFile.scala 23:{25,25}]
  wire [31:0] _GEN_106 = 5'ha == io_rs2_index ? registers_10 : _GEN_105; // @[RegFile.scala 23:{25,25}]
  wire [31:0] _GEN_107 = 5'hb == io_rs2_index ? registers_11 : _GEN_106; // @[RegFile.scala 23:{25,25}]
  wire [31:0] _GEN_108 = 5'hc == io_rs2_index ? registers_12 : _GEN_107; // @[RegFile.scala 23:{25,25}]
  wire [31:0] _GEN_109 = 5'hd == io_rs2_index ? registers_13 : _GEN_108; // @[RegFile.scala 23:{25,25}]
  wire [31:0] _GEN_110 = 5'he == io_rs2_index ? registers_14 : _GEN_109; // @[RegFile.scala 23:{25,25}]
  wire [31:0] _GEN_111 = 5'hf == io_rs2_index ? registers_15 : _GEN_110; // @[RegFile.scala 23:{25,25}]
  wire [31:0] _GEN_112 = 5'h10 == io_rs2_index ? registers_16 : _GEN_111; // @[RegFile.scala 23:{25,25}]
  wire [31:0] _GEN_113 = 5'h11 == io_rs2_index ? registers_17 : _GEN_112; // @[RegFile.scala 23:{25,25}]
  wire [31:0] _GEN_114 = 5'h12 == io_rs2_index ? registers_18 : _GEN_113; // @[RegFile.scala 23:{25,25}]
  wire [31:0] _GEN_115 = 5'h13 == io_rs2_index ? registers_19 : _GEN_114; // @[RegFile.scala 23:{25,25}]
  wire [31:0] _GEN_116 = 5'h14 == io_rs2_index ? registers_20 : _GEN_115; // @[RegFile.scala 23:{25,25}]
  wire [31:0] _GEN_117 = 5'h15 == io_rs2_index ? registers_21 : _GEN_116; // @[RegFile.scala 23:{25,25}]
  wire [31:0] _GEN_118 = 5'h16 == io_rs2_index ? registers_22 : _GEN_117; // @[RegFile.scala 23:{25,25}]
  wire [31:0] _GEN_119 = 5'h17 == io_rs2_index ? registers_23 : _GEN_118; // @[RegFile.scala 23:{25,25}]
  wire [31:0] _GEN_120 = 5'h18 == io_rs2_index ? registers_24 : _GEN_119; // @[RegFile.scala 23:{25,25}]
  wire [31:0] _GEN_121 = 5'h19 == io_rs2_index ? registers_25 : _GEN_120; // @[RegFile.scala 23:{25,25}]
  wire [31:0] _GEN_122 = 5'h1a == io_rs2_index ? registers_26 : _GEN_121; // @[RegFile.scala 23:{25,25}]
  wire [31:0] _GEN_123 = 5'h1b == io_rs2_index ? registers_27 : _GEN_122; // @[RegFile.scala 23:{25,25}]
  wire [31:0] _GEN_124 = 5'h1c == io_rs2_index ? registers_28 : _GEN_123; // @[RegFile.scala 23:{25,25}]
  wire [31:0] _GEN_125 = 5'h1d == io_rs2_index ? registers_29 : _GEN_124; // @[RegFile.scala 23:{25,25}]
  wire [31:0] _GEN_126 = 5'h1e == io_rs2_index ? registers_30 : _GEN_125; // @[RegFile.scala 23:{25,25}]
  wire [31:0] _GEN_127 = 5'h1f == io_rs2_index ? registers_31 : _GEN_126; // @[RegFile.scala 23:{25,25}]
  assign io_rs1_data_out = io_rs1_index == 5'h0 ? 32'h0 : _GEN_95; // @[RegFile.scala 22:25]
  assign io_rs2_data_out = io_rs2_index == 5'h0 ? 32'h0 : _GEN_127; // @[RegFile.scala 23:25]
  always @(posedge clock) begin
    if (reset) begin // @[RegFile.scala 16:26]
      registers_0 <= 32'h0; // @[RegFile.scala 16:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 18:41]
      if (5'h0 == io_rd_index) begin // @[RegFile.scala 19:28]
        registers_0 <= io_wb_data; // @[RegFile.scala 19:28]
      end
    end
    if (reset) begin // @[RegFile.scala 16:26]
      registers_1 <= 32'h0; // @[RegFile.scala 16:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 18:41]
      if (5'h1 == io_rd_index) begin // @[RegFile.scala 19:28]
        registers_1 <= io_wb_data; // @[RegFile.scala 19:28]
      end
    end
    if (reset) begin // @[RegFile.scala 16:26]
      registers_2 <= 32'h0; // @[RegFile.scala 16:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 18:41]
      if (5'h2 == io_rd_index) begin // @[RegFile.scala 19:28]
        registers_2 <= io_wb_data; // @[RegFile.scala 19:28]
      end
    end
    if (reset) begin // @[RegFile.scala 16:26]
      registers_3 <= 32'h0; // @[RegFile.scala 16:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 18:41]
      if (5'h3 == io_rd_index) begin // @[RegFile.scala 19:28]
        registers_3 <= io_wb_data; // @[RegFile.scala 19:28]
      end
    end
    if (reset) begin // @[RegFile.scala 16:26]
      registers_4 <= 32'h0; // @[RegFile.scala 16:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 18:41]
      if (5'h4 == io_rd_index) begin // @[RegFile.scala 19:28]
        registers_4 <= io_wb_data; // @[RegFile.scala 19:28]
      end
    end
    if (reset) begin // @[RegFile.scala 16:26]
      registers_5 <= 32'h0; // @[RegFile.scala 16:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 18:41]
      if (5'h5 == io_rd_index) begin // @[RegFile.scala 19:28]
        registers_5 <= io_wb_data; // @[RegFile.scala 19:28]
      end
    end
    if (reset) begin // @[RegFile.scala 16:26]
      registers_6 <= 32'h0; // @[RegFile.scala 16:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 18:41]
      if (5'h6 == io_rd_index) begin // @[RegFile.scala 19:28]
        registers_6 <= io_wb_data; // @[RegFile.scala 19:28]
      end
    end
    if (reset) begin // @[RegFile.scala 16:26]
      registers_7 <= 32'h0; // @[RegFile.scala 16:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 18:41]
      if (5'h7 == io_rd_index) begin // @[RegFile.scala 19:28]
        registers_7 <= io_wb_data; // @[RegFile.scala 19:28]
      end
    end
    if (reset) begin // @[RegFile.scala 16:26]
      registers_8 <= 32'h0; // @[RegFile.scala 16:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 18:41]
      if (5'h8 == io_rd_index) begin // @[RegFile.scala 19:28]
        registers_8 <= io_wb_data; // @[RegFile.scala 19:28]
      end
    end
    if (reset) begin // @[RegFile.scala 16:26]
      registers_9 <= 32'h0; // @[RegFile.scala 16:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 18:41]
      if (5'h9 == io_rd_index) begin // @[RegFile.scala 19:28]
        registers_9 <= io_wb_data; // @[RegFile.scala 19:28]
      end
    end
    if (reset) begin // @[RegFile.scala 16:26]
      registers_10 <= 32'h0; // @[RegFile.scala 16:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 18:41]
      if (5'ha == io_rd_index) begin // @[RegFile.scala 19:28]
        registers_10 <= io_wb_data; // @[RegFile.scala 19:28]
      end
    end
    if (reset) begin // @[RegFile.scala 16:26]
      registers_11 <= 32'h0; // @[RegFile.scala 16:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 18:41]
      if (5'hb == io_rd_index) begin // @[RegFile.scala 19:28]
        registers_11 <= io_wb_data; // @[RegFile.scala 19:28]
      end
    end
    if (reset) begin // @[RegFile.scala 16:26]
      registers_12 <= 32'h0; // @[RegFile.scala 16:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 18:41]
      if (5'hc == io_rd_index) begin // @[RegFile.scala 19:28]
        registers_12 <= io_wb_data; // @[RegFile.scala 19:28]
      end
    end
    if (reset) begin // @[RegFile.scala 16:26]
      registers_13 <= 32'h0; // @[RegFile.scala 16:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 18:41]
      if (5'hd == io_rd_index) begin // @[RegFile.scala 19:28]
        registers_13 <= io_wb_data; // @[RegFile.scala 19:28]
      end
    end
    if (reset) begin // @[RegFile.scala 16:26]
      registers_14 <= 32'h0; // @[RegFile.scala 16:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 18:41]
      if (5'he == io_rd_index) begin // @[RegFile.scala 19:28]
        registers_14 <= io_wb_data; // @[RegFile.scala 19:28]
      end
    end
    if (reset) begin // @[RegFile.scala 16:26]
      registers_15 <= 32'h0; // @[RegFile.scala 16:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 18:41]
      if (5'hf == io_rd_index) begin // @[RegFile.scala 19:28]
        registers_15 <= io_wb_data; // @[RegFile.scala 19:28]
      end
    end
    if (reset) begin // @[RegFile.scala 16:26]
      registers_16 <= 32'h0; // @[RegFile.scala 16:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 18:41]
      if (5'h10 == io_rd_index) begin // @[RegFile.scala 19:28]
        registers_16 <= io_wb_data; // @[RegFile.scala 19:28]
      end
    end
    if (reset) begin // @[RegFile.scala 16:26]
      registers_17 <= 32'h0; // @[RegFile.scala 16:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 18:41]
      if (5'h11 == io_rd_index) begin // @[RegFile.scala 19:28]
        registers_17 <= io_wb_data; // @[RegFile.scala 19:28]
      end
    end
    if (reset) begin // @[RegFile.scala 16:26]
      registers_18 <= 32'h0; // @[RegFile.scala 16:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 18:41]
      if (5'h12 == io_rd_index) begin // @[RegFile.scala 19:28]
        registers_18 <= io_wb_data; // @[RegFile.scala 19:28]
      end
    end
    if (reset) begin // @[RegFile.scala 16:26]
      registers_19 <= 32'h0; // @[RegFile.scala 16:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 18:41]
      if (5'h13 == io_rd_index) begin // @[RegFile.scala 19:28]
        registers_19 <= io_wb_data; // @[RegFile.scala 19:28]
      end
    end
    if (reset) begin // @[RegFile.scala 16:26]
      registers_20 <= 32'h0; // @[RegFile.scala 16:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 18:41]
      if (5'h14 == io_rd_index) begin // @[RegFile.scala 19:28]
        registers_20 <= io_wb_data; // @[RegFile.scala 19:28]
      end
    end
    if (reset) begin // @[RegFile.scala 16:26]
      registers_21 <= 32'h0; // @[RegFile.scala 16:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 18:41]
      if (5'h15 == io_rd_index) begin // @[RegFile.scala 19:28]
        registers_21 <= io_wb_data; // @[RegFile.scala 19:28]
      end
    end
    if (reset) begin // @[RegFile.scala 16:26]
      registers_22 <= 32'h0; // @[RegFile.scala 16:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 18:41]
      if (5'h16 == io_rd_index) begin // @[RegFile.scala 19:28]
        registers_22 <= io_wb_data; // @[RegFile.scala 19:28]
      end
    end
    if (reset) begin // @[RegFile.scala 16:26]
      registers_23 <= 32'h0; // @[RegFile.scala 16:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 18:41]
      if (5'h17 == io_rd_index) begin // @[RegFile.scala 19:28]
        registers_23 <= io_wb_data; // @[RegFile.scala 19:28]
      end
    end
    if (reset) begin // @[RegFile.scala 16:26]
      registers_24 <= 32'h0; // @[RegFile.scala 16:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 18:41]
      if (5'h18 == io_rd_index) begin // @[RegFile.scala 19:28]
        registers_24 <= io_wb_data; // @[RegFile.scala 19:28]
      end
    end
    if (reset) begin // @[RegFile.scala 16:26]
      registers_25 <= 32'h0; // @[RegFile.scala 16:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 18:41]
      if (5'h19 == io_rd_index) begin // @[RegFile.scala 19:28]
        registers_25 <= io_wb_data; // @[RegFile.scala 19:28]
      end
    end
    if (reset) begin // @[RegFile.scala 16:26]
      registers_26 <= 32'h0; // @[RegFile.scala 16:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 18:41]
      if (5'h1a == io_rd_index) begin // @[RegFile.scala 19:28]
        registers_26 <= io_wb_data; // @[RegFile.scala 19:28]
      end
    end
    if (reset) begin // @[RegFile.scala 16:26]
      registers_27 <= 32'h0; // @[RegFile.scala 16:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 18:41]
      if (5'h1b == io_rd_index) begin // @[RegFile.scala 19:28]
        registers_27 <= io_wb_data; // @[RegFile.scala 19:28]
      end
    end
    if (reset) begin // @[RegFile.scala 16:26]
      registers_28 <= 32'h0; // @[RegFile.scala 16:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 18:41]
      if (5'h1c == io_rd_index) begin // @[RegFile.scala 19:28]
        registers_28 <= io_wb_data; // @[RegFile.scala 19:28]
      end
    end
    if (reset) begin // @[RegFile.scala 16:26]
      registers_29 <= 32'h0; // @[RegFile.scala 16:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 18:41]
      if (5'h1d == io_rd_index) begin // @[RegFile.scala 19:28]
        registers_29 <= io_wb_data; // @[RegFile.scala 19:28]
      end
    end
    if (reset) begin // @[RegFile.scala 16:26]
      registers_30 <= 32'h0; // @[RegFile.scala 16:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 18:41]
      if (5'h1e == io_rd_index) begin // @[RegFile.scala 19:28]
        registers_30 <= io_wb_data; // @[RegFile.scala 19:28]
      end
    end
    if (reset) begin // @[RegFile.scala 16:26]
      registers_31 <= 32'h0; // @[RegFile.scala 16:26]
    end else if (io_wb_en & io_rd_index != 5'h0) begin // @[RegFile.scala 18:41]
      if (5'h1f == io_rd_index) begin // @[RegFile.scala 19:28]
        registers_31 <= io_wb_data; // @[RegFile.scala 19:28]
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
  reg [31:0] E_PC_REG; // @[Reg_E.scala 19:43]
  reg [31:0] E_RS1_DATA_REG; // @[Reg_E.scala 20:43]
  reg [31:0] E_RS2_DATA_REG; // @[Reg_E.scala 21:43]
  reg [31:0] E_SEXT_IMME_REG; // @[Reg_E.scala 22:43]
  assign io_out_Reg_E_pc = E_PC_REG; // @[Reg_E.scala 36:28]
  assign io_out_Reg_E_rs1_data = E_RS1_DATA_REG; // @[Reg_E.scala 37:28]
  assign io_out_Reg_E_rs2_data = E_RS2_DATA_REG; // @[Reg_E.scala 38:28]
  assign io_out_Reg_E_sext_imme = E_SEXT_IMME_REG; // @[Reg_E.scala 39:28]
  always @(posedge clock) begin
    if (reset) begin // @[Reg_E.scala 19:43]
      E_PC_REG <= 32'h0; // @[Reg_E.scala 19:43]
    end else if (io_jb | io_stall) begin // @[Reg_E.scala 24:26]
      E_PC_REG <= 32'h0; // @[Reg_E.scala 25:23]
    end else begin
      E_PC_REG <= io_pc; // @[Reg_E.scala 30:23]
    end
    if (reset) begin // @[Reg_E.scala 20:43]
      E_RS1_DATA_REG <= 32'h0; // @[Reg_E.scala 20:43]
    end else if (io_jb | io_stall) begin // @[Reg_E.scala 24:26]
      E_RS1_DATA_REG <= 32'h0; // @[Reg_E.scala 26:23]
    end else begin
      E_RS1_DATA_REG <= io_rs1_data; // @[Reg_E.scala 31:23]
    end
    if (reset) begin // @[Reg_E.scala 21:43]
      E_RS2_DATA_REG <= 32'h0; // @[Reg_E.scala 21:43]
    end else if (io_jb | io_stall) begin // @[Reg_E.scala 24:26]
      E_RS2_DATA_REG <= 32'h0; // @[Reg_E.scala 27:23]
    end else begin
      E_RS2_DATA_REG <= io_rs2_data; // @[Reg_E.scala 32:23]
    end
    if (reset) begin // @[Reg_E.scala 22:43]
      E_SEXT_IMME_REG <= 32'h0; // @[Reg_E.scala 22:43]
    end else if (io_jb | io_stall) begin // @[Reg_E.scala 24:26]
      E_SEXT_IMME_REG <= 32'h0; // @[Reg_E.scala 28:23]
    end else begin
      E_SEXT_IMME_REG <= io_sext_imme; // @[Reg_E.scala 33:23]
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
  wire [31:0] _io_alu_out_T = io_operand1; // @[ALU.scala 20:44]
  wire [31:0] _io_alu_out_T_1 = io_operand2; // @[ALU.scala 20:65]
  wire [31:0] _io_alu_out_T_5 = $signed(io_operand1) + $signed(io_operand2); // @[ALU.scala 20:73]
  wire [31:0] _io_alu_out_T_11 = $signed(io_operand1) - $signed(io_operand2); // @[ALU.scala 23:74]
  wire [62:0] _GEN_31 = {{31'd0}, io_operand1}; // @[ALU.scala 26:44]
  wire [62:0] _io_alu_out_T_13 = _GEN_31 << io_operand2[4:0]; // @[ALU.scala 26:44]
  wire  _io_alu_out_T_16 = $signed(io_operand1) < $signed(io_operand2); // @[ALU.scala 29:51]
  wire  _io_alu_out_T_17 = io_operand1 < io_operand2; // @[ALU.scala 32:44]
  wire [31:0] _io_alu_out_T_18 = io_operand1 ^ io_operand2; // @[ALU.scala 35:44]
  wire [31:0] _io_alu_out_T_20 = io_operand1 >> io_operand2[4:0]; // @[ALU.scala 38:44]
  wire [31:0] _io_alu_out_T_24 = $signed(io_operand1) >>> io_operand2[4:0]; // @[ALU.scala 41:73]
  wire [31:0] _io_alu_out_T_25 = io_operand1 | io_operand2; // @[ALU.scala 44:44]
  wire [31:0] _io_alu_out_T_26 = io_operand1 & io_operand2; // @[ALU.scala 47:44]
  wire [31:0] _GEN_0 = 4'h7 == func7_and_func3 ? _io_alu_out_T_26 : 32'h0; // @[ALU.scala 16:16 18:33 47:28]
  wire [31:0] _GEN_1 = 4'h6 == func7_and_func3 ? _io_alu_out_T_25 : _GEN_0; // @[ALU.scala 18:33 44:28]
  wire [31:0] _GEN_2 = 4'hd == func7_and_func3 ? _io_alu_out_T_24 : _GEN_1; // @[ALU.scala 18:33 41:28]
  wire [31:0] _GEN_3 = 4'h5 == func7_and_func3 ? _io_alu_out_T_20 : _GEN_2; // @[ALU.scala 18:33 38:28]
  wire [31:0] _GEN_4 = 4'h4 == func7_and_func3 ? _io_alu_out_T_18 : _GEN_3; // @[ALU.scala 18:33 35:28]
  wire [31:0] _GEN_5 = 4'h3 == func7_and_func3 ? {{31'd0}, io_operand1 < io_operand2} : _GEN_4; // @[ALU.scala 18:33 32:28]
  wire [31:0] _GEN_6 = 4'h2 == func7_and_func3 ? {{31'd0}, $signed(_io_alu_out_T) < $signed(_io_alu_out_T_1)} : _GEN_5; // @[ALU.scala 18:33 29:28]
  wire [62:0] _GEN_7 = 4'h1 == func7_and_func3 ? _io_alu_out_T_13 : {{31'd0}, _GEN_6}; // @[ALU.scala 18:33 26:28]
  wire [62:0] _GEN_8 = 4'h8 == func7_and_func3 ? {{31'd0}, _io_alu_out_T_11} : _GEN_7; // @[ALU.scala 18:33 23:28]
  wire [62:0] _GEN_9 = 4'h0 == func7_and_func3 ? {{31'd0}, _io_alu_out_T_5} : _GEN_8; // @[ALU.scala 18:33 20:28]
  wire  _T_12 = 3'h0 == io_func3; // @[ALU.scala 52:26]
  wire  _T_15 = 3'h4 == io_func3; // @[ALU.scala 52:26]
  wire  _T_16 = 3'h6 == io_func3; // @[ALU.scala 52:26]
  wire  _T_17 = 3'h7 == io_func3; // @[ALU.scala 52:26]
  wire  _T_18 = 3'h1 == io_func3; // @[ALU.scala 52:26]
  wire  _T_19 = 3'h5 == io_func3; // @[ALU.scala 52:26]
  wire [31:0] _GEN_10 = io_func7 ? _io_alu_out_T_24 : _io_alu_out_T_20; // @[ALU.scala 75:39 76:32 78:32]
  wire [31:0] _GEN_11 = 3'h5 == io_func3 ? _GEN_10 : 32'h0; // @[ALU.scala 16:16 52:26]
  wire [62:0] _GEN_12 = 3'h1 == io_func3 ? _io_alu_out_T_13 : {{31'd0}, _GEN_11}; // @[ALU.scala 52:26 72:28]
  wire [62:0] _GEN_13 = 3'h7 == io_func3 ? {{31'd0}, _io_alu_out_T_26} : _GEN_12; // @[ALU.scala 52:26 69:28]
  wire [62:0] _GEN_14 = 3'h6 == io_func3 ? {{31'd0}, _io_alu_out_T_25} : _GEN_13; // @[ALU.scala 52:26 66:28]
  wire [62:0] _GEN_15 = 3'h4 == io_func3 ? {{31'd0}, _io_alu_out_T_18} : _GEN_14; // @[ALU.scala 52:26 63:28]
  wire [62:0] _GEN_16 = 3'h3 == io_func3 ? {{62'd0}, _io_alu_out_T_17} : _GEN_15; // @[ALU.scala 52:26 60:28]
  wire [62:0] _GEN_17 = 3'h2 == io_func3 ? {{62'd0}, _io_alu_out_T_16} : _GEN_16; // @[ALU.scala 52:26 57:28]
  wire [62:0] _GEN_18 = 3'h0 == io_func3 ? {{31'd0}, _io_alu_out_T_5} : _GEN_17; // @[ALU.scala 52:26 54:28]
  wire [31:0] _GEN_19 = _T_17 ? {{31'd0}, io_operand1 >= io_operand2} : 32'h0; // @[ALU.scala 84:26 101:28 16:16]
  wire [31:0] _GEN_20 = _T_16 ? {{31'd0}, _io_alu_out_T_17} : _GEN_19; // @[ALU.scala 84:26 98:28]
  wire [31:0] _GEN_21 = _T_19 ? {{31'd0}, $signed(_io_alu_out_T) >= $signed(_io_alu_out_T_1)} : _GEN_20; // @[ALU.scala 84:26 95:28]
  wire [31:0] _GEN_22 = _T_15 ? {{31'd0}, _io_alu_out_T_16} : _GEN_21; // @[ALU.scala 84:26 92:28]
  wire [31:0] _GEN_23 = _T_18 ? {{31'd0}, io_operand1 != io_operand2} : _GEN_22; // @[ALU.scala 84:26 89:28]
  wire [31:0] _GEN_24 = _T_12 ? {{31'd0}, io_operand1 == io_operand2} : _GEN_23; // @[ALU.scala 84:26 86:28]
  wire [31:0] _io_alu_out_T_59 = io_operand1 + io_operand2; // @[ALU.scala 110:36]
  wire [31:0] _io_alu_out_T_61 = io_operand1 + 32'h4; // @[ALU.scala 112:36]
  wire [31:0] _GEN_25 = io_opcode == 5'h1b | io_opcode == 5'h19 ? _io_alu_out_T_61 : 32'h0; // @[ALU.scala 111:114 112:20 114:20]
  wire [31:0] _GEN_26 = io_opcode == 5'h5 | io_opcode == 5'h8 | io_opcode == 5'h0 ? _io_alu_out_T_59 : _GEN_25; // @[ALU.scala 109:161 110:20]
  wire [31:0] _GEN_27 = io_opcode == 5'hd ? io_operand2 : _GEN_26; // @[ALU.scala 107:64 108:20]
  wire [31:0] _GEN_28 = io_opcode == 5'h18 ? _GEN_24 : _GEN_27; // @[ALU.scala 83:62]
  wire [62:0] _GEN_29 = io_opcode == 5'h4 ? _GEN_18 : {{31'd0}, _GEN_28}; // @[ALU.scala 51:63]
  wire [62:0] _GEN_30 = io_opcode == 5'hc ? _GEN_9 : _GEN_29; // @[ALU.scala 17:55]
  assign io_alu_out = _GEN_30[31:0];
endmodule
module JB_Unit(
  input  [31:0] io_operand1,
  input  [31:0] io_operand2,
  output [31:0] io_jb_out
);
  assign io_jb_out = io_operand1 + io_operand2; // @[JB_Unit.scala 12:32]
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
  reg [31:0] ALU_OUT_REG; // @[Reg_M.scala 13:40]
  reg [31:0] RS2_DATA_REG; // @[Reg_M.scala 14:40]
  assign io_out_Reg_M_alu_out = ALU_OUT_REG; // @[Reg_M.scala 19:31]
  assign io_out_Reg_M_rs2_data = RS2_DATA_REG; // @[Reg_M.scala 20:31]
  always @(posedge clock) begin
    if (reset) begin // @[Reg_M.scala 13:40]
      ALU_OUT_REG <= 32'h0; // @[Reg_M.scala 13:40]
    end else begin
      ALU_OUT_REG <= io_alu_out; // @[Reg_M.scala 16:19]
    end
    if (reset) begin // @[Reg_M.scala 14:40]
      RS2_DATA_REG <= 32'h0; // @[Reg_M.scala 14:40]
    end else begin
      RS2_DATA_REG <= io_rs2_data; // @[Reg_M.scala 17:19]
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
module SRAM_dm(
  input         clock,
  input  [3:0]  io_w_en,
  input  [15:0] io_address,
  input  [31:0] io_write_data,
  output [31:0] io_read_data,
  input         io_mem_read_test,
  input  [31:0] io_mem_addr_test,
  output [31:0] io_mem_data_test
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [7:0] mem [0:65535]; // @[SRAM_dm.scala 17:16]
  wire  mem_read_data_bytes_0_MPORT_en; // @[SRAM_dm.scala 17:16]
  wire [15:0] mem_read_data_bytes_0_MPORT_addr; // @[SRAM_dm.scala 17:16]
  wire [7:0] mem_read_data_bytes_0_MPORT_data; // @[SRAM_dm.scala 17:16]
  wire  mem_read_data_bytes_1_MPORT_en; // @[SRAM_dm.scala 17:16]
  wire [15:0] mem_read_data_bytes_1_MPORT_addr; // @[SRAM_dm.scala 17:16]
  wire [7:0] mem_read_data_bytes_1_MPORT_data; // @[SRAM_dm.scala 17:16]
  wire  mem_read_data_bytes_2_MPORT_en; // @[SRAM_dm.scala 17:16]
  wire [15:0] mem_read_data_bytes_2_MPORT_addr; // @[SRAM_dm.scala 17:16]
  wire [7:0] mem_read_data_bytes_2_MPORT_data; // @[SRAM_dm.scala 17:16]
  wire  mem_read_data_bytes_3_MPORT_en; // @[SRAM_dm.scala 17:16]
  wire [15:0] mem_read_data_bytes_3_MPORT_addr; // @[SRAM_dm.scala 17:16]
  wire [7:0] mem_read_data_bytes_3_MPORT_data; // @[SRAM_dm.scala 17:16]
  wire  mem_test_data_bytes_0_MPORT_en; // @[SRAM_dm.scala 17:16]
  wire [15:0] mem_test_data_bytes_0_MPORT_addr; // @[SRAM_dm.scala 17:16]
  wire [7:0] mem_test_data_bytes_0_MPORT_data; // @[SRAM_dm.scala 17:16]
  wire  mem_test_data_bytes_1_MPORT_en; // @[SRAM_dm.scala 17:16]
  wire [15:0] mem_test_data_bytes_1_MPORT_addr; // @[SRAM_dm.scala 17:16]
  wire [7:0] mem_test_data_bytes_1_MPORT_data; // @[SRAM_dm.scala 17:16]
  wire  mem_test_data_bytes_2_MPORT_en; // @[SRAM_dm.scala 17:16]
  wire [15:0] mem_test_data_bytes_2_MPORT_addr; // @[SRAM_dm.scala 17:16]
  wire [7:0] mem_test_data_bytes_2_MPORT_data; // @[SRAM_dm.scala 17:16]
  wire  mem_test_data_bytes_3_MPORT_en; // @[SRAM_dm.scala 17:16]
  wire [15:0] mem_test_data_bytes_3_MPORT_addr; // @[SRAM_dm.scala 17:16]
  wire [7:0] mem_test_data_bytes_3_MPORT_data; // @[SRAM_dm.scala 17:16]
  wire [7:0] mem_MPORT_data; // @[SRAM_dm.scala 17:16]
  wire [15:0] mem_MPORT_addr; // @[SRAM_dm.scala 17:16]
  wire  mem_MPORT_mask; // @[SRAM_dm.scala 17:16]
  wire  mem_MPORT_en; // @[SRAM_dm.scala 17:16]
  wire [7:0] mem_MPORT_1_data; // @[SRAM_dm.scala 17:16]
  wire [15:0] mem_MPORT_1_addr; // @[SRAM_dm.scala 17:16]
  wire  mem_MPORT_1_mask; // @[SRAM_dm.scala 17:16]
  wire  mem_MPORT_1_en; // @[SRAM_dm.scala 17:16]
  wire [7:0] mem_MPORT_2_data; // @[SRAM_dm.scala 17:16]
  wire [15:0] mem_MPORT_2_addr; // @[SRAM_dm.scala 17:16]
  wire  mem_MPORT_2_mask; // @[SRAM_dm.scala 17:16]
  wire  mem_MPORT_2_en; // @[SRAM_dm.scala 17:16]
  wire [7:0] mem_MPORT_3_data; // @[SRAM_dm.scala 17:16]
  wire [15:0] mem_MPORT_3_addr; // @[SRAM_dm.scala 17:16]
  wire  mem_MPORT_3_mask; // @[SRAM_dm.scala 17:16]
  wire  mem_MPORT_3_en; // @[SRAM_dm.scala 17:16]
  wire  _T = io_w_en != 4'h0; // @[SRAM_dm.scala 20:16]
  wire [7:0] read_data_bytes_1 = mem_read_data_bytes_1_MPORT_data; // @[SRAM_dm.scala 28:32 30:22]
  wire [7:0] read_data_bytes_0 = mem_read_data_bytes_0_MPORT_data; // @[SRAM_dm.scala 28:32 29:22]
  wire [15:0] io_read_data_lo = {read_data_bytes_1,read_data_bytes_0}; // @[Cat.scala 31:58]
  wire [7:0] read_data_bytes_3 = mem_read_data_bytes_3_MPORT_data; // @[SRAM_dm.scala 28:32 32:22]
  wire [7:0] read_data_bytes_2 = mem_read_data_bytes_2_MPORT_data; // @[SRAM_dm.scala 28:32 31:22]
  wire [15:0] io_read_data_hi = {read_data_bytes_3,read_data_bytes_2}; // @[Cat.scala 31:58]
  wire [31:0] _test_data_bytes_1_T_1 = io_mem_addr_test + 32'h1; // @[SRAM_dm.scala 39:51]
  wire [31:0] _test_data_bytes_2_T_1 = io_mem_addr_test + 32'h2; // @[SRAM_dm.scala 40:51]
  wire [31:0] _test_data_bytes_3_T_1 = io_mem_addr_test + 32'h3; // @[SRAM_dm.scala 41:51]
  wire [7:0] test_data_bytes_1 = mem_test_data_bytes_1_MPORT_data; // @[SRAM_dm.scala 37:32 39:22]
  wire [7:0] test_data_bytes_0 = mem_test_data_bytes_0_MPORT_data; // @[SRAM_dm.scala 37:32 38:22]
  wire [7:0] test_data_bytes_3 = mem_test_data_bytes_3_MPORT_data; // @[SRAM_dm.scala 37:32 41:22]
  wire [7:0] test_data_bytes_2 = mem_test_data_bytes_2_MPORT_data; // @[SRAM_dm.scala 37:32 40:22]
  wire [31:0] _io_mem_data_test_T = {test_data_bytes_3,test_data_bytes_2,test_data_bytes_1,test_data_bytes_0}; // @[Cat.scala 31:58]
  assign mem_read_data_bytes_0_MPORT_en = 1'h1;
  assign mem_read_data_bytes_0_MPORT_addr = io_address;
  assign mem_read_data_bytes_0_MPORT_data = mem[mem_read_data_bytes_0_MPORT_addr]; // @[SRAM_dm.scala 17:16]
  assign mem_read_data_bytes_1_MPORT_en = 1'h1;
  assign mem_read_data_bytes_1_MPORT_addr = io_address + 16'h1;
  assign mem_read_data_bytes_1_MPORT_data = mem[mem_read_data_bytes_1_MPORT_addr]; // @[SRAM_dm.scala 17:16]
  assign mem_read_data_bytes_2_MPORT_en = 1'h1;
  assign mem_read_data_bytes_2_MPORT_addr = io_address + 16'h2;
  assign mem_read_data_bytes_2_MPORT_data = mem[mem_read_data_bytes_2_MPORT_addr]; // @[SRAM_dm.scala 17:16]
  assign mem_read_data_bytes_3_MPORT_en = 1'h1;
  assign mem_read_data_bytes_3_MPORT_addr = io_address + 16'h3;
  assign mem_read_data_bytes_3_MPORT_data = mem[mem_read_data_bytes_3_MPORT_addr]; // @[SRAM_dm.scala 17:16]
  assign mem_test_data_bytes_0_MPORT_en = 1'h1;
  assign mem_test_data_bytes_0_MPORT_addr = io_mem_addr_test[15:0];
  assign mem_test_data_bytes_0_MPORT_data = mem[mem_test_data_bytes_0_MPORT_addr]; // @[SRAM_dm.scala 17:16]
  assign mem_test_data_bytes_1_MPORT_en = 1'h1;
  assign mem_test_data_bytes_1_MPORT_addr = _test_data_bytes_1_T_1[15:0];
  assign mem_test_data_bytes_1_MPORT_data = mem[mem_test_data_bytes_1_MPORT_addr]; // @[SRAM_dm.scala 17:16]
  assign mem_test_data_bytes_2_MPORT_en = 1'h1;
  assign mem_test_data_bytes_2_MPORT_addr = _test_data_bytes_2_T_1[15:0];
  assign mem_test_data_bytes_2_MPORT_data = mem[mem_test_data_bytes_2_MPORT_addr]; // @[SRAM_dm.scala 17:16]
  assign mem_test_data_bytes_3_MPORT_en = 1'h1;
  assign mem_test_data_bytes_3_MPORT_addr = _test_data_bytes_3_T_1[15:0];
  assign mem_test_data_bytes_3_MPORT_data = mem[mem_test_data_bytes_3_MPORT_addr]; // @[SRAM_dm.scala 17:16]
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
  assign io_mem_data_test = io_mem_read_test ? _io_mem_data_test_T : 32'h0; // @[SRAM_dm.scala 43:20 44:25 45:22]
  always @(posedge clock) begin
    if (mem_MPORT_en & mem_MPORT_mask) begin
      mem[mem_MPORT_addr] <= mem_MPORT_data; // @[SRAM_dm.scala 17:16]
    end
    if (mem_MPORT_1_en & mem_MPORT_1_mask) begin
      mem[mem_MPORT_1_addr] <= mem_MPORT_1_data; // @[SRAM_dm.scala 17:16]
    end
    if (mem_MPORT_2_en & mem_MPORT_2_mask) begin
      mem[mem_MPORT_2_addr] <= mem_MPORT_2_data; // @[SRAM_dm.scala 17:16]
    end
    if (mem_MPORT_3_en & mem_MPORT_3_mask) begin
      mem[mem_MPORT_3_addr] <= mem_MPORT_3_data; // @[SRAM_dm.scala 17:16]
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
  wire [31:0] _GEN_0 = 3'h5 == io_func3 ? _io_ld_data_f_T_13 : 32'h0; // @[LD_Filter.scala 14:21 13:25 28:29]
  wire [31:0] _GEN_1 = 3'h4 == io_func3 ? _io_ld_data_f_T_11 : _GEN_0; // @[LD_Filter.scala 14:21 25:29]
  wire [31:0] _GEN_2 = 3'h2 == io_func3 ? io_ld_data : _GEN_1; // @[LD_Filter.scala 14:21 22:29]
  wire [31:0] _GEN_3 = 3'h1 == io_func3 ? _io_ld_data_f_T_9 : _GEN_2; // @[LD_Filter.scala 14:21 19:29]
  assign io_ld_data_f = 3'h0 == io_func3 ? _io_ld_data_f_T_4 : _GEN_3; // @[LD_Filter.scala 14:21 16:29]
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
  input        io_predict_miss,
  input        io_BTB_miss,
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
module BPU(
  input         clock,
  input         reset,
  input  [31:0] io_IF_pc,
  input  [31:0] io_IF_inst,
  input  [31:0] io_EXE_pc,
  input  [4:0]  io_EXE_op,
  input         io_alu_out,
  input         io_stall,
  input         io_jump,
  input  [31:0] io_jb_pc,
  output        io_predict,
  output        io_predict_miss,
  output        io_BTB_miss,
  output [31:0] io_next_pc
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
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] BHT_0; // @[BPU.scala 26:30]
  reg [1:0] BHT_1; // @[BPU.scala 26:30]
  reg [1:0] BHT_2; // @[BPU.scala 26:30]
  reg [1:0] BHT_3; // @[BPU.scala 26:30]
  reg [1:0] BHT_4; // @[BPU.scala 26:30]
  reg [1:0] BHT_5; // @[BPU.scala 26:30]
  reg [1:0] BHT_6; // @[BPU.scala 26:30]
  reg [1:0] BHT_7; // @[BPU.scala 26:30]
  reg [1:0] BHT_8; // @[BPU.scala 26:30]
  reg [1:0] BHT_9; // @[BPU.scala 26:30]
  reg [1:0] BHT_10; // @[BPU.scala 26:30]
  reg [1:0] BHT_11; // @[BPU.scala 26:30]
  reg [1:0] BHT_12; // @[BPU.scala 26:30]
  reg [1:0] BHT_13; // @[BPU.scala 26:30]
  reg [1:0] BHT_14; // @[BPU.scala 26:30]
  reg [1:0] BHT_15; // @[BPU.scala 26:30]
  reg [31:0] BTB_0; // @[BPU.scala 27:30]
  reg [31:0] BTB_1; // @[BPU.scala 27:30]
  reg [31:0] BTB_2; // @[BPU.scala 27:30]
  reg [31:0] BTB_3; // @[BPU.scala 27:30]
  reg [31:0] BTB_4; // @[BPU.scala 27:30]
  reg [31:0] BTB_5; // @[BPU.scala 27:30]
  reg [31:0] BTB_6; // @[BPU.scala 27:30]
  reg [31:0] BTB_7; // @[BPU.scala 27:30]
  reg [31:0] BTB_8; // @[BPU.scala 27:30]
  reg [31:0] BTB_9; // @[BPU.scala 27:30]
  reg [31:0] BTB_10; // @[BPU.scala 27:30]
  reg [31:0] BTB_11; // @[BPU.scala 27:30]
  reg [31:0] BTB_12; // @[BPU.scala 27:30]
  reg [31:0] BTB_13; // @[BPU.scala 27:30]
  reg [31:0] BTB_14; // @[BPU.scala 27:30]
  reg [31:0] BTB_15; // @[BPU.scala 27:30]
  reg  BTB_valid_0; // @[BPU.scala 28:30]
  reg  BTB_valid_1; // @[BPU.scala 28:30]
  reg  BTB_valid_2; // @[BPU.scala 28:30]
  reg  BTB_valid_3; // @[BPU.scala 28:30]
  reg  BTB_valid_4; // @[BPU.scala 28:30]
  reg  BTB_valid_5; // @[BPU.scala 28:30]
  reg  BTB_valid_6; // @[BPU.scala 28:30]
  reg  BTB_valid_7; // @[BPU.scala 28:30]
  reg  BTB_valid_8; // @[BPU.scala 28:30]
  reg  BTB_valid_9; // @[BPU.scala 28:30]
  reg  BTB_valid_10; // @[BPU.scala 28:30]
  reg  BTB_valid_11; // @[BPU.scala 28:30]
  reg  BTB_valid_12; // @[BPU.scala 28:30]
  reg  BTB_valid_13; // @[BPU.scala 28:30]
  reg  BTB_valid_14; // @[BPU.scala 28:30]
  reg  BTB_valid_15; // @[BPU.scala 28:30]
  reg  delay; // @[BPU.scala 30:30]
  reg  last_predict; // @[BPU.scala 31:30]
  reg [31:0] delay_pc; // @[BPU.scala 32:30]
  reg [31:0] last_pc; // @[BPU.scala 33:30]
  wire  IF_is_B_type = io_IF_inst[6:0] == 7'h63; // @[BPU.scala 35:40]
  wire  EXE_is_B_type = io_EXE_op == 5'h18; // @[BPU.scala 36:33]
  wire [3:0] IF_B_index = io_IF_pc[5:2]; // @[BPU.scala 38:31]
  wire [3:0] EXE_B_index = io_EXE_pc[5:2]; // @[BPU.scala 39:32]
  wire [31:0] _GEN_1 = 4'h1 == EXE_B_index ? BTB_1 : BTB_0; // @[BPU.scala 41:{69,69}]
  wire [31:0] _GEN_2 = 4'h2 == EXE_B_index ? BTB_2 : _GEN_1; // @[BPU.scala 41:{69,69}]
  wire [31:0] _GEN_3 = 4'h3 == EXE_B_index ? BTB_3 : _GEN_2; // @[BPU.scala 41:{69,69}]
  wire [31:0] _GEN_4 = 4'h4 == EXE_B_index ? BTB_4 : _GEN_3; // @[BPU.scala 41:{69,69}]
  wire [31:0] _GEN_5 = 4'h5 == EXE_B_index ? BTB_5 : _GEN_4; // @[BPU.scala 41:{69,69}]
  wire [31:0] _GEN_6 = 4'h6 == EXE_B_index ? BTB_6 : _GEN_5; // @[BPU.scala 41:{69,69}]
  wire [31:0] _GEN_7 = 4'h7 == EXE_B_index ? BTB_7 : _GEN_6; // @[BPU.scala 41:{69,69}]
  wire [31:0] _GEN_8 = 4'h8 == EXE_B_index ? BTB_8 : _GEN_7; // @[BPU.scala 41:{69,69}]
  wire [31:0] _GEN_9 = 4'h9 == EXE_B_index ? BTB_9 : _GEN_8; // @[BPU.scala 41:{69,69}]
  wire [31:0] _GEN_10 = 4'ha == EXE_B_index ? BTB_10 : _GEN_9; // @[BPU.scala 41:{69,69}]
  wire [31:0] _GEN_11 = 4'hb == EXE_B_index ? BTB_11 : _GEN_10; // @[BPU.scala 41:{69,69}]
  wire [31:0] _GEN_12 = 4'hc == EXE_B_index ? BTB_12 : _GEN_11; // @[BPU.scala 41:{69,69}]
  wire [31:0] _GEN_13 = 4'hd == EXE_B_index ? BTB_13 : _GEN_12; // @[BPU.scala 41:{69,69}]
  wire [31:0] _GEN_14 = 4'he == EXE_B_index ? BTB_14 : _GEN_13; // @[BPU.scala 41:{69,69}]
  wire [31:0] _GEN_15 = 4'hf == EXE_B_index ? BTB_15 : _GEN_14; // @[BPU.scala 41:{69,69}]
  wire  _GEN_17 = 4'h1 == IF_B_index ? BTB_valid_1 : BTB_valid_0; // @[BPU.scala 42:{39,39}]
  wire  _GEN_18 = 4'h2 == IF_B_index ? BTB_valid_2 : _GEN_17; // @[BPU.scala 42:{39,39}]
  wire  _GEN_19 = 4'h3 == IF_B_index ? BTB_valid_3 : _GEN_18; // @[BPU.scala 42:{39,39}]
  wire  _GEN_20 = 4'h4 == IF_B_index ? BTB_valid_4 : _GEN_19; // @[BPU.scala 42:{39,39}]
  wire  _GEN_21 = 4'h5 == IF_B_index ? BTB_valid_5 : _GEN_20; // @[BPU.scala 42:{39,39}]
  wire  _GEN_22 = 4'h6 == IF_B_index ? BTB_valid_6 : _GEN_21; // @[BPU.scala 42:{39,39}]
  wire  _GEN_23 = 4'h7 == IF_B_index ? BTB_valid_7 : _GEN_22; // @[BPU.scala 42:{39,39}]
  wire  _GEN_24 = 4'h8 == IF_B_index ? BTB_valid_8 : _GEN_23; // @[BPU.scala 42:{39,39}]
  wire  _GEN_25 = 4'h9 == IF_B_index ? BTB_valid_9 : _GEN_24; // @[BPU.scala 42:{39,39}]
  wire  _GEN_26 = 4'ha == IF_B_index ? BTB_valid_10 : _GEN_25; // @[BPU.scala 42:{39,39}]
  wire  _GEN_27 = 4'hb == IF_B_index ? BTB_valid_11 : _GEN_26; // @[BPU.scala 42:{39,39}]
  wire  _GEN_28 = 4'hc == IF_B_index ? BTB_valid_12 : _GEN_27; // @[BPU.scala 42:{39,39}]
  wire  _GEN_29 = 4'hd == IF_B_index ? BTB_valid_13 : _GEN_28; // @[BPU.scala 42:{39,39}]
  wire  _GEN_30 = 4'he == IF_B_index ? BTB_valid_14 : _GEN_29; // @[BPU.scala 42:{39,39}]
  wire  _GEN_31 = 4'hf == IF_B_index ? BTB_valid_15 : _GEN_30; // @[BPU.scala 42:{39,39}]
  wire [1:0] _GEN_33 = 4'h1 == IF_B_index ? BHT_1 : BHT_0; // @[BPU.scala 42:{74,74}]
  wire [1:0] _GEN_34 = 4'h2 == IF_B_index ? BHT_2 : _GEN_33; // @[BPU.scala 42:{74,74}]
  wire [1:0] _GEN_35 = 4'h3 == IF_B_index ? BHT_3 : _GEN_34; // @[BPU.scala 42:{74,74}]
  wire [1:0] _GEN_36 = 4'h4 == IF_B_index ? BHT_4 : _GEN_35; // @[BPU.scala 42:{74,74}]
  wire [1:0] _GEN_37 = 4'h5 == IF_B_index ? BHT_5 : _GEN_36; // @[BPU.scala 42:{74,74}]
  wire [1:0] _GEN_38 = 4'h6 == IF_B_index ? BHT_6 : _GEN_37; // @[BPU.scala 42:{74,74}]
  wire [1:0] _GEN_39 = 4'h7 == IF_B_index ? BHT_7 : _GEN_38; // @[BPU.scala 42:{74,74}]
  wire [1:0] _GEN_40 = 4'h8 == IF_B_index ? BHT_8 : _GEN_39; // @[BPU.scala 42:{74,74}]
  wire [1:0] _GEN_41 = 4'h9 == IF_B_index ? BHT_9 : _GEN_40; // @[BPU.scala 42:{74,74}]
  wire [1:0] _GEN_42 = 4'ha == IF_B_index ? BHT_10 : _GEN_41; // @[BPU.scala 42:{74,74}]
  wire [1:0] _GEN_43 = 4'hb == IF_B_index ? BHT_11 : _GEN_42; // @[BPU.scala 42:{74,74}]
  wire [1:0] _GEN_44 = 4'hc == IF_B_index ? BHT_12 : _GEN_43; // @[BPU.scala 42:{74,74}]
  wire [1:0] _GEN_45 = 4'hd == IF_B_index ? BHT_13 : _GEN_44; // @[BPU.scala 42:{74,74}]
  wire [1:0] _GEN_46 = 4'he == IF_B_index ? BHT_14 : _GEN_45; // @[BPU.scala 42:{74,74}]
  wire [1:0] _GEN_47 = 4'hf == IF_B_index ? BHT_15 : _GEN_46; // @[BPU.scala 42:{74,74}]
  wire [31:0] _io_next_pc_T = last_predict ? last_pc : io_jb_pc; // @[BPU.scala 46:41]
  wire [31:0] _io_next_pc_T_2 = io_IF_pc + 32'h4; // @[BPU.scala 48:59]
  wire [31:0] _GEN_49 = 4'h1 == IF_B_index ? BTB_1 : BTB_0; // @[BPU.scala 48:{20,20}]
  wire [31:0] _GEN_50 = 4'h2 == IF_B_index ? BTB_2 : _GEN_49; // @[BPU.scala 48:{20,20}]
  wire [31:0] _GEN_51 = 4'h3 == IF_B_index ? BTB_3 : _GEN_50; // @[BPU.scala 48:{20,20}]
  wire [31:0] _GEN_52 = 4'h4 == IF_B_index ? BTB_4 : _GEN_51; // @[BPU.scala 48:{20,20}]
  wire [31:0] _GEN_53 = 4'h5 == IF_B_index ? BTB_5 : _GEN_52; // @[BPU.scala 48:{20,20}]
  wire [31:0] _GEN_54 = 4'h6 == IF_B_index ? BTB_6 : _GEN_53; // @[BPU.scala 48:{20,20}]
  wire [31:0] _GEN_55 = 4'h7 == IF_B_index ? BTB_7 : _GEN_54; // @[BPU.scala 48:{20,20}]
  wire [31:0] _GEN_56 = 4'h8 == IF_B_index ? BTB_8 : _GEN_55; // @[BPU.scala 48:{20,20}]
  wire [31:0] _GEN_57 = 4'h9 == IF_B_index ? BTB_9 : _GEN_56; // @[BPU.scala 48:{20,20}]
  wire [31:0] _GEN_58 = 4'ha == IF_B_index ? BTB_10 : _GEN_57; // @[BPU.scala 48:{20,20}]
  wire [31:0] _GEN_59 = 4'hb == IF_B_index ? BTB_11 : _GEN_58; // @[BPU.scala 48:{20,20}]
  wire [31:0] _GEN_60 = 4'hc == IF_B_index ? BTB_12 : _GEN_59; // @[BPU.scala 48:{20,20}]
  wire [31:0] _GEN_61 = 4'hd == IF_B_index ? BTB_13 : _GEN_60; // @[BPU.scala 48:{20,20}]
  wire [31:0] _GEN_62 = 4'he == IF_B_index ? BTB_14 : _GEN_61; // @[BPU.scala 48:{20,20}]
  wire [31:0] _GEN_63 = 4'hf == IF_B_index ? BTB_15 : _GEN_62; // @[BPU.scala 48:{20,20}]
  wire [31:0] _io_next_pc_T_3 = io_predict ? _GEN_63 : _io_next_pc_T_2; // @[BPU.scala 48:20]
  wire [31:0] _io_next_pc_T_4 = io_BTB_miss ? io_jb_pc : _io_next_pc_T_3; // @[BPU.scala 47:20]
  wire [31:0] _io_next_pc_T_5 = io_predict_miss ? _io_next_pc_T : _io_next_pc_T_4; // @[BPU.scala 46:20]
  wire [1:0] _GEN_69 = 4'h1 == EXE_B_index ? BHT_1 : BHT_0; // @[BPU.scala 65:{56,56}]
  wire [1:0] _GEN_70 = 4'h2 == EXE_B_index ? BHT_2 : _GEN_69; // @[BPU.scala 65:{56,56}]
  wire [1:0] _GEN_71 = 4'h3 == EXE_B_index ? BHT_3 : _GEN_70; // @[BPU.scala 65:{56,56}]
  wire [1:0] _GEN_72 = 4'h4 == EXE_B_index ? BHT_4 : _GEN_71; // @[BPU.scala 65:{56,56}]
  wire [1:0] _GEN_73 = 4'h5 == EXE_B_index ? BHT_5 : _GEN_72; // @[BPU.scala 65:{56,56}]
  wire [1:0] _GEN_74 = 4'h6 == EXE_B_index ? BHT_6 : _GEN_73; // @[BPU.scala 65:{56,56}]
  wire [1:0] _GEN_75 = 4'h7 == EXE_B_index ? BHT_7 : _GEN_74; // @[BPU.scala 65:{56,56}]
  wire [1:0] _GEN_76 = 4'h8 == EXE_B_index ? BHT_8 : _GEN_75; // @[BPU.scala 65:{56,56}]
  wire [1:0] _GEN_77 = 4'h9 == EXE_B_index ? BHT_9 : _GEN_76; // @[BPU.scala 65:{56,56}]
  wire [1:0] _GEN_78 = 4'ha == EXE_B_index ? BHT_10 : _GEN_77; // @[BPU.scala 65:{56,56}]
  wire [1:0] _GEN_79 = 4'hb == EXE_B_index ? BHT_11 : _GEN_78; // @[BPU.scala 65:{56,56}]
  wire [1:0] _GEN_80 = 4'hc == EXE_B_index ? BHT_12 : _GEN_79; // @[BPU.scala 65:{56,56}]
  wire [1:0] _GEN_81 = 4'hd == EXE_B_index ? BHT_13 : _GEN_80; // @[BPU.scala 65:{56,56}]
  wire [1:0] _GEN_82 = 4'he == EXE_B_index ? BHT_14 : _GEN_81; // @[BPU.scala 65:{56,56}]
  wire [1:0] _GEN_83 = 4'hf == EXE_B_index ? BHT_15 : _GEN_82; // @[BPU.scala 65:{56,56}]
  wire [1:0] _BHT_T_2 = _GEN_83 + 2'h1; // @[BPU.scala 65:87]
  wire [1:0] _BHT_T_3 = _GEN_83 == 2'h3 ? 2'h3 : _BHT_T_2; // @[BPU.scala 65:38]
  wire [1:0] _GEN_84 = 4'h0 == EXE_B_index ? _BHT_T_3 : BHT_0; // @[BPU.scala 26:30 65:{32,32}]
  wire [1:0] _GEN_85 = 4'h1 == EXE_B_index ? _BHT_T_3 : BHT_1; // @[BPU.scala 26:30 65:{32,32}]
  wire [1:0] _GEN_86 = 4'h2 == EXE_B_index ? _BHT_T_3 : BHT_2; // @[BPU.scala 26:30 65:{32,32}]
  wire [1:0] _GEN_87 = 4'h3 == EXE_B_index ? _BHT_T_3 : BHT_3; // @[BPU.scala 26:30 65:{32,32}]
  wire [1:0] _GEN_88 = 4'h4 == EXE_B_index ? _BHT_T_3 : BHT_4; // @[BPU.scala 26:30 65:{32,32}]
  wire [1:0] _GEN_89 = 4'h5 == EXE_B_index ? _BHT_T_3 : BHT_5; // @[BPU.scala 26:30 65:{32,32}]
  wire [1:0] _GEN_90 = 4'h6 == EXE_B_index ? _BHT_T_3 : BHT_6; // @[BPU.scala 26:30 65:{32,32}]
  wire [1:0] _GEN_91 = 4'h7 == EXE_B_index ? _BHT_T_3 : BHT_7; // @[BPU.scala 26:30 65:{32,32}]
  wire [1:0] _GEN_92 = 4'h8 == EXE_B_index ? _BHT_T_3 : BHT_8; // @[BPU.scala 26:30 65:{32,32}]
  wire [1:0] _GEN_93 = 4'h9 == EXE_B_index ? _BHT_T_3 : BHT_9; // @[BPU.scala 26:30 65:{32,32}]
  wire [1:0] _GEN_94 = 4'ha == EXE_B_index ? _BHT_T_3 : BHT_10; // @[BPU.scala 26:30 65:{32,32}]
  wire [1:0] _GEN_95 = 4'hb == EXE_B_index ? _BHT_T_3 : BHT_11; // @[BPU.scala 26:30 65:{32,32}]
  wire [1:0] _GEN_96 = 4'hc == EXE_B_index ? _BHT_T_3 : BHT_12; // @[BPU.scala 26:30 65:{32,32}]
  wire [1:0] _GEN_97 = 4'hd == EXE_B_index ? _BHT_T_3 : BHT_13; // @[BPU.scala 26:30 65:{32,32}]
  wire [1:0] _GEN_98 = 4'he == EXE_B_index ? _BHT_T_3 : BHT_14; // @[BPU.scala 26:30 65:{32,32}]
  wire [1:0] _GEN_99 = 4'hf == EXE_B_index ? _BHT_T_3 : BHT_15; // @[BPU.scala 26:30 65:{32,32}]
  wire [31:0] _GEN_100 = 4'h0 == EXE_B_index ? io_jb_pc : BTB_0; // @[BPU.scala 27:30 66:{32,32}]
  wire [31:0] _GEN_101 = 4'h1 == EXE_B_index ? io_jb_pc : BTB_1; // @[BPU.scala 27:30 66:{32,32}]
  wire [31:0] _GEN_102 = 4'h2 == EXE_B_index ? io_jb_pc : BTB_2; // @[BPU.scala 27:30 66:{32,32}]
  wire [31:0] _GEN_103 = 4'h3 == EXE_B_index ? io_jb_pc : BTB_3; // @[BPU.scala 27:30 66:{32,32}]
  wire [31:0] _GEN_104 = 4'h4 == EXE_B_index ? io_jb_pc : BTB_4; // @[BPU.scala 27:30 66:{32,32}]
  wire [31:0] _GEN_105 = 4'h5 == EXE_B_index ? io_jb_pc : BTB_5; // @[BPU.scala 27:30 66:{32,32}]
  wire [31:0] _GEN_106 = 4'h6 == EXE_B_index ? io_jb_pc : BTB_6; // @[BPU.scala 27:30 66:{32,32}]
  wire [31:0] _GEN_107 = 4'h7 == EXE_B_index ? io_jb_pc : BTB_7; // @[BPU.scala 27:30 66:{32,32}]
  wire [31:0] _GEN_108 = 4'h8 == EXE_B_index ? io_jb_pc : BTB_8; // @[BPU.scala 27:30 66:{32,32}]
  wire [31:0] _GEN_109 = 4'h9 == EXE_B_index ? io_jb_pc : BTB_9; // @[BPU.scala 27:30 66:{32,32}]
  wire [31:0] _GEN_110 = 4'ha == EXE_B_index ? io_jb_pc : BTB_10; // @[BPU.scala 27:30 66:{32,32}]
  wire [31:0] _GEN_111 = 4'hb == EXE_B_index ? io_jb_pc : BTB_11; // @[BPU.scala 27:30 66:{32,32}]
  wire [31:0] _GEN_112 = 4'hc == EXE_B_index ? io_jb_pc : BTB_12; // @[BPU.scala 27:30 66:{32,32}]
  wire [31:0] _GEN_113 = 4'hd == EXE_B_index ? io_jb_pc : BTB_13; // @[BPU.scala 27:30 66:{32,32}]
  wire [31:0] _GEN_114 = 4'he == EXE_B_index ? io_jb_pc : BTB_14; // @[BPU.scala 27:30 66:{32,32}]
  wire [31:0] _GEN_115 = 4'hf == EXE_B_index ? io_jb_pc : BTB_15; // @[BPU.scala 27:30 66:{32,32}]
  wire  _GEN_116 = 4'h0 == EXE_B_index | BTB_valid_0; // @[BPU.scala 28:30 67:{32,32}]
  wire  _GEN_117 = 4'h1 == EXE_B_index | BTB_valid_1; // @[BPU.scala 28:30 67:{32,32}]
  wire  _GEN_118 = 4'h2 == EXE_B_index | BTB_valid_2; // @[BPU.scala 28:30 67:{32,32}]
  wire  _GEN_119 = 4'h3 == EXE_B_index | BTB_valid_3; // @[BPU.scala 28:30 67:{32,32}]
  wire  _GEN_120 = 4'h4 == EXE_B_index | BTB_valid_4; // @[BPU.scala 28:30 67:{32,32}]
  wire  _GEN_121 = 4'h5 == EXE_B_index | BTB_valid_5; // @[BPU.scala 28:30 67:{32,32}]
  wire  _GEN_122 = 4'h6 == EXE_B_index | BTB_valid_6; // @[BPU.scala 28:30 67:{32,32}]
  wire  _GEN_123 = 4'h7 == EXE_B_index | BTB_valid_7; // @[BPU.scala 28:30 67:{32,32}]
  wire  _GEN_124 = 4'h8 == EXE_B_index | BTB_valid_8; // @[BPU.scala 28:30 67:{32,32}]
  wire  _GEN_125 = 4'h9 == EXE_B_index | BTB_valid_9; // @[BPU.scala 28:30 67:{32,32}]
  wire  _GEN_126 = 4'ha == EXE_B_index | BTB_valid_10; // @[BPU.scala 28:30 67:{32,32}]
  wire  _GEN_127 = 4'hb == EXE_B_index | BTB_valid_11; // @[BPU.scala 28:30 67:{32,32}]
  wire  _GEN_128 = 4'hc == EXE_B_index | BTB_valid_12; // @[BPU.scala 28:30 67:{32,32}]
  wire  _GEN_129 = 4'hd == EXE_B_index | BTB_valid_13; // @[BPU.scala 28:30 67:{32,32}]
  wire  _GEN_130 = 4'he == EXE_B_index | BTB_valid_14; // @[BPU.scala 28:30 67:{32,32}]
  wire  _GEN_131 = 4'hf == EXE_B_index | BTB_valid_15; // @[BPU.scala 28:30 67:{32,32}]
  wire [1:0] _BHT_T_6 = _GEN_83 - 2'h1; // @[BPU.scala 69:87]
  wire [1:0] _BHT_T_7 = _GEN_83 == 2'h0 ? 2'h0 : _BHT_T_6; // @[BPU.scala 69:38]
  wire [1:0] _GEN_132 = 4'h0 == EXE_B_index ? _BHT_T_7 : BHT_0; // @[BPU.scala 26:30 69:{32,32}]
  wire [1:0] _GEN_133 = 4'h1 == EXE_B_index ? _BHT_T_7 : BHT_1; // @[BPU.scala 26:30 69:{32,32}]
  wire [1:0] _GEN_134 = 4'h2 == EXE_B_index ? _BHT_T_7 : BHT_2; // @[BPU.scala 26:30 69:{32,32}]
  wire [1:0] _GEN_135 = 4'h3 == EXE_B_index ? _BHT_T_7 : BHT_3; // @[BPU.scala 26:30 69:{32,32}]
  wire [1:0] _GEN_136 = 4'h4 == EXE_B_index ? _BHT_T_7 : BHT_4; // @[BPU.scala 26:30 69:{32,32}]
  wire [1:0] _GEN_137 = 4'h5 == EXE_B_index ? _BHT_T_7 : BHT_5; // @[BPU.scala 26:30 69:{32,32}]
  wire [1:0] _GEN_138 = 4'h6 == EXE_B_index ? _BHT_T_7 : BHT_6; // @[BPU.scala 26:30 69:{32,32}]
  wire [1:0] _GEN_139 = 4'h7 == EXE_B_index ? _BHT_T_7 : BHT_7; // @[BPU.scala 26:30 69:{32,32}]
  wire [1:0] _GEN_140 = 4'h8 == EXE_B_index ? _BHT_T_7 : BHT_8; // @[BPU.scala 26:30 69:{32,32}]
  wire [1:0] _GEN_141 = 4'h9 == EXE_B_index ? _BHT_T_7 : BHT_9; // @[BPU.scala 26:30 69:{32,32}]
  wire [1:0] _GEN_142 = 4'ha == EXE_B_index ? _BHT_T_7 : BHT_10; // @[BPU.scala 26:30 69:{32,32}]
  wire [1:0] _GEN_143 = 4'hb == EXE_B_index ? _BHT_T_7 : BHT_11; // @[BPU.scala 26:30 69:{32,32}]
  wire [1:0] _GEN_144 = 4'hc == EXE_B_index ? _BHT_T_7 : BHT_12; // @[BPU.scala 26:30 69:{32,32}]
  wire [1:0] _GEN_145 = 4'hd == EXE_B_index ? _BHT_T_7 : BHT_13; // @[BPU.scala 26:30 69:{32,32}]
  wire [1:0] _GEN_146 = 4'he == EXE_B_index ? _BHT_T_7 : BHT_14; // @[BPU.scala 26:30 69:{32,32}]
  wire [1:0] _GEN_147 = 4'hf == EXE_B_index ? _BHT_T_7 : BHT_15; // @[BPU.scala 26:30 69:{32,32}]
  wire [1:0] _GEN_148 = io_alu_out ? _GEN_84 : _GEN_132; // @[BPU.scala 64:23]
  wire [1:0] _GEN_149 = io_alu_out ? _GEN_85 : _GEN_133; // @[BPU.scala 64:23]
  wire [1:0] _GEN_150 = io_alu_out ? _GEN_86 : _GEN_134; // @[BPU.scala 64:23]
  wire [1:0] _GEN_151 = io_alu_out ? _GEN_87 : _GEN_135; // @[BPU.scala 64:23]
  wire [1:0] _GEN_152 = io_alu_out ? _GEN_88 : _GEN_136; // @[BPU.scala 64:23]
  wire [1:0] _GEN_153 = io_alu_out ? _GEN_89 : _GEN_137; // @[BPU.scala 64:23]
  wire [1:0] _GEN_154 = io_alu_out ? _GEN_90 : _GEN_138; // @[BPU.scala 64:23]
  wire [1:0] _GEN_155 = io_alu_out ? _GEN_91 : _GEN_139; // @[BPU.scala 64:23]
  wire [1:0] _GEN_156 = io_alu_out ? _GEN_92 : _GEN_140; // @[BPU.scala 64:23]
  wire [1:0] _GEN_157 = io_alu_out ? _GEN_93 : _GEN_141; // @[BPU.scala 64:23]
  wire [1:0] _GEN_158 = io_alu_out ? _GEN_94 : _GEN_142; // @[BPU.scala 64:23]
  wire [1:0] _GEN_159 = io_alu_out ? _GEN_95 : _GEN_143; // @[BPU.scala 64:23]
  wire [1:0] _GEN_160 = io_alu_out ? _GEN_96 : _GEN_144; // @[BPU.scala 64:23]
  wire [1:0] _GEN_161 = io_alu_out ? _GEN_97 : _GEN_145; // @[BPU.scala 64:23]
  wire [1:0] _GEN_162 = io_alu_out ? _GEN_98 : _GEN_146; // @[BPU.scala 64:23]
  wire [1:0] _GEN_163 = io_alu_out ? _GEN_99 : _GEN_147; // @[BPU.scala 64:23]
  wire [31:0] _GEN_164 = io_alu_out ? _GEN_100 : BTB_0; // @[BPU.scala 64:23 27:30]
  wire [31:0] _GEN_165 = io_alu_out ? _GEN_101 : BTB_1; // @[BPU.scala 64:23 27:30]
  wire [31:0] _GEN_166 = io_alu_out ? _GEN_102 : BTB_2; // @[BPU.scala 64:23 27:30]
  wire [31:0] _GEN_167 = io_alu_out ? _GEN_103 : BTB_3; // @[BPU.scala 64:23 27:30]
  wire [31:0] _GEN_168 = io_alu_out ? _GEN_104 : BTB_4; // @[BPU.scala 64:23 27:30]
  wire [31:0] _GEN_169 = io_alu_out ? _GEN_105 : BTB_5; // @[BPU.scala 64:23 27:30]
  wire [31:0] _GEN_170 = io_alu_out ? _GEN_106 : BTB_6; // @[BPU.scala 64:23 27:30]
  wire [31:0] _GEN_171 = io_alu_out ? _GEN_107 : BTB_7; // @[BPU.scala 64:23 27:30]
  wire [31:0] _GEN_172 = io_alu_out ? _GEN_108 : BTB_8; // @[BPU.scala 64:23 27:30]
  wire [31:0] _GEN_173 = io_alu_out ? _GEN_109 : BTB_9; // @[BPU.scala 64:23 27:30]
  wire [31:0] _GEN_174 = io_alu_out ? _GEN_110 : BTB_10; // @[BPU.scala 64:23 27:30]
  wire [31:0] _GEN_175 = io_alu_out ? _GEN_111 : BTB_11; // @[BPU.scala 64:23 27:30]
  wire [31:0] _GEN_176 = io_alu_out ? _GEN_112 : BTB_12; // @[BPU.scala 64:23 27:30]
  wire [31:0] _GEN_177 = io_alu_out ? _GEN_113 : BTB_13; // @[BPU.scala 64:23 27:30]
  wire [31:0] _GEN_178 = io_alu_out ? _GEN_114 : BTB_14; // @[BPU.scala 64:23 27:30]
  wire [31:0] _GEN_179 = io_alu_out ? _GEN_115 : BTB_15; // @[BPU.scala 64:23 27:30]
  wire  _GEN_180 = io_alu_out ? _GEN_116 : BTB_valid_0; // @[BPU.scala 64:23 28:30]
  wire  _GEN_181 = io_alu_out ? _GEN_117 : BTB_valid_1; // @[BPU.scala 64:23 28:30]
  wire  _GEN_182 = io_alu_out ? _GEN_118 : BTB_valid_2; // @[BPU.scala 64:23 28:30]
  wire  _GEN_183 = io_alu_out ? _GEN_119 : BTB_valid_3; // @[BPU.scala 64:23 28:30]
  wire  _GEN_184 = io_alu_out ? _GEN_120 : BTB_valid_4; // @[BPU.scala 64:23 28:30]
  wire  _GEN_185 = io_alu_out ? _GEN_121 : BTB_valid_5; // @[BPU.scala 64:23 28:30]
  wire  _GEN_186 = io_alu_out ? _GEN_122 : BTB_valid_6; // @[BPU.scala 64:23 28:30]
  wire  _GEN_187 = io_alu_out ? _GEN_123 : BTB_valid_7; // @[BPU.scala 64:23 28:30]
  wire  _GEN_188 = io_alu_out ? _GEN_124 : BTB_valid_8; // @[BPU.scala 64:23 28:30]
  wire  _GEN_189 = io_alu_out ? _GEN_125 : BTB_valid_9; // @[BPU.scala 64:23 28:30]
  wire  _GEN_190 = io_alu_out ? _GEN_126 : BTB_valid_10; // @[BPU.scala 64:23 28:30]
  wire  _GEN_191 = io_alu_out ? _GEN_127 : BTB_valid_11; // @[BPU.scala 64:23 28:30]
  wire  _GEN_192 = io_alu_out ? _GEN_128 : BTB_valid_12; // @[BPU.scala 64:23 28:30]
  wire  _GEN_193 = io_alu_out ? _GEN_129 : BTB_valid_13; // @[BPU.scala 64:23 28:30]
  wire  _GEN_194 = io_alu_out ? _GEN_130 : BTB_valid_14; // @[BPU.scala 64:23 28:30]
  wire  _GEN_195 = io_alu_out ? _GEN_131 : BTB_valid_15; // @[BPU.scala 64:23 28:30]
  assign io_predict = _GEN_31 & IF_is_B_type & _GEN_47 >= 2'h2; // @[BPU.scala 42:55]
  assign io_predict_miss = EXE_is_B_type & (last_predict ^ io_alu_out); // @[BPU.scala 43:36]
  assign io_BTB_miss = EXE_is_B_type & last_predict & _GEN_15 != io_jb_pc; // @[BPU.scala 41:48]
  assign io_next_pc = io_jump ? io_jb_pc : _io_next_pc_T_5; // @[BPU.scala 45:20]
  always @(posedge clock) begin
    if (reset) begin // @[BPU.scala 26:30]
      BHT_0 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BHT_0 <= _GEN_148;
      end else begin
        BHT_0 <= _GEN_148;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_1 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BHT_1 <= _GEN_149;
      end else begin
        BHT_1 <= _GEN_149;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_2 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BHT_2 <= _GEN_150;
      end else begin
        BHT_2 <= _GEN_150;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_3 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BHT_3 <= _GEN_151;
      end else begin
        BHT_3 <= _GEN_151;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_4 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BHT_4 <= _GEN_152;
      end else begin
        BHT_4 <= _GEN_152;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_5 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BHT_5 <= _GEN_153;
      end else begin
        BHT_5 <= _GEN_153;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_6 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BHT_6 <= _GEN_154;
      end else begin
        BHT_6 <= _GEN_154;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_7 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BHT_7 <= _GEN_155;
      end else begin
        BHT_7 <= _GEN_155;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_8 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BHT_8 <= _GEN_156;
      end else begin
        BHT_8 <= _GEN_156;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_9 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BHT_9 <= _GEN_157;
      end else begin
        BHT_9 <= _GEN_157;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_10 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BHT_10 <= _GEN_158;
      end else begin
        BHT_10 <= _GEN_158;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_11 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BHT_11 <= _GEN_159;
      end else begin
        BHT_11 <= _GEN_159;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_12 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BHT_12 <= _GEN_160;
      end else begin
        BHT_12 <= _GEN_160;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_13 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BHT_13 <= _GEN_161;
      end else begin
        BHT_13 <= _GEN_161;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_14 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BHT_14 <= _GEN_162;
      end else begin
        BHT_14 <= _GEN_162;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_15 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BHT_15 <= _GEN_163;
      end else begin
        BHT_15 <= _GEN_163;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_0 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BTB_0 <= _GEN_164;
      end else begin
        BTB_0 <= _GEN_164;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_1 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BTB_1 <= _GEN_165;
      end else begin
        BTB_1 <= _GEN_165;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_2 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BTB_2 <= _GEN_166;
      end else begin
        BTB_2 <= _GEN_166;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_3 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BTB_3 <= _GEN_167;
      end else begin
        BTB_3 <= _GEN_167;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_4 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BTB_4 <= _GEN_168;
      end else begin
        BTB_4 <= _GEN_168;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_5 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BTB_5 <= _GEN_169;
      end else begin
        BTB_5 <= _GEN_169;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_6 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BTB_6 <= _GEN_170;
      end else begin
        BTB_6 <= _GEN_170;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_7 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BTB_7 <= _GEN_171;
      end else begin
        BTB_7 <= _GEN_171;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_8 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BTB_8 <= _GEN_172;
      end else begin
        BTB_8 <= _GEN_172;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_9 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BTB_9 <= _GEN_173;
      end else begin
        BTB_9 <= _GEN_173;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_10 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BTB_10 <= _GEN_174;
      end else begin
        BTB_10 <= _GEN_174;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_11 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BTB_11 <= _GEN_175;
      end else begin
        BTB_11 <= _GEN_175;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_12 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BTB_12 <= _GEN_176;
      end else begin
        BTB_12 <= _GEN_176;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_13 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BTB_13 <= _GEN_177;
      end else begin
        BTB_13 <= _GEN_177;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_14 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BTB_14 <= _GEN_178;
      end else begin
        BTB_14 <= _GEN_178;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_15 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BTB_15 <= _GEN_179;
      end else begin
        BTB_15 <= _GEN_179;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_0 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BTB_valid_0 <= _GEN_180;
      end else begin
        BTB_valid_0 <= _GEN_180;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_1 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BTB_valid_1 <= _GEN_181;
      end else begin
        BTB_valid_1 <= _GEN_181;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_2 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BTB_valid_2 <= _GEN_182;
      end else begin
        BTB_valid_2 <= _GEN_182;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_3 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BTB_valid_3 <= _GEN_183;
      end else begin
        BTB_valid_3 <= _GEN_183;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_4 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BTB_valid_4 <= _GEN_184;
      end else begin
        BTB_valid_4 <= _GEN_184;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_5 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BTB_valid_5 <= _GEN_185;
      end else begin
        BTB_valid_5 <= _GEN_185;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_6 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BTB_valid_6 <= _GEN_186;
      end else begin
        BTB_valid_6 <= _GEN_186;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_7 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BTB_valid_7 <= _GEN_187;
      end else begin
        BTB_valid_7 <= _GEN_187;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_8 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BTB_valid_8 <= _GEN_188;
      end else begin
        BTB_valid_8 <= _GEN_188;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_9 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BTB_valid_9 <= _GEN_189;
      end else begin
        BTB_valid_9 <= _GEN_189;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_10 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BTB_valid_10 <= _GEN_190;
      end else begin
        BTB_valid_10 <= _GEN_190;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_11 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BTB_valid_11 <= _GEN_191;
      end else begin
        BTB_valid_11 <= _GEN_191;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_12 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BTB_valid_12 <= _GEN_192;
      end else begin
        BTB_valid_12 <= _GEN_192;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_13 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BTB_valid_13 <= _GEN_193;
      end else begin
        BTB_valid_13 <= _GEN_193;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_14 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BTB_valid_14 <= _GEN_194;
      end else begin
        BTB_valid_14 <= _GEN_194;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_15 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 62:23]
      if (last_predict) begin // @[BPU.scala 63:24]
        BTB_valid_15 <= _GEN_195;
      end else begin
        BTB_valid_15 <= _GEN_195;
      end
    end
    if (reset) begin // @[BPU.scala 30:30]
      delay <= 1'h0; // @[BPU.scala 30:30]
    end else if (!(io_stall)) begin // @[BPU.scala 50:18]
      delay <= io_predict; // @[BPU.scala 56:18]
    end
    if (reset) begin // @[BPU.scala 31:30]
      last_predict <= 1'h0; // @[BPU.scala 31:30]
    end else if (!(io_stall)) begin // @[BPU.scala 50:18]
      last_predict <= delay; // @[BPU.scala 57:18]
    end
    if (reset) begin // @[BPU.scala 32:30]
      delay_pc <= 32'h0; // @[BPU.scala 32:30]
    end else if (!(io_stall)) begin // @[BPU.scala 50:18]
      delay_pc <= _io_next_pc_T_2; // @[BPU.scala 58:18]
    end
    if (reset) begin // @[BPU.scala 33:30]
      last_pc <= 32'h0; // @[BPU.scala 33:30]
    end else if (!(io_stall)) begin // @[BPU.scala 50:18]
      last_pc <= delay_pc; // @[BPU.scala 59:18]
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
  BHT_0 = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  BHT_1 = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  BHT_2 = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  BHT_3 = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  BHT_4 = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  BHT_5 = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  BHT_6 = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  BHT_7 = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  BHT_8 = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  BHT_9 = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  BHT_10 = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  BHT_11 = _RAND_11[1:0];
  _RAND_12 = {1{`RANDOM}};
  BHT_12 = _RAND_12[1:0];
  _RAND_13 = {1{`RANDOM}};
  BHT_13 = _RAND_13[1:0];
  _RAND_14 = {1{`RANDOM}};
  BHT_14 = _RAND_14[1:0];
  _RAND_15 = {1{`RANDOM}};
  BHT_15 = _RAND_15[1:0];
  _RAND_16 = {1{`RANDOM}};
  BTB_0 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  BTB_1 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  BTB_2 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  BTB_3 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  BTB_4 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  BTB_5 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  BTB_6 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  BTB_7 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  BTB_8 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  BTB_9 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  BTB_10 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  BTB_11 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  BTB_12 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  BTB_13 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  BTB_14 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  BTB_15 = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  BTB_valid_0 = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  BTB_valid_1 = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  BTB_valid_2 = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  BTB_valid_3 = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  BTB_valid_4 = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  BTB_valid_5 = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  BTB_valid_6 = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  BTB_valid_7 = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  BTB_valid_8 = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  BTB_valid_9 = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  BTB_valid_10 = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  BTB_valid_11 = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  BTB_valid_12 = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  BTB_valid_13 = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  BTB_valid_14 = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  BTB_valid_15 = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  delay = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  last_predict = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  delay_pc = _RAND_50[31:0];
  _RAND_51 = {1{`RANDOM}};
  last_pc = _RAND_51[31:0];
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
  input         io_mem_read_test,
  input  [31:0] io_mem_addr_test,
  output [31:0] io_mem_data_test,
  output        io_EXE_Branch,
  output        io_BTB_miss,
  output        io_Predict_miss
);
  wire  reg_pc_clock; // @[Top.scala 19:33]
  wire  reg_pc_reset; // @[Top.scala 19:33]
  wire  reg_pc_io_stall; // @[Top.scala 19:33]
  wire [31:0] reg_pc_io_next_pc; // @[Top.scala 19:33]
  wire [31:0] reg_pc_io_current_pc; // @[Top.scala 19:33]
  wire  im_clock; // @[Top.scala 20:33]
  wire [15:0] im_io_address; // @[Top.scala 20:33]
  wire [31:0] im_io_read_data; // @[Top.scala 20:33]
  wire  reg_d_clock; // @[Top.scala 21:33]
  wire  reg_d_reset; // @[Top.scala 21:33]
  wire  reg_d_io_stall; // @[Top.scala 21:33]
  wire  reg_d_io_jb; // @[Top.scala 21:33]
  wire [31:0] reg_d_io_pc; // @[Top.scala 21:33]
  wire [31:0] reg_d_io_inst; // @[Top.scala 21:33]
  wire [31:0] reg_d_io_out_Reg_D_pc; // @[Top.scala 21:33]
  wire [31:0] reg_d_io_out_Reg_D_inst; // @[Top.scala 21:33]
  wire [31:0] decoder_io_inst; // @[Top.scala 22:33]
  wire [4:0] decoder_io_dc_out_opcode; // @[Top.scala 22:33]
  wire [2:0] decoder_io_dc_out_func3; // @[Top.scala 22:33]
  wire  decoder_io_dc_out_func7; // @[Top.scala 22:33]
  wire [4:0] decoder_io_dc_out_rs1_index; // @[Top.scala 22:33]
  wire [4:0] decoder_io_dc_out_rs2_index; // @[Top.scala 22:33]
  wire [4:0] decoder_io_dc_out_rd_index; // @[Top.scala 22:33]
  wire [31:0] imm_ext_io_inst; // @[Top.scala 23:33]
  wire [31:0] imm_ext_io_imm_ext_out; // @[Top.scala 23:33]
  wire  regfile_clock; // @[Top.scala 24:33]
  wire  regfile_reset; // @[Top.scala 24:33]
  wire  regfile_io_wb_en; // @[Top.scala 24:33]
  wire [31:0] regfile_io_wb_data; // @[Top.scala 24:33]
  wire [4:0] regfile_io_rd_index; // @[Top.scala 24:33]
  wire [4:0] regfile_io_rs1_index; // @[Top.scala 24:33]
  wire [4:0] regfile_io_rs2_index; // @[Top.scala 24:33]
  wire [31:0] regfile_io_rs1_data_out; // @[Top.scala 24:33]
  wire [31:0] regfile_io_rs2_data_out; // @[Top.scala 24:33]
  wire  reg_e_clock; // @[Top.scala 25:33]
  wire  reg_e_reset; // @[Top.scala 25:33]
  wire  reg_e_io_stall; // @[Top.scala 25:33]
  wire  reg_e_io_jb; // @[Top.scala 25:33]
  wire [31:0] reg_e_io_pc; // @[Top.scala 25:33]
  wire [31:0] reg_e_io_rs1_data; // @[Top.scala 25:33]
  wire [31:0] reg_e_io_rs2_data; // @[Top.scala 25:33]
  wire [31:0] reg_e_io_sext_imme; // @[Top.scala 25:33]
  wire [31:0] reg_e_io_out_Reg_E_pc; // @[Top.scala 25:33]
  wire [31:0] reg_e_io_out_Reg_E_rs1_data; // @[Top.scala 25:33]
  wire [31:0] reg_e_io_out_Reg_E_rs2_data; // @[Top.scala 25:33]
  wire [31:0] reg_e_io_out_Reg_E_sext_imme; // @[Top.scala 25:33]
  wire [4:0] alu_io_opcode; // @[Top.scala 26:33]
  wire [2:0] alu_io_func3; // @[Top.scala 26:33]
  wire  alu_io_func7; // @[Top.scala 26:33]
  wire [31:0] alu_io_operand1; // @[Top.scala 26:33]
  wire [31:0] alu_io_operand2; // @[Top.scala 26:33]
  wire [31:0] alu_io_alu_out; // @[Top.scala 26:33]
  wire [31:0] jb_unit_io_operand1; // @[Top.scala 27:33]
  wire [31:0] jb_unit_io_operand2; // @[Top.scala 27:33]
  wire [31:0] jb_unit_io_jb_out; // @[Top.scala 27:33]
  wire  reg_m_clock; // @[Top.scala 28:33]
  wire  reg_m_reset; // @[Top.scala 28:33]
  wire [31:0] reg_m_io_alu_out; // @[Top.scala 28:33]
  wire [31:0] reg_m_io_rs2_data; // @[Top.scala 28:33]
  wire [31:0] reg_m_io_out_Reg_M_alu_out; // @[Top.scala 28:33]
  wire [31:0] reg_m_io_out_Reg_M_rs2_data; // @[Top.scala 28:33]
  wire  dm_clock; // @[Top.scala 29:33]
  wire [3:0] dm_io_w_en; // @[Top.scala 29:33]
  wire [15:0] dm_io_address; // @[Top.scala 29:33]
  wire [31:0] dm_io_write_data; // @[Top.scala 29:33]
  wire [31:0] dm_io_read_data; // @[Top.scala 29:33]
  wire  dm_io_mem_read_test; // @[Top.scala 29:33]
  wire [31:0] dm_io_mem_addr_test; // @[Top.scala 29:33]
  wire [31:0] dm_io_mem_data_test; // @[Top.scala 29:33]
  wire  reg_w_clock; // @[Top.scala 30:33]
  wire  reg_w_reset; // @[Top.scala 30:33]
  wire [31:0] reg_w_io_alu_out; // @[Top.scala 30:33]
  wire [31:0] reg_w_io_rs2_data; // @[Top.scala 30:33]
  wire [31:0] reg_w_io_out_Reg_M_alu_out; // @[Top.scala 30:33]
  wire [31:0] reg_w_io_out_Reg_M_rs2_data; // @[Top.scala 30:33]
  wire [2:0] Ld_filter_io_func3; // @[Top.scala 31:33]
  wire [31:0] Ld_filter_io_ld_data; // @[Top.scala 31:33]
  wire [31:0] Ld_filter_io_ld_data_f; // @[Top.scala 31:33]
  wire  controller_clock; // @[Top.scala 32:33]
  wire  controller_reset; // @[Top.scala 32:33]
  wire [4:0] controller_io_op; // @[Top.scala 32:33]
  wire [2:0] controller_io_f3; // @[Top.scala 32:33]
  wire [4:0] controller_io_rd; // @[Top.scala 32:33]
  wire [4:0] controller_io_rs1; // @[Top.scala 32:33]
  wire [4:0] controller_io_rs2; // @[Top.scala 32:33]
  wire  controller_io_f7; // @[Top.scala 32:33]
  wire  controller_io_predict_miss; // @[Top.scala 32:33]
  wire  controller_io_BTB_miss; // @[Top.scala 32:33]
  wire  controller_io_stall; // @[Top.scala 32:33]
  wire  controller_io_next_pc_sel; // @[Top.scala 32:33]
  wire  controller_io_D_rs1_data_sel; // @[Top.scala 32:33]
  wire  controller_io_D_rs2_data_sel; // @[Top.scala 32:33]
  wire [1:0] controller_io_E_rs1_data_sel; // @[Top.scala 32:33]
  wire [1:0] controller_io_E_rs2_data_sel; // @[Top.scala 32:33]
  wire  controller_io_E_jb_op1_sel; // @[Top.scala 32:33]
  wire  controller_io_E_alu_op1_sel; // @[Top.scala 32:33]
  wire  controller_io_E_alu_op2_sel; // @[Top.scala 32:33]
  wire [4:0] controller_io_E_op; // @[Top.scala 32:33]
  wire [2:0] controller_io_E_f3; // @[Top.scala 32:33]
  wire  controller_io_E_f7; // @[Top.scala 32:33]
  wire [3:0] controller_io_M_dm_w_en; // @[Top.scala 32:33]
  wire  controller_io_W_wb_en; // @[Top.scala 32:33]
  wire [4:0] controller_io_W_rd_index; // @[Top.scala 32:33]
  wire [2:0] controller_io_W_f3; // @[Top.scala 32:33]
  wire  controller_io_W_wb_data_sel; // @[Top.scala 32:33]
  wire  BPU_clock; // @[Top.scala 33:33]
  wire  BPU_reset; // @[Top.scala 33:33]
  wire [31:0] BPU_io_IF_pc; // @[Top.scala 33:33]
  wire [31:0] BPU_io_IF_inst; // @[Top.scala 33:33]
  wire [31:0] BPU_io_EXE_pc; // @[Top.scala 33:33]
  wire [4:0] BPU_io_EXE_op; // @[Top.scala 33:33]
  wire  BPU_io_alu_out; // @[Top.scala 33:33]
  wire  BPU_io_stall; // @[Top.scala 33:33]
  wire  BPU_io_jump; // @[Top.scala 33:33]
  wire [31:0] BPU_io_jb_pc; // @[Top.scala 33:33]
  wire  BPU_io_predict; // @[Top.scala 33:33]
  wire  BPU_io_predict_miss; // @[Top.scala 33:33]
  wire  BPU_io_BTB_miss; // @[Top.scala 33:33]
  wire [31:0] BPU_io_next_pc; // @[Top.scala 33:33]
  wire [4:0] E_op = controller_io_E_op; // @[Top.scala 257:33 99:39]
  wire [31:0] alu_out = alu_io_alu_out; // @[Top.scala 205:33 67:39]
  wire [31:0] out_pc_reg = reg_pc_io_current_pc; // @[Top.scala 132:33 40:39]
  wire  next_pc_sel = controller_io_next_pc_sel; // @[Top.scala 248:33 88:39]
  wire  predict_miss = BPU_io_predict_miss; // @[Top.scala 125:33 84:39]
  wire  _reg_d_io_jb_T = next_pc_sel | predict_miss; // @[Top.scala 142:48]
  wire  BTB_miss = BPU_io_BTB_miss; // @[Top.scala 126:33 85:39]
  wire  W_wb_sel = controller_io_W_wb_data_sel; // @[Top.scala 108:39 264:33]
  wire [31:0] out_Reg_W_alu_out = reg_w_io_out_Reg_M_alu_out; // @[Top.scala 229:33 74:39]
  wire [31:0] ld_data_f = Ld_filter_io_ld_data_f; // @[Top.scala 235:33 75:39]
  wire [31:0] wb_data = W_wb_sel ? out_Reg_W_alu_out : ld_data_f; // @[Top.scala 162:39]
  wire  D_rs1_data_sel = controller_io_D_rs1_data_sel; // @[Top.scala 250:33 91:39]
  wire [31:0] out_reg_file_rs1_data = regfile_io_rs1_data_out; // @[Top.scala 168:33 57:39]
  wire  D_rs2_data_sel = controller_io_D_rs2_data_sel; // @[Top.scala 251:33 92:39]
  wire [31:0] out_reg_file_rs2_data = regfile_io_rs2_data_out; // @[Top.scala 169:33 58:39]
  wire [1:0] E_rs1_data_sel = controller_io_E_rs1_data_sel; // @[Top.scala 252:33 94:39]
  wire [31:0] alu_out_forward = reg_m_io_out_Reg_M_alu_out; // @[Top.scala 217:33 68:39]
  wire [31:0] _rs1_data_final_T_3 = 2'h1 == E_rs1_data_sel ? alu_out_forward : wb_data; // @[Mux.scala 81:58]
  wire [31:0] rs1_data = reg_e_io_out_Reg_E_rs1_data; // @[Top.scala 181:33 61:39]
  wire [31:0] rs1_data_final = 2'h2 == E_rs1_data_sel ? rs1_data : _rs1_data_final_T_3; // @[Mux.scala 81:58]
  wire [1:0] E_rs2_data_sel = controller_io_E_rs2_data_sel; // @[Top.scala 253:33 95:39]
  wire [31:0] _rs2_data_final_T_3 = 2'h1 == E_rs2_data_sel ? alu_out_forward : wb_data; // @[Mux.scala 81:58]
  wire [31:0] rs2_data = reg_e_io_out_Reg_E_rs2_data; // @[Top.scala 182:33 62:39]
  wire [31:0] rs2_data_final = 2'h2 == E_rs2_data_sel ? rs2_data : _rs2_data_final_T_3; // @[Mux.scala 81:58]
  wire  E_alu_op1_sel = controller_io_E_alu_op1_sel; // @[Top.scala 255:33 97:39]
  wire [31:0] out_Reg_E_pc = reg_e_io_out_Reg_E_pc; // @[Top.scala 180:33 42:39]
  wire  E_alu_op2_sel = controller_io_E_alu_op2_sel; // @[Top.scala 256:33 98:39]
  wire [31:0] out_Reg_E_sext_imme = reg_e_io_out_Reg_E_sext_imme; // @[Top.scala 183:33 55:39]
  wire  E_jb_op1_sel = controller_io_E_jb_op1_sel; // @[Top.scala 254:33 96:39]
  Reg_PC reg_pc ( // @[Top.scala 19:33]
    .clock(reg_pc_clock),
    .reset(reg_pc_reset),
    .io_stall(reg_pc_io_stall),
    .io_next_pc(reg_pc_io_next_pc),
    .io_current_pc(reg_pc_io_current_pc)
  );
  SRAM im ( // @[Top.scala 20:33]
    .clock(im_clock),
    .io_address(im_io_address),
    .io_read_data(im_io_read_data)
  );
  Reg_D reg_d ( // @[Top.scala 21:33]
    .clock(reg_d_clock),
    .reset(reg_d_reset),
    .io_stall(reg_d_io_stall),
    .io_jb(reg_d_io_jb),
    .io_pc(reg_d_io_pc),
    .io_inst(reg_d_io_inst),
    .io_out_Reg_D_pc(reg_d_io_out_Reg_D_pc),
    .io_out_Reg_D_inst(reg_d_io_out_Reg_D_inst)
  );
  Decoder decoder ( // @[Top.scala 22:33]
    .io_inst(decoder_io_inst),
    .io_dc_out_opcode(decoder_io_dc_out_opcode),
    .io_dc_out_func3(decoder_io_dc_out_func3),
    .io_dc_out_func7(decoder_io_dc_out_func7),
    .io_dc_out_rs1_index(decoder_io_dc_out_rs1_index),
    .io_dc_out_rs2_index(decoder_io_dc_out_rs2_index),
    .io_dc_out_rd_index(decoder_io_dc_out_rd_index)
  );
  Imm_Ext imm_ext ( // @[Top.scala 23:33]
    .io_inst(imm_ext_io_inst),
    .io_imm_ext_out(imm_ext_io_imm_ext_out)
  );
  RegFile regfile ( // @[Top.scala 24:33]
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
  Reg_E reg_e ( // @[Top.scala 25:33]
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
  ALU alu ( // @[Top.scala 26:33]
    .io_opcode(alu_io_opcode),
    .io_func3(alu_io_func3),
    .io_func7(alu_io_func7),
    .io_operand1(alu_io_operand1),
    .io_operand2(alu_io_operand2),
    .io_alu_out(alu_io_alu_out)
  );
  JB_Unit jb_unit ( // @[Top.scala 27:33]
    .io_operand1(jb_unit_io_operand1),
    .io_operand2(jb_unit_io_operand2),
    .io_jb_out(jb_unit_io_jb_out)
  );
  Reg_M reg_m ( // @[Top.scala 28:33]
    .clock(reg_m_clock),
    .reset(reg_m_reset),
    .io_alu_out(reg_m_io_alu_out),
    .io_rs2_data(reg_m_io_rs2_data),
    .io_out_Reg_M_alu_out(reg_m_io_out_Reg_M_alu_out),
    .io_out_Reg_M_rs2_data(reg_m_io_out_Reg_M_rs2_data)
  );
  SRAM_dm dm ( // @[Top.scala 29:33]
    .clock(dm_clock),
    .io_w_en(dm_io_w_en),
    .io_address(dm_io_address),
    .io_write_data(dm_io_write_data),
    .io_read_data(dm_io_read_data),
    .io_mem_read_test(dm_io_mem_read_test),
    .io_mem_addr_test(dm_io_mem_addr_test),
    .io_mem_data_test(dm_io_mem_data_test)
  );
  Reg_M reg_w ( // @[Top.scala 30:33]
    .clock(reg_w_clock),
    .reset(reg_w_reset),
    .io_alu_out(reg_w_io_alu_out),
    .io_rs2_data(reg_w_io_rs2_data),
    .io_out_Reg_M_alu_out(reg_w_io_out_Reg_M_alu_out),
    .io_out_Reg_M_rs2_data(reg_w_io_out_Reg_M_rs2_data)
  );
  LD_Filter Ld_filter ( // @[Top.scala 31:33]
    .io_func3(Ld_filter_io_func3),
    .io_ld_data(Ld_filter_io_ld_data),
    .io_ld_data_f(Ld_filter_io_ld_data_f)
  );
  Controller controller ( // @[Top.scala 32:33]
    .clock(controller_clock),
    .reset(controller_reset),
    .io_op(controller_io_op),
    .io_f3(controller_io_f3),
    .io_rd(controller_io_rd),
    .io_rs1(controller_io_rs1),
    .io_rs2(controller_io_rs2),
    .io_f7(controller_io_f7),
    .io_predict_miss(controller_io_predict_miss),
    .io_BTB_miss(controller_io_BTB_miss),
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
  BPU BPU ( // @[Top.scala 33:33]
    .clock(BPU_clock),
    .reset(BPU_reset),
    .io_IF_pc(BPU_io_IF_pc),
    .io_IF_inst(BPU_io_IF_inst),
    .io_EXE_pc(BPU_io_EXE_pc),
    .io_EXE_op(BPU_io_EXE_op),
    .io_alu_out(BPU_io_alu_out),
    .io_stall(BPU_io_stall),
    .io_jump(BPU_io_jump),
    .io_jb_pc(BPU_io_jb_pc),
    .io_predict(BPU_io_predict),
    .io_predict_miss(BPU_io_predict_miss),
    .io_BTB_miss(BPU_io_BTB_miss),
    .io_next_pc(BPU_io_next_pc)
  );
  assign io_mem_data_test = dm_io_mem_data_test; // @[Top.scala 271:33]
  assign io_EXE_Branch = E_op == 5'h18; // @[Top.scala 113:42]
  assign io_BTB_miss = BPU_io_BTB_miss; // @[Top.scala 126:33 85:39]
  assign io_Predict_miss = BPU_io_predict_miss; // @[Top.scala 125:33 84:39]
  assign reg_pc_clock = clock;
  assign reg_pc_reset = reset;
  assign reg_pc_io_stall = controller_io_stall; // @[Top.scala 247:33 89:39]
  assign reg_pc_io_next_pc = BPU_io_next_pc; // @[Top.scala 127:33 39:39]
  assign im_clock = clock;
  assign im_io_address = out_pc_reg[15:0]; // @[Top.scala 136:46]
  assign reg_d_clock = clock;
  assign reg_d_reset = reset;
  assign reg_d_io_stall = controller_io_stall; // @[Top.scala 247:33 89:39]
  assign reg_d_io_jb = next_pc_sel | predict_miss | BTB_miss; // @[Top.scala 142:64]
  assign reg_d_io_pc = reg_pc_io_current_pc; // @[Top.scala 132:33 40:39]
  assign reg_d_io_inst = im_io_read_data; // @[Top.scala 138:33 44:39]
  assign decoder_io_inst = reg_d_io_out_Reg_D_inst; // @[Top.scala 146:33 45:39]
  assign imm_ext_io_inst = reg_d_io_out_Reg_D_inst; // @[Top.scala 146:33 45:39]
  assign regfile_clock = clock;
  assign regfile_reset = reset;
  assign regfile_io_wb_en = controller_io_W_wb_en; // @[Top.scala 105:39 261:33]
  assign regfile_io_wb_data = W_wb_sel ? out_Reg_W_alu_out : ld_data_f; // @[Top.scala 162:39]
  assign regfile_io_rd_index = controller_io_W_rd_index; // @[Top.scala 106:39 262:33]
  assign regfile_io_rs1_index = decoder_io_dc_out_rs1_index; // @[Top.scala 153:33 50:39]
  assign regfile_io_rs2_index = decoder_io_dc_out_rs2_index; // @[Top.scala 154:33 51:39]
  assign reg_e_clock = clock;
  assign reg_e_reset = reset;
  assign reg_e_io_stall = controller_io_stall; // @[Top.scala 247:33 89:39]
  assign reg_e_io_jb = _reg_d_io_jb_T | BTB_miss; // @[Top.scala 175:64]
  assign reg_e_io_pc = reg_d_io_out_Reg_D_pc; // @[Top.scala 145:33 41:39]
  assign reg_e_io_rs1_data = D_rs1_data_sel ? wb_data : out_reg_file_rs1_data; // @[Top.scala 172:39]
  assign reg_e_io_rs2_data = D_rs2_data_sel ? wb_data : out_reg_file_rs2_data; // @[Top.scala 173:39]
  assign reg_e_io_sext_imme = imm_ext_io_imm_ext_out; // @[Top.scala 159:33 54:39]
  assign alu_io_opcode = controller_io_E_op; // @[Top.scala 257:33 99:39]
  assign alu_io_func3 = controller_io_E_f3; // @[Top.scala 100:39 258:33]
  assign alu_io_func7 = controller_io_E_f7; // @[Top.scala 101:39 259:33]
  assign alu_io_operand1 = E_alu_op1_sel ? rs1_data_final : out_Reg_E_pc; // @[Top.scala 196:39]
  assign alu_io_operand2 = E_alu_op2_sel ? rs2_data_final : out_Reg_E_sext_imme; // @[Top.scala 197:39]
  assign jb_unit_io_operand1 = E_jb_op1_sel ? rs1_data_final : out_Reg_E_pc; // @[Top.scala 207:39]
  assign jb_unit_io_operand2 = reg_e_io_out_Reg_E_sext_imme; // @[Top.scala 183:33 55:39]
  assign reg_m_clock = clock;
  assign reg_m_reset = reset;
  assign reg_m_io_alu_out = alu_io_alu_out; // @[Top.scala 205:33 67:39]
  assign reg_m_io_rs2_data = 2'h2 == E_rs2_data_sel ? rs2_data : _rs2_data_final_T_3; // @[Mux.scala 81:58]
  assign dm_clock = clock;
  assign dm_io_w_en = controller_io_M_dm_w_en; // @[Top.scala 103:39 260:33]
  assign dm_io_address = alu_out_forward[15:0]; // @[Top.scala 222:51]
  assign dm_io_write_data = reg_m_io_out_Reg_M_rs2_data; // @[Top.scala 218:33 70:39]
  assign dm_io_mem_read_test = io_mem_read_test; // @[Top.scala 269:33]
  assign dm_io_mem_addr_test = io_mem_addr_test; // @[Top.scala 270:33]
  assign reg_w_clock = clock;
  assign reg_w_reset = reset;
  assign reg_w_io_alu_out = reg_m_io_out_Reg_M_alu_out; // @[Top.scala 217:33 68:39]
  assign reg_w_io_rs2_data = dm_io_read_data; // @[Top.scala 224:33 72:39]
  assign Ld_filter_io_func3 = controller_io_W_f3; // @[Top.scala 107:39 263:33]
  assign Ld_filter_io_ld_data = reg_w_io_out_Reg_M_rs2_data; // @[Top.scala 230:33 73:39]
  assign controller_clock = clock;
  assign controller_reset = reset;
  assign controller_io_op = decoder_io_dc_out_opcode; // @[Top.scala 150:33 47:39]
  assign controller_io_f3 = decoder_io_dc_out_func3; // @[Top.scala 151:33 48:39]
  assign controller_io_rd = decoder_io_dc_out_rd_index; // @[Top.scala 155:33 52:39]
  assign controller_io_rs1 = decoder_io_dc_out_rs1_index; // @[Top.scala 153:33 50:39]
  assign controller_io_rs2 = decoder_io_dc_out_rs2_index; // @[Top.scala 154:33 51:39]
  assign controller_io_f7 = decoder_io_dc_out_func7; // @[Top.scala 152:33 49:39]
  assign controller_io_predict_miss = BPU_io_predict_miss; // @[Top.scala 125:33 84:39]
  assign controller_io_BTB_miss = BPU_io_BTB_miss; // @[Top.scala 126:33 85:39]
  assign BPU_clock = clock;
  assign BPU_reset = reset;
  assign BPU_io_IF_pc = reg_pc_io_current_pc; // @[Top.scala 132:33 40:39]
  assign BPU_io_IF_inst = im_io_read_data; // @[Top.scala 138:33 44:39]
  assign BPU_io_EXE_pc = reg_e_io_out_Reg_E_pc; // @[Top.scala 180:33 42:39]
  assign BPU_io_EXE_op = controller_io_E_op; // @[Top.scala 257:33 99:39]
  assign BPU_io_alu_out = alu_out[0]; // @[Top.scala 120:43]
  assign BPU_io_stall = controller_io_stall; // @[Top.scala 247:33 89:39]
  assign BPU_io_jump = controller_io_next_pc_sel; // @[Top.scala 248:33 88:39]
  assign BPU_io_jb_pc = jb_unit_io_jb_out; // @[Top.scala 212:33 77:39]
endmodule
