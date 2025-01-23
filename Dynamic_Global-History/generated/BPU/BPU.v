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
