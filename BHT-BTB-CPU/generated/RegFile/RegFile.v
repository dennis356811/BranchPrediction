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
