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
