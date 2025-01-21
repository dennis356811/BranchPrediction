module Imm_Ext(
  input         clock,
  input         reset,
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
  wire [31:0] _GEN_0 = 5'h1b == io_inst[6:2] ? _io_imm_ext_out_T_38 : 32'h0; // @[Imm_Ext.scala 23:24 26:26 49:33]
  wire [31:0] _GEN_1 = 5'h5 == io_inst[6:2] ? _io_imm_ext_out_T_29 : _GEN_0; // @[Imm_Ext.scala 26:26 46:33]
  wire [31:0] _GEN_2 = 5'hd == io_inst[6:2] ? _io_imm_ext_out_T_29 : _GEN_1; // @[Imm_Ext.scala 26:26 43:33]
  wire [31:0] _GEN_3 = 5'h18 == io_inst[6:2] ? _io_imm_ext_out_T_27 : _GEN_2; // @[Imm_Ext.scala 26:26 40:33]
  wire [31:0] _GEN_4 = 5'h8 == io_inst[6:2] ? _io_imm_ext_out_T_20 : _GEN_3; // @[Imm_Ext.scala 26:26 37:33]
  wire [31:0] _GEN_5 = 5'h19 == io_inst[6:2] ? _io_imm_ext_out_T_4 : _GEN_4; // @[Imm_Ext.scala 26:26 34:33]
  wire [31:0] _GEN_6 = 5'h4 == io_inst[6:2] ? _io_imm_ext_out_T_4 : _GEN_5; // @[Imm_Ext.scala 26:26 31:33]
  assign io_imm_ext_out = 5'h0 == io_inst[6:2] ? _io_imm_ext_out_T_4 : _GEN_6; // @[Imm_Ext.scala 26:26 28:33]
endmodule
