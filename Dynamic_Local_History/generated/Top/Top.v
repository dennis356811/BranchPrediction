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
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [31:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_107;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] BHT_0; // @[BPU.scala 27:30]
  reg [1:0] BHT_1; // @[BPU.scala 27:30]
  reg [1:0] BHT_2; // @[BPU.scala 27:30]
  reg [1:0] BHT_3; // @[BPU.scala 27:30]
  reg [1:0] BHT_4; // @[BPU.scala 27:30]
  reg [1:0] BHT_5; // @[BPU.scala 27:30]
  reg [1:0] BHT_6; // @[BPU.scala 27:30]
  reg [1:0] BHT_7; // @[BPU.scala 27:30]
  reg [1:0] BHT_8; // @[BPU.scala 27:30]
  reg [1:0] BHT_9; // @[BPU.scala 27:30]
  reg [1:0] BHT_10; // @[BPU.scala 27:30]
  reg [1:0] BHT_11; // @[BPU.scala 27:30]
  reg [1:0] BHT_12; // @[BPU.scala 27:30]
  reg [1:0] BHT_13; // @[BPU.scala 27:30]
  reg [1:0] BHT_14; // @[BPU.scala 27:30]
  reg [1:0] BHT_15; // @[BPU.scala 27:30]
  reg [1:0] BHT_16; // @[BPU.scala 27:30]
  reg [1:0] BHT_17; // @[BPU.scala 27:30]
  reg [1:0] BHT_18; // @[BPU.scala 27:30]
  reg [1:0] BHT_19; // @[BPU.scala 27:30]
  reg [1:0] BHT_20; // @[BPU.scala 27:30]
  reg [1:0] BHT_21; // @[BPU.scala 27:30]
  reg [1:0] BHT_22; // @[BPU.scala 27:30]
  reg [1:0] BHT_23; // @[BPU.scala 27:30]
  reg [1:0] BHT_24; // @[BPU.scala 27:30]
  reg [1:0] BHT_25; // @[BPU.scala 27:30]
  reg [1:0] BHT_26; // @[BPU.scala 27:30]
  reg [1:0] BHT_27; // @[BPU.scala 27:30]
  reg [1:0] BHT_28; // @[BPU.scala 27:30]
  reg [1:0] BHT_29; // @[BPU.scala 27:30]
  reg [1:0] BHT_30; // @[BPU.scala 27:30]
  reg [1:0] BHT_31; // @[BPU.scala 27:30]
  reg [31:0] BTB_0; // @[BPU.scala 28:30]
  reg [31:0] BTB_1; // @[BPU.scala 28:30]
  reg [31:0] BTB_2; // @[BPU.scala 28:30]
  reg [31:0] BTB_3; // @[BPU.scala 28:30]
  reg [31:0] BTB_4; // @[BPU.scala 28:30]
  reg [31:0] BTB_5; // @[BPU.scala 28:30]
  reg [31:0] BTB_6; // @[BPU.scala 28:30]
  reg [31:0] BTB_7; // @[BPU.scala 28:30]
  reg [31:0] BTB_8; // @[BPU.scala 28:30]
  reg [31:0] BTB_9; // @[BPU.scala 28:30]
  reg [31:0] BTB_10; // @[BPU.scala 28:30]
  reg [31:0] BTB_11; // @[BPU.scala 28:30]
  reg [31:0] BTB_12; // @[BPU.scala 28:30]
  reg [31:0] BTB_13; // @[BPU.scala 28:30]
  reg [31:0] BTB_14; // @[BPU.scala 28:30]
  reg [31:0] BTB_15; // @[BPU.scala 28:30]
  reg [31:0] BTB_16; // @[BPU.scala 28:30]
  reg [31:0] BTB_17; // @[BPU.scala 28:30]
  reg [31:0] BTB_18; // @[BPU.scala 28:30]
  reg [31:0] BTB_19; // @[BPU.scala 28:30]
  reg [31:0] BTB_20; // @[BPU.scala 28:30]
  reg [31:0] BTB_21; // @[BPU.scala 28:30]
  reg [31:0] BTB_22; // @[BPU.scala 28:30]
  reg [31:0] BTB_23; // @[BPU.scala 28:30]
  reg [31:0] BTB_24; // @[BPU.scala 28:30]
  reg [31:0] BTB_25; // @[BPU.scala 28:30]
  reg [31:0] BTB_26; // @[BPU.scala 28:30]
  reg [31:0] BTB_27; // @[BPU.scala 28:30]
  reg [31:0] BTB_28; // @[BPU.scala 28:30]
  reg [31:0] BTB_29; // @[BPU.scala 28:30]
  reg [31:0] BTB_30; // @[BPU.scala 28:30]
  reg [31:0] BTB_31; // @[BPU.scala 28:30]
  reg  BTB_valid_0; // @[BPU.scala 29:30]
  reg  BTB_valid_1; // @[BPU.scala 29:30]
  reg  BTB_valid_2; // @[BPU.scala 29:30]
  reg  BTB_valid_3; // @[BPU.scala 29:30]
  reg  BTB_valid_4; // @[BPU.scala 29:30]
  reg  BTB_valid_5; // @[BPU.scala 29:30]
  reg  BTB_valid_6; // @[BPU.scala 29:30]
  reg  BTB_valid_7; // @[BPU.scala 29:30]
  reg  BTB_valid_8; // @[BPU.scala 29:30]
  reg  BTB_valid_9; // @[BPU.scala 29:30]
  reg  BTB_valid_10; // @[BPU.scala 29:30]
  reg  BTB_valid_11; // @[BPU.scala 29:30]
  reg  BTB_valid_12; // @[BPU.scala 29:30]
  reg  BTB_valid_13; // @[BPU.scala 29:30]
  reg  BTB_valid_14; // @[BPU.scala 29:30]
  reg  BTB_valid_15; // @[BPU.scala 29:30]
  reg  BTB_valid_16; // @[BPU.scala 29:30]
  reg  BTB_valid_17; // @[BPU.scala 29:30]
  reg  BTB_valid_18; // @[BPU.scala 29:30]
  reg  BTB_valid_19; // @[BPU.scala 29:30]
  reg  BTB_valid_20; // @[BPU.scala 29:30]
  reg  BTB_valid_21; // @[BPU.scala 29:30]
  reg  BTB_valid_22; // @[BPU.scala 29:30]
  reg  BTB_valid_23; // @[BPU.scala 29:30]
  reg  BTB_valid_24; // @[BPU.scala 29:30]
  reg  BTB_valid_25; // @[BPU.scala 29:30]
  reg  BTB_valid_26; // @[BPU.scala 29:30]
  reg  BTB_valid_27; // @[BPU.scala 29:30]
  reg  BTB_valid_28; // @[BPU.scala 29:30]
  reg  BTB_valid_29; // @[BPU.scala 29:30]
  reg  BTB_valid_30; // @[BPU.scala 29:30]
  reg  BTB_valid_31; // @[BPU.scala 29:30]
  reg [4:0] LHT_0; // @[BPU.scala 30:30]
  reg [4:0] LHT_1; // @[BPU.scala 30:30]
  reg [4:0] LHT_2; // @[BPU.scala 30:30]
  reg [4:0] LHT_3; // @[BPU.scala 30:30]
  reg [4:0] LHT_4; // @[BPU.scala 30:30]
  reg [4:0] LHT_5; // @[BPU.scala 30:30]
  reg [4:0] LHT_6; // @[BPU.scala 30:30]
  reg [4:0] LHT_7; // @[BPU.scala 30:30]
  reg  delay; // @[BPU.scala 32:30]
  reg  last_predict; // @[BPU.scala 33:30]
  reg [31:0] delay_pc; // @[BPU.scala 34:30]
  reg [31:0] last_pc; // @[BPU.scala 35:30]
  wire  IF_is_B_type = io_IF_inst[6:0] == 7'h63; // @[BPU.scala 37:40]
  wire  EXE_is_B_type = io_EXE_op == 5'h18; // @[BPU.scala 38:33]
  wire [4:0] _GEN_1 = 3'h1 == io_EXE_pc[4:2] ? LHT_1 : LHT_0; // @[BPU.scala 43:{75,75}]
  wire [4:0] _GEN_2 = 3'h2 == io_EXE_pc[4:2] ? LHT_2 : _GEN_1; // @[BPU.scala 43:{75,75}]
  wire [4:0] _GEN_3 = 3'h3 == io_EXE_pc[4:2] ? LHT_3 : _GEN_2; // @[BPU.scala 43:{75,75}]
  wire [4:0] _GEN_4 = 3'h4 == io_EXE_pc[4:2] ? LHT_4 : _GEN_3; // @[BPU.scala 43:{75,75}]
  wire [4:0] _GEN_5 = 3'h5 == io_EXE_pc[4:2] ? LHT_5 : _GEN_4; // @[BPU.scala 43:{75,75}]
  wire [4:0] _GEN_6 = 3'h6 == io_EXE_pc[4:2] ? LHT_6 : _GEN_5; // @[BPU.scala 43:{75,75}]
  wire [4:0] _GEN_7 = 3'h7 == io_EXE_pc[4:2] ? LHT_7 : _GEN_6; // @[BPU.scala 43:{75,75}]
  wire [31:0] _GEN_9 = 5'h1 == _GEN_7 ? BTB_1 : BTB_0; // @[BPU.scala 43:{75,75}]
  wire [31:0] _GEN_10 = 5'h2 == _GEN_7 ? BTB_2 : _GEN_9; // @[BPU.scala 43:{75,75}]
  wire [31:0] _GEN_11 = 5'h3 == _GEN_7 ? BTB_3 : _GEN_10; // @[BPU.scala 43:{75,75}]
  wire [31:0] _GEN_12 = 5'h4 == _GEN_7 ? BTB_4 : _GEN_11; // @[BPU.scala 43:{75,75}]
  wire [31:0] _GEN_13 = 5'h5 == _GEN_7 ? BTB_5 : _GEN_12; // @[BPU.scala 43:{75,75}]
  wire [31:0] _GEN_14 = 5'h6 == _GEN_7 ? BTB_6 : _GEN_13; // @[BPU.scala 43:{75,75}]
  wire [31:0] _GEN_15 = 5'h7 == _GEN_7 ? BTB_7 : _GEN_14; // @[BPU.scala 43:{75,75}]
  wire [31:0] _GEN_16 = 5'h8 == _GEN_7 ? BTB_8 : _GEN_15; // @[BPU.scala 43:{75,75}]
  wire [31:0] _GEN_17 = 5'h9 == _GEN_7 ? BTB_9 : _GEN_16; // @[BPU.scala 43:{75,75}]
  wire [31:0] _GEN_18 = 5'ha == _GEN_7 ? BTB_10 : _GEN_17; // @[BPU.scala 43:{75,75}]
  wire [31:0] _GEN_19 = 5'hb == _GEN_7 ? BTB_11 : _GEN_18; // @[BPU.scala 43:{75,75}]
  wire [31:0] _GEN_20 = 5'hc == _GEN_7 ? BTB_12 : _GEN_19; // @[BPU.scala 43:{75,75}]
  wire [31:0] _GEN_21 = 5'hd == _GEN_7 ? BTB_13 : _GEN_20; // @[BPU.scala 43:{75,75}]
  wire [31:0] _GEN_22 = 5'he == _GEN_7 ? BTB_14 : _GEN_21; // @[BPU.scala 43:{75,75}]
  wire [31:0] _GEN_23 = 5'hf == _GEN_7 ? BTB_15 : _GEN_22; // @[BPU.scala 43:{75,75}]
  wire [31:0] _GEN_24 = 5'h10 == _GEN_7 ? BTB_16 : _GEN_23; // @[BPU.scala 43:{75,75}]
  wire [31:0] _GEN_25 = 5'h11 == _GEN_7 ? BTB_17 : _GEN_24; // @[BPU.scala 43:{75,75}]
  wire [31:0] _GEN_26 = 5'h12 == _GEN_7 ? BTB_18 : _GEN_25; // @[BPU.scala 43:{75,75}]
  wire [31:0] _GEN_27 = 5'h13 == _GEN_7 ? BTB_19 : _GEN_26; // @[BPU.scala 43:{75,75}]
  wire [31:0] _GEN_28 = 5'h14 == _GEN_7 ? BTB_20 : _GEN_27; // @[BPU.scala 43:{75,75}]
  wire [31:0] _GEN_29 = 5'h15 == _GEN_7 ? BTB_21 : _GEN_28; // @[BPU.scala 43:{75,75}]
  wire [31:0] _GEN_30 = 5'h16 == _GEN_7 ? BTB_22 : _GEN_29; // @[BPU.scala 43:{75,75}]
  wire [31:0] _GEN_31 = 5'h17 == _GEN_7 ? BTB_23 : _GEN_30; // @[BPU.scala 43:{75,75}]
  wire [31:0] _GEN_32 = 5'h18 == _GEN_7 ? BTB_24 : _GEN_31; // @[BPU.scala 43:{75,75}]
  wire [31:0] _GEN_33 = 5'h19 == _GEN_7 ? BTB_25 : _GEN_32; // @[BPU.scala 43:{75,75}]
  wire [31:0] _GEN_34 = 5'h1a == _GEN_7 ? BTB_26 : _GEN_33; // @[BPU.scala 43:{75,75}]
  wire [31:0] _GEN_35 = 5'h1b == _GEN_7 ? BTB_27 : _GEN_34; // @[BPU.scala 43:{75,75}]
  wire [31:0] _GEN_36 = 5'h1c == _GEN_7 ? BTB_28 : _GEN_35; // @[BPU.scala 43:{75,75}]
  wire [31:0] _GEN_37 = 5'h1d == _GEN_7 ? BTB_29 : _GEN_36; // @[BPU.scala 43:{75,75}]
  wire [31:0] _GEN_38 = 5'h1e == _GEN_7 ? BTB_30 : _GEN_37; // @[BPU.scala 43:{75,75}]
  wire [31:0] _GEN_39 = 5'h1f == _GEN_7 ? BTB_31 : _GEN_38; // @[BPU.scala 43:{75,75}]
  wire [4:0] _GEN_41 = 3'h1 == io_IF_pc[4:2] ? LHT_1 : LHT_0; // @[BPU.scala 44:{46,46}]
  wire [4:0] _GEN_42 = 3'h2 == io_IF_pc[4:2] ? LHT_2 : _GEN_41; // @[BPU.scala 44:{46,46}]
  wire [4:0] _GEN_43 = 3'h3 == io_IF_pc[4:2] ? LHT_3 : _GEN_42; // @[BPU.scala 44:{46,46}]
  wire [4:0] _GEN_44 = 3'h4 == io_IF_pc[4:2] ? LHT_4 : _GEN_43; // @[BPU.scala 44:{46,46}]
  wire [4:0] _GEN_45 = 3'h5 == io_IF_pc[4:2] ? LHT_5 : _GEN_44; // @[BPU.scala 44:{46,46}]
  wire [4:0] _GEN_46 = 3'h6 == io_IF_pc[4:2] ? LHT_6 : _GEN_45; // @[BPU.scala 44:{46,46}]
  wire [4:0] _GEN_47 = 3'h7 == io_IF_pc[4:2] ? LHT_7 : _GEN_46; // @[BPU.scala 44:{46,46}]
  wire  _GEN_49 = 5'h1 == _GEN_47 ? BTB_valid_1 : BTB_valid_0; // @[BPU.scala 44:{46,46}]
  wire  _GEN_50 = 5'h2 == _GEN_47 ? BTB_valid_2 : _GEN_49; // @[BPU.scala 44:{46,46}]
  wire  _GEN_51 = 5'h3 == _GEN_47 ? BTB_valid_3 : _GEN_50; // @[BPU.scala 44:{46,46}]
  wire  _GEN_52 = 5'h4 == _GEN_47 ? BTB_valid_4 : _GEN_51; // @[BPU.scala 44:{46,46}]
  wire  _GEN_53 = 5'h5 == _GEN_47 ? BTB_valid_5 : _GEN_52; // @[BPU.scala 44:{46,46}]
  wire  _GEN_54 = 5'h6 == _GEN_47 ? BTB_valid_6 : _GEN_53; // @[BPU.scala 44:{46,46}]
  wire  _GEN_55 = 5'h7 == _GEN_47 ? BTB_valid_7 : _GEN_54; // @[BPU.scala 44:{46,46}]
  wire  _GEN_56 = 5'h8 == _GEN_47 ? BTB_valid_8 : _GEN_55; // @[BPU.scala 44:{46,46}]
  wire  _GEN_57 = 5'h9 == _GEN_47 ? BTB_valid_9 : _GEN_56; // @[BPU.scala 44:{46,46}]
  wire  _GEN_58 = 5'ha == _GEN_47 ? BTB_valid_10 : _GEN_57; // @[BPU.scala 44:{46,46}]
  wire  _GEN_59 = 5'hb == _GEN_47 ? BTB_valid_11 : _GEN_58; // @[BPU.scala 44:{46,46}]
  wire  _GEN_60 = 5'hc == _GEN_47 ? BTB_valid_12 : _GEN_59; // @[BPU.scala 44:{46,46}]
  wire  _GEN_61 = 5'hd == _GEN_47 ? BTB_valid_13 : _GEN_60; // @[BPU.scala 44:{46,46}]
  wire  _GEN_62 = 5'he == _GEN_47 ? BTB_valid_14 : _GEN_61; // @[BPU.scala 44:{46,46}]
  wire  _GEN_63 = 5'hf == _GEN_47 ? BTB_valid_15 : _GEN_62; // @[BPU.scala 44:{46,46}]
  wire  _GEN_64 = 5'h10 == _GEN_47 ? BTB_valid_16 : _GEN_63; // @[BPU.scala 44:{46,46}]
  wire  _GEN_65 = 5'h11 == _GEN_47 ? BTB_valid_17 : _GEN_64; // @[BPU.scala 44:{46,46}]
  wire  _GEN_66 = 5'h12 == _GEN_47 ? BTB_valid_18 : _GEN_65; // @[BPU.scala 44:{46,46}]
  wire  _GEN_67 = 5'h13 == _GEN_47 ? BTB_valid_19 : _GEN_66; // @[BPU.scala 44:{46,46}]
  wire  _GEN_68 = 5'h14 == _GEN_47 ? BTB_valid_20 : _GEN_67; // @[BPU.scala 44:{46,46}]
  wire  _GEN_69 = 5'h15 == _GEN_47 ? BTB_valid_21 : _GEN_68; // @[BPU.scala 44:{46,46}]
  wire  _GEN_70 = 5'h16 == _GEN_47 ? BTB_valid_22 : _GEN_69; // @[BPU.scala 44:{46,46}]
  wire  _GEN_71 = 5'h17 == _GEN_47 ? BTB_valid_23 : _GEN_70; // @[BPU.scala 44:{46,46}]
  wire  _GEN_72 = 5'h18 == _GEN_47 ? BTB_valid_24 : _GEN_71; // @[BPU.scala 44:{46,46}]
  wire  _GEN_73 = 5'h19 == _GEN_47 ? BTB_valid_25 : _GEN_72; // @[BPU.scala 44:{46,46}]
  wire  _GEN_74 = 5'h1a == _GEN_47 ? BTB_valid_26 : _GEN_73; // @[BPU.scala 44:{46,46}]
  wire  _GEN_75 = 5'h1b == _GEN_47 ? BTB_valid_27 : _GEN_74; // @[BPU.scala 44:{46,46}]
  wire  _GEN_76 = 5'h1c == _GEN_47 ? BTB_valid_28 : _GEN_75; // @[BPU.scala 44:{46,46}]
  wire  _GEN_77 = 5'h1d == _GEN_47 ? BTB_valid_29 : _GEN_76; // @[BPU.scala 44:{46,46}]
  wire  _GEN_78 = 5'h1e == _GEN_47 ? BTB_valid_30 : _GEN_77; // @[BPU.scala 44:{46,46}]
  wire  _GEN_79 = 5'h1f == _GEN_47 ? BTB_valid_31 : _GEN_78; // @[BPU.scala 44:{46,46}]
  wire [1:0] _GEN_81 = 5'h1 == _GEN_47 ? BHT_1 : BHT_0; // @[BPU.scala 44:{81,81}]
  wire [1:0] _GEN_82 = 5'h2 == _GEN_47 ? BHT_2 : _GEN_81; // @[BPU.scala 44:{81,81}]
  wire [1:0] _GEN_83 = 5'h3 == _GEN_47 ? BHT_3 : _GEN_82; // @[BPU.scala 44:{81,81}]
  wire [1:0] _GEN_84 = 5'h4 == _GEN_47 ? BHT_4 : _GEN_83; // @[BPU.scala 44:{81,81}]
  wire [1:0] _GEN_85 = 5'h5 == _GEN_47 ? BHT_5 : _GEN_84; // @[BPU.scala 44:{81,81}]
  wire [1:0] _GEN_86 = 5'h6 == _GEN_47 ? BHT_6 : _GEN_85; // @[BPU.scala 44:{81,81}]
  wire [1:0] _GEN_87 = 5'h7 == _GEN_47 ? BHT_7 : _GEN_86; // @[BPU.scala 44:{81,81}]
  wire [1:0] _GEN_88 = 5'h8 == _GEN_47 ? BHT_8 : _GEN_87; // @[BPU.scala 44:{81,81}]
  wire [1:0] _GEN_89 = 5'h9 == _GEN_47 ? BHT_9 : _GEN_88; // @[BPU.scala 44:{81,81}]
  wire [1:0] _GEN_90 = 5'ha == _GEN_47 ? BHT_10 : _GEN_89; // @[BPU.scala 44:{81,81}]
  wire [1:0] _GEN_91 = 5'hb == _GEN_47 ? BHT_11 : _GEN_90; // @[BPU.scala 44:{81,81}]
  wire [1:0] _GEN_92 = 5'hc == _GEN_47 ? BHT_12 : _GEN_91; // @[BPU.scala 44:{81,81}]
  wire [1:0] _GEN_93 = 5'hd == _GEN_47 ? BHT_13 : _GEN_92; // @[BPU.scala 44:{81,81}]
  wire [1:0] _GEN_94 = 5'he == _GEN_47 ? BHT_14 : _GEN_93; // @[BPU.scala 44:{81,81}]
  wire [1:0] _GEN_95 = 5'hf == _GEN_47 ? BHT_15 : _GEN_94; // @[BPU.scala 44:{81,81}]
  wire [1:0] _GEN_96 = 5'h10 == _GEN_47 ? BHT_16 : _GEN_95; // @[BPU.scala 44:{81,81}]
  wire [1:0] _GEN_97 = 5'h11 == _GEN_47 ? BHT_17 : _GEN_96; // @[BPU.scala 44:{81,81}]
  wire [1:0] _GEN_98 = 5'h12 == _GEN_47 ? BHT_18 : _GEN_97; // @[BPU.scala 44:{81,81}]
  wire [1:0] _GEN_99 = 5'h13 == _GEN_47 ? BHT_19 : _GEN_98; // @[BPU.scala 44:{81,81}]
  wire [1:0] _GEN_100 = 5'h14 == _GEN_47 ? BHT_20 : _GEN_99; // @[BPU.scala 44:{81,81}]
  wire [1:0] _GEN_101 = 5'h15 == _GEN_47 ? BHT_21 : _GEN_100; // @[BPU.scala 44:{81,81}]
  wire [1:0] _GEN_102 = 5'h16 == _GEN_47 ? BHT_22 : _GEN_101; // @[BPU.scala 44:{81,81}]
  wire [1:0] _GEN_103 = 5'h17 == _GEN_47 ? BHT_23 : _GEN_102; // @[BPU.scala 44:{81,81}]
  wire [1:0] _GEN_104 = 5'h18 == _GEN_47 ? BHT_24 : _GEN_103; // @[BPU.scala 44:{81,81}]
  wire [1:0] _GEN_105 = 5'h19 == _GEN_47 ? BHT_25 : _GEN_104; // @[BPU.scala 44:{81,81}]
  wire [1:0] _GEN_106 = 5'h1a == _GEN_47 ? BHT_26 : _GEN_105; // @[BPU.scala 44:{81,81}]
  wire [1:0] _GEN_107 = 5'h1b == _GEN_47 ? BHT_27 : _GEN_106; // @[BPU.scala 44:{81,81}]
  wire [1:0] _GEN_108 = 5'h1c == _GEN_47 ? BHT_28 : _GEN_107; // @[BPU.scala 44:{81,81}]
  wire [1:0] _GEN_109 = 5'h1d == _GEN_47 ? BHT_29 : _GEN_108; // @[BPU.scala 44:{81,81}]
  wire [1:0] _GEN_110 = 5'h1e == _GEN_47 ? BHT_30 : _GEN_109; // @[BPU.scala 44:{81,81}]
  wire [1:0] _GEN_111 = 5'h1f == _GEN_47 ? BHT_31 : _GEN_110; // @[BPU.scala 44:{81,81}]
  wire [31:0] _io_next_pc_T = last_predict ? last_pc : io_jb_pc; // @[BPU.scala 48:41]
  wire [31:0] _io_next_pc_T_2 = io_IF_pc + 32'h4; // @[BPU.scala 50:59]
  wire [31:0] _GEN_113 = 5'h1 == _GEN_47 ? BTB_1 : BTB_0; // @[BPU.scala 50:{20,20}]
  wire [31:0] _GEN_114 = 5'h2 == _GEN_47 ? BTB_2 : _GEN_113; // @[BPU.scala 50:{20,20}]
  wire [31:0] _GEN_115 = 5'h3 == _GEN_47 ? BTB_3 : _GEN_114; // @[BPU.scala 50:{20,20}]
  wire [31:0] _GEN_116 = 5'h4 == _GEN_47 ? BTB_4 : _GEN_115; // @[BPU.scala 50:{20,20}]
  wire [31:0] _GEN_117 = 5'h5 == _GEN_47 ? BTB_5 : _GEN_116; // @[BPU.scala 50:{20,20}]
  wire [31:0] _GEN_118 = 5'h6 == _GEN_47 ? BTB_6 : _GEN_117; // @[BPU.scala 50:{20,20}]
  wire [31:0] _GEN_119 = 5'h7 == _GEN_47 ? BTB_7 : _GEN_118; // @[BPU.scala 50:{20,20}]
  wire [31:0] _GEN_120 = 5'h8 == _GEN_47 ? BTB_8 : _GEN_119; // @[BPU.scala 50:{20,20}]
  wire [31:0] _GEN_121 = 5'h9 == _GEN_47 ? BTB_9 : _GEN_120; // @[BPU.scala 50:{20,20}]
  wire [31:0] _GEN_122 = 5'ha == _GEN_47 ? BTB_10 : _GEN_121; // @[BPU.scala 50:{20,20}]
  wire [31:0] _GEN_123 = 5'hb == _GEN_47 ? BTB_11 : _GEN_122; // @[BPU.scala 50:{20,20}]
  wire [31:0] _GEN_124 = 5'hc == _GEN_47 ? BTB_12 : _GEN_123; // @[BPU.scala 50:{20,20}]
  wire [31:0] _GEN_125 = 5'hd == _GEN_47 ? BTB_13 : _GEN_124; // @[BPU.scala 50:{20,20}]
  wire [31:0] _GEN_126 = 5'he == _GEN_47 ? BTB_14 : _GEN_125; // @[BPU.scala 50:{20,20}]
  wire [31:0] _GEN_127 = 5'hf == _GEN_47 ? BTB_15 : _GEN_126; // @[BPU.scala 50:{20,20}]
  wire [31:0] _GEN_128 = 5'h10 == _GEN_47 ? BTB_16 : _GEN_127; // @[BPU.scala 50:{20,20}]
  wire [31:0] _GEN_129 = 5'h11 == _GEN_47 ? BTB_17 : _GEN_128; // @[BPU.scala 50:{20,20}]
  wire [31:0] _GEN_130 = 5'h12 == _GEN_47 ? BTB_18 : _GEN_129; // @[BPU.scala 50:{20,20}]
  wire [31:0] _GEN_131 = 5'h13 == _GEN_47 ? BTB_19 : _GEN_130; // @[BPU.scala 50:{20,20}]
  wire [31:0] _GEN_132 = 5'h14 == _GEN_47 ? BTB_20 : _GEN_131; // @[BPU.scala 50:{20,20}]
  wire [31:0] _GEN_133 = 5'h15 == _GEN_47 ? BTB_21 : _GEN_132; // @[BPU.scala 50:{20,20}]
  wire [31:0] _GEN_134 = 5'h16 == _GEN_47 ? BTB_22 : _GEN_133; // @[BPU.scala 50:{20,20}]
  wire [31:0] _GEN_135 = 5'h17 == _GEN_47 ? BTB_23 : _GEN_134; // @[BPU.scala 50:{20,20}]
  wire [31:0] _GEN_136 = 5'h18 == _GEN_47 ? BTB_24 : _GEN_135; // @[BPU.scala 50:{20,20}]
  wire [31:0] _GEN_137 = 5'h19 == _GEN_47 ? BTB_25 : _GEN_136; // @[BPU.scala 50:{20,20}]
  wire [31:0] _GEN_138 = 5'h1a == _GEN_47 ? BTB_26 : _GEN_137; // @[BPU.scala 50:{20,20}]
  wire [31:0] _GEN_139 = 5'h1b == _GEN_47 ? BTB_27 : _GEN_138; // @[BPU.scala 50:{20,20}]
  wire [31:0] _GEN_140 = 5'h1c == _GEN_47 ? BTB_28 : _GEN_139; // @[BPU.scala 50:{20,20}]
  wire [31:0] _GEN_141 = 5'h1d == _GEN_47 ? BTB_29 : _GEN_140; // @[BPU.scala 50:{20,20}]
  wire [31:0] _GEN_142 = 5'h1e == _GEN_47 ? BTB_30 : _GEN_141; // @[BPU.scala 50:{20,20}]
  wire [31:0] _GEN_143 = 5'h1f == _GEN_47 ? BTB_31 : _GEN_142; // @[BPU.scala 50:{20,20}]
  wire [31:0] _io_next_pc_T_3 = io_predict ? _GEN_143 : _io_next_pc_T_2; // @[BPU.scala 50:20]
  wire [31:0] _io_next_pc_T_4 = io_BTB_miss ? io_jb_pc : _io_next_pc_T_3; // @[BPU.scala 49:20]
  wire [31:0] _io_next_pc_T_5 = io_predict_miss ? _io_next_pc_T : _io_next_pc_T_4; // @[BPU.scala 48:20]
  wire [1:0] _GEN_149 = 5'h1 == _GEN_7 ? BHT_1 : BHT_0; // @[BPU.scala 67:{56,56}]
  wire [1:0] _GEN_150 = 5'h2 == _GEN_7 ? BHT_2 : _GEN_149; // @[BPU.scala 67:{56,56}]
  wire [1:0] _GEN_151 = 5'h3 == _GEN_7 ? BHT_3 : _GEN_150; // @[BPU.scala 67:{56,56}]
  wire [1:0] _GEN_152 = 5'h4 == _GEN_7 ? BHT_4 : _GEN_151; // @[BPU.scala 67:{56,56}]
  wire [1:0] _GEN_153 = 5'h5 == _GEN_7 ? BHT_5 : _GEN_152; // @[BPU.scala 67:{56,56}]
  wire [1:0] _GEN_154 = 5'h6 == _GEN_7 ? BHT_6 : _GEN_153; // @[BPU.scala 67:{56,56}]
  wire [1:0] _GEN_155 = 5'h7 == _GEN_7 ? BHT_7 : _GEN_154; // @[BPU.scala 67:{56,56}]
  wire [1:0] _GEN_156 = 5'h8 == _GEN_7 ? BHT_8 : _GEN_155; // @[BPU.scala 67:{56,56}]
  wire [1:0] _GEN_157 = 5'h9 == _GEN_7 ? BHT_9 : _GEN_156; // @[BPU.scala 67:{56,56}]
  wire [1:0] _GEN_158 = 5'ha == _GEN_7 ? BHT_10 : _GEN_157; // @[BPU.scala 67:{56,56}]
  wire [1:0] _GEN_159 = 5'hb == _GEN_7 ? BHT_11 : _GEN_158; // @[BPU.scala 67:{56,56}]
  wire [1:0] _GEN_160 = 5'hc == _GEN_7 ? BHT_12 : _GEN_159; // @[BPU.scala 67:{56,56}]
  wire [1:0] _GEN_161 = 5'hd == _GEN_7 ? BHT_13 : _GEN_160; // @[BPU.scala 67:{56,56}]
  wire [1:0] _GEN_162 = 5'he == _GEN_7 ? BHT_14 : _GEN_161; // @[BPU.scala 67:{56,56}]
  wire [1:0] _GEN_163 = 5'hf == _GEN_7 ? BHT_15 : _GEN_162; // @[BPU.scala 67:{56,56}]
  wire [1:0] _GEN_164 = 5'h10 == _GEN_7 ? BHT_16 : _GEN_163; // @[BPU.scala 67:{56,56}]
  wire [1:0] _GEN_165 = 5'h11 == _GEN_7 ? BHT_17 : _GEN_164; // @[BPU.scala 67:{56,56}]
  wire [1:0] _GEN_166 = 5'h12 == _GEN_7 ? BHT_18 : _GEN_165; // @[BPU.scala 67:{56,56}]
  wire [1:0] _GEN_167 = 5'h13 == _GEN_7 ? BHT_19 : _GEN_166; // @[BPU.scala 67:{56,56}]
  wire [1:0] _GEN_168 = 5'h14 == _GEN_7 ? BHT_20 : _GEN_167; // @[BPU.scala 67:{56,56}]
  wire [1:0] _GEN_169 = 5'h15 == _GEN_7 ? BHT_21 : _GEN_168; // @[BPU.scala 67:{56,56}]
  wire [1:0] _GEN_170 = 5'h16 == _GEN_7 ? BHT_22 : _GEN_169; // @[BPU.scala 67:{56,56}]
  wire [1:0] _GEN_171 = 5'h17 == _GEN_7 ? BHT_23 : _GEN_170; // @[BPU.scala 67:{56,56}]
  wire [1:0] _GEN_172 = 5'h18 == _GEN_7 ? BHT_24 : _GEN_171; // @[BPU.scala 67:{56,56}]
  wire [1:0] _GEN_173 = 5'h19 == _GEN_7 ? BHT_25 : _GEN_172; // @[BPU.scala 67:{56,56}]
  wire [1:0] _GEN_174 = 5'h1a == _GEN_7 ? BHT_26 : _GEN_173; // @[BPU.scala 67:{56,56}]
  wire [1:0] _GEN_175 = 5'h1b == _GEN_7 ? BHT_27 : _GEN_174; // @[BPU.scala 67:{56,56}]
  wire [1:0] _GEN_176 = 5'h1c == _GEN_7 ? BHT_28 : _GEN_175; // @[BPU.scala 67:{56,56}]
  wire [1:0] _GEN_177 = 5'h1d == _GEN_7 ? BHT_29 : _GEN_176; // @[BPU.scala 67:{56,56}]
  wire [1:0] _GEN_178 = 5'h1e == _GEN_7 ? BHT_30 : _GEN_177; // @[BPU.scala 67:{56,56}]
  wire [1:0] _GEN_179 = 5'h1f == _GEN_7 ? BHT_31 : _GEN_178; // @[BPU.scala 67:{56,56}]
  wire [1:0] _BHT_T_2 = _GEN_179 + 2'h1; // @[BPU.scala 67:87]
  wire [1:0] _BHT_T_3 = _GEN_179 == 2'h3 ? 2'h3 : _BHT_T_2; // @[BPU.scala 67:38]
  wire [1:0] _GEN_212 = 5'h0 == _GEN_7 ? _BHT_T_3 : BHT_0; // @[BPU.scala 27:30 67:{32,32}]
  wire [1:0] _GEN_213 = 5'h1 == _GEN_7 ? _BHT_T_3 : BHT_1; // @[BPU.scala 27:30 67:{32,32}]
  wire [1:0] _GEN_214 = 5'h2 == _GEN_7 ? _BHT_T_3 : BHT_2; // @[BPU.scala 27:30 67:{32,32}]
  wire [1:0] _GEN_215 = 5'h3 == _GEN_7 ? _BHT_T_3 : BHT_3; // @[BPU.scala 27:30 67:{32,32}]
  wire [1:0] _GEN_216 = 5'h4 == _GEN_7 ? _BHT_T_3 : BHT_4; // @[BPU.scala 27:30 67:{32,32}]
  wire [1:0] _GEN_217 = 5'h5 == _GEN_7 ? _BHT_T_3 : BHT_5; // @[BPU.scala 27:30 67:{32,32}]
  wire [1:0] _GEN_218 = 5'h6 == _GEN_7 ? _BHT_T_3 : BHT_6; // @[BPU.scala 27:30 67:{32,32}]
  wire [1:0] _GEN_219 = 5'h7 == _GEN_7 ? _BHT_T_3 : BHT_7; // @[BPU.scala 27:30 67:{32,32}]
  wire [1:0] _GEN_220 = 5'h8 == _GEN_7 ? _BHT_T_3 : BHT_8; // @[BPU.scala 27:30 67:{32,32}]
  wire [1:0] _GEN_221 = 5'h9 == _GEN_7 ? _BHT_T_3 : BHT_9; // @[BPU.scala 27:30 67:{32,32}]
  wire [1:0] _GEN_222 = 5'ha == _GEN_7 ? _BHT_T_3 : BHT_10; // @[BPU.scala 27:30 67:{32,32}]
  wire [1:0] _GEN_223 = 5'hb == _GEN_7 ? _BHT_T_3 : BHT_11; // @[BPU.scala 27:30 67:{32,32}]
  wire [1:0] _GEN_224 = 5'hc == _GEN_7 ? _BHT_T_3 : BHT_12; // @[BPU.scala 27:30 67:{32,32}]
  wire [1:0] _GEN_225 = 5'hd == _GEN_7 ? _BHT_T_3 : BHT_13; // @[BPU.scala 27:30 67:{32,32}]
  wire [1:0] _GEN_226 = 5'he == _GEN_7 ? _BHT_T_3 : BHT_14; // @[BPU.scala 27:30 67:{32,32}]
  wire [1:0] _GEN_227 = 5'hf == _GEN_7 ? _BHT_T_3 : BHT_15; // @[BPU.scala 27:30 67:{32,32}]
  wire [1:0] _GEN_228 = 5'h10 == _GEN_7 ? _BHT_T_3 : BHT_16; // @[BPU.scala 27:30 67:{32,32}]
  wire [1:0] _GEN_229 = 5'h11 == _GEN_7 ? _BHT_T_3 : BHT_17; // @[BPU.scala 27:30 67:{32,32}]
  wire [1:0] _GEN_230 = 5'h12 == _GEN_7 ? _BHT_T_3 : BHT_18; // @[BPU.scala 27:30 67:{32,32}]
  wire [1:0] _GEN_231 = 5'h13 == _GEN_7 ? _BHT_T_3 : BHT_19; // @[BPU.scala 27:30 67:{32,32}]
  wire [1:0] _GEN_232 = 5'h14 == _GEN_7 ? _BHT_T_3 : BHT_20; // @[BPU.scala 27:30 67:{32,32}]
  wire [1:0] _GEN_233 = 5'h15 == _GEN_7 ? _BHT_T_3 : BHT_21; // @[BPU.scala 27:30 67:{32,32}]
  wire [1:0] _GEN_234 = 5'h16 == _GEN_7 ? _BHT_T_3 : BHT_22; // @[BPU.scala 27:30 67:{32,32}]
  wire [1:0] _GEN_235 = 5'h17 == _GEN_7 ? _BHT_T_3 : BHT_23; // @[BPU.scala 27:30 67:{32,32}]
  wire [1:0] _GEN_236 = 5'h18 == _GEN_7 ? _BHT_T_3 : BHT_24; // @[BPU.scala 27:30 67:{32,32}]
  wire [1:0] _GEN_237 = 5'h19 == _GEN_7 ? _BHT_T_3 : BHT_25; // @[BPU.scala 27:30 67:{32,32}]
  wire [1:0] _GEN_238 = 5'h1a == _GEN_7 ? _BHT_T_3 : BHT_26; // @[BPU.scala 27:30 67:{32,32}]
  wire [1:0] _GEN_239 = 5'h1b == _GEN_7 ? _BHT_T_3 : BHT_27; // @[BPU.scala 27:30 67:{32,32}]
  wire [1:0] _GEN_240 = 5'h1c == _GEN_7 ? _BHT_T_3 : BHT_28; // @[BPU.scala 27:30 67:{32,32}]
  wire [1:0] _GEN_241 = 5'h1d == _GEN_7 ? _BHT_T_3 : BHT_29; // @[BPU.scala 27:30 67:{32,32}]
  wire [1:0] _GEN_242 = 5'h1e == _GEN_7 ? _BHT_T_3 : BHT_30; // @[BPU.scala 27:30 67:{32,32}]
  wire [1:0] _GEN_243 = 5'h1f == _GEN_7 ? _BHT_T_3 : BHT_31; // @[BPU.scala 27:30 67:{32,32}]
  wire [31:0] _GEN_244 = 5'h0 == _GEN_7 ? io_jb_pc : BTB_0; // @[BPU.scala 28:30 68:{32,32}]
  wire [31:0] _GEN_245 = 5'h1 == _GEN_7 ? io_jb_pc : BTB_1; // @[BPU.scala 28:30 68:{32,32}]
  wire [31:0] _GEN_246 = 5'h2 == _GEN_7 ? io_jb_pc : BTB_2; // @[BPU.scala 28:30 68:{32,32}]
  wire [31:0] _GEN_247 = 5'h3 == _GEN_7 ? io_jb_pc : BTB_3; // @[BPU.scala 28:30 68:{32,32}]
  wire [31:0] _GEN_248 = 5'h4 == _GEN_7 ? io_jb_pc : BTB_4; // @[BPU.scala 28:30 68:{32,32}]
  wire [31:0] _GEN_249 = 5'h5 == _GEN_7 ? io_jb_pc : BTB_5; // @[BPU.scala 28:30 68:{32,32}]
  wire [31:0] _GEN_250 = 5'h6 == _GEN_7 ? io_jb_pc : BTB_6; // @[BPU.scala 28:30 68:{32,32}]
  wire [31:0] _GEN_251 = 5'h7 == _GEN_7 ? io_jb_pc : BTB_7; // @[BPU.scala 28:30 68:{32,32}]
  wire [31:0] _GEN_252 = 5'h8 == _GEN_7 ? io_jb_pc : BTB_8; // @[BPU.scala 28:30 68:{32,32}]
  wire [31:0] _GEN_253 = 5'h9 == _GEN_7 ? io_jb_pc : BTB_9; // @[BPU.scala 28:30 68:{32,32}]
  wire [31:0] _GEN_254 = 5'ha == _GEN_7 ? io_jb_pc : BTB_10; // @[BPU.scala 28:30 68:{32,32}]
  wire [31:0] _GEN_255 = 5'hb == _GEN_7 ? io_jb_pc : BTB_11; // @[BPU.scala 28:30 68:{32,32}]
  wire [31:0] _GEN_256 = 5'hc == _GEN_7 ? io_jb_pc : BTB_12; // @[BPU.scala 28:30 68:{32,32}]
  wire [31:0] _GEN_257 = 5'hd == _GEN_7 ? io_jb_pc : BTB_13; // @[BPU.scala 28:30 68:{32,32}]
  wire [31:0] _GEN_258 = 5'he == _GEN_7 ? io_jb_pc : BTB_14; // @[BPU.scala 28:30 68:{32,32}]
  wire [31:0] _GEN_259 = 5'hf == _GEN_7 ? io_jb_pc : BTB_15; // @[BPU.scala 28:30 68:{32,32}]
  wire [31:0] _GEN_260 = 5'h10 == _GEN_7 ? io_jb_pc : BTB_16; // @[BPU.scala 28:30 68:{32,32}]
  wire [31:0] _GEN_261 = 5'h11 == _GEN_7 ? io_jb_pc : BTB_17; // @[BPU.scala 28:30 68:{32,32}]
  wire [31:0] _GEN_262 = 5'h12 == _GEN_7 ? io_jb_pc : BTB_18; // @[BPU.scala 28:30 68:{32,32}]
  wire [31:0] _GEN_263 = 5'h13 == _GEN_7 ? io_jb_pc : BTB_19; // @[BPU.scala 28:30 68:{32,32}]
  wire [31:0] _GEN_264 = 5'h14 == _GEN_7 ? io_jb_pc : BTB_20; // @[BPU.scala 28:30 68:{32,32}]
  wire [31:0] _GEN_265 = 5'h15 == _GEN_7 ? io_jb_pc : BTB_21; // @[BPU.scala 28:30 68:{32,32}]
  wire [31:0] _GEN_266 = 5'h16 == _GEN_7 ? io_jb_pc : BTB_22; // @[BPU.scala 28:30 68:{32,32}]
  wire [31:0] _GEN_267 = 5'h17 == _GEN_7 ? io_jb_pc : BTB_23; // @[BPU.scala 28:30 68:{32,32}]
  wire [31:0] _GEN_268 = 5'h18 == _GEN_7 ? io_jb_pc : BTB_24; // @[BPU.scala 28:30 68:{32,32}]
  wire [31:0] _GEN_269 = 5'h19 == _GEN_7 ? io_jb_pc : BTB_25; // @[BPU.scala 28:30 68:{32,32}]
  wire [31:0] _GEN_270 = 5'h1a == _GEN_7 ? io_jb_pc : BTB_26; // @[BPU.scala 28:30 68:{32,32}]
  wire [31:0] _GEN_271 = 5'h1b == _GEN_7 ? io_jb_pc : BTB_27; // @[BPU.scala 28:30 68:{32,32}]
  wire [31:0] _GEN_272 = 5'h1c == _GEN_7 ? io_jb_pc : BTB_28; // @[BPU.scala 28:30 68:{32,32}]
  wire [31:0] _GEN_273 = 5'h1d == _GEN_7 ? io_jb_pc : BTB_29; // @[BPU.scala 28:30 68:{32,32}]
  wire [31:0] _GEN_274 = 5'h1e == _GEN_7 ? io_jb_pc : BTB_30; // @[BPU.scala 28:30 68:{32,32}]
  wire [31:0] _GEN_275 = 5'h1f == _GEN_7 ? io_jb_pc : BTB_31; // @[BPU.scala 28:30 68:{32,32}]
  wire  _GEN_276 = 5'h0 == _GEN_7 | BTB_valid_0; // @[BPU.scala 29:30 69:{32,32}]
  wire  _GEN_277 = 5'h1 == _GEN_7 | BTB_valid_1; // @[BPU.scala 29:30 69:{32,32}]
  wire  _GEN_278 = 5'h2 == _GEN_7 | BTB_valid_2; // @[BPU.scala 29:30 69:{32,32}]
  wire  _GEN_279 = 5'h3 == _GEN_7 | BTB_valid_3; // @[BPU.scala 29:30 69:{32,32}]
  wire  _GEN_280 = 5'h4 == _GEN_7 | BTB_valid_4; // @[BPU.scala 29:30 69:{32,32}]
  wire  _GEN_281 = 5'h5 == _GEN_7 | BTB_valid_5; // @[BPU.scala 29:30 69:{32,32}]
  wire  _GEN_282 = 5'h6 == _GEN_7 | BTB_valid_6; // @[BPU.scala 29:30 69:{32,32}]
  wire  _GEN_283 = 5'h7 == _GEN_7 | BTB_valid_7; // @[BPU.scala 29:30 69:{32,32}]
  wire  _GEN_284 = 5'h8 == _GEN_7 | BTB_valid_8; // @[BPU.scala 29:30 69:{32,32}]
  wire  _GEN_285 = 5'h9 == _GEN_7 | BTB_valid_9; // @[BPU.scala 29:30 69:{32,32}]
  wire  _GEN_286 = 5'ha == _GEN_7 | BTB_valid_10; // @[BPU.scala 29:30 69:{32,32}]
  wire  _GEN_287 = 5'hb == _GEN_7 | BTB_valid_11; // @[BPU.scala 29:30 69:{32,32}]
  wire  _GEN_288 = 5'hc == _GEN_7 | BTB_valid_12; // @[BPU.scala 29:30 69:{32,32}]
  wire  _GEN_289 = 5'hd == _GEN_7 | BTB_valid_13; // @[BPU.scala 29:30 69:{32,32}]
  wire  _GEN_290 = 5'he == _GEN_7 | BTB_valid_14; // @[BPU.scala 29:30 69:{32,32}]
  wire  _GEN_291 = 5'hf == _GEN_7 | BTB_valid_15; // @[BPU.scala 29:30 69:{32,32}]
  wire  _GEN_292 = 5'h10 == _GEN_7 | BTB_valid_16; // @[BPU.scala 29:30 69:{32,32}]
  wire  _GEN_293 = 5'h11 == _GEN_7 | BTB_valid_17; // @[BPU.scala 29:30 69:{32,32}]
  wire  _GEN_294 = 5'h12 == _GEN_7 | BTB_valid_18; // @[BPU.scala 29:30 69:{32,32}]
  wire  _GEN_295 = 5'h13 == _GEN_7 | BTB_valid_19; // @[BPU.scala 29:30 69:{32,32}]
  wire  _GEN_296 = 5'h14 == _GEN_7 | BTB_valid_20; // @[BPU.scala 29:30 69:{32,32}]
  wire  _GEN_297 = 5'h15 == _GEN_7 | BTB_valid_21; // @[BPU.scala 29:30 69:{32,32}]
  wire  _GEN_298 = 5'h16 == _GEN_7 | BTB_valid_22; // @[BPU.scala 29:30 69:{32,32}]
  wire  _GEN_299 = 5'h17 == _GEN_7 | BTB_valid_23; // @[BPU.scala 29:30 69:{32,32}]
  wire  _GEN_300 = 5'h18 == _GEN_7 | BTB_valid_24; // @[BPU.scala 29:30 69:{32,32}]
  wire  _GEN_301 = 5'h19 == _GEN_7 | BTB_valid_25; // @[BPU.scala 29:30 69:{32,32}]
  wire  _GEN_302 = 5'h1a == _GEN_7 | BTB_valid_26; // @[BPU.scala 29:30 69:{32,32}]
  wire  _GEN_303 = 5'h1b == _GEN_7 | BTB_valid_27; // @[BPU.scala 29:30 69:{32,32}]
  wire  _GEN_304 = 5'h1c == _GEN_7 | BTB_valid_28; // @[BPU.scala 29:30 69:{32,32}]
  wire  _GEN_305 = 5'h1d == _GEN_7 | BTB_valid_29; // @[BPU.scala 29:30 69:{32,32}]
  wire  _GEN_306 = 5'h1e == _GEN_7 | BTB_valid_30; // @[BPU.scala 29:30 69:{32,32}]
  wire  _GEN_307 = 5'h1f == _GEN_7 | BTB_valid_31; // @[BPU.scala 29:30 69:{32,32}]
  wire [1:0] _BHT_T_6 = _GEN_179 - 2'h1; // @[BPU.scala 71:87]
  wire [1:0] _BHT_T_7 = _GEN_179 == 2'h0 ? 2'h0 : _BHT_T_6; // @[BPU.scala 71:38]
  wire [1:0] _GEN_372 = 5'h0 == _GEN_7 ? _BHT_T_7 : BHT_0; // @[BPU.scala 27:30 71:{32,32}]
  wire [1:0] _GEN_373 = 5'h1 == _GEN_7 ? _BHT_T_7 : BHT_1; // @[BPU.scala 27:30 71:{32,32}]
  wire [1:0] _GEN_374 = 5'h2 == _GEN_7 ? _BHT_T_7 : BHT_2; // @[BPU.scala 27:30 71:{32,32}]
  wire [1:0] _GEN_375 = 5'h3 == _GEN_7 ? _BHT_T_7 : BHT_3; // @[BPU.scala 27:30 71:{32,32}]
  wire [1:0] _GEN_376 = 5'h4 == _GEN_7 ? _BHT_T_7 : BHT_4; // @[BPU.scala 27:30 71:{32,32}]
  wire [1:0] _GEN_377 = 5'h5 == _GEN_7 ? _BHT_T_7 : BHT_5; // @[BPU.scala 27:30 71:{32,32}]
  wire [1:0] _GEN_378 = 5'h6 == _GEN_7 ? _BHT_T_7 : BHT_6; // @[BPU.scala 27:30 71:{32,32}]
  wire [1:0] _GEN_379 = 5'h7 == _GEN_7 ? _BHT_T_7 : BHT_7; // @[BPU.scala 27:30 71:{32,32}]
  wire [1:0] _GEN_380 = 5'h8 == _GEN_7 ? _BHT_T_7 : BHT_8; // @[BPU.scala 27:30 71:{32,32}]
  wire [1:0] _GEN_381 = 5'h9 == _GEN_7 ? _BHT_T_7 : BHT_9; // @[BPU.scala 27:30 71:{32,32}]
  wire [1:0] _GEN_382 = 5'ha == _GEN_7 ? _BHT_T_7 : BHT_10; // @[BPU.scala 27:30 71:{32,32}]
  wire [1:0] _GEN_383 = 5'hb == _GEN_7 ? _BHT_T_7 : BHT_11; // @[BPU.scala 27:30 71:{32,32}]
  wire [1:0] _GEN_384 = 5'hc == _GEN_7 ? _BHT_T_7 : BHT_12; // @[BPU.scala 27:30 71:{32,32}]
  wire [1:0] _GEN_385 = 5'hd == _GEN_7 ? _BHT_T_7 : BHT_13; // @[BPU.scala 27:30 71:{32,32}]
  wire [1:0] _GEN_386 = 5'he == _GEN_7 ? _BHT_T_7 : BHT_14; // @[BPU.scala 27:30 71:{32,32}]
  wire [1:0] _GEN_387 = 5'hf == _GEN_7 ? _BHT_T_7 : BHT_15; // @[BPU.scala 27:30 71:{32,32}]
  wire [1:0] _GEN_388 = 5'h10 == _GEN_7 ? _BHT_T_7 : BHT_16; // @[BPU.scala 27:30 71:{32,32}]
  wire [1:0] _GEN_389 = 5'h11 == _GEN_7 ? _BHT_T_7 : BHT_17; // @[BPU.scala 27:30 71:{32,32}]
  wire [1:0] _GEN_390 = 5'h12 == _GEN_7 ? _BHT_T_7 : BHT_18; // @[BPU.scala 27:30 71:{32,32}]
  wire [1:0] _GEN_391 = 5'h13 == _GEN_7 ? _BHT_T_7 : BHT_19; // @[BPU.scala 27:30 71:{32,32}]
  wire [1:0] _GEN_392 = 5'h14 == _GEN_7 ? _BHT_T_7 : BHT_20; // @[BPU.scala 27:30 71:{32,32}]
  wire [1:0] _GEN_393 = 5'h15 == _GEN_7 ? _BHT_T_7 : BHT_21; // @[BPU.scala 27:30 71:{32,32}]
  wire [1:0] _GEN_394 = 5'h16 == _GEN_7 ? _BHT_T_7 : BHT_22; // @[BPU.scala 27:30 71:{32,32}]
  wire [1:0] _GEN_395 = 5'h17 == _GEN_7 ? _BHT_T_7 : BHT_23; // @[BPU.scala 27:30 71:{32,32}]
  wire [1:0] _GEN_396 = 5'h18 == _GEN_7 ? _BHT_T_7 : BHT_24; // @[BPU.scala 27:30 71:{32,32}]
  wire [1:0] _GEN_397 = 5'h19 == _GEN_7 ? _BHT_T_7 : BHT_25; // @[BPU.scala 27:30 71:{32,32}]
  wire [1:0] _GEN_398 = 5'h1a == _GEN_7 ? _BHT_T_7 : BHT_26; // @[BPU.scala 27:30 71:{32,32}]
  wire [1:0] _GEN_399 = 5'h1b == _GEN_7 ? _BHT_T_7 : BHT_27; // @[BPU.scala 27:30 71:{32,32}]
  wire [1:0] _GEN_400 = 5'h1c == _GEN_7 ? _BHT_T_7 : BHT_28; // @[BPU.scala 27:30 71:{32,32}]
  wire [1:0] _GEN_401 = 5'h1d == _GEN_7 ? _BHT_T_7 : BHT_29; // @[BPU.scala 27:30 71:{32,32}]
  wire [1:0] _GEN_402 = 5'h1e == _GEN_7 ? _BHT_T_7 : BHT_30; // @[BPU.scala 27:30 71:{32,32}]
  wire [1:0] _GEN_403 = 5'h1f == _GEN_7 ? _BHT_T_7 : BHT_31; // @[BPU.scala 27:30 71:{32,32}]
  wire [1:0] _GEN_404 = io_alu_out ? _GEN_212 : _GEN_372; // @[BPU.scala 66:23]
  wire [1:0] _GEN_405 = io_alu_out ? _GEN_213 : _GEN_373; // @[BPU.scala 66:23]
  wire [1:0] _GEN_406 = io_alu_out ? _GEN_214 : _GEN_374; // @[BPU.scala 66:23]
  wire [1:0] _GEN_407 = io_alu_out ? _GEN_215 : _GEN_375; // @[BPU.scala 66:23]
  wire [1:0] _GEN_408 = io_alu_out ? _GEN_216 : _GEN_376; // @[BPU.scala 66:23]
  wire [1:0] _GEN_409 = io_alu_out ? _GEN_217 : _GEN_377; // @[BPU.scala 66:23]
  wire [1:0] _GEN_410 = io_alu_out ? _GEN_218 : _GEN_378; // @[BPU.scala 66:23]
  wire [1:0] _GEN_411 = io_alu_out ? _GEN_219 : _GEN_379; // @[BPU.scala 66:23]
  wire [1:0] _GEN_412 = io_alu_out ? _GEN_220 : _GEN_380; // @[BPU.scala 66:23]
  wire [1:0] _GEN_413 = io_alu_out ? _GEN_221 : _GEN_381; // @[BPU.scala 66:23]
  wire [1:0] _GEN_414 = io_alu_out ? _GEN_222 : _GEN_382; // @[BPU.scala 66:23]
  wire [1:0] _GEN_415 = io_alu_out ? _GEN_223 : _GEN_383; // @[BPU.scala 66:23]
  wire [1:0] _GEN_416 = io_alu_out ? _GEN_224 : _GEN_384; // @[BPU.scala 66:23]
  wire [1:0] _GEN_417 = io_alu_out ? _GEN_225 : _GEN_385; // @[BPU.scala 66:23]
  wire [1:0] _GEN_418 = io_alu_out ? _GEN_226 : _GEN_386; // @[BPU.scala 66:23]
  wire [1:0] _GEN_419 = io_alu_out ? _GEN_227 : _GEN_387; // @[BPU.scala 66:23]
  wire [1:0] _GEN_420 = io_alu_out ? _GEN_228 : _GEN_388; // @[BPU.scala 66:23]
  wire [1:0] _GEN_421 = io_alu_out ? _GEN_229 : _GEN_389; // @[BPU.scala 66:23]
  wire [1:0] _GEN_422 = io_alu_out ? _GEN_230 : _GEN_390; // @[BPU.scala 66:23]
  wire [1:0] _GEN_423 = io_alu_out ? _GEN_231 : _GEN_391; // @[BPU.scala 66:23]
  wire [1:0] _GEN_424 = io_alu_out ? _GEN_232 : _GEN_392; // @[BPU.scala 66:23]
  wire [1:0] _GEN_425 = io_alu_out ? _GEN_233 : _GEN_393; // @[BPU.scala 66:23]
  wire [1:0] _GEN_426 = io_alu_out ? _GEN_234 : _GEN_394; // @[BPU.scala 66:23]
  wire [1:0] _GEN_427 = io_alu_out ? _GEN_235 : _GEN_395; // @[BPU.scala 66:23]
  wire [1:0] _GEN_428 = io_alu_out ? _GEN_236 : _GEN_396; // @[BPU.scala 66:23]
  wire [1:0] _GEN_429 = io_alu_out ? _GEN_237 : _GEN_397; // @[BPU.scala 66:23]
  wire [1:0] _GEN_430 = io_alu_out ? _GEN_238 : _GEN_398; // @[BPU.scala 66:23]
  wire [1:0] _GEN_431 = io_alu_out ? _GEN_239 : _GEN_399; // @[BPU.scala 66:23]
  wire [1:0] _GEN_432 = io_alu_out ? _GEN_240 : _GEN_400; // @[BPU.scala 66:23]
  wire [1:0] _GEN_433 = io_alu_out ? _GEN_241 : _GEN_401; // @[BPU.scala 66:23]
  wire [1:0] _GEN_434 = io_alu_out ? _GEN_242 : _GEN_402; // @[BPU.scala 66:23]
  wire [1:0] _GEN_435 = io_alu_out ? _GEN_243 : _GEN_403; // @[BPU.scala 66:23]
  wire [31:0] _GEN_436 = io_alu_out ? _GEN_244 : BTB_0; // @[BPU.scala 66:23 28:30]
  wire [31:0] _GEN_437 = io_alu_out ? _GEN_245 : BTB_1; // @[BPU.scala 66:23 28:30]
  wire [31:0] _GEN_438 = io_alu_out ? _GEN_246 : BTB_2; // @[BPU.scala 66:23 28:30]
  wire [31:0] _GEN_439 = io_alu_out ? _GEN_247 : BTB_3; // @[BPU.scala 66:23 28:30]
  wire [31:0] _GEN_440 = io_alu_out ? _GEN_248 : BTB_4; // @[BPU.scala 66:23 28:30]
  wire [31:0] _GEN_441 = io_alu_out ? _GEN_249 : BTB_5; // @[BPU.scala 66:23 28:30]
  wire [31:0] _GEN_442 = io_alu_out ? _GEN_250 : BTB_6; // @[BPU.scala 66:23 28:30]
  wire [31:0] _GEN_443 = io_alu_out ? _GEN_251 : BTB_7; // @[BPU.scala 66:23 28:30]
  wire [31:0] _GEN_444 = io_alu_out ? _GEN_252 : BTB_8; // @[BPU.scala 66:23 28:30]
  wire [31:0] _GEN_445 = io_alu_out ? _GEN_253 : BTB_9; // @[BPU.scala 66:23 28:30]
  wire [31:0] _GEN_446 = io_alu_out ? _GEN_254 : BTB_10; // @[BPU.scala 66:23 28:30]
  wire [31:0] _GEN_447 = io_alu_out ? _GEN_255 : BTB_11; // @[BPU.scala 66:23 28:30]
  wire [31:0] _GEN_448 = io_alu_out ? _GEN_256 : BTB_12; // @[BPU.scala 66:23 28:30]
  wire [31:0] _GEN_449 = io_alu_out ? _GEN_257 : BTB_13; // @[BPU.scala 66:23 28:30]
  wire [31:0] _GEN_450 = io_alu_out ? _GEN_258 : BTB_14; // @[BPU.scala 66:23 28:30]
  wire [31:0] _GEN_451 = io_alu_out ? _GEN_259 : BTB_15; // @[BPU.scala 66:23 28:30]
  wire [31:0] _GEN_452 = io_alu_out ? _GEN_260 : BTB_16; // @[BPU.scala 66:23 28:30]
  wire [31:0] _GEN_453 = io_alu_out ? _GEN_261 : BTB_17; // @[BPU.scala 66:23 28:30]
  wire [31:0] _GEN_454 = io_alu_out ? _GEN_262 : BTB_18; // @[BPU.scala 66:23 28:30]
  wire [31:0] _GEN_455 = io_alu_out ? _GEN_263 : BTB_19; // @[BPU.scala 66:23 28:30]
  wire [31:0] _GEN_456 = io_alu_out ? _GEN_264 : BTB_20; // @[BPU.scala 66:23 28:30]
  wire [31:0] _GEN_457 = io_alu_out ? _GEN_265 : BTB_21; // @[BPU.scala 66:23 28:30]
  wire [31:0] _GEN_458 = io_alu_out ? _GEN_266 : BTB_22; // @[BPU.scala 66:23 28:30]
  wire [31:0] _GEN_459 = io_alu_out ? _GEN_267 : BTB_23; // @[BPU.scala 66:23 28:30]
  wire [31:0] _GEN_460 = io_alu_out ? _GEN_268 : BTB_24; // @[BPU.scala 66:23 28:30]
  wire [31:0] _GEN_461 = io_alu_out ? _GEN_269 : BTB_25; // @[BPU.scala 66:23 28:30]
  wire [31:0] _GEN_462 = io_alu_out ? _GEN_270 : BTB_26; // @[BPU.scala 66:23 28:30]
  wire [31:0] _GEN_463 = io_alu_out ? _GEN_271 : BTB_27; // @[BPU.scala 66:23 28:30]
  wire [31:0] _GEN_464 = io_alu_out ? _GEN_272 : BTB_28; // @[BPU.scala 66:23 28:30]
  wire [31:0] _GEN_465 = io_alu_out ? _GEN_273 : BTB_29; // @[BPU.scala 66:23 28:30]
  wire [31:0] _GEN_466 = io_alu_out ? _GEN_274 : BTB_30; // @[BPU.scala 66:23 28:30]
  wire [31:0] _GEN_467 = io_alu_out ? _GEN_275 : BTB_31; // @[BPU.scala 66:23 28:30]
  wire  _GEN_468 = io_alu_out ? _GEN_276 : BTB_valid_0; // @[BPU.scala 66:23 29:30]
  wire  _GEN_469 = io_alu_out ? _GEN_277 : BTB_valid_1; // @[BPU.scala 66:23 29:30]
  wire  _GEN_470 = io_alu_out ? _GEN_278 : BTB_valid_2; // @[BPU.scala 66:23 29:30]
  wire  _GEN_471 = io_alu_out ? _GEN_279 : BTB_valid_3; // @[BPU.scala 66:23 29:30]
  wire  _GEN_472 = io_alu_out ? _GEN_280 : BTB_valid_4; // @[BPU.scala 66:23 29:30]
  wire  _GEN_473 = io_alu_out ? _GEN_281 : BTB_valid_5; // @[BPU.scala 66:23 29:30]
  wire  _GEN_474 = io_alu_out ? _GEN_282 : BTB_valid_6; // @[BPU.scala 66:23 29:30]
  wire  _GEN_475 = io_alu_out ? _GEN_283 : BTB_valid_7; // @[BPU.scala 66:23 29:30]
  wire  _GEN_476 = io_alu_out ? _GEN_284 : BTB_valid_8; // @[BPU.scala 66:23 29:30]
  wire  _GEN_477 = io_alu_out ? _GEN_285 : BTB_valid_9; // @[BPU.scala 66:23 29:30]
  wire  _GEN_478 = io_alu_out ? _GEN_286 : BTB_valid_10; // @[BPU.scala 66:23 29:30]
  wire  _GEN_479 = io_alu_out ? _GEN_287 : BTB_valid_11; // @[BPU.scala 66:23 29:30]
  wire  _GEN_480 = io_alu_out ? _GEN_288 : BTB_valid_12; // @[BPU.scala 66:23 29:30]
  wire  _GEN_481 = io_alu_out ? _GEN_289 : BTB_valid_13; // @[BPU.scala 66:23 29:30]
  wire  _GEN_482 = io_alu_out ? _GEN_290 : BTB_valid_14; // @[BPU.scala 66:23 29:30]
  wire  _GEN_483 = io_alu_out ? _GEN_291 : BTB_valid_15; // @[BPU.scala 66:23 29:30]
  wire  _GEN_484 = io_alu_out ? _GEN_292 : BTB_valid_16; // @[BPU.scala 66:23 29:30]
  wire  _GEN_485 = io_alu_out ? _GEN_293 : BTB_valid_17; // @[BPU.scala 66:23 29:30]
  wire  _GEN_486 = io_alu_out ? _GEN_294 : BTB_valid_18; // @[BPU.scala 66:23 29:30]
  wire  _GEN_487 = io_alu_out ? _GEN_295 : BTB_valid_19; // @[BPU.scala 66:23 29:30]
  wire  _GEN_488 = io_alu_out ? _GEN_296 : BTB_valid_20; // @[BPU.scala 66:23 29:30]
  wire  _GEN_489 = io_alu_out ? _GEN_297 : BTB_valid_21; // @[BPU.scala 66:23 29:30]
  wire  _GEN_490 = io_alu_out ? _GEN_298 : BTB_valid_22; // @[BPU.scala 66:23 29:30]
  wire  _GEN_491 = io_alu_out ? _GEN_299 : BTB_valid_23; // @[BPU.scala 66:23 29:30]
  wire  _GEN_492 = io_alu_out ? _GEN_300 : BTB_valid_24; // @[BPU.scala 66:23 29:30]
  wire  _GEN_493 = io_alu_out ? _GEN_301 : BTB_valid_25; // @[BPU.scala 66:23 29:30]
  wire  _GEN_494 = io_alu_out ? _GEN_302 : BTB_valid_26; // @[BPU.scala 66:23 29:30]
  wire  _GEN_495 = io_alu_out ? _GEN_303 : BTB_valid_27; // @[BPU.scala 66:23 29:30]
  wire  _GEN_496 = io_alu_out ? _GEN_304 : BTB_valid_28; // @[BPU.scala 66:23 29:30]
  wire  _GEN_497 = io_alu_out ? _GEN_305 : BTB_valid_29; // @[BPU.scala 66:23 29:30]
  wire  _GEN_498 = io_alu_out ? _GEN_306 : BTB_valid_30; // @[BPU.scala 66:23 29:30]
  wire  _GEN_499 = io_alu_out ? _GEN_307 : BTB_valid_31; // @[BPU.scala 66:23 29:30]
  wire [5:0] _LHT_T_1 = {_GEN_7, 1'h0}; // @[BPU.scala 82:68]
  wire [5:0] _GEN_1132 = {{5'd0}, io_alu_out}; // @[BPU.scala 82:74]
  wire [5:0] _LHT_T_2 = _LHT_T_1 | _GEN_1132; // @[BPU.scala 82:74]
  assign io_predict = _GEN_79 & IF_is_B_type & _GEN_111 >= 2'h2; // @[BPU.scala 44:62]
  assign io_predict_miss = EXE_is_B_type & (last_predict ^ io_alu_out); // @[BPU.scala 45:38]
  assign io_BTB_miss = EXE_is_B_type & last_predict & _GEN_39 != io_jb_pc; // @[BPU.scala 43:54]
  assign io_next_pc = io_jump ? io_jb_pc : _io_next_pc_T_5; // @[BPU.scala 47:20]
  always @(posedge clock) begin
    if (reset) begin // @[BPU.scala 27:30]
      BHT_0 <= 2'h3; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BHT_0 <= _GEN_404;
      end else begin
        BHT_0 <= _GEN_404;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BHT_1 <= 2'h3; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BHT_1 <= _GEN_405;
      end else begin
        BHT_1 <= _GEN_405;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BHT_2 <= 2'h3; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BHT_2 <= _GEN_406;
      end else begin
        BHT_2 <= _GEN_406;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BHT_3 <= 2'h3; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BHT_3 <= _GEN_407;
      end else begin
        BHT_3 <= _GEN_407;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BHT_4 <= 2'h3; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BHT_4 <= _GEN_408;
      end else begin
        BHT_4 <= _GEN_408;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BHT_5 <= 2'h3; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BHT_5 <= _GEN_409;
      end else begin
        BHT_5 <= _GEN_409;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BHT_6 <= 2'h3; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BHT_6 <= _GEN_410;
      end else begin
        BHT_6 <= _GEN_410;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BHT_7 <= 2'h3; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BHT_7 <= _GEN_411;
      end else begin
        BHT_7 <= _GEN_411;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BHT_8 <= 2'h3; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BHT_8 <= _GEN_412;
      end else begin
        BHT_8 <= _GEN_412;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BHT_9 <= 2'h3; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BHT_9 <= _GEN_413;
      end else begin
        BHT_9 <= _GEN_413;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BHT_10 <= 2'h3; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BHT_10 <= _GEN_414;
      end else begin
        BHT_10 <= _GEN_414;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BHT_11 <= 2'h3; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BHT_11 <= _GEN_415;
      end else begin
        BHT_11 <= _GEN_415;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BHT_12 <= 2'h3; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BHT_12 <= _GEN_416;
      end else begin
        BHT_12 <= _GEN_416;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BHT_13 <= 2'h3; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BHT_13 <= _GEN_417;
      end else begin
        BHT_13 <= _GEN_417;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BHT_14 <= 2'h3; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BHT_14 <= _GEN_418;
      end else begin
        BHT_14 <= _GEN_418;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BHT_15 <= 2'h3; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BHT_15 <= _GEN_419;
      end else begin
        BHT_15 <= _GEN_419;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BHT_16 <= 2'h3; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BHT_16 <= _GEN_420;
      end else begin
        BHT_16 <= _GEN_420;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BHT_17 <= 2'h3; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BHT_17 <= _GEN_421;
      end else begin
        BHT_17 <= _GEN_421;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BHT_18 <= 2'h3; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BHT_18 <= _GEN_422;
      end else begin
        BHT_18 <= _GEN_422;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BHT_19 <= 2'h3; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BHT_19 <= _GEN_423;
      end else begin
        BHT_19 <= _GEN_423;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BHT_20 <= 2'h3; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BHT_20 <= _GEN_424;
      end else begin
        BHT_20 <= _GEN_424;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BHT_21 <= 2'h3; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BHT_21 <= _GEN_425;
      end else begin
        BHT_21 <= _GEN_425;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BHT_22 <= 2'h3; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BHT_22 <= _GEN_426;
      end else begin
        BHT_22 <= _GEN_426;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BHT_23 <= 2'h3; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BHT_23 <= _GEN_427;
      end else begin
        BHT_23 <= _GEN_427;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BHT_24 <= 2'h3; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BHT_24 <= _GEN_428;
      end else begin
        BHT_24 <= _GEN_428;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BHT_25 <= 2'h3; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BHT_25 <= _GEN_429;
      end else begin
        BHT_25 <= _GEN_429;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BHT_26 <= 2'h3; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BHT_26 <= _GEN_430;
      end else begin
        BHT_26 <= _GEN_430;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BHT_27 <= 2'h3; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BHT_27 <= _GEN_431;
      end else begin
        BHT_27 <= _GEN_431;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BHT_28 <= 2'h3; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BHT_28 <= _GEN_432;
      end else begin
        BHT_28 <= _GEN_432;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BHT_29 <= 2'h3; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BHT_29 <= _GEN_433;
      end else begin
        BHT_29 <= _GEN_433;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BHT_30 <= 2'h3; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BHT_30 <= _GEN_434;
      end else begin
        BHT_30 <= _GEN_434;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BHT_31 <= 2'h3; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BHT_31 <= _GEN_435;
      end else begin
        BHT_31 <= _GEN_435;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_0 <= 32'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_0 <= _GEN_436;
      end else begin
        BTB_0 <= _GEN_436;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_1 <= 32'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_1 <= _GEN_437;
      end else begin
        BTB_1 <= _GEN_437;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_2 <= 32'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_2 <= _GEN_438;
      end else begin
        BTB_2 <= _GEN_438;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_3 <= 32'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_3 <= _GEN_439;
      end else begin
        BTB_3 <= _GEN_439;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_4 <= 32'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_4 <= _GEN_440;
      end else begin
        BTB_4 <= _GEN_440;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_5 <= 32'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_5 <= _GEN_441;
      end else begin
        BTB_5 <= _GEN_441;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_6 <= 32'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_6 <= _GEN_442;
      end else begin
        BTB_6 <= _GEN_442;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_7 <= 32'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_7 <= _GEN_443;
      end else begin
        BTB_7 <= _GEN_443;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_8 <= 32'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_8 <= _GEN_444;
      end else begin
        BTB_8 <= _GEN_444;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_9 <= 32'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_9 <= _GEN_445;
      end else begin
        BTB_9 <= _GEN_445;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_10 <= 32'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_10 <= _GEN_446;
      end else begin
        BTB_10 <= _GEN_446;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_11 <= 32'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_11 <= _GEN_447;
      end else begin
        BTB_11 <= _GEN_447;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_12 <= 32'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_12 <= _GEN_448;
      end else begin
        BTB_12 <= _GEN_448;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_13 <= 32'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_13 <= _GEN_449;
      end else begin
        BTB_13 <= _GEN_449;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_14 <= 32'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_14 <= _GEN_450;
      end else begin
        BTB_14 <= _GEN_450;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_15 <= 32'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_15 <= _GEN_451;
      end else begin
        BTB_15 <= _GEN_451;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_16 <= 32'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_16 <= _GEN_452;
      end else begin
        BTB_16 <= _GEN_452;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_17 <= 32'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_17 <= _GEN_453;
      end else begin
        BTB_17 <= _GEN_453;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_18 <= 32'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_18 <= _GEN_454;
      end else begin
        BTB_18 <= _GEN_454;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_19 <= 32'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_19 <= _GEN_455;
      end else begin
        BTB_19 <= _GEN_455;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_20 <= 32'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_20 <= _GEN_456;
      end else begin
        BTB_20 <= _GEN_456;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_21 <= 32'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_21 <= _GEN_457;
      end else begin
        BTB_21 <= _GEN_457;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_22 <= 32'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_22 <= _GEN_458;
      end else begin
        BTB_22 <= _GEN_458;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_23 <= 32'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_23 <= _GEN_459;
      end else begin
        BTB_23 <= _GEN_459;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_24 <= 32'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_24 <= _GEN_460;
      end else begin
        BTB_24 <= _GEN_460;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_25 <= 32'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_25 <= _GEN_461;
      end else begin
        BTB_25 <= _GEN_461;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_26 <= 32'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_26 <= _GEN_462;
      end else begin
        BTB_26 <= _GEN_462;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_27 <= 32'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_27 <= _GEN_463;
      end else begin
        BTB_27 <= _GEN_463;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_28 <= 32'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_28 <= _GEN_464;
      end else begin
        BTB_28 <= _GEN_464;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_29 <= 32'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_29 <= _GEN_465;
      end else begin
        BTB_29 <= _GEN_465;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_30 <= 32'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_30 <= _GEN_466;
      end else begin
        BTB_30 <= _GEN_466;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_31 <= 32'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_31 <= _GEN_467;
      end else begin
        BTB_31 <= _GEN_467;
      end
    end
    if (reset) begin // @[BPU.scala 29:30]
      BTB_valid_0 <= 1'h0; // @[BPU.scala 29:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_valid_0 <= _GEN_468;
      end else begin
        BTB_valid_0 <= _GEN_468;
      end
    end
    if (reset) begin // @[BPU.scala 29:30]
      BTB_valid_1 <= 1'h0; // @[BPU.scala 29:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_valid_1 <= _GEN_469;
      end else begin
        BTB_valid_1 <= _GEN_469;
      end
    end
    if (reset) begin // @[BPU.scala 29:30]
      BTB_valid_2 <= 1'h0; // @[BPU.scala 29:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_valid_2 <= _GEN_470;
      end else begin
        BTB_valid_2 <= _GEN_470;
      end
    end
    if (reset) begin // @[BPU.scala 29:30]
      BTB_valid_3 <= 1'h0; // @[BPU.scala 29:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_valid_3 <= _GEN_471;
      end else begin
        BTB_valid_3 <= _GEN_471;
      end
    end
    if (reset) begin // @[BPU.scala 29:30]
      BTB_valid_4 <= 1'h0; // @[BPU.scala 29:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_valid_4 <= _GEN_472;
      end else begin
        BTB_valid_4 <= _GEN_472;
      end
    end
    if (reset) begin // @[BPU.scala 29:30]
      BTB_valid_5 <= 1'h0; // @[BPU.scala 29:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_valid_5 <= _GEN_473;
      end else begin
        BTB_valid_5 <= _GEN_473;
      end
    end
    if (reset) begin // @[BPU.scala 29:30]
      BTB_valid_6 <= 1'h0; // @[BPU.scala 29:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_valid_6 <= _GEN_474;
      end else begin
        BTB_valid_6 <= _GEN_474;
      end
    end
    if (reset) begin // @[BPU.scala 29:30]
      BTB_valid_7 <= 1'h0; // @[BPU.scala 29:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_valid_7 <= _GEN_475;
      end else begin
        BTB_valid_7 <= _GEN_475;
      end
    end
    if (reset) begin // @[BPU.scala 29:30]
      BTB_valid_8 <= 1'h0; // @[BPU.scala 29:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_valid_8 <= _GEN_476;
      end else begin
        BTB_valid_8 <= _GEN_476;
      end
    end
    if (reset) begin // @[BPU.scala 29:30]
      BTB_valid_9 <= 1'h0; // @[BPU.scala 29:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_valid_9 <= _GEN_477;
      end else begin
        BTB_valid_9 <= _GEN_477;
      end
    end
    if (reset) begin // @[BPU.scala 29:30]
      BTB_valid_10 <= 1'h0; // @[BPU.scala 29:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_valid_10 <= _GEN_478;
      end else begin
        BTB_valid_10 <= _GEN_478;
      end
    end
    if (reset) begin // @[BPU.scala 29:30]
      BTB_valid_11 <= 1'h0; // @[BPU.scala 29:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_valid_11 <= _GEN_479;
      end else begin
        BTB_valid_11 <= _GEN_479;
      end
    end
    if (reset) begin // @[BPU.scala 29:30]
      BTB_valid_12 <= 1'h0; // @[BPU.scala 29:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_valid_12 <= _GEN_480;
      end else begin
        BTB_valid_12 <= _GEN_480;
      end
    end
    if (reset) begin // @[BPU.scala 29:30]
      BTB_valid_13 <= 1'h0; // @[BPU.scala 29:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_valid_13 <= _GEN_481;
      end else begin
        BTB_valid_13 <= _GEN_481;
      end
    end
    if (reset) begin // @[BPU.scala 29:30]
      BTB_valid_14 <= 1'h0; // @[BPU.scala 29:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_valid_14 <= _GEN_482;
      end else begin
        BTB_valid_14 <= _GEN_482;
      end
    end
    if (reset) begin // @[BPU.scala 29:30]
      BTB_valid_15 <= 1'h0; // @[BPU.scala 29:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_valid_15 <= _GEN_483;
      end else begin
        BTB_valid_15 <= _GEN_483;
      end
    end
    if (reset) begin // @[BPU.scala 29:30]
      BTB_valid_16 <= 1'h0; // @[BPU.scala 29:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_valid_16 <= _GEN_484;
      end else begin
        BTB_valid_16 <= _GEN_484;
      end
    end
    if (reset) begin // @[BPU.scala 29:30]
      BTB_valid_17 <= 1'h0; // @[BPU.scala 29:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_valid_17 <= _GEN_485;
      end else begin
        BTB_valid_17 <= _GEN_485;
      end
    end
    if (reset) begin // @[BPU.scala 29:30]
      BTB_valid_18 <= 1'h0; // @[BPU.scala 29:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_valid_18 <= _GEN_486;
      end else begin
        BTB_valid_18 <= _GEN_486;
      end
    end
    if (reset) begin // @[BPU.scala 29:30]
      BTB_valid_19 <= 1'h0; // @[BPU.scala 29:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_valid_19 <= _GEN_487;
      end else begin
        BTB_valid_19 <= _GEN_487;
      end
    end
    if (reset) begin // @[BPU.scala 29:30]
      BTB_valid_20 <= 1'h0; // @[BPU.scala 29:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_valid_20 <= _GEN_488;
      end else begin
        BTB_valid_20 <= _GEN_488;
      end
    end
    if (reset) begin // @[BPU.scala 29:30]
      BTB_valid_21 <= 1'h0; // @[BPU.scala 29:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_valid_21 <= _GEN_489;
      end else begin
        BTB_valid_21 <= _GEN_489;
      end
    end
    if (reset) begin // @[BPU.scala 29:30]
      BTB_valid_22 <= 1'h0; // @[BPU.scala 29:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_valid_22 <= _GEN_490;
      end else begin
        BTB_valid_22 <= _GEN_490;
      end
    end
    if (reset) begin // @[BPU.scala 29:30]
      BTB_valid_23 <= 1'h0; // @[BPU.scala 29:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_valid_23 <= _GEN_491;
      end else begin
        BTB_valid_23 <= _GEN_491;
      end
    end
    if (reset) begin // @[BPU.scala 29:30]
      BTB_valid_24 <= 1'h0; // @[BPU.scala 29:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_valid_24 <= _GEN_492;
      end else begin
        BTB_valid_24 <= _GEN_492;
      end
    end
    if (reset) begin // @[BPU.scala 29:30]
      BTB_valid_25 <= 1'h0; // @[BPU.scala 29:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_valid_25 <= _GEN_493;
      end else begin
        BTB_valid_25 <= _GEN_493;
      end
    end
    if (reset) begin // @[BPU.scala 29:30]
      BTB_valid_26 <= 1'h0; // @[BPU.scala 29:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_valid_26 <= _GEN_494;
      end else begin
        BTB_valid_26 <= _GEN_494;
      end
    end
    if (reset) begin // @[BPU.scala 29:30]
      BTB_valid_27 <= 1'h0; // @[BPU.scala 29:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_valid_27 <= _GEN_495;
      end else begin
        BTB_valid_27 <= _GEN_495;
      end
    end
    if (reset) begin // @[BPU.scala 29:30]
      BTB_valid_28 <= 1'h0; // @[BPU.scala 29:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_valid_28 <= _GEN_496;
      end else begin
        BTB_valid_28 <= _GEN_496;
      end
    end
    if (reset) begin // @[BPU.scala 29:30]
      BTB_valid_29 <= 1'h0; // @[BPU.scala 29:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_valid_29 <= _GEN_497;
      end else begin
        BTB_valid_29 <= _GEN_497;
      end
    end
    if (reset) begin // @[BPU.scala 29:30]
      BTB_valid_30 <= 1'h0; // @[BPU.scala 29:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_valid_30 <= _GEN_498;
      end else begin
        BTB_valid_30 <= _GEN_498;
      end
    end
    if (reset) begin // @[BPU.scala 29:30]
      BTB_valid_31 <= 1'h0; // @[BPU.scala 29:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (last_predict) begin // @[BPU.scala 65:24]
        BTB_valid_31 <= _GEN_499;
      end else begin
        BTB_valid_31 <= _GEN_499;
      end
    end
    if (reset) begin // @[BPU.scala 30:30]
      LHT_0 <= 5'h0; // @[BPU.scala 30:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (3'h0 == io_EXE_pc[4:2]) begin // @[BPU.scala 82:34]
        LHT_0 <= _LHT_T_2[4:0]; // @[BPU.scala 82:34]
      end
    end
    if (reset) begin // @[BPU.scala 30:30]
      LHT_1 <= 5'h0; // @[BPU.scala 30:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (3'h1 == io_EXE_pc[4:2]) begin // @[BPU.scala 82:34]
        LHT_1 <= _LHT_T_2[4:0]; // @[BPU.scala 82:34]
      end
    end
    if (reset) begin // @[BPU.scala 30:30]
      LHT_2 <= 5'h0; // @[BPU.scala 30:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (3'h2 == io_EXE_pc[4:2]) begin // @[BPU.scala 82:34]
        LHT_2 <= _LHT_T_2[4:0]; // @[BPU.scala 82:34]
      end
    end
    if (reset) begin // @[BPU.scala 30:30]
      LHT_3 <= 5'h0; // @[BPU.scala 30:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (3'h3 == io_EXE_pc[4:2]) begin // @[BPU.scala 82:34]
        LHT_3 <= _LHT_T_2[4:0]; // @[BPU.scala 82:34]
      end
    end
    if (reset) begin // @[BPU.scala 30:30]
      LHT_4 <= 5'h0; // @[BPU.scala 30:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (3'h4 == io_EXE_pc[4:2]) begin // @[BPU.scala 82:34]
        LHT_4 <= _LHT_T_2[4:0]; // @[BPU.scala 82:34]
      end
    end
    if (reset) begin // @[BPU.scala 30:30]
      LHT_5 <= 5'h0; // @[BPU.scala 30:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (3'h5 == io_EXE_pc[4:2]) begin // @[BPU.scala 82:34]
        LHT_5 <= _LHT_T_2[4:0]; // @[BPU.scala 82:34]
      end
    end
    if (reset) begin // @[BPU.scala 30:30]
      LHT_6 <= 5'h0; // @[BPU.scala 30:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (3'h6 == io_EXE_pc[4:2]) begin // @[BPU.scala 82:34]
        LHT_6 <= _LHT_T_2[4:0]; // @[BPU.scala 82:34]
      end
    end
    if (reset) begin // @[BPU.scala 30:30]
      LHT_7 <= 5'h0; // @[BPU.scala 30:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 64:23]
      if (3'h7 == io_EXE_pc[4:2]) begin // @[BPU.scala 82:34]
        LHT_7 <= _LHT_T_2[4:0]; // @[BPU.scala 82:34]
      end
    end
    if (reset) begin // @[BPU.scala 32:30]
      delay <= 1'h0; // @[BPU.scala 32:30]
    end else if (!(io_stall)) begin // @[BPU.scala 52:18]
      delay <= io_predict; // @[BPU.scala 58:18]
    end
    if (reset) begin // @[BPU.scala 33:30]
      last_predict <= 1'h0; // @[BPU.scala 33:30]
    end else if (!(io_stall)) begin // @[BPU.scala 52:18]
      last_predict <= delay; // @[BPU.scala 59:18]
    end
    if (reset) begin // @[BPU.scala 34:30]
      delay_pc <= 32'h0; // @[BPU.scala 34:30]
    end else if (!(io_stall)) begin // @[BPU.scala 52:18]
      delay_pc <= _io_next_pc_T_2; // @[BPU.scala 60:18]
    end
    if (reset) begin // @[BPU.scala 35:30]
      last_pc <= 32'h0; // @[BPU.scala 35:30]
    end else if (!(io_stall)) begin // @[BPU.scala 52:18]
      last_pc <= delay_pc; // @[BPU.scala 61:18]
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
  BHT_16 = _RAND_16[1:0];
  _RAND_17 = {1{`RANDOM}};
  BHT_17 = _RAND_17[1:0];
  _RAND_18 = {1{`RANDOM}};
  BHT_18 = _RAND_18[1:0];
  _RAND_19 = {1{`RANDOM}};
  BHT_19 = _RAND_19[1:0];
  _RAND_20 = {1{`RANDOM}};
  BHT_20 = _RAND_20[1:0];
  _RAND_21 = {1{`RANDOM}};
  BHT_21 = _RAND_21[1:0];
  _RAND_22 = {1{`RANDOM}};
  BHT_22 = _RAND_22[1:0];
  _RAND_23 = {1{`RANDOM}};
  BHT_23 = _RAND_23[1:0];
  _RAND_24 = {1{`RANDOM}};
  BHT_24 = _RAND_24[1:0];
  _RAND_25 = {1{`RANDOM}};
  BHT_25 = _RAND_25[1:0];
  _RAND_26 = {1{`RANDOM}};
  BHT_26 = _RAND_26[1:0];
  _RAND_27 = {1{`RANDOM}};
  BHT_27 = _RAND_27[1:0];
  _RAND_28 = {1{`RANDOM}};
  BHT_28 = _RAND_28[1:0];
  _RAND_29 = {1{`RANDOM}};
  BHT_29 = _RAND_29[1:0];
  _RAND_30 = {1{`RANDOM}};
  BHT_30 = _RAND_30[1:0];
  _RAND_31 = {1{`RANDOM}};
  BHT_31 = _RAND_31[1:0];
  _RAND_32 = {1{`RANDOM}};
  BTB_0 = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  BTB_1 = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  BTB_2 = _RAND_34[31:0];
  _RAND_35 = {1{`RANDOM}};
  BTB_3 = _RAND_35[31:0];
  _RAND_36 = {1{`RANDOM}};
  BTB_4 = _RAND_36[31:0];
  _RAND_37 = {1{`RANDOM}};
  BTB_5 = _RAND_37[31:0];
  _RAND_38 = {1{`RANDOM}};
  BTB_6 = _RAND_38[31:0];
  _RAND_39 = {1{`RANDOM}};
  BTB_7 = _RAND_39[31:0];
  _RAND_40 = {1{`RANDOM}};
  BTB_8 = _RAND_40[31:0];
  _RAND_41 = {1{`RANDOM}};
  BTB_9 = _RAND_41[31:0];
  _RAND_42 = {1{`RANDOM}};
  BTB_10 = _RAND_42[31:0];
  _RAND_43 = {1{`RANDOM}};
  BTB_11 = _RAND_43[31:0];
  _RAND_44 = {1{`RANDOM}};
  BTB_12 = _RAND_44[31:0];
  _RAND_45 = {1{`RANDOM}};
  BTB_13 = _RAND_45[31:0];
  _RAND_46 = {1{`RANDOM}};
  BTB_14 = _RAND_46[31:0];
  _RAND_47 = {1{`RANDOM}};
  BTB_15 = _RAND_47[31:0];
  _RAND_48 = {1{`RANDOM}};
  BTB_16 = _RAND_48[31:0];
  _RAND_49 = {1{`RANDOM}};
  BTB_17 = _RAND_49[31:0];
  _RAND_50 = {1{`RANDOM}};
  BTB_18 = _RAND_50[31:0];
  _RAND_51 = {1{`RANDOM}};
  BTB_19 = _RAND_51[31:0];
  _RAND_52 = {1{`RANDOM}};
  BTB_20 = _RAND_52[31:0];
  _RAND_53 = {1{`RANDOM}};
  BTB_21 = _RAND_53[31:0];
  _RAND_54 = {1{`RANDOM}};
  BTB_22 = _RAND_54[31:0];
  _RAND_55 = {1{`RANDOM}};
  BTB_23 = _RAND_55[31:0];
  _RAND_56 = {1{`RANDOM}};
  BTB_24 = _RAND_56[31:0];
  _RAND_57 = {1{`RANDOM}};
  BTB_25 = _RAND_57[31:0];
  _RAND_58 = {1{`RANDOM}};
  BTB_26 = _RAND_58[31:0];
  _RAND_59 = {1{`RANDOM}};
  BTB_27 = _RAND_59[31:0];
  _RAND_60 = {1{`RANDOM}};
  BTB_28 = _RAND_60[31:0];
  _RAND_61 = {1{`RANDOM}};
  BTB_29 = _RAND_61[31:0];
  _RAND_62 = {1{`RANDOM}};
  BTB_30 = _RAND_62[31:0];
  _RAND_63 = {1{`RANDOM}};
  BTB_31 = _RAND_63[31:0];
  _RAND_64 = {1{`RANDOM}};
  BTB_valid_0 = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  BTB_valid_1 = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  BTB_valid_2 = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  BTB_valid_3 = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  BTB_valid_4 = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  BTB_valid_5 = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  BTB_valid_6 = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  BTB_valid_7 = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  BTB_valid_8 = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  BTB_valid_9 = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  BTB_valid_10 = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  BTB_valid_11 = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  BTB_valid_12 = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  BTB_valid_13 = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  BTB_valid_14 = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  BTB_valid_15 = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  BTB_valid_16 = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  BTB_valid_17 = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  BTB_valid_18 = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  BTB_valid_19 = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  BTB_valid_20 = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  BTB_valid_21 = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  BTB_valid_22 = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  BTB_valid_23 = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  BTB_valid_24 = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  BTB_valid_25 = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  BTB_valid_26 = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  BTB_valid_27 = _RAND_91[0:0];
  _RAND_92 = {1{`RANDOM}};
  BTB_valid_28 = _RAND_92[0:0];
  _RAND_93 = {1{`RANDOM}};
  BTB_valid_29 = _RAND_93[0:0];
  _RAND_94 = {1{`RANDOM}};
  BTB_valid_30 = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  BTB_valid_31 = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  LHT_0 = _RAND_96[4:0];
  _RAND_97 = {1{`RANDOM}};
  LHT_1 = _RAND_97[4:0];
  _RAND_98 = {1{`RANDOM}};
  LHT_2 = _RAND_98[4:0];
  _RAND_99 = {1{`RANDOM}};
  LHT_3 = _RAND_99[4:0];
  _RAND_100 = {1{`RANDOM}};
  LHT_4 = _RAND_100[4:0];
  _RAND_101 = {1{`RANDOM}};
  LHT_5 = _RAND_101[4:0];
  _RAND_102 = {1{`RANDOM}};
  LHT_6 = _RAND_102[4:0];
  _RAND_103 = {1{`RANDOM}};
  LHT_7 = _RAND_103[4:0];
  _RAND_104 = {1{`RANDOM}};
  delay = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  last_predict = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  delay_pc = _RAND_106[31:0];
  _RAND_107 = {1{`RANDOM}};
  last_pc = _RAND_107[31:0];
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
