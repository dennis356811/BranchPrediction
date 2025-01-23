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
  reg [1:0] BHT_16; // @[BPU.scala 26:30]
  reg [1:0] BHT_17; // @[BPU.scala 26:30]
  reg [1:0] BHT_18; // @[BPU.scala 26:30]
  reg [1:0] BHT_19; // @[BPU.scala 26:30]
  reg [1:0] BHT_20; // @[BPU.scala 26:30]
  reg [1:0] BHT_21; // @[BPU.scala 26:30]
  reg [1:0] BHT_22; // @[BPU.scala 26:30]
  reg [1:0] BHT_23; // @[BPU.scala 26:30]
  reg [1:0] BHT_24; // @[BPU.scala 26:30]
  reg [1:0] BHT_25; // @[BPU.scala 26:30]
  reg [1:0] BHT_26; // @[BPU.scala 26:30]
  reg [1:0] BHT_27; // @[BPU.scala 26:30]
  reg [1:0] BHT_28; // @[BPU.scala 26:30]
  reg [1:0] BHT_29; // @[BPU.scala 26:30]
  reg [1:0] BHT_30; // @[BPU.scala 26:30]
  reg [1:0] BHT_31; // @[BPU.scala 26:30]
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
  reg [31:0] BTB_16; // @[BPU.scala 27:30]
  reg [31:0] BTB_17; // @[BPU.scala 27:30]
  reg [31:0] BTB_18; // @[BPU.scala 27:30]
  reg [31:0] BTB_19; // @[BPU.scala 27:30]
  reg [31:0] BTB_20; // @[BPU.scala 27:30]
  reg [31:0] BTB_21; // @[BPU.scala 27:30]
  reg [31:0] BTB_22; // @[BPU.scala 27:30]
  reg [31:0] BTB_23; // @[BPU.scala 27:30]
  reg [31:0] BTB_24; // @[BPU.scala 27:30]
  reg [31:0] BTB_25; // @[BPU.scala 27:30]
  reg [31:0] BTB_26; // @[BPU.scala 27:30]
  reg [31:0] BTB_27; // @[BPU.scala 27:30]
  reg [31:0] BTB_28; // @[BPU.scala 27:30]
  reg [31:0] BTB_29; // @[BPU.scala 27:30]
  reg [31:0] BTB_30; // @[BPU.scala 27:30]
  reg [31:0] BTB_31; // @[BPU.scala 27:30]
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
  reg  BTB_valid_16; // @[BPU.scala 28:30]
  reg  BTB_valid_17; // @[BPU.scala 28:30]
  reg  BTB_valid_18; // @[BPU.scala 28:30]
  reg  BTB_valid_19; // @[BPU.scala 28:30]
  reg  BTB_valid_20; // @[BPU.scala 28:30]
  reg  BTB_valid_21; // @[BPU.scala 28:30]
  reg  BTB_valid_22; // @[BPU.scala 28:30]
  reg  BTB_valid_23; // @[BPU.scala 28:30]
  reg  BTB_valid_24; // @[BPU.scala 28:30]
  reg  BTB_valid_25; // @[BPU.scala 28:30]
  reg  BTB_valid_26; // @[BPU.scala 28:30]
  reg  BTB_valid_27; // @[BPU.scala 28:30]
  reg  BTB_valid_28; // @[BPU.scala 28:30]
  reg  BTB_valid_29; // @[BPU.scala 28:30]
  reg  BTB_valid_30; // @[BPU.scala 28:30]
  reg  BTB_valid_31; // @[BPU.scala 28:30]
  reg  delay; // @[BPU.scala 30:30]
  reg  last_predict; // @[BPU.scala 31:30]
  reg [31:0] delay_pc; // @[BPU.scala 32:30]
  reg [31:0] last_pc; // @[BPU.scala 33:30]
  reg [4:0] temp; // @[BPU.scala 35:30]
  reg [4:0] delay_GH; // @[BPU.scala 36:30]
  reg [4:0] GH; // @[BPU.scala 37:30]
  wire  IF_is_B_type = io_IF_inst[6:0] == 7'h63; // @[BPU.scala 39:40]
  wire  EXE_is_B_type = io_EXE_op == 5'h18; // @[BPU.scala 40:33]
  wire [4:0] IF_B_index = io_IF_pc[6:2] ^ GH; // @[BPU.scala 42:47]
  wire [4:0] EXE_B_index = io_EXE_pc[6:2] ^ delay_GH; // @[BPU.scala 43:48]
  wire [31:0] _GEN_1 = 5'h1 == EXE_B_index ? BTB_1 : BTB_0; // @[BPU.scala 45:{75,75}]
  wire [31:0] _GEN_2 = 5'h2 == EXE_B_index ? BTB_2 : _GEN_1; // @[BPU.scala 45:{75,75}]
  wire [31:0] _GEN_3 = 5'h3 == EXE_B_index ? BTB_3 : _GEN_2; // @[BPU.scala 45:{75,75}]
  wire [31:0] _GEN_4 = 5'h4 == EXE_B_index ? BTB_4 : _GEN_3; // @[BPU.scala 45:{75,75}]
  wire [31:0] _GEN_5 = 5'h5 == EXE_B_index ? BTB_5 : _GEN_4; // @[BPU.scala 45:{75,75}]
  wire [31:0] _GEN_6 = 5'h6 == EXE_B_index ? BTB_6 : _GEN_5; // @[BPU.scala 45:{75,75}]
  wire [31:0] _GEN_7 = 5'h7 == EXE_B_index ? BTB_7 : _GEN_6; // @[BPU.scala 45:{75,75}]
  wire [31:0] _GEN_8 = 5'h8 == EXE_B_index ? BTB_8 : _GEN_7; // @[BPU.scala 45:{75,75}]
  wire [31:0] _GEN_9 = 5'h9 == EXE_B_index ? BTB_9 : _GEN_8; // @[BPU.scala 45:{75,75}]
  wire [31:0] _GEN_10 = 5'ha == EXE_B_index ? BTB_10 : _GEN_9; // @[BPU.scala 45:{75,75}]
  wire [31:0] _GEN_11 = 5'hb == EXE_B_index ? BTB_11 : _GEN_10; // @[BPU.scala 45:{75,75}]
  wire [31:0] _GEN_12 = 5'hc == EXE_B_index ? BTB_12 : _GEN_11; // @[BPU.scala 45:{75,75}]
  wire [31:0] _GEN_13 = 5'hd == EXE_B_index ? BTB_13 : _GEN_12; // @[BPU.scala 45:{75,75}]
  wire [31:0] _GEN_14 = 5'he == EXE_B_index ? BTB_14 : _GEN_13; // @[BPU.scala 45:{75,75}]
  wire [31:0] _GEN_15 = 5'hf == EXE_B_index ? BTB_15 : _GEN_14; // @[BPU.scala 45:{75,75}]
  wire [31:0] _GEN_16 = 5'h10 == EXE_B_index ? BTB_16 : _GEN_15; // @[BPU.scala 45:{75,75}]
  wire [31:0] _GEN_17 = 5'h11 == EXE_B_index ? BTB_17 : _GEN_16; // @[BPU.scala 45:{75,75}]
  wire [31:0] _GEN_18 = 5'h12 == EXE_B_index ? BTB_18 : _GEN_17; // @[BPU.scala 45:{75,75}]
  wire [31:0] _GEN_19 = 5'h13 == EXE_B_index ? BTB_19 : _GEN_18; // @[BPU.scala 45:{75,75}]
  wire [31:0] _GEN_20 = 5'h14 == EXE_B_index ? BTB_20 : _GEN_19; // @[BPU.scala 45:{75,75}]
  wire [31:0] _GEN_21 = 5'h15 == EXE_B_index ? BTB_21 : _GEN_20; // @[BPU.scala 45:{75,75}]
  wire [31:0] _GEN_22 = 5'h16 == EXE_B_index ? BTB_22 : _GEN_21; // @[BPU.scala 45:{75,75}]
  wire [31:0] _GEN_23 = 5'h17 == EXE_B_index ? BTB_23 : _GEN_22; // @[BPU.scala 45:{75,75}]
  wire [31:0] _GEN_24 = 5'h18 == EXE_B_index ? BTB_24 : _GEN_23; // @[BPU.scala 45:{75,75}]
  wire [31:0] _GEN_25 = 5'h19 == EXE_B_index ? BTB_25 : _GEN_24; // @[BPU.scala 45:{75,75}]
  wire [31:0] _GEN_26 = 5'h1a == EXE_B_index ? BTB_26 : _GEN_25; // @[BPU.scala 45:{75,75}]
  wire [31:0] _GEN_27 = 5'h1b == EXE_B_index ? BTB_27 : _GEN_26; // @[BPU.scala 45:{75,75}]
  wire [31:0] _GEN_28 = 5'h1c == EXE_B_index ? BTB_28 : _GEN_27; // @[BPU.scala 45:{75,75}]
  wire [31:0] _GEN_29 = 5'h1d == EXE_B_index ? BTB_29 : _GEN_28; // @[BPU.scala 45:{75,75}]
  wire [31:0] _GEN_30 = 5'h1e == EXE_B_index ? BTB_30 : _GEN_29; // @[BPU.scala 45:{75,75}]
  wire [31:0] _GEN_31 = 5'h1f == EXE_B_index ? BTB_31 : _GEN_30; // @[BPU.scala 45:{75,75}]
  wire  _GEN_33 = 5'h1 == IF_B_index ? BTB_valid_1 : BTB_valid_0; // @[BPU.scala 46:{46,46}]
  wire  _GEN_34 = 5'h2 == IF_B_index ? BTB_valid_2 : _GEN_33; // @[BPU.scala 46:{46,46}]
  wire  _GEN_35 = 5'h3 == IF_B_index ? BTB_valid_3 : _GEN_34; // @[BPU.scala 46:{46,46}]
  wire  _GEN_36 = 5'h4 == IF_B_index ? BTB_valid_4 : _GEN_35; // @[BPU.scala 46:{46,46}]
  wire  _GEN_37 = 5'h5 == IF_B_index ? BTB_valid_5 : _GEN_36; // @[BPU.scala 46:{46,46}]
  wire  _GEN_38 = 5'h6 == IF_B_index ? BTB_valid_6 : _GEN_37; // @[BPU.scala 46:{46,46}]
  wire  _GEN_39 = 5'h7 == IF_B_index ? BTB_valid_7 : _GEN_38; // @[BPU.scala 46:{46,46}]
  wire  _GEN_40 = 5'h8 == IF_B_index ? BTB_valid_8 : _GEN_39; // @[BPU.scala 46:{46,46}]
  wire  _GEN_41 = 5'h9 == IF_B_index ? BTB_valid_9 : _GEN_40; // @[BPU.scala 46:{46,46}]
  wire  _GEN_42 = 5'ha == IF_B_index ? BTB_valid_10 : _GEN_41; // @[BPU.scala 46:{46,46}]
  wire  _GEN_43 = 5'hb == IF_B_index ? BTB_valid_11 : _GEN_42; // @[BPU.scala 46:{46,46}]
  wire  _GEN_44 = 5'hc == IF_B_index ? BTB_valid_12 : _GEN_43; // @[BPU.scala 46:{46,46}]
  wire  _GEN_45 = 5'hd == IF_B_index ? BTB_valid_13 : _GEN_44; // @[BPU.scala 46:{46,46}]
  wire  _GEN_46 = 5'he == IF_B_index ? BTB_valid_14 : _GEN_45; // @[BPU.scala 46:{46,46}]
  wire  _GEN_47 = 5'hf == IF_B_index ? BTB_valid_15 : _GEN_46; // @[BPU.scala 46:{46,46}]
  wire  _GEN_48 = 5'h10 == IF_B_index ? BTB_valid_16 : _GEN_47; // @[BPU.scala 46:{46,46}]
  wire  _GEN_49 = 5'h11 == IF_B_index ? BTB_valid_17 : _GEN_48; // @[BPU.scala 46:{46,46}]
  wire  _GEN_50 = 5'h12 == IF_B_index ? BTB_valid_18 : _GEN_49; // @[BPU.scala 46:{46,46}]
  wire  _GEN_51 = 5'h13 == IF_B_index ? BTB_valid_19 : _GEN_50; // @[BPU.scala 46:{46,46}]
  wire  _GEN_52 = 5'h14 == IF_B_index ? BTB_valid_20 : _GEN_51; // @[BPU.scala 46:{46,46}]
  wire  _GEN_53 = 5'h15 == IF_B_index ? BTB_valid_21 : _GEN_52; // @[BPU.scala 46:{46,46}]
  wire  _GEN_54 = 5'h16 == IF_B_index ? BTB_valid_22 : _GEN_53; // @[BPU.scala 46:{46,46}]
  wire  _GEN_55 = 5'h17 == IF_B_index ? BTB_valid_23 : _GEN_54; // @[BPU.scala 46:{46,46}]
  wire  _GEN_56 = 5'h18 == IF_B_index ? BTB_valid_24 : _GEN_55; // @[BPU.scala 46:{46,46}]
  wire  _GEN_57 = 5'h19 == IF_B_index ? BTB_valid_25 : _GEN_56; // @[BPU.scala 46:{46,46}]
  wire  _GEN_58 = 5'h1a == IF_B_index ? BTB_valid_26 : _GEN_57; // @[BPU.scala 46:{46,46}]
  wire  _GEN_59 = 5'h1b == IF_B_index ? BTB_valid_27 : _GEN_58; // @[BPU.scala 46:{46,46}]
  wire  _GEN_60 = 5'h1c == IF_B_index ? BTB_valid_28 : _GEN_59; // @[BPU.scala 46:{46,46}]
  wire  _GEN_61 = 5'h1d == IF_B_index ? BTB_valid_29 : _GEN_60; // @[BPU.scala 46:{46,46}]
  wire  _GEN_62 = 5'h1e == IF_B_index ? BTB_valid_30 : _GEN_61; // @[BPU.scala 46:{46,46}]
  wire  _GEN_63 = 5'h1f == IF_B_index ? BTB_valid_31 : _GEN_62; // @[BPU.scala 46:{46,46}]
  wire [1:0] _GEN_65 = 5'h1 == IF_B_index ? BHT_1 : BHT_0; // @[BPU.scala 46:{81,81}]
  wire [1:0] _GEN_66 = 5'h2 == IF_B_index ? BHT_2 : _GEN_65; // @[BPU.scala 46:{81,81}]
  wire [1:0] _GEN_67 = 5'h3 == IF_B_index ? BHT_3 : _GEN_66; // @[BPU.scala 46:{81,81}]
  wire [1:0] _GEN_68 = 5'h4 == IF_B_index ? BHT_4 : _GEN_67; // @[BPU.scala 46:{81,81}]
  wire [1:0] _GEN_69 = 5'h5 == IF_B_index ? BHT_5 : _GEN_68; // @[BPU.scala 46:{81,81}]
  wire [1:0] _GEN_70 = 5'h6 == IF_B_index ? BHT_6 : _GEN_69; // @[BPU.scala 46:{81,81}]
  wire [1:0] _GEN_71 = 5'h7 == IF_B_index ? BHT_7 : _GEN_70; // @[BPU.scala 46:{81,81}]
  wire [1:0] _GEN_72 = 5'h8 == IF_B_index ? BHT_8 : _GEN_71; // @[BPU.scala 46:{81,81}]
  wire [1:0] _GEN_73 = 5'h9 == IF_B_index ? BHT_9 : _GEN_72; // @[BPU.scala 46:{81,81}]
  wire [1:0] _GEN_74 = 5'ha == IF_B_index ? BHT_10 : _GEN_73; // @[BPU.scala 46:{81,81}]
  wire [1:0] _GEN_75 = 5'hb == IF_B_index ? BHT_11 : _GEN_74; // @[BPU.scala 46:{81,81}]
  wire [1:0] _GEN_76 = 5'hc == IF_B_index ? BHT_12 : _GEN_75; // @[BPU.scala 46:{81,81}]
  wire [1:0] _GEN_77 = 5'hd == IF_B_index ? BHT_13 : _GEN_76; // @[BPU.scala 46:{81,81}]
  wire [1:0] _GEN_78 = 5'he == IF_B_index ? BHT_14 : _GEN_77; // @[BPU.scala 46:{81,81}]
  wire [1:0] _GEN_79 = 5'hf == IF_B_index ? BHT_15 : _GEN_78; // @[BPU.scala 46:{81,81}]
  wire [1:0] _GEN_80 = 5'h10 == IF_B_index ? BHT_16 : _GEN_79; // @[BPU.scala 46:{81,81}]
  wire [1:0] _GEN_81 = 5'h11 == IF_B_index ? BHT_17 : _GEN_80; // @[BPU.scala 46:{81,81}]
  wire [1:0] _GEN_82 = 5'h12 == IF_B_index ? BHT_18 : _GEN_81; // @[BPU.scala 46:{81,81}]
  wire [1:0] _GEN_83 = 5'h13 == IF_B_index ? BHT_19 : _GEN_82; // @[BPU.scala 46:{81,81}]
  wire [1:0] _GEN_84 = 5'h14 == IF_B_index ? BHT_20 : _GEN_83; // @[BPU.scala 46:{81,81}]
  wire [1:0] _GEN_85 = 5'h15 == IF_B_index ? BHT_21 : _GEN_84; // @[BPU.scala 46:{81,81}]
  wire [1:0] _GEN_86 = 5'h16 == IF_B_index ? BHT_22 : _GEN_85; // @[BPU.scala 46:{81,81}]
  wire [1:0] _GEN_87 = 5'h17 == IF_B_index ? BHT_23 : _GEN_86; // @[BPU.scala 46:{81,81}]
  wire [1:0] _GEN_88 = 5'h18 == IF_B_index ? BHT_24 : _GEN_87; // @[BPU.scala 46:{81,81}]
  wire [1:0] _GEN_89 = 5'h19 == IF_B_index ? BHT_25 : _GEN_88; // @[BPU.scala 46:{81,81}]
  wire [1:0] _GEN_90 = 5'h1a == IF_B_index ? BHT_26 : _GEN_89; // @[BPU.scala 46:{81,81}]
  wire [1:0] _GEN_91 = 5'h1b == IF_B_index ? BHT_27 : _GEN_90; // @[BPU.scala 46:{81,81}]
  wire [1:0] _GEN_92 = 5'h1c == IF_B_index ? BHT_28 : _GEN_91; // @[BPU.scala 46:{81,81}]
  wire [1:0] _GEN_93 = 5'h1d == IF_B_index ? BHT_29 : _GEN_92; // @[BPU.scala 46:{81,81}]
  wire [1:0] _GEN_94 = 5'h1e == IF_B_index ? BHT_30 : _GEN_93; // @[BPU.scala 46:{81,81}]
  wire [1:0] _GEN_95 = 5'h1f == IF_B_index ? BHT_31 : _GEN_94; // @[BPU.scala 46:{81,81}]
  wire [31:0] _io_next_pc_T = last_predict ? last_pc : io_jb_pc; // @[BPU.scala 50:41]
  wire [31:0] _io_next_pc_T_2 = io_IF_pc + 32'h4; // @[BPU.scala 52:59]
  wire [31:0] _GEN_97 = 5'h1 == IF_B_index ? BTB_1 : BTB_0; // @[BPU.scala 52:{20,20}]
  wire [31:0] _GEN_98 = 5'h2 == IF_B_index ? BTB_2 : _GEN_97; // @[BPU.scala 52:{20,20}]
  wire [31:0] _GEN_99 = 5'h3 == IF_B_index ? BTB_3 : _GEN_98; // @[BPU.scala 52:{20,20}]
  wire [31:0] _GEN_100 = 5'h4 == IF_B_index ? BTB_4 : _GEN_99; // @[BPU.scala 52:{20,20}]
  wire [31:0] _GEN_101 = 5'h5 == IF_B_index ? BTB_5 : _GEN_100; // @[BPU.scala 52:{20,20}]
  wire [31:0] _GEN_102 = 5'h6 == IF_B_index ? BTB_6 : _GEN_101; // @[BPU.scala 52:{20,20}]
  wire [31:0] _GEN_103 = 5'h7 == IF_B_index ? BTB_7 : _GEN_102; // @[BPU.scala 52:{20,20}]
  wire [31:0] _GEN_104 = 5'h8 == IF_B_index ? BTB_8 : _GEN_103; // @[BPU.scala 52:{20,20}]
  wire [31:0] _GEN_105 = 5'h9 == IF_B_index ? BTB_9 : _GEN_104; // @[BPU.scala 52:{20,20}]
  wire [31:0] _GEN_106 = 5'ha == IF_B_index ? BTB_10 : _GEN_105; // @[BPU.scala 52:{20,20}]
  wire [31:0] _GEN_107 = 5'hb == IF_B_index ? BTB_11 : _GEN_106; // @[BPU.scala 52:{20,20}]
  wire [31:0] _GEN_108 = 5'hc == IF_B_index ? BTB_12 : _GEN_107; // @[BPU.scala 52:{20,20}]
  wire [31:0] _GEN_109 = 5'hd == IF_B_index ? BTB_13 : _GEN_108; // @[BPU.scala 52:{20,20}]
  wire [31:0] _GEN_110 = 5'he == IF_B_index ? BTB_14 : _GEN_109; // @[BPU.scala 52:{20,20}]
  wire [31:0] _GEN_111 = 5'hf == IF_B_index ? BTB_15 : _GEN_110; // @[BPU.scala 52:{20,20}]
  wire [31:0] _GEN_112 = 5'h10 == IF_B_index ? BTB_16 : _GEN_111; // @[BPU.scala 52:{20,20}]
  wire [31:0] _GEN_113 = 5'h11 == IF_B_index ? BTB_17 : _GEN_112; // @[BPU.scala 52:{20,20}]
  wire [31:0] _GEN_114 = 5'h12 == IF_B_index ? BTB_18 : _GEN_113; // @[BPU.scala 52:{20,20}]
  wire [31:0] _GEN_115 = 5'h13 == IF_B_index ? BTB_19 : _GEN_114; // @[BPU.scala 52:{20,20}]
  wire [31:0] _GEN_116 = 5'h14 == IF_B_index ? BTB_20 : _GEN_115; // @[BPU.scala 52:{20,20}]
  wire [31:0] _GEN_117 = 5'h15 == IF_B_index ? BTB_21 : _GEN_116; // @[BPU.scala 52:{20,20}]
  wire [31:0] _GEN_118 = 5'h16 == IF_B_index ? BTB_22 : _GEN_117; // @[BPU.scala 52:{20,20}]
  wire [31:0] _GEN_119 = 5'h17 == IF_B_index ? BTB_23 : _GEN_118; // @[BPU.scala 52:{20,20}]
  wire [31:0] _GEN_120 = 5'h18 == IF_B_index ? BTB_24 : _GEN_119; // @[BPU.scala 52:{20,20}]
  wire [31:0] _GEN_121 = 5'h19 == IF_B_index ? BTB_25 : _GEN_120; // @[BPU.scala 52:{20,20}]
  wire [31:0] _GEN_122 = 5'h1a == IF_B_index ? BTB_26 : _GEN_121; // @[BPU.scala 52:{20,20}]
  wire [31:0] _GEN_123 = 5'h1b == IF_B_index ? BTB_27 : _GEN_122; // @[BPU.scala 52:{20,20}]
  wire [31:0] _GEN_124 = 5'h1c == IF_B_index ? BTB_28 : _GEN_123; // @[BPU.scala 52:{20,20}]
  wire [31:0] _GEN_125 = 5'h1d == IF_B_index ? BTB_29 : _GEN_124; // @[BPU.scala 52:{20,20}]
  wire [31:0] _GEN_126 = 5'h1e == IF_B_index ? BTB_30 : _GEN_125; // @[BPU.scala 52:{20,20}]
  wire [31:0] _GEN_127 = 5'h1f == IF_B_index ? BTB_31 : _GEN_126; // @[BPU.scala 52:{20,20}]
  wire [31:0] _io_next_pc_T_3 = io_predict ? _GEN_127 : _io_next_pc_T_2; // @[BPU.scala 52:20]
  wire [31:0] _io_next_pc_T_4 = io_BTB_miss ? io_jb_pc : _io_next_pc_T_3; // @[BPU.scala 51:20]
  wire [31:0] _io_next_pc_T_5 = io_predict_miss ? _io_next_pc_T : _io_next_pc_T_4; // @[BPU.scala 50:20]
  wire [1:0] _GEN_135 = 5'h1 == EXE_B_index ? BHT_1 : BHT_0; // @[BPU.scala 73:{56,56}]
  wire [1:0] _GEN_136 = 5'h2 == EXE_B_index ? BHT_2 : _GEN_135; // @[BPU.scala 73:{56,56}]
  wire [1:0] _GEN_137 = 5'h3 == EXE_B_index ? BHT_3 : _GEN_136; // @[BPU.scala 73:{56,56}]
  wire [1:0] _GEN_138 = 5'h4 == EXE_B_index ? BHT_4 : _GEN_137; // @[BPU.scala 73:{56,56}]
  wire [1:0] _GEN_139 = 5'h5 == EXE_B_index ? BHT_5 : _GEN_138; // @[BPU.scala 73:{56,56}]
  wire [1:0] _GEN_140 = 5'h6 == EXE_B_index ? BHT_6 : _GEN_139; // @[BPU.scala 73:{56,56}]
  wire [1:0] _GEN_141 = 5'h7 == EXE_B_index ? BHT_7 : _GEN_140; // @[BPU.scala 73:{56,56}]
  wire [1:0] _GEN_142 = 5'h8 == EXE_B_index ? BHT_8 : _GEN_141; // @[BPU.scala 73:{56,56}]
  wire [1:0] _GEN_143 = 5'h9 == EXE_B_index ? BHT_9 : _GEN_142; // @[BPU.scala 73:{56,56}]
  wire [1:0] _GEN_144 = 5'ha == EXE_B_index ? BHT_10 : _GEN_143; // @[BPU.scala 73:{56,56}]
  wire [1:0] _GEN_145 = 5'hb == EXE_B_index ? BHT_11 : _GEN_144; // @[BPU.scala 73:{56,56}]
  wire [1:0] _GEN_146 = 5'hc == EXE_B_index ? BHT_12 : _GEN_145; // @[BPU.scala 73:{56,56}]
  wire [1:0] _GEN_147 = 5'hd == EXE_B_index ? BHT_13 : _GEN_146; // @[BPU.scala 73:{56,56}]
  wire [1:0] _GEN_148 = 5'he == EXE_B_index ? BHT_14 : _GEN_147; // @[BPU.scala 73:{56,56}]
  wire [1:0] _GEN_149 = 5'hf == EXE_B_index ? BHT_15 : _GEN_148; // @[BPU.scala 73:{56,56}]
  wire [1:0] _GEN_150 = 5'h10 == EXE_B_index ? BHT_16 : _GEN_149; // @[BPU.scala 73:{56,56}]
  wire [1:0] _GEN_151 = 5'h11 == EXE_B_index ? BHT_17 : _GEN_150; // @[BPU.scala 73:{56,56}]
  wire [1:0] _GEN_152 = 5'h12 == EXE_B_index ? BHT_18 : _GEN_151; // @[BPU.scala 73:{56,56}]
  wire [1:0] _GEN_153 = 5'h13 == EXE_B_index ? BHT_19 : _GEN_152; // @[BPU.scala 73:{56,56}]
  wire [1:0] _GEN_154 = 5'h14 == EXE_B_index ? BHT_20 : _GEN_153; // @[BPU.scala 73:{56,56}]
  wire [1:0] _GEN_155 = 5'h15 == EXE_B_index ? BHT_21 : _GEN_154; // @[BPU.scala 73:{56,56}]
  wire [1:0] _GEN_156 = 5'h16 == EXE_B_index ? BHT_22 : _GEN_155; // @[BPU.scala 73:{56,56}]
  wire [1:0] _GEN_157 = 5'h17 == EXE_B_index ? BHT_23 : _GEN_156; // @[BPU.scala 73:{56,56}]
  wire [1:0] _GEN_158 = 5'h18 == EXE_B_index ? BHT_24 : _GEN_157; // @[BPU.scala 73:{56,56}]
  wire [1:0] _GEN_159 = 5'h19 == EXE_B_index ? BHT_25 : _GEN_158; // @[BPU.scala 73:{56,56}]
  wire [1:0] _GEN_160 = 5'h1a == EXE_B_index ? BHT_26 : _GEN_159; // @[BPU.scala 73:{56,56}]
  wire [1:0] _GEN_161 = 5'h1b == EXE_B_index ? BHT_27 : _GEN_160; // @[BPU.scala 73:{56,56}]
  wire [1:0] _GEN_162 = 5'h1c == EXE_B_index ? BHT_28 : _GEN_161; // @[BPU.scala 73:{56,56}]
  wire [1:0] _GEN_163 = 5'h1d == EXE_B_index ? BHT_29 : _GEN_162; // @[BPU.scala 73:{56,56}]
  wire [1:0] _GEN_164 = 5'h1e == EXE_B_index ? BHT_30 : _GEN_163; // @[BPU.scala 73:{56,56}]
  wire [1:0] _GEN_165 = 5'h1f == EXE_B_index ? BHT_31 : _GEN_164; // @[BPU.scala 73:{56,56}]
  wire [1:0] _BHT_T_2 = _GEN_165 + 2'h1; // @[BPU.scala 73:87]
  wire [1:0] _BHT_T_3 = _GEN_165 == 2'h3 ? 2'h3 : _BHT_T_2; // @[BPU.scala 73:38]
  wire [1:0] _GEN_166 = 5'h0 == EXE_B_index ? _BHT_T_3 : BHT_0; // @[BPU.scala 26:30 73:{32,32}]
  wire [1:0] _GEN_167 = 5'h1 == EXE_B_index ? _BHT_T_3 : BHT_1; // @[BPU.scala 26:30 73:{32,32}]
  wire [1:0] _GEN_168 = 5'h2 == EXE_B_index ? _BHT_T_3 : BHT_2; // @[BPU.scala 26:30 73:{32,32}]
  wire [1:0] _GEN_169 = 5'h3 == EXE_B_index ? _BHT_T_3 : BHT_3; // @[BPU.scala 26:30 73:{32,32}]
  wire [1:0] _GEN_170 = 5'h4 == EXE_B_index ? _BHT_T_3 : BHT_4; // @[BPU.scala 26:30 73:{32,32}]
  wire [1:0] _GEN_171 = 5'h5 == EXE_B_index ? _BHT_T_3 : BHT_5; // @[BPU.scala 26:30 73:{32,32}]
  wire [1:0] _GEN_172 = 5'h6 == EXE_B_index ? _BHT_T_3 : BHT_6; // @[BPU.scala 26:30 73:{32,32}]
  wire [1:0] _GEN_173 = 5'h7 == EXE_B_index ? _BHT_T_3 : BHT_7; // @[BPU.scala 26:30 73:{32,32}]
  wire [1:0] _GEN_174 = 5'h8 == EXE_B_index ? _BHT_T_3 : BHT_8; // @[BPU.scala 26:30 73:{32,32}]
  wire [1:0] _GEN_175 = 5'h9 == EXE_B_index ? _BHT_T_3 : BHT_9; // @[BPU.scala 26:30 73:{32,32}]
  wire [1:0] _GEN_176 = 5'ha == EXE_B_index ? _BHT_T_3 : BHT_10; // @[BPU.scala 26:30 73:{32,32}]
  wire [1:0] _GEN_177 = 5'hb == EXE_B_index ? _BHT_T_3 : BHT_11; // @[BPU.scala 26:30 73:{32,32}]
  wire [1:0] _GEN_178 = 5'hc == EXE_B_index ? _BHT_T_3 : BHT_12; // @[BPU.scala 26:30 73:{32,32}]
  wire [1:0] _GEN_179 = 5'hd == EXE_B_index ? _BHT_T_3 : BHT_13; // @[BPU.scala 26:30 73:{32,32}]
  wire [1:0] _GEN_180 = 5'he == EXE_B_index ? _BHT_T_3 : BHT_14; // @[BPU.scala 26:30 73:{32,32}]
  wire [1:0] _GEN_181 = 5'hf == EXE_B_index ? _BHT_T_3 : BHT_15; // @[BPU.scala 26:30 73:{32,32}]
  wire [1:0] _GEN_182 = 5'h10 == EXE_B_index ? _BHT_T_3 : BHT_16; // @[BPU.scala 26:30 73:{32,32}]
  wire [1:0] _GEN_183 = 5'h11 == EXE_B_index ? _BHT_T_3 : BHT_17; // @[BPU.scala 26:30 73:{32,32}]
  wire [1:0] _GEN_184 = 5'h12 == EXE_B_index ? _BHT_T_3 : BHT_18; // @[BPU.scala 26:30 73:{32,32}]
  wire [1:0] _GEN_185 = 5'h13 == EXE_B_index ? _BHT_T_3 : BHT_19; // @[BPU.scala 26:30 73:{32,32}]
  wire [1:0] _GEN_186 = 5'h14 == EXE_B_index ? _BHT_T_3 : BHT_20; // @[BPU.scala 26:30 73:{32,32}]
  wire [1:0] _GEN_187 = 5'h15 == EXE_B_index ? _BHT_T_3 : BHT_21; // @[BPU.scala 26:30 73:{32,32}]
  wire [1:0] _GEN_188 = 5'h16 == EXE_B_index ? _BHT_T_3 : BHT_22; // @[BPU.scala 26:30 73:{32,32}]
  wire [1:0] _GEN_189 = 5'h17 == EXE_B_index ? _BHT_T_3 : BHT_23; // @[BPU.scala 26:30 73:{32,32}]
  wire [1:0] _GEN_190 = 5'h18 == EXE_B_index ? _BHT_T_3 : BHT_24; // @[BPU.scala 26:30 73:{32,32}]
  wire [1:0] _GEN_191 = 5'h19 == EXE_B_index ? _BHT_T_3 : BHT_25; // @[BPU.scala 26:30 73:{32,32}]
  wire [1:0] _GEN_192 = 5'h1a == EXE_B_index ? _BHT_T_3 : BHT_26; // @[BPU.scala 26:30 73:{32,32}]
  wire [1:0] _GEN_193 = 5'h1b == EXE_B_index ? _BHT_T_3 : BHT_27; // @[BPU.scala 26:30 73:{32,32}]
  wire [1:0] _GEN_194 = 5'h1c == EXE_B_index ? _BHT_T_3 : BHT_28; // @[BPU.scala 26:30 73:{32,32}]
  wire [1:0] _GEN_195 = 5'h1d == EXE_B_index ? _BHT_T_3 : BHT_29; // @[BPU.scala 26:30 73:{32,32}]
  wire [1:0] _GEN_196 = 5'h1e == EXE_B_index ? _BHT_T_3 : BHT_30; // @[BPU.scala 26:30 73:{32,32}]
  wire [1:0] _GEN_197 = 5'h1f == EXE_B_index ? _BHT_T_3 : BHT_31; // @[BPU.scala 26:30 73:{32,32}]
  wire [31:0] _GEN_198 = 5'h0 == EXE_B_index ? io_jb_pc : BTB_0; // @[BPU.scala 27:30 74:{32,32}]
  wire [31:0] _GEN_199 = 5'h1 == EXE_B_index ? io_jb_pc : BTB_1; // @[BPU.scala 27:30 74:{32,32}]
  wire [31:0] _GEN_200 = 5'h2 == EXE_B_index ? io_jb_pc : BTB_2; // @[BPU.scala 27:30 74:{32,32}]
  wire [31:0] _GEN_201 = 5'h3 == EXE_B_index ? io_jb_pc : BTB_3; // @[BPU.scala 27:30 74:{32,32}]
  wire [31:0] _GEN_202 = 5'h4 == EXE_B_index ? io_jb_pc : BTB_4; // @[BPU.scala 27:30 74:{32,32}]
  wire [31:0] _GEN_203 = 5'h5 == EXE_B_index ? io_jb_pc : BTB_5; // @[BPU.scala 27:30 74:{32,32}]
  wire [31:0] _GEN_204 = 5'h6 == EXE_B_index ? io_jb_pc : BTB_6; // @[BPU.scala 27:30 74:{32,32}]
  wire [31:0] _GEN_205 = 5'h7 == EXE_B_index ? io_jb_pc : BTB_7; // @[BPU.scala 27:30 74:{32,32}]
  wire [31:0] _GEN_206 = 5'h8 == EXE_B_index ? io_jb_pc : BTB_8; // @[BPU.scala 27:30 74:{32,32}]
  wire [31:0] _GEN_207 = 5'h9 == EXE_B_index ? io_jb_pc : BTB_9; // @[BPU.scala 27:30 74:{32,32}]
  wire [31:0] _GEN_208 = 5'ha == EXE_B_index ? io_jb_pc : BTB_10; // @[BPU.scala 27:30 74:{32,32}]
  wire [31:0] _GEN_209 = 5'hb == EXE_B_index ? io_jb_pc : BTB_11; // @[BPU.scala 27:30 74:{32,32}]
  wire [31:0] _GEN_210 = 5'hc == EXE_B_index ? io_jb_pc : BTB_12; // @[BPU.scala 27:30 74:{32,32}]
  wire [31:0] _GEN_211 = 5'hd == EXE_B_index ? io_jb_pc : BTB_13; // @[BPU.scala 27:30 74:{32,32}]
  wire [31:0] _GEN_212 = 5'he == EXE_B_index ? io_jb_pc : BTB_14; // @[BPU.scala 27:30 74:{32,32}]
  wire [31:0] _GEN_213 = 5'hf == EXE_B_index ? io_jb_pc : BTB_15; // @[BPU.scala 27:30 74:{32,32}]
  wire [31:0] _GEN_214 = 5'h10 == EXE_B_index ? io_jb_pc : BTB_16; // @[BPU.scala 27:30 74:{32,32}]
  wire [31:0] _GEN_215 = 5'h11 == EXE_B_index ? io_jb_pc : BTB_17; // @[BPU.scala 27:30 74:{32,32}]
  wire [31:0] _GEN_216 = 5'h12 == EXE_B_index ? io_jb_pc : BTB_18; // @[BPU.scala 27:30 74:{32,32}]
  wire [31:0] _GEN_217 = 5'h13 == EXE_B_index ? io_jb_pc : BTB_19; // @[BPU.scala 27:30 74:{32,32}]
  wire [31:0] _GEN_218 = 5'h14 == EXE_B_index ? io_jb_pc : BTB_20; // @[BPU.scala 27:30 74:{32,32}]
  wire [31:0] _GEN_219 = 5'h15 == EXE_B_index ? io_jb_pc : BTB_21; // @[BPU.scala 27:30 74:{32,32}]
  wire [31:0] _GEN_220 = 5'h16 == EXE_B_index ? io_jb_pc : BTB_22; // @[BPU.scala 27:30 74:{32,32}]
  wire [31:0] _GEN_221 = 5'h17 == EXE_B_index ? io_jb_pc : BTB_23; // @[BPU.scala 27:30 74:{32,32}]
  wire [31:0] _GEN_222 = 5'h18 == EXE_B_index ? io_jb_pc : BTB_24; // @[BPU.scala 27:30 74:{32,32}]
  wire [31:0] _GEN_223 = 5'h19 == EXE_B_index ? io_jb_pc : BTB_25; // @[BPU.scala 27:30 74:{32,32}]
  wire [31:0] _GEN_224 = 5'h1a == EXE_B_index ? io_jb_pc : BTB_26; // @[BPU.scala 27:30 74:{32,32}]
  wire [31:0] _GEN_225 = 5'h1b == EXE_B_index ? io_jb_pc : BTB_27; // @[BPU.scala 27:30 74:{32,32}]
  wire [31:0] _GEN_226 = 5'h1c == EXE_B_index ? io_jb_pc : BTB_28; // @[BPU.scala 27:30 74:{32,32}]
  wire [31:0] _GEN_227 = 5'h1d == EXE_B_index ? io_jb_pc : BTB_29; // @[BPU.scala 27:30 74:{32,32}]
  wire [31:0] _GEN_228 = 5'h1e == EXE_B_index ? io_jb_pc : BTB_30; // @[BPU.scala 27:30 74:{32,32}]
  wire [31:0] _GEN_229 = 5'h1f == EXE_B_index ? io_jb_pc : BTB_31; // @[BPU.scala 27:30 74:{32,32}]
  wire  _GEN_230 = 5'h0 == EXE_B_index | BTB_valid_0; // @[BPU.scala 28:30 75:{32,32}]
  wire  _GEN_231 = 5'h1 == EXE_B_index | BTB_valid_1; // @[BPU.scala 28:30 75:{32,32}]
  wire  _GEN_232 = 5'h2 == EXE_B_index | BTB_valid_2; // @[BPU.scala 28:30 75:{32,32}]
  wire  _GEN_233 = 5'h3 == EXE_B_index | BTB_valid_3; // @[BPU.scala 28:30 75:{32,32}]
  wire  _GEN_234 = 5'h4 == EXE_B_index | BTB_valid_4; // @[BPU.scala 28:30 75:{32,32}]
  wire  _GEN_235 = 5'h5 == EXE_B_index | BTB_valid_5; // @[BPU.scala 28:30 75:{32,32}]
  wire  _GEN_236 = 5'h6 == EXE_B_index | BTB_valid_6; // @[BPU.scala 28:30 75:{32,32}]
  wire  _GEN_237 = 5'h7 == EXE_B_index | BTB_valid_7; // @[BPU.scala 28:30 75:{32,32}]
  wire  _GEN_238 = 5'h8 == EXE_B_index | BTB_valid_8; // @[BPU.scala 28:30 75:{32,32}]
  wire  _GEN_239 = 5'h9 == EXE_B_index | BTB_valid_9; // @[BPU.scala 28:30 75:{32,32}]
  wire  _GEN_240 = 5'ha == EXE_B_index | BTB_valid_10; // @[BPU.scala 28:30 75:{32,32}]
  wire  _GEN_241 = 5'hb == EXE_B_index | BTB_valid_11; // @[BPU.scala 28:30 75:{32,32}]
  wire  _GEN_242 = 5'hc == EXE_B_index | BTB_valid_12; // @[BPU.scala 28:30 75:{32,32}]
  wire  _GEN_243 = 5'hd == EXE_B_index | BTB_valid_13; // @[BPU.scala 28:30 75:{32,32}]
  wire  _GEN_244 = 5'he == EXE_B_index | BTB_valid_14; // @[BPU.scala 28:30 75:{32,32}]
  wire  _GEN_245 = 5'hf == EXE_B_index | BTB_valid_15; // @[BPU.scala 28:30 75:{32,32}]
  wire  _GEN_246 = 5'h10 == EXE_B_index | BTB_valid_16; // @[BPU.scala 28:30 75:{32,32}]
  wire  _GEN_247 = 5'h11 == EXE_B_index | BTB_valid_17; // @[BPU.scala 28:30 75:{32,32}]
  wire  _GEN_248 = 5'h12 == EXE_B_index | BTB_valid_18; // @[BPU.scala 28:30 75:{32,32}]
  wire  _GEN_249 = 5'h13 == EXE_B_index | BTB_valid_19; // @[BPU.scala 28:30 75:{32,32}]
  wire  _GEN_250 = 5'h14 == EXE_B_index | BTB_valid_20; // @[BPU.scala 28:30 75:{32,32}]
  wire  _GEN_251 = 5'h15 == EXE_B_index | BTB_valid_21; // @[BPU.scala 28:30 75:{32,32}]
  wire  _GEN_252 = 5'h16 == EXE_B_index | BTB_valid_22; // @[BPU.scala 28:30 75:{32,32}]
  wire  _GEN_253 = 5'h17 == EXE_B_index | BTB_valid_23; // @[BPU.scala 28:30 75:{32,32}]
  wire  _GEN_254 = 5'h18 == EXE_B_index | BTB_valid_24; // @[BPU.scala 28:30 75:{32,32}]
  wire  _GEN_255 = 5'h19 == EXE_B_index | BTB_valid_25; // @[BPU.scala 28:30 75:{32,32}]
  wire  _GEN_256 = 5'h1a == EXE_B_index | BTB_valid_26; // @[BPU.scala 28:30 75:{32,32}]
  wire  _GEN_257 = 5'h1b == EXE_B_index | BTB_valid_27; // @[BPU.scala 28:30 75:{32,32}]
  wire  _GEN_258 = 5'h1c == EXE_B_index | BTB_valid_28; // @[BPU.scala 28:30 75:{32,32}]
  wire  _GEN_259 = 5'h1d == EXE_B_index | BTB_valid_29; // @[BPU.scala 28:30 75:{32,32}]
  wire  _GEN_260 = 5'h1e == EXE_B_index | BTB_valid_30; // @[BPU.scala 28:30 75:{32,32}]
  wire  _GEN_261 = 5'h1f == EXE_B_index | BTB_valid_31; // @[BPU.scala 28:30 75:{32,32}]
  wire [1:0] _BHT_T_6 = _GEN_165 - 2'h1; // @[BPU.scala 77:87]
  wire [1:0] _BHT_T_7 = _GEN_165 == 2'h0 ? 2'h0 : _BHT_T_6; // @[BPU.scala 77:38]
  wire [1:0] _GEN_262 = 5'h0 == EXE_B_index ? _BHT_T_7 : BHT_0; // @[BPU.scala 26:30 77:{32,32}]
  wire [1:0] _GEN_263 = 5'h1 == EXE_B_index ? _BHT_T_7 : BHT_1; // @[BPU.scala 26:30 77:{32,32}]
  wire [1:0] _GEN_264 = 5'h2 == EXE_B_index ? _BHT_T_7 : BHT_2; // @[BPU.scala 26:30 77:{32,32}]
  wire [1:0] _GEN_265 = 5'h3 == EXE_B_index ? _BHT_T_7 : BHT_3; // @[BPU.scala 26:30 77:{32,32}]
  wire [1:0] _GEN_266 = 5'h4 == EXE_B_index ? _BHT_T_7 : BHT_4; // @[BPU.scala 26:30 77:{32,32}]
  wire [1:0] _GEN_267 = 5'h5 == EXE_B_index ? _BHT_T_7 : BHT_5; // @[BPU.scala 26:30 77:{32,32}]
  wire [1:0] _GEN_268 = 5'h6 == EXE_B_index ? _BHT_T_7 : BHT_6; // @[BPU.scala 26:30 77:{32,32}]
  wire [1:0] _GEN_269 = 5'h7 == EXE_B_index ? _BHT_T_7 : BHT_7; // @[BPU.scala 26:30 77:{32,32}]
  wire [1:0] _GEN_270 = 5'h8 == EXE_B_index ? _BHT_T_7 : BHT_8; // @[BPU.scala 26:30 77:{32,32}]
  wire [1:0] _GEN_271 = 5'h9 == EXE_B_index ? _BHT_T_7 : BHT_9; // @[BPU.scala 26:30 77:{32,32}]
  wire [1:0] _GEN_272 = 5'ha == EXE_B_index ? _BHT_T_7 : BHT_10; // @[BPU.scala 26:30 77:{32,32}]
  wire [1:0] _GEN_273 = 5'hb == EXE_B_index ? _BHT_T_7 : BHT_11; // @[BPU.scala 26:30 77:{32,32}]
  wire [1:0] _GEN_274 = 5'hc == EXE_B_index ? _BHT_T_7 : BHT_12; // @[BPU.scala 26:30 77:{32,32}]
  wire [1:0] _GEN_275 = 5'hd == EXE_B_index ? _BHT_T_7 : BHT_13; // @[BPU.scala 26:30 77:{32,32}]
  wire [1:0] _GEN_276 = 5'he == EXE_B_index ? _BHT_T_7 : BHT_14; // @[BPU.scala 26:30 77:{32,32}]
  wire [1:0] _GEN_277 = 5'hf == EXE_B_index ? _BHT_T_7 : BHT_15; // @[BPU.scala 26:30 77:{32,32}]
  wire [1:0] _GEN_278 = 5'h10 == EXE_B_index ? _BHT_T_7 : BHT_16; // @[BPU.scala 26:30 77:{32,32}]
  wire [1:0] _GEN_279 = 5'h11 == EXE_B_index ? _BHT_T_7 : BHT_17; // @[BPU.scala 26:30 77:{32,32}]
  wire [1:0] _GEN_280 = 5'h12 == EXE_B_index ? _BHT_T_7 : BHT_18; // @[BPU.scala 26:30 77:{32,32}]
  wire [1:0] _GEN_281 = 5'h13 == EXE_B_index ? _BHT_T_7 : BHT_19; // @[BPU.scala 26:30 77:{32,32}]
  wire [1:0] _GEN_282 = 5'h14 == EXE_B_index ? _BHT_T_7 : BHT_20; // @[BPU.scala 26:30 77:{32,32}]
  wire [1:0] _GEN_283 = 5'h15 == EXE_B_index ? _BHT_T_7 : BHT_21; // @[BPU.scala 26:30 77:{32,32}]
  wire [1:0] _GEN_284 = 5'h16 == EXE_B_index ? _BHT_T_7 : BHT_22; // @[BPU.scala 26:30 77:{32,32}]
  wire [1:0] _GEN_285 = 5'h17 == EXE_B_index ? _BHT_T_7 : BHT_23; // @[BPU.scala 26:30 77:{32,32}]
  wire [1:0] _GEN_286 = 5'h18 == EXE_B_index ? _BHT_T_7 : BHT_24; // @[BPU.scala 26:30 77:{32,32}]
  wire [1:0] _GEN_287 = 5'h19 == EXE_B_index ? _BHT_T_7 : BHT_25; // @[BPU.scala 26:30 77:{32,32}]
  wire [1:0] _GEN_288 = 5'h1a == EXE_B_index ? _BHT_T_7 : BHT_26; // @[BPU.scala 26:30 77:{32,32}]
  wire [1:0] _GEN_289 = 5'h1b == EXE_B_index ? _BHT_T_7 : BHT_27; // @[BPU.scala 26:30 77:{32,32}]
  wire [1:0] _GEN_290 = 5'h1c == EXE_B_index ? _BHT_T_7 : BHT_28; // @[BPU.scala 26:30 77:{32,32}]
  wire [1:0] _GEN_291 = 5'h1d == EXE_B_index ? _BHT_T_7 : BHT_29; // @[BPU.scala 26:30 77:{32,32}]
  wire [1:0] _GEN_292 = 5'h1e == EXE_B_index ? _BHT_T_7 : BHT_30; // @[BPU.scala 26:30 77:{32,32}]
  wire [1:0] _GEN_293 = 5'h1f == EXE_B_index ? _BHT_T_7 : BHT_31; // @[BPU.scala 26:30 77:{32,32}]
  wire [1:0] _GEN_294 = io_alu_out ? _GEN_166 : _GEN_262; // @[BPU.scala 72:23]
  wire [1:0] _GEN_295 = io_alu_out ? _GEN_167 : _GEN_263; // @[BPU.scala 72:23]
  wire [1:0] _GEN_296 = io_alu_out ? _GEN_168 : _GEN_264; // @[BPU.scala 72:23]
  wire [1:0] _GEN_297 = io_alu_out ? _GEN_169 : _GEN_265; // @[BPU.scala 72:23]
  wire [1:0] _GEN_298 = io_alu_out ? _GEN_170 : _GEN_266; // @[BPU.scala 72:23]
  wire [1:0] _GEN_299 = io_alu_out ? _GEN_171 : _GEN_267; // @[BPU.scala 72:23]
  wire [1:0] _GEN_300 = io_alu_out ? _GEN_172 : _GEN_268; // @[BPU.scala 72:23]
  wire [1:0] _GEN_301 = io_alu_out ? _GEN_173 : _GEN_269; // @[BPU.scala 72:23]
  wire [1:0] _GEN_302 = io_alu_out ? _GEN_174 : _GEN_270; // @[BPU.scala 72:23]
  wire [1:0] _GEN_303 = io_alu_out ? _GEN_175 : _GEN_271; // @[BPU.scala 72:23]
  wire [1:0] _GEN_304 = io_alu_out ? _GEN_176 : _GEN_272; // @[BPU.scala 72:23]
  wire [1:0] _GEN_305 = io_alu_out ? _GEN_177 : _GEN_273; // @[BPU.scala 72:23]
  wire [1:0] _GEN_306 = io_alu_out ? _GEN_178 : _GEN_274; // @[BPU.scala 72:23]
  wire [1:0] _GEN_307 = io_alu_out ? _GEN_179 : _GEN_275; // @[BPU.scala 72:23]
  wire [1:0] _GEN_308 = io_alu_out ? _GEN_180 : _GEN_276; // @[BPU.scala 72:23]
  wire [1:0] _GEN_309 = io_alu_out ? _GEN_181 : _GEN_277; // @[BPU.scala 72:23]
  wire [1:0] _GEN_310 = io_alu_out ? _GEN_182 : _GEN_278; // @[BPU.scala 72:23]
  wire [1:0] _GEN_311 = io_alu_out ? _GEN_183 : _GEN_279; // @[BPU.scala 72:23]
  wire [1:0] _GEN_312 = io_alu_out ? _GEN_184 : _GEN_280; // @[BPU.scala 72:23]
  wire [1:0] _GEN_313 = io_alu_out ? _GEN_185 : _GEN_281; // @[BPU.scala 72:23]
  wire [1:0] _GEN_314 = io_alu_out ? _GEN_186 : _GEN_282; // @[BPU.scala 72:23]
  wire [1:0] _GEN_315 = io_alu_out ? _GEN_187 : _GEN_283; // @[BPU.scala 72:23]
  wire [1:0] _GEN_316 = io_alu_out ? _GEN_188 : _GEN_284; // @[BPU.scala 72:23]
  wire [1:0] _GEN_317 = io_alu_out ? _GEN_189 : _GEN_285; // @[BPU.scala 72:23]
  wire [1:0] _GEN_318 = io_alu_out ? _GEN_190 : _GEN_286; // @[BPU.scala 72:23]
  wire [1:0] _GEN_319 = io_alu_out ? _GEN_191 : _GEN_287; // @[BPU.scala 72:23]
  wire [1:0] _GEN_320 = io_alu_out ? _GEN_192 : _GEN_288; // @[BPU.scala 72:23]
  wire [1:0] _GEN_321 = io_alu_out ? _GEN_193 : _GEN_289; // @[BPU.scala 72:23]
  wire [1:0] _GEN_322 = io_alu_out ? _GEN_194 : _GEN_290; // @[BPU.scala 72:23]
  wire [1:0] _GEN_323 = io_alu_out ? _GEN_195 : _GEN_291; // @[BPU.scala 72:23]
  wire [1:0] _GEN_324 = io_alu_out ? _GEN_196 : _GEN_292; // @[BPU.scala 72:23]
  wire [1:0] _GEN_325 = io_alu_out ? _GEN_197 : _GEN_293; // @[BPU.scala 72:23]
  wire [31:0] _GEN_326 = io_alu_out ? _GEN_198 : BTB_0; // @[BPU.scala 72:23 27:30]
  wire [31:0] _GEN_327 = io_alu_out ? _GEN_199 : BTB_1; // @[BPU.scala 72:23 27:30]
  wire [31:0] _GEN_328 = io_alu_out ? _GEN_200 : BTB_2; // @[BPU.scala 72:23 27:30]
  wire [31:0] _GEN_329 = io_alu_out ? _GEN_201 : BTB_3; // @[BPU.scala 72:23 27:30]
  wire [31:0] _GEN_330 = io_alu_out ? _GEN_202 : BTB_4; // @[BPU.scala 72:23 27:30]
  wire [31:0] _GEN_331 = io_alu_out ? _GEN_203 : BTB_5; // @[BPU.scala 72:23 27:30]
  wire [31:0] _GEN_332 = io_alu_out ? _GEN_204 : BTB_6; // @[BPU.scala 72:23 27:30]
  wire [31:0] _GEN_333 = io_alu_out ? _GEN_205 : BTB_7; // @[BPU.scala 72:23 27:30]
  wire [31:0] _GEN_334 = io_alu_out ? _GEN_206 : BTB_8; // @[BPU.scala 72:23 27:30]
  wire [31:0] _GEN_335 = io_alu_out ? _GEN_207 : BTB_9; // @[BPU.scala 72:23 27:30]
  wire [31:0] _GEN_336 = io_alu_out ? _GEN_208 : BTB_10; // @[BPU.scala 72:23 27:30]
  wire [31:0] _GEN_337 = io_alu_out ? _GEN_209 : BTB_11; // @[BPU.scala 72:23 27:30]
  wire [31:0] _GEN_338 = io_alu_out ? _GEN_210 : BTB_12; // @[BPU.scala 72:23 27:30]
  wire [31:0] _GEN_339 = io_alu_out ? _GEN_211 : BTB_13; // @[BPU.scala 72:23 27:30]
  wire [31:0] _GEN_340 = io_alu_out ? _GEN_212 : BTB_14; // @[BPU.scala 72:23 27:30]
  wire [31:0] _GEN_341 = io_alu_out ? _GEN_213 : BTB_15; // @[BPU.scala 72:23 27:30]
  wire [31:0] _GEN_342 = io_alu_out ? _GEN_214 : BTB_16; // @[BPU.scala 72:23 27:30]
  wire [31:0] _GEN_343 = io_alu_out ? _GEN_215 : BTB_17; // @[BPU.scala 72:23 27:30]
  wire [31:0] _GEN_344 = io_alu_out ? _GEN_216 : BTB_18; // @[BPU.scala 72:23 27:30]
  wire [31:0] _GEN_345 = io_alu_out ? _GEN_217 : BTB_19; // @[BPU.scala 72:23 27:30]
  wire [31:0] _GEN_346 = io_alu_out ? _GEN_218 : BTB_20; // @[BPU.scala 72:23 27:30]
  wire [31:0] _GEN_347 = io_alu_out ? _GEN_219 : BTB_21; // @[BPU.scala 72:23 27:30]
  wire [31:0] _GEN_348 = io_alu_out ? _GEN_220 : BTB_22; // @[BPU.scala 72:23 27:30]
  wire [31:0] _GEN_349 = io_alu_out ? _GEN_221 : BTB_23; // @[BPU.scala 72:23 27:30]
  wire [31:0] _GEN_350 = io_alu_out ? _GEN_222 : BTB_24; // @[BPU.scala 72:23 27:30]
  wire [31:0] _GEN_351 = io_alu_out ? _GEN_223 : BTB_25; // @[BPU.scala 72:23 27:30]
  wire [31:0] _GEN_352 = io_alu_out ? _GEN_224 : BTB_26; // @[BPU.scala 72:23 27:30]
  wire [31:0] _GEN_353 = io_alu_out ? _GEN_225 : BTB_27; // @[BPU.scala 72:23 27:30]
  wire [31:0] _GEN_354 = io_alu_out ? _GEN_226 : BTB_28; // @[BPU.scala 72:23 27:30]
  wire [31:0] _GEN_355 = io_alu_out ? _GEN_227 : BTB_29; // @[BPU.scala 72:23 27:30]
  wire [31:0] _GEN_356 = io_alu_out ? _GEN_228 : BTB_30; // @[BPU.scala 72:23 27:30]
  wire [31:0] _GEN_357 = io_alu_out ? _GEN_229 : BTB_31; // @[BPU.scala 72:23 27:30]
  wire  _GEN_358 = io_alu_out ? _GEN_230 : BTB_valid_0; // @[BPU.scala 72:23 28:30]
  wire  _GEN_359 = io_alu_out ? _GEN_231 : BTB_valid_1; // @[BPU.scala 72:23 28:30]
  wire  _GEN_360 = io_alu_out ? _GEN_232 : BTB_valid_2; // @[BPU.scala 72:23 28:30]
  wire  _GEN_361 = io_alu_out ? _GEN_233 : BTB_valid_3; // @[BPU.scala 72:23 28:30]
  wire  _GEN_362 = io_alu_out ? _GEN_234 : BTB_valid_4; // @[BPU.scala 72:23 28:30]
  wire  _GEN_363 = io_alu_out ? _GEN_235 : BTB_valid_5; // @[BPU.scala 72:23 28:30]
  wire  _GEN_364 = io_alu_out ? _GEN_236 : BTB_valid_6; // @[BPU.scala 72:23 28:30]
  wire  _GEN_365 = io_alu_out ? _GEN_237 : BTB_valid_7; // @[BPU.scala 72:23 28:30]
  wire  _GEN_366 = io_alu_out ? _GEN_238 : BTB_valid_8; // @[BPU.scala 72:23 28:30]
  wire  _GEN_367 = io_alu_out ? _GEN_239 : BTB_valid_9; // @[BPU.scala 72:23 28:30]
  wire  _GEN_368 = io_alu_out ? _GEN_240 : BTB_valid_10; // @[BPU.scala 72:23 28:30]
  wire  _GEN_369 = io_alu_out ? _GEN_241 : BTB_valid_11; // @[BPU.scala 72:23 28:30]
  wire  _GEN_370 = io_alu_out ? _GEN_242 : BTB_valid_12; // @[BPU.scala 72:23 28:30]
  wire  _GEN_371 = io_alu_out ? _GEN_243 : BTB_valid_13; // @[BPU.scala 72:23 28:30]
  wire  _GEN_372 = io_alu_out ? _GEN_244 : BTB_valid_14; // @[BPU.scala 72:23 28:30]
  wire  _GEN_373 = io_alu_out ? _GEN_245 : BTB_valid_15; // @[BPU.scala 72:23 28:30]
  wire  _GEN_374 = io_alu_out ? _GEN_246 : BTB_valid_16; // @[BPU.scala 72:23 28:30]
  wire  _GEN_375 = io_alu_out ? _GEN_247 : BTB_valid_17; // @[BPU.scala 72:23 28:30]
  wire  _GEN_376 = io_alu_out ? _GEN_248 : BTB_valid_18; // @[BPU.scala 72:23 28:30]
  wire  _GEN_377 = io_alu_out ? _GEN_249 : BTB_valid_19; // @[BPU.scala 72:23 28:30]
  wire  _GEN_378 = io_alu_out ? _GEN_250 : BTB_valid_20; // @[BPU.scala 72:23 28:30]
  wire  _GEN_379 = io_alu_out ? _GEN_251 : BTB_valid_21; // @[BPU.scala 72:23 28:30]
  wire  _GEN_380 = io_alu_out ? _GEN_252 : BTB_valid_22; // @[BPU.scala 72:23 28:30]
  wire  _GEN_381 = io_alu_out ? _GEN_253 : BTB_valid_23; // @[BPU.scala 72:23 28:30]
  wire  _GEN_382 = io_alu_out ? _GEN_254 : BTB_valid_24; // @[BPU.scala 72:23 28:30]
  wire  _GEN_383 = io_alu_out ? _GEN_255 : BTB_valid_25; // @[BPU.scala 72:23 28:30]
  wire  _GEN_384 = io_alu_out ? _GEN_256 : BTB_valid_26; // @[BPU.scala 72:23 28:30]
  wire  _GEN_385 = io_alu_out ? _GEN_257 : BTB_valid_27; // @[BPU.scala 72:23 28:30]
  wire  _GEN_386 = io_alu_out ? _GEN_258 : BTB_valid_28; // @[BPU.scala 72:23 28:30]
  wire  _GEN_387 = io_alu_out ? _GEN_259 : BTB_valid_29; // @[BPU.scala 72:23 28:30]
  wire  _GEN_388 = io_alu_out ? _GEN_260 : BTB_valid_30; // @[BPU.scala 72:23 28:30]
  wire  _GEN_389 = io_alu_out ? _GEN_261 : BTB_valid_31; // @[BPU.scala 72:23 28:30]
  wire [4:0] _GH_T_1 = {GH[3:0],io_alu_out}; // @[Cat.scala 31:58]
  assign io_predict = _GEN_63 & IF_is_B_type & _GEN_95 >= 2'h2; // @[BPU.scala 46:62]
  assign io_predict_miss = EXE_is_B_type & (last_predict ^ io_alu_out); // @[BPU.scala 47:38]
  assign io_BTB_miss = EXE_is_B_type & last_predict & _GEN_31 != io_jb_pc; // @[BPU.scala 45:54]
  assign io_next_pc = io_jump ? io_jb_pc : _io_next_pc_T_5; // @[BPU.scala 49:20]
  always @(posedge clock) begin
    if (reset) begin // @[BPU.scala 26:30]
      BHT_0 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BHT_0 <= _GEN_294;
      end else begin
        BHT_0 <= _GEN_294;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_1 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BHT_1 <= _GEN_295;
      end else begin
        BHT_1 <= _GEN_295;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_2 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BHT_2 <= _GEN_296;
      end else begin
        BHT_2 <= _GEN_296;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_3 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BHT_3 <= _GEN_297;
      end else begin
        BHT_3 <= _GEN_297;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_4 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BHT_4 <= _GEN_298;
      end else begin
        BHT_4 <= _GEN_298;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_5 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BHT_5 <= _GEN_299;
      end else begin
        BHT_5 <= _GEN_299;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_6 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BHT_6 <= _GEN_300;
      end else begin
        BHT_6 <= _GEN_300;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_7 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BHT_7 <= _GEN_301;
      end else begin
        BHT_7 <= _GEN_301;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_8 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BHT_8 <= _GEN_302;
      end else begin
        BHT_8 <= _GEN_302;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_9 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BHT_9 <= _GEN_303;
      end else begin
        BHT_9 <= _GEN_303;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_10 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BHT_10 <= _GEN_304;
      end else begin
        BHT_10 <= _GEN_304;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_11 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BHT_11 <= _GEN_305;
      end else begin
        BHT_11 <= _GEN_305;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_12 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BHT_12 <= _GEN_306;
      end else begin
        BHT_12 <= _GEN_306;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_13 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BHT_13 <= _GEN_307;
      end else begin
        BHT_13 <= _GEN_307;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_14 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BHT_14 <= _GEN_308;
      end else begin
        BHT_14 <= _GEN_308;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_15 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BHT_15 <= _GEN_309;
      end else begin
        BHT_15 <= _GEN_309;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_16 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BHT_16 <= _GEN_310;
      end else begin
        BHT_16 <= _GEN_310;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_17 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BHT_17 <= _GEN_311;
      end else begin
        BHT_17 <= _GEN_311;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_18 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BHT_18 <= _GEN_312;
      end else begin
        BHT_18 <= _GEN_312;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_19 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BHT_19 <= _GEN_313;
      end else begin
        BHT_19 <= _GEN_313;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_20 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BHT_20 <= _GEN_314;
      end else begin
        BHT_20 <= _GEN_314;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_21 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BHT_21 <= _GEN_315;
      end else begin
        BHT_21 <= _GEN_315;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_22 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BHT_22 <= _GEN_316;
      end else begin
        BHT_22 <= _GEN_316;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_23 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BHT_23 <= _GEN_317;
      end else begin
        BHT_23 <= _GEN_317;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_24 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BHT_24 <= _GEN_318;
      end else begin
        BHT_24 <= _GEN_318;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_25 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BHT_25 <= _GEN_319;
      end else begin
        BHT_25 <= _GEN_319;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_26 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BHT_26 <= _GEN_320;
      end else begin
        BHT_26 <= _GEN_320;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_27 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BHT_27 <= _GEN_321;
      end else begin
        BHT_27 <= _GEN_321;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_28 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BHT_28 <= _GEN_322;
      end else begin
        BHT_28 <= _GEN_322;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_29 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BHT_29 <= _GEN_323;
      end else begin
        BHT_29 <= _GEN_323;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_30 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BHT_30 <= _GEN_324;
      end else begin
        BHT_30 <= _GEN_324;
      end
    end
    if (reset) begin // @[BPU.scala 26:30]
      BHT_31 <= 2'h3; // @[BPU.scala 26:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BHT_31 <= _GEN_325;
      end else begin
        BHT_31 <= _GEN_325;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_0 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_0 <= _GEN_326;
      end else begin
        BTB_0 <= _GEN_326;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_1 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_1 <= _GEN_327;
      end else begin
        BTB_1 <= _GEN_327;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_2 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_2 <= _GEN_328;
      end else begin
        BTB_2 <= _GEN_328;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_3 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_3 <= _GEN_329;
      end else begin
        BTB_3 <= _GEN_329;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_4 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_4 <= _GEN_330;
      end else begin
        BTB_4 <= _GEN_330;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_5 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_5 <= _GEN_331;
      end else begin
        BTB_5 <= _GEN_331;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_6 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_6 <= _GEN_332;
      end else begin
        BTB_6 <= _GEN_332;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_7 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_7 <= _GEN_333;
      end else begin
        BTB_7 <= _GEN_333;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_8 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_8 <= _GEN_334;
      end else begin
        BTB_8 <= _GEN_334;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_9 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_9 <= _GEN_335;
      end else begin
        BTB_9 <= _GEN_335;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_10 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_10 <= _GEN_336;
      end else begin
        BTB_10 <= _GEN_336;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_11 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_11 <= _GEN_337;
      end else begin
        BTB_11 <= _GEN_337;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_12 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_12 <= _GEN_338;
      end else begin
        BTB_12 <= _GEN_338;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_13 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_13 <= _GEN_339;
      end else begin
        BTB_13 <= _GEN_339;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_14 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_14 <= _GEN_340;
      end else begin
        BTB_14 <= _GEN_340;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_15 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_15 <= _GEN_341;
      end else begin
        BTB_15 <= _GEN_341;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_16 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_16 <= _GEN_342;
      end else begin
        BTB_16 <= _GEN_342;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_17 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_17 <= _GEN_343;
      end else begin
        BTB_17 <= _GEN_343;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_18 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_18 <= _GEN_344;
      end else begin
        BTB_18 <= _GEN_344;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_19 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_19 <= _GEN_345;
      end else begin
        BTB_19 <= _GEN_345;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_20 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_20 <= _GEN_346;
      end else begin
        BTB_20 <= _GEN_346;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_21 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_21 <= _GEN_347;
      end else begin
        BTB_21 <= _GEN_347;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_22 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_22 <= _GEN_348;
      end else begin
        BTB_22 <= _GEN_348;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_23 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_23 <= _GEN_349;
      end else begin
        BTB_23 <= _GEN_349;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_24 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_24 <= _GEN_350;
      end else begin
        BTB_24 <= _GEN_350;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_25 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_25 <= _GEN_351;
      end else begin
        BTB_25 <= _GEN_351;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_26 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_26 <= _GEN_352;
      end else begin
        BTB_26 <= _GEN_352;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_27 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_27 <= _GEN_353;
      end else begin
        BTB_27 <= _GEN_353;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_28 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_28 <= _GEN_354;
      end else begin
        BTB_28 <= _GEN_354;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_29 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_29 <= _GEN_355;
      end else begin
        BTB_29 <= _GEN_355;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_30 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_30 <= _GEN_356;
      end else begin
        BTB_30 <= _GEN_356;
      end
    end
    if (reset) begin // @[BPU.scala 27:30]
      BTB_31 <= 32'h0; // @[BPU.scala 27:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_31 <= _GEN_357;
      end else begin
        BTB_31 <= _GEN_357;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_0 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_valid_0 <= _GEN_358;
      end else begin
        BTB_valid_0 <= _GEN_358;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_1 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_valid_1 <= _GEN_359;
      end else begin
        BTB_valid_1 <= _GEN_359;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_2 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_valid_2 <= _GEN_360;
      end else begin
        BTB_valid_2 <= _GEN_360;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_3 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_valid_3 <= _GEN_361;
      end else begin
        BTB_valid_3 <= _GEN_361;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_4 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_valid_4 <= _GEN_362;
      end else begin
        BTB_valid_4 <= _GEN_362;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_5 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_valid_5 <= _GEN_363;
      end else begin
        BTB_valid_5 <= _GEN_363;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_6 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_valid_6 <= _GEN_364;
      end else begin
        BTB_valid_6 <= _GEN_364;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_7 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_valid_7 <= _GEN_365;
      end else begin
        BTB_valid_7 <= _GEN_365;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_8 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_valid_8 <= _GEN_366;
      end else begin
        BTB_valid_8 <= _GEN_366;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_9 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_valid_9 <= _GEN_367;
      end else begin
        BTB_valid_9 <= _GEN_367;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_10 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_valid_10 <= _GEN_368;
      end else begin
        BTB_valid_10 <= _GEN_368;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_11 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_valid_11 <= _GEN_369;
      end else begin
        BTB_valid_11 <= _GEN_369;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_12 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_valid_12 <= _GEN_370;
      end else begin
        BTB_valid_12 <= _GEN_370;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_13 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_valid_13 <= _GEN_371;
      end else begin
        BTB_valid_13 <= _GEN_371;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_14 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_valid_14 <= _GEN_372;
      end else begin
        BTB_valid_14 <= _GEN_372;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_15 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_valid_15 <= _GEN_373;
      end else begin
        BTB_valid_15 <= _GEN_373;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_16 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_valid_16 <= _GEN_374;
      end else begin
        BTB_valid_16 <= _GEN_374;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_17 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_valid_17 <= _GEN_375;
      end else begin
        BTB_valid_17 <= _GEN_375;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_18 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_valid_18 <= _GEN_376;
      end else begin
        BTB_valid_18 <= _GEN_376;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_19 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_valid_19 <= _GEN_377;
      end else begin
        BTB_valid_19 <= _GEN_377;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_20 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_valid_20 <= _GEN_378;
      end else begin
        BTB_valid_20 <= _GEN_378;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_21 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_valid_21 <= _GEN_379;
      end else begin
        BTB_valid_21 <= _GEN_379;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_22 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_valid_22 <= _GEN_380;
      end else begin
        BTB_valid_22 <= _GEN_380;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_23 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_valid_23 <= _GEN_381;
      end else begin
        BTB_valid_23 <= _GEN_381;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_24 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_valid_24 <= _GEN_382;
      end else begin
        BTB_valid_24 <= _GEN_382;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_25 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_valid_25 <= _GEN_383;
      end else begin
        BTB_valid_25 <= _GEN_383;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_26 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_valid_26 <= _GEN_384;
      end else begin
        BTB_valid_26 <= _GEN_384;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_27 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_valid_27 <= _GEN_385;
      end else begin
        BTB_valid_27 <= _GEN_385;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_28 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_valid_28 <= _GEN_386;
      end else begin
        BTB_valid_28 <= _GEN_386;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_29 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_valid_29 <= _GEN_387;
      end else begin
        BTB_valid_29 <= _GEN_387;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_30 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_valid_30 <= _GEN_388;
      end else begin
        BTB_valid_30 <= _GEN_388;
      end
    end
    if (reset) begin // @[BPU.scala 28:30]
      BTB_valid_31 <= 1'h0; // @[BPU.scala 28:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      if (last_predict) begin // @[BPU.scala 71:24]
        BTB_valid_31 <= _GEN_389;
      end else begin
        BTB_valid_31 <= _GEN_389;
      end
    end
    if (reset) begin // @[BPU.scala 30:30]
      delay <= 1'h0; // @[BPU.scala 30:30]
    end else if (!(io_stall)) begin // @[BPU.scala 54:18]
      delay <= io_predict; // @[BPU.scala 62:18]
    end
    if (reset) begin // @[BPU.scala 31:30]
      last_predict <= 1'h0; // @[BPU.scala 31:30]
    end else if (!(io_stall)) begin // @[BPU.scala 54:18]
      last_predict <= delay; // @[BPU.scala 63:18]
    end
    if (reset) begin // @[BPU.scala 32:30]
      delay_pc <= 32'h0; // @[BPU.scala 32:30]
    end else if (!(io_stall)) begin // @[BPU.scala 54:18]
      delay_pc <= _io_next_pc_T_2; // @[BPU.scala 64:18]
    end
    if (reset) begin // @[BPU.scala 33:30]
      last_pc <= 32'h0; // @[BPU.scala 33:30]
    end else if (!(io_stall)) begin // @[BPU.scala 54:18]
      last_pc <= delay_pc; // @[BPU.scala 65:18]
    end
    if (reset) begin // @[BPU.scala 35:30]
      temp <= 5'h0; // @[BPU.scala 35:30]
    end else if (!(io_stall)) begin // @[BPU.scala 54:18]
      temp <= GH; // @[BPU.scala 66:18]
    end
    if (reset) begin // @[BPU.scala 36:30]
      delay_GH <= 5'h0; // @[BPU.scala 36:30]
    end else if (!(io_stall)) begin // @[BPU.scala 54:18]
      delay_GH <= temp; // @[BPU.scala 67:18]
    end
    if (reset) begin // @[BPU.scala 37:30]
      GH <= 5'h0; // @[BPU.scala 37:30]
    end else if (EXE_is_B_type) begin // @[BPU.scala 70:23]
      GH <= _GH_T_1; // @[BPU.scala 88:8]
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
  delay = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  last_predict = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  delay_pc = _RAND_98[31:0];
  _RAND_99 = {1{`RANDOM}};
  last_pc = _RAND_99[31:0];
  _RAND_100 = {1{`RANDOM}};
  temp = _RAND_100[4:0];
  _RAND_101 = {1{`RANDOM}};
  delay_GH = _RAND_101[4:0];
  _RAND_102 = {1{`RANDOM}};
  GH = _RAND_102[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
