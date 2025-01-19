circuit Top :
  module Reg_PC :
    input clock : Clock
    input reset : UInt<1>
    input io_stall : UInt<1>
    input io_next_pc : UInt<32>
    output io_current_pc : UInt<32>

    reg PC_REG : UInt<32>, clock with :
      reset => (UInt<1>("h0"), PC_REG) @[Reg_PC.scala 12:35]
    node _GEN_0 = mux(io_stall, PC_REG, io_next_pc) @[Reg_PC.scala 14:17 15:12 17:12]
    io_current_pc <= PC_REG @[Reg_PC.scala 20:24]
    PC_REG <= mux(reset, UInt<32>("h0"), _GEN_0) @[Reg_PC.scala 12:{35,35}]

  module SRAM :
    input clock : Clock
    input reset : UInt<1>
    input io_w_en : UInt<4>
    input io_address : UInt<16>
    input io_write_data : UInt<32>
    output io_read_data : UInt<32>

    mem mem : @[SRAM.scala 16:16]
      data-type => UInt<8>
      depth => 65536
      read-latency => 0
      write-latency => 1
      reader => read_data_bytes_0_MPORT
      reader => read_data_bytes_1_MPORT
      reader => read_data_bytes_2_MPORT
      reader => read_data_bytes_3_MPORT
      writer => MPORT
      writer => MPORT_1
      writer => MPORT_2
      writer => MPORT_3
      read-under-write => undefined
    node _T = neq(io_w_en, UInt<1>("h0")) @[SRAM.scala 19:16]
    node _T_1 = bits(io_w_en, 0, 0) @[SRAM.scala 20:17]
    node _T_2 = bits(io_write_data, 7, 0) @[SRAM.scala 20:59]
    node _GEN_0 = validif(_T_1, io_address) @[SRAM.scala 20:22]
    node _GEN_1 = validif(_T_1, clock) @[SRAM.scala 20:22]
    node _GEN_2 = mux(_T_1, UInt<1>("h1"), UInt<1>("h0")) @[SRAM.scala 16:16 20:22]
    node _GEN_3 = validif(_T_1, UInt<1>("h1")) @[SRAM.scala 20:22]
    node _GEN_4 = validif(_T_1, _T_2) @[SRAM.scala 20:22]
    node _T_3 = bits(io_w_en, 1, 1) @[SRAM.scala 21:17]
    node _T_4 = add(io_address, UInt<1>("h1")) @[SRAM.scala 21:45]
    node _T_5 = tail(_T_4, 1) @[SRAM.scala 21:45]
    node _T_6 = bits(io_write_data, 15, 8) @[SRAM.scala 21:65]
    node _GEN_5 = validif(_T_3, _T_5) @[SRAM.scala 21:22]
    node _GEN_6 = validif(_T_3, clock) @[SRAM.scala 21:22]
    node _GEN_7 = mux(_T_3, UInt<1>("h1"), UInt<1>("h0")) @[SRAM.scala 16:16 21:22]
    node _GEN_8 = validif(_T_3, UInt<1>("h1")) @[SRAM.scala 21:22]
    node _GEN_9 = validif(_T_3, _T_6) @[SRAM.scala 21:22]
    node _T_7 = bits(io_w_en, 2, 2) @[SRAM.scala 22:17]
    node _T_8 = add(io_address, UInt<2>("h2")) @[SRAM.scala 22:45]
    node _T_9 = tail(_T_8, 1) @[SRAM.scala 22:45]
    node _T_10 = bits(io_write_data, 23, 16) @[SRAM.scala 22:65]
    node _GEN_10 = validif(_T_7, _T_9) @[SRAM.scala 22:22]
    node _GEN_11 = validif(_T_7, clock) @[SRAM.scala 22:22]
    node _GEN_12 = mux(_T_7, UInt<1>("h1"), UInt<1>("h0")) @[SRAM.scala 16:16 22:22]
    node _GEN_13 = validif(_T_7, UInt<1>("h1")) @[SRAM.scala 22:22]
    node _GEN_14 = validif(_T_7, _T_10) @[SRAM.scala 22:22]
    node _T_11 = bits(io_w_en, 3, 3) @[SRAM.scala 23:17]
    node _T_12 = add(io_address, UInt<2>("h3")) @[SRAM.scala 23:45]
    node _T_13 = tail(_T_12, 1) @[SRAM.scala 23:45]
    node _T_14 = bits(io_write_data, 31, 24) @[SRAM.scala 23:65]
    node _GEN_15 = validif(_T_11, _T_13) @[SRAM.scala 23:22]
    node _GEN_16 = validif(_T_11, clock) @[SRAM.scala 23:22]
    node _GEN_17 = mux(_T_11, UInt<1>("h1"), UInt<1>("h0")) @[SRAM.scala 16:16 23:22]
    node _GEN_18 = validif(_T_11, UInt<1>("h1")) @[SRAM.scala 23:22]
    node _GEN_19 = validif(_T_11, _T_14) @[SRAM.scala 23:22]
    node _GEN_20 = validif(_T, _GEN_0) @[SRAM.scala 19:25]
    node _GEN_21 = validif(_T, _GEN_1) @[SRAM.scala 19:25]
    node _GEN_22 = mux(_T, _GEN_2, UInt<1>("h0")) @[SRAM.scala 16:16 19:25]
    node _GEN_23 = validif(_T, _GEN_3) @[SRAM.scala 19:25]
    node _GEN_24 = validif(_T, _GEN_4) @[SRAM.scala 19:25]
    node _GEN_25 = validif(_T, _GEN_5) @[SRAM.scala 19:25]
    node _GEN_26 = validif(_T, _GEN_6) @[SRAM.scala 19:25]
    node _GEN_27 = mux(_T, _GEN_7, UInt<1>("h0")) @[SRAM.scala 16:16 19:25]
    node _GEN_28 = validif(_T, _GEN_8) @[SRAM.scala 19:25]
    node _GEN_29 = validif(_T, _GEN_9) @[SRAM.scala 19:25]
    node _GEN_30 = validif(_T, _GEN_10) @[SRAM.scala 19:25]
    node _GEN_31 = validif(_T, _GEN_11) @[SRAM.scala 19:25]
    node _GEN_32 = mux(_T, _GEN_12, UInt<1>("h0")) @[SRAM.scala 16:16 19:25]
    node _GEN_33 = validif(_T, _GEN_13) @[SRAM.scala 19:25]
    node _GEN_34 = validif(_T, _GEN_14) @[SRAM.scala 19:25]
    node _GEN_35 = validif(_T, _GEN_15) @[SRAM.scala 19:25]
    node _GEN_36 = validif(_T, _GEN_16) @[SRAM.scala 19:25]
    node _GEN_37 = mux(_T, _GEN_17, UInt<1>("h0")) @[SRAM.scala 16:16 19:25]
    node _GEN_38 = validif(_T, _GEN_18) @[SRAM.scala 19:25]
    node _GEN_39 = validif(_T, _GEN_19) @[SRAM.scala 19:25]
    node _read_data_bytes_1_T = add(io_address, UInt<1>("h1")) @[SRAM.scala 29:45]
    node _read_data_bytes_1_T_1 = tail(_read_data_bytes_1_T, 1) @[SRAM.scala 29:45]
    node _read_data_bytes_2_T = add(io_address, UInt<2>("h2")) @[SRAM.scala 30:45]
    node _read_data_bytes_2_T_1 = tail(_read_data_bytes_2_T, 1) @[SRAM.scala 30:45]
    node _read_data_bytes_3_T = add(io_address, UInt<2>("h3")) @[SRAM.scala 31:45]
    node _read_data_bytes_3_T_1 = tail(_read_data_bytes_3_T, 1) @[SRAM.scala 31:45]
    node read_data_bytes_1 = mem.read_data_bytes_1_MPORT.data @[SRAM.scala 27:32 29:22]
    node read_data_bytes_0 = mem.read_data_bytes_0_MPORT.data @[SRAM.scala 27:32 28:22]
    node io_read_data_lo = cat(read_data_bytes_1, read_data_bytes_0) @[Cat.scala 31:58]
    node read_data_bytes_3 = mem.read_data_bytes_3_MPORT.data @[SRAM.scala 27:32 31:22]
    node read_data_bytes_2 = mem.read_data_bytes_2_MPORT.data @[SRAM.scala 27:32 30:22]
    node io_read_data_hi = cat(read_data_bytes_3, read_data_bytes_2) @[Cat.scala 31:58]
    node _io_read_data_T = cat(io_read_data_hi, io_read_data_lo) @[Cat.scala 31:58]
    io_read_data <= _io_read_data_T @[SRAM.scala 33:16]
    mem.read_data_bytes_0_MPORT.addr <= io_address @[SRAM.scala 28:33]
    mem.read_data_bytes_0_MPORT.en <= UInt<1>("h1") @[SRAM.scala 28:33]
    mem.read_data_bytes_0_MPORT.clk <= clock @[SRAM.scala 28:33]
    mem.read_data_bytes_1_MPORT.addr <= _read_data_bytes_1_T_1 @[SRAM.scala 29:33]
    mem.read_data_bytes_1_MPORT.en <= UInt<1>("h1") @[SRAM.scala 29:33]
    mem.read_data_bytes_1_MPORT.clk <= clock @[SRAM.scala 29:33]
    mem.read_data_bytes_2_MPORT.addr <= _read_data_bytes_2_T_1 @[SRAM.scala 30:33]
    mem.read_data_bytes_2_MPORT.en <= UInt<1>("h1") @[SRAM.scala 30:33]
    mem.read_data_bytes_2_MPORT.clk <= clock @[SRAM.scala 30:33]
    mem.read_data_bytes_3_MPORT.addr <= _read_data_bytes_3_T_1 @[SRAM.scala 31:33]
    mem.read_data_bytes_3_MPORT.en <= UInt<1>("h1") @[SRAM.scala 31:33]
    mem.read_data_bytes_3_MPORT.clk <= clock @[SRAM.scala 31:33]
    mem.MPORT.addr <= _GEN_20
    mem.MPORT.en <= _GEN_22
    mem.MPORT.clk <= _GEN_21
    mem.MPORT.data <= _GEN_24
    mem.MPORT.mask <= _GEN_23
    mem.MPORT_1.addr <= _GEN_25
    mem.MPORT_1.en <= _GEN_27
    mem.MPORT_1.clk <= _GEN_26
    mem.MPORT_1.data <= _GEN_29
    mem.MPORT_1.mask <= _GEN_28
    mem.MPORT_2.addr <= _GEN_30
    mem.MPORT_2.en <= _GEN_32
    mem.MPORT_2.clk <= _GEN_31
    mem.MPORT_2.data <= _GEN_34
    mem.MPORT_2.mask <= _GEN_33
    mem.MPORT_3.addr <= _GEN_35
    mem.MPORT_3.en <= _GEN_37
    mem.MPORT_3.clk <= _GEN_36
    mem.MPORT_3.data <= _GEN_39
    mem.MPORT_3.mask <= _GEN_38

  module Reg_D :
    input clock : Clock
    input reset : UInt<1>
    input io_stall : UInt<1>
    input io_jb : UInt<1>
    input io_pc : UInt<32>
    input io_inst : UInt<32>
    output io_out_Reg_D_pc : UInt<32>
    output io_out_Reg_D_inst : UInt<32>

    reg PC_REG : UInt<32>, clock with :
      reset => (UInt<1>("h0"), PC_REG) @[Reg_D.scala 15:35]
    reg INST_REG : UInt<32>, clock with :
      reset => (UInt<1>("h0"), INST_REG) @[Reg_D.scala 16:35]
    node _GEN_0 = mux(io_stall, PC_REG, io_pc) @[Reg_D.scala 21:23 22:17 25:17]
    node _GEN_1 = mux(io_stall, INST_REG, io_inst) @[Reg_D.scala 21:23 23:17 26:17]
    node _GEN_2 = mux(io_jb, UInt<32>("h0"), _GEN_0) @[Reg_D.scala 18:14 19:17]
    node _GEN_3 = mux(io_jb, UInt<32>("h0"), _GEN_1) @[Reg_D.scala 18:14 20:17]
    io_out_Reg_D_pc <= PC_REG @[Reg_D.scala 28:25]
    io_out_Reg_D_inst <= INST_REG @[Reg_D.scala 29:25]
    PC_REG <= mux(reset, UInt<32>("h0"), _GEN_2) @[Reg_D.scala 15:{35,35}]
    INST_REG <= mux(reset, UInt<32>("h0"), _GEN_3) @[Reg_D.scala 16:{35,35}]

  module Decoder :
    input clock : Clock
    input reset : UInt<1>
    input io_inst : UInt<32>
    output io_dc_out_opcode : UInt<5>
    output io_dc_out_func3 : UInt<3>
    output io_dc_out_func7 : UInt<1>
    output io_dc_out_rs1_index : UInt<5>
    output io_dc_out_rs2_index : UInt<5>
    output io_dc_out_rd_index : UInt<5>

    node _io_dc_out_opcode_T = bits(io_inst, 6, 2) @[Decoder.scala 15:30]
    node _io_dc_out_func3_T = bits(io_inst, 14, 12) @[Decoder.scala 16:29]
    node _io_dc_out_func7_T = bits(io_inst, 30, 30) @[Decoder.scala 17:29]
    node _io_dc_out_rs1_index_T = bits(io_inst, 19, 15) @[Decoder.scala 18:33]
    node _io_dc_out_rs2_index_T = bits(io_inst, 24, 20) @[Decoder.scala 19:33]
    node _io_dc_out_rd_index_T = bits(io_inst, 11, 7) @[Decoder.scala 20:32]
    io_dc_out_opcode <= _io_dc_out_opcode_T @[Decoder.scala 15:20]
    io_dc_out_func3 <= _io_dc_out_func3_T @[Decoder.scala 16:19]
    io_dc_out_func7 <= _io_dc_out_func7_T @[Decoder.scala 17:19]
    io_dc_out_rs1_index <= _io_dc_out_rs1_index_T @[Decoder.scala 18:23]
    io_dc_out_rs2_index <= _io_dc_out_rs2_index_T @[Decoder.scala 19:23]
    io_dc_out_rd_index <= _io_dc_out_rd_index_T @[Decoder.scala 20:22]

  module Imm_Ext :
    input clock : Clock
    input reset : UInt<1>
    input io_inst : UInt<32>
    output io_imm_ext_out : UInt<32>

    node _T = bits(io_inst, 6, 2) @[Imm_Ext.scala 15:19]
    node _T_1 = eq(UInt<5>("h0"), _T) @[Imm_Ext.scala 15:26]
    node _io_imm_ext_out_T = bits(io_inst, 31, 31) @[Imm_Ext.scala 17:56]
    node _io_imm_ext_out_T_1 = bits(_io_imm_ext_out_T, 0, 0) @[Bitwise.scala 74:15]
    node _io_imm_ext_out_T_2 = mux(_io_imm_ext_out_T_1, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 74:12]
    node _io_imm_ext_out_T_3 = bits(io_inst, 31, 20) @[Imm_Ext.scala 17:70]
    node _io_imm_ext_out_T_4 = cat(_io_imm_ext_out_T_2, _io_imm_ext_out_T_3) @[Cat.scala 31:58]
    node _T_2 = eq(UInt<5>("h4"), _T) @[Imm_Ext.scala 15:26]
    node _io_imm_ext_out_T_5 = bits(io_inst, 31, 31) @[Imm_Ext.scala 20:56]
    node _io_imm_ext_out_T_6 = bits(_io_imm_ext_out_T_5, 0, 0) @[Bitwise.scala 74:15]
    node _io_imm_ext_out_T_7 = mux(_io_imm_ext_out_T_6, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 74:12]
    node _io_imm_ext_out_T_8 = bits(io_inst, 31, 20) @[Imm_Ext.scala 20:70]
    node _io_imm_ext_out_T_9 = cat(_io_imm_ext_out_T_7, _io_imm_ext_out_T_8) @[Cat.scala 31:58]
    node _T_3 = eq(UInt<5>("h19"), _T) @[Imm_Ext.scala 15:26]
    node _io_imm_ext_out_T_10 = bits(io_inst, 31, 31) @[Imm_Ext.scala 23:56]
    node _io_imm_ext_out_T_11 = bits(_io_imm_ext_out_T_10, 0, 0) @[Bitwise.scala 74:15]
    node _io_imm_ext_out_T_12 = mux(_io_imm_ext_out_T_11, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 74:12]
    node _io_imm_ext_out_T_13 = bits(io_inst, 31, 20) @[Imm_Ext.scala 23:70]
    node _io_imm_ext_out_T_14 = cat(_io_imm_ext_out_T_12, _io_imm_ext_out_T_13) @[Cat.scala 31:58]
    node _T_4 = eq(UInt<5>("h8"), _T) @[Imm_Ext.scala 15:26]
    node _io_imm_ext_out_T_15 = bits(io_inst, 31, 31) @[Imm_Ext.scala 26:56]
    node _io_imm_ext_out_T_16 = bits(_io_imm_ext_out_T_15, 0, 0) @[Bitwise.scala 74:15]
    node _io_imm_ext_out_T_17 = mux(_io_imm_ext_out_T_16, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 74:12]
    node _io_imm_ext_out_T_18 = bits(io_inst, 31, 25) @[Imm_Ext.scala 26:70]
    node _io_imm_ext_out_T_19 = bits(io_inst, 11, 7) @[Imm_Ext.scala 26:87]
    node io_imm_ext_out_hi = cat(_io_imm_ext_out_T_17, _io_imm_ext_out_T_18) @[Cat.scala 31:58]
    node _io_imm_ext_out_T_20 = cat(io_imm_ext_out_hi, _io_imm_ext_out_T_19) @[Cat.scala 31:58]
    node _T_5 = eq(UInt<5>("h18"), _T) @[Imm_Ext.scala 15:26]
    node _io_imm_ext_out_T_21 = bits(io_inst, 31, 31) @[Imm_Ext.scala 29:56]
    node _io_imm_ext_out_T_22 = bits(_io_imm_ext_out_T_21, 0, 0) @[Bitwise.scala 74:15]
    node _io_imm_ext_out_T_23 = mux(_io_imm_ext_out_T_22, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 74:12]
    node _io_imm_ext_out_T_24 = bits(io_inst, 7, 7) @[Imm_Ext.scala 29:70]
    node _io_imm_ext_out_T_25 = bits(io_inst, 30, 25) @[Imm_Ext.scala 29:82]
    node _io_imm_ext_out_T_26 = bits(io_inst, 11, 8) @[Imm_Ext.scala 29:99]
    node io_imm_ext_out_lo = cat(_io_imm_ext_out_T_26, UInt<1>("h0")) @[Cat.scala 31:58]
    node io_imm_ext_out_hi_hi = cat(_io_imm_ext_out_T_23, _io_imm_ext_out_T_24) @[Cat.scala 31:58]
    node io_imm_ext_out_hi_1 = cat(io_imm_ext_out_hi_hi, _io_imm_ext_out_T_25) @[Cat.scala 31:58]
    node _io_imm_ext_out_T_27 = cat(io_imm_ext_out_hi_1, io_imm_ext_out_lo) @[Cat.scala 31:58]
    node _T_6 = eq(UInt<5>("hd"), _T) @[Imm_Ext.scala 15:26]
    node _io_imm_ext_out_T_28 = bits(io_inst, 31, 12) @[Imm_Ext.scala 32:47]
    node _io_imm_ext_out_T_29 = cat(_io_imm_ext_out_T_28, UInt<12>("h0")) @[Cat.scala 31:58]
    node _T_7 = eq(UInt<5>("h5"), _T) @[Imm_Ext.scala 15:26]
    node _io_imm_ext_out_T_30 = bits(io_inst, 31, 12) @[Imm_Ext.scala 35:47]
    node _io_imm_ext_out_T_31 = cat(_io_imm_ext_out_T_30, UInt<12>("h0")) @[Cat.scala 31:58]
    node _T_8 = eq(UInt<5>("h1b"), _T) @[Imm_Ext.scala 15:26]
    node _io_imm_ext_out_T_32 = bits(io_inst, 31, 31) @[Imm_Ext.scala 38:56]
    node _io_imm_ext_out_T_33 = bits(_io_imm_ext_out_T_32, 0, 0) @[Bitwise.scala 74:15]
    node _io_imm_ext_out_T_34 = mux(_io_imm_ext_out_T_33, UInt<12>("hfff"), UInt<12>("h0")) @[Bitwise.scala 74:12]
    node _io_imm_ext_out_T_35 = bits(io_inst, 19, 12) @[Imm_Ext.scala 38:70]
    node _io_imm_ext_out_T_36 = bits(io_inst, 20, 20) @[Imm_Ext.scala 38:87]
    node _io_imm_ext_out_T_37 = bits(io_inst, 30, 21) @[Imm_Ext.scala 38:100]
    node io_imm_ext_out_lo_1 = cat(_io_imm_ext_out_T_37, UInt<1>("h0")) @[Cat.scala 31:58]
    node io_imm_ext_out_hi_hi_1 = cat(_io_imm_ext_out_T_34, _io_imm_ext_out_T_35) @[Cat.scala 31:58]
    node io_imm_ext_out_hi_2 = cat(io_imm_ext_out_hi_hi_1, _io_imm_ext_out_T_36) @[Cat.scala 31:58]
    node _io_imm_ext_out_T_38 = cat(io_imm_ext_out_hi_2, io_imm_ext_out_lo_1) @[Cat.scala 31:58]
    node _GEN_0 = mux(_T_8, _io_imm_ext_out_T_38, UInt<32>("h0")) @[Imm_Ext.scala 12:24 15:26 38:33]
    node _GEN_1 = mux(_T_7, _io_imm_ext_out_T_31, _GEN_0) @[Imm_Ext.scala 15:26 35:33]
    node _GEN_2 = mux(_T_6, _io_imm_ext_out_T_29, _GEN_1) @[Imm_Ext.scala 15:26 32:33]
    node _GEN_3 = mux(_T_5, _io_imm_ext_out_T_27, _GEN_2) @[Imm_Ext.scala 15:26 29:33]
    node _GEN_4 = mux(_T_4, _io_imm_ext_out_T_20, _GEN_3) @[Imm_Ext.scala 15:26 26:33]
    node _GEN_5 = mux(_T_3, _io_imm_ext_out_T_14, _GEN_4) @[Imm_Ext.scala 15:26 23:33]
    node _GEN_6 = mux(_T_2, _io_imm_ext_out_T_9, _GEN_5) @[Imm_Ext.scala 15:26 20:33]
    node _GEN_7 = mux(_T_1, _io_imm_ext_out_T_4, _GEN_6) @[Imm_Ext.scala 15:26 17:33]
    io_imm_ext_out <= _GEN_7

  module RegFile :
    input clock : Clock
    input reset : UInt<1>
    input io_wb_en : UInt<1>
    input io_wb_data : UInt<32>
    input io_rd_index : UInt<5>
    input io_rs1_index : UInt<5>
    input io_rs2_index : UInt<5>
    output io_rs1_data_out : UInt<32>
    output io_rs2_data_out : UInt<32>

    reg registers_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registers_0) @[RegFile.scala 16:26]
    reg registers_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registers_1) @[RegFile.scala 16:26]
    reg registers_2 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registers_2) @[RegFile.scala 16:26]
    reg registers_3 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registers_3) @[RegFile.scala 16:26]
    reg registers_4 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registers_4) @[RegFile.scala 16:26]
    reg registers_5 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registers_5) @[RegFile.scala 16:26]
    reg registers_6 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registers_6) @[RegFile.scala 16:26]
    reg registers_7 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registers_7) @[RegFile.scala 16:26]
    reg registers_8 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registers_8) @[RegFile.scala 16:26]
    reg registers_9 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registers_9) @[RegFile.scala 16:26]
    reg registers_10 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registers_10) @[RegFile.scala 16:26]
    reg registers_11 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registers_11) @[RegFile.scala 16:26]
    reg registers_12 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registers_12) @[RegFile.scala 16:26]
    reg registers_13 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registers_13) @[RegFile.scala 16:26]
    reg registers_14 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registers_14) @[RegFile.scala 16:26]
    reg registers_15 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registers_15) @[RegFile.scala 16:26]
    reg registers_16 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registers_16) @[RegFile.scala 16:26]
    reg registers_17 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registers_17) @[RegFile.scala 16:26]
    reg registers_18 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registers_18) @[RegFile.scala 16:26]
    reg registers_19 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registers_19) @[RegFile.scala 16:26]
    reg registers_20 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registers_20) @[RegFile.scala 16:26]
    reg registers_21 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registers_21) @[RegFile.scala 16:26]
    reg registers_22 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registers_22) @[RegFile.scala 16:26]
    reg registers_23 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registers_23) @[RegFile.scala 16:26]
    reg registers_24 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registers_24) @[RegFile.scala 16:26]
    reg registers_25 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registers_25) @[RegFile.scala 16:26]
    reg registers_26 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registers_26) @[RegFile.scala 16:26]
    reg registers_27 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registers_27) @[RegFile.scala 16:26]
    reg registers_28 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registers_28) @[RegFile.scala 16:26]
    reg registers_29 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registers_29) @[RegFile.scala 16:26]
    reg registers_30 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registers_30) @[RegFile.scala 16:26]
    reg registers_31 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registers_31) @[RegFile.scala 16:26]
    node _T = neq(io_rd_index, UInt<1>("h0")) @[RegFile.scala 18:32]
    node _T_1 = and(io_wb_en, _T) @[RegFile.scala 18:17]
    node _registers_io_rd_index = io_wb_data @[RegFile.scala 19:{28,28}]
    node _GEN_0 = mux(eq(UInt<1>("h0"), io_rd_index), _registers_io_rd_index, registers_0) @[RegFile.scala 16:26 19:{28,28}]
    node _GEN_1 = mux(eq(UInt<1>("h1"), io_rd_index), _registers_io_rd_index, registers_1) @[RegFile.scala 16:26 19:{28,28}]
    node _GEN_2 = mux(eq(UInt<2>("h2"), io_rd_index), _registers_io_rd_index, registers_2) @[RegFile.scala 16:26 19:{28,28}]
    node _GEN_3 = mux(eq(UInt<2>("h3"), io_rd_index), _registers_io_rd_index, registers_3) @[RegFile.scala 16:26 19:{28,28}]
    node _GEN_4 = mux(eq(UInt<3>("h4"), io_rd_index), _registers_io_rd_index, registers_4) @[RegFile.scala 16:26 19:{28,28}]
    node _GEN_5 = mux(eq(UInt<3>("h5"), io_rd_index), _registers_io_rd_index, registers_5) @[RegFile.scala 16:26 19:{28,28}]
    node _GEN_6 = mux(eq(UInt<3>("h6"), io_rd_index), _registers_io_rd_index, registers_6) @[RegFile.scala 16:26 19:{28,28}]
    node _GEN_7 = mux(eq(UInt<3>("h7"), io_rd_index), _registers_io_rd_index, registers_7) @[RegFile.scala 16:26 19:{28,28}]
    node _GEN_8 = mux(eq(UInt<4>("h8"), io_rd_index), _registers_io_rd_index, registers_8) @[RegFile.scala 16:26 19:{28,28}]
    node _GEN_9 = mux(eq(UInt<4>("h9"), io_rd_index), _registers_io_rd_index, registers_9) @[RegFile.scala 16:26 19:{28,28}]
    node _GEN_10 = mux(eq(UInt<4>("ha"), io_rd_index), _registers_io_rd_index, registers_10) @[RegFile.scala 16:26 19:{28,28}]
    node _GEN_11 = mux(eq(UInt<4>("hb"), io_rd_index), _registers_io_rd_index, registers_11) @[RegFile.scala 16:26 19:{28,28}]
    node _GEN_12 = mux(eq(UInt<4>("hc"), io_rd_index), _registers_io_rd_index, registers_12) @[RegFile.scala 16:26 19:{28,28}]
    node _GEN_13 = mux(eq(UInt<4>("hd"), io_rd_index), _registers_io_rd_index, registers_13) @[RegFile.scala 16:26 19:{28,28}]
    node _GEN_14 = mux(eq(UInt<4>("he"), io_rd_index), _registers_io_rd_index, registers_14) @[RegFile.scala 16:26 19:{28,28}]
    node _GEN_15 = mux(eq(UInt<4>("hf"), io_rd_index), _registers_io_rd_index, registers_15) @[RegFile.scala 16:26 19:{28,28}]
    node _GEN_16 = mux(eq(UInt<5>("h10"), io_rd_index), _registers_io_rd_index, registers_16) @[RegFile.scala 16:26 19:{28,28}]
    node _GEN_17 = mux(eq(UInt<5>("h11"), io_rd_index), _registers_io_rd_index, registers_17) @[RegFile.scala 16:26 19:{28,28}]
    node _GEN_18 = mux(eq(UInt<5>("h12"), io_rd_index), _registers_io_rd_index, registers_18) @[RegFile.scala 16:26 19:{28,28}]
    node _GEN_19 = mux(eq(UInt<5>("h13"), io_rd_index), _registers_io_rd_index, registers_19) @[RegFile.scala 16:26 19:{28,28}]
    node _GEN_20 = mux(eq(UInt<5>("h14"), io_rd_index), _registers_io_rd_index, registers_20) @[RegFile.scala 16:26 19:{28,28}]
    node _GEN_21 = mux(eq(UInt<5>("h15"), io_rd_index), _registers_io_rd_index, registers_21) @[RegFile.scala 16:26 19:{28,28}]
    node _GEN_22 = mux(eq(UInt<5>("h16"), io_rd_index), _registers_io_rd_index, registers_22) @[RegFile.scala 16:26 19:{28,28}]
    node _GEN_23 = mux(eq(UInt<5>("h17"), io_rd_index), _registers_io_rd_index, registers_23) @[RegFile.scala 16:26 19:{28,28}]
    node _GEN_24 = mux(eq(UInt<5>("h18"), io_rd_index), _registers_io_rd_index, registers_24) @[RegFile.scala 16:26 19:{28,28}]
    node _GEN_25 = mux(eq(UInt<5>("h19"), io_rd_index), _registers_io_rd_index, registers_25) @[RegFile.scala 16:26 19:{28,28}]
    node _GEN_26 = mux(eq(UInt<5>("h1a"), io_rd_index), _registers_io_rd_index, registers_26) @[RegFile.scala 16:26 19:{28,28}]
    node _GEN_27 = mux(eq(UInt<5>("h1b"), io_rd_index), _registers_io_rd_index, registers_27) @[RegFile.scala 16:26 19:{28,28}]
    node _GEN_28 = mux(eq(UInt<5>("h1c"), io_rd_index), _registers_io_rd_index, registers_28) @[RegFile.scala 16:26 19:{28,28}]
    node _GEN_29 = mux(eq(UInt<5>("h1d"), io_rd_index), _registers_io_rd_index, registers_29) @[RegFile.scala 16:26 19:{28,28}]
    node _GEN_30 = mux(eq(UInt<5>("h1e"), io_rd_index), _registers_io_rd_index, registers_30) @[RegFile.scala 16:26 19:{28,28}]
    node _GEN_31 = mux(eq(UInt<5>("h1f"), io_rd_index), _registers_io_rd_index, registers_31) @[RegFile.scala 16:26 19:{28,28}]
    node _GEN_32 = mux(_T_1, _GEN_0, registers_0) @[RegFile.scala 16:26 18:41]
    node _GEN_33 = mux(_T_1, _GEN_1, registers_1) @[RegFile.scala 16:26 18:41]
    node _GEN_34 = mux(_T_1, _GEN_2, registers_2) @[RegFile.scala 16:26 18:41]
    node _GEN_35 = mux(_T_1, _GEN_3, registers_3) @[RegFile.scala 16:26 18:41]
    node _GEN_36 = mux(_T_1, _GEN_4, registers_4) @[RegFile.scala 16:26 18:41]
    node _GEN_37 = mux(_T_1, _GEN_5, registers_5) @[RegFile.scala 16:26 18:41]
    node _GEN_38 = mux(_T_1, _GEN_6, registers_6) @[RegFile.scala 16:26 18:41]
    node _GEN_39 = mux(_T_1, _GEN_7, registers_7) @[RegFile.scala 16:26 18:41]
    node _GEN_40 = mux(_T_1, _GEN_8, registers_8) @[RegFile.scala 16:26 18:41]
    node _GEN_41 = mux(_T_1, _GEN_9, registers_9) @[RegFile.scala 16:26 18:41]
    node _GEN_42 = mux(_T_1, _GEN_10, registers_10) @[RegFile.scala 16:26 18:41]
    node _GEN_43 = mux(_T_1, _GEN_11, registers_11) @[RegFile.scala 16:26 18:41]
    node _GEN_44 = mux(_T_1, _GEN_12, registers_12) @[RegFile.scala 16:26 18:41]
    node _GEN_45 = mux(_T_1, _GEN_13, registers_13) @[RegFile.scala 16:26 18:41]
    node _GEN_46 = mux(_T_1, _GEN_14, registers_14) @[RegFile.scala 16:26 18:41]
    node _GEN_47 = mux(_T_1, _GEN_15, registers_15) @[RegFile.scala 16:26 18:41]
    node _GEN_48 = mux(_T_1, _GEN_16, registers_16) @[RegFile.scala 16:26 18:41]
    node _GEN_49 = mux(_T_1, _GEN_17, registers_17) @[RegFile.scala 16:26 18:41]
    node _GEN_50 = mux(_T_1, _GEN_18, registers_18) @[RegFile.scala 16:26 18:41]
    node _GEN_51 = mux(_T_1, _GEN_19, registers_19) @[RegFile.scala 16:26 18:41]
    node _GEN_52 = mux(_T_1, _GEN_20, registers_20) @[RegFile.scala 16:26 18:41]
    node _GEN_53 = mux(_T_1, _GEN_21, registers_21) @[RegFile.scala 16:26 18:41]
    node _GEN_54 = mux(_T_1, _GEN_22, registers_22) @[RegFile.scala 16:26 18:41]
    node _GEN_55 = mux(_T_1, _GEN_23, registers_23) @[RegFile.scala 16:26 18:41]
    node _GEN_56 = mux(_T_1, _GEN_24, registers_24) @[RegFile.scala 16:26 18:41]
    node _GEN_57 = mux(_T_1, _GEN_25, registers_25) @[RegFile.scala 16:26 18:41]
    node _GEN_58 = mux(_T_1, _GEN_26, registers_26) @[RegFile.scala 16:26 18:41]
    node _GEN_59 = mux(_T_1, _GEN_27, registers_27) @[RegFile.scala 16:26 18:41]
    node _GEN_60 = mux(_T_1, _GEN_28, registers_28) @[RegFile.scala 16:26 18:41]
    node _GEN_61 = mux(_T_1, _GEN_29, registers_29) @[RegFile.scala 16:26 18:41]
    node _GEN_62 = mux(_T_1, _GEN_30, registers_30) @[RegFile.scala 16:26 18:41]
    node _GEN_63 = mux(_T_1, _GEN_31, registers_31) @[RegFile.scala 16:26 18:41]
    node _io_rs1_data_out_T = eq(io_rs1_index, UInt<1>("h0")) @[RegFile.scala 22:39]
    node _GEN_64 = validif(eq(UInt<1>("h0"), io_rs1_index), registers_0) @[RegFile.scala 22:{25,25}]
    node _GEN_65 = mux(eq(UInt<1>("h1"), io_rs1_index), registers_1, _GEN_64) @[RegFile.scala 22:{25,25}]
    node _GEN_66 = mux(eq(UInt<2>("h2"), io_rs1_index), registers_2, _GEN_65) @[RegFile.scala 22:{25,25}]
    node _GEN_67 = mux(eq(UInt<2>("h3"), io_rs1_index), registers_3, _GEN_66) @[RegFile.scala 22:{25,25}]
    node _GEN_68 = mux(eq(UInt<3>("h4"), io_rs1_index), registers_4, _GEN_67) @[RegFile.scala 22:{25,25}]
    node _GEN_69 = mux(eq(UInt<3>("h5"), io_rs1_index), registers_5, _GEN_68) @[RegFile.scala 22:{25,25}]
    node _GEN_70 = mux(eq(UInt<3>("h6"), io_rs1_index), registers_6, _GEN_69) @[RegFile.scala 22:{25,25}]
    node _GEN_71 = mux(eq(UInt<3>("h7"), io_rs1_index), registers_7, _GEN_70) @[RegFile.scala 22:{25,25}]
    node _GEN_72 = mux(eq(UInt<4>("h8"), io_rs1_index), registers_8, _GEN_71) @[RegFile.scala 22:{25,25}]
    node _GEN_73 = mux(eq(UInt<4>("h9"), io_rs1_index), registers_9, _GEN_72) @[RegFile.scala 22:{25,25}]
    node _GEN_74 = mux(eq(UInt<4>("ha"), io_rs1_index), registers_10, _GEN_73) @[RegFile.scala 22:{25,25}]
    node _GEN_75 = mux(eq(UInt<4>("hb"), io_rs1_index), registers_11, _GEN_74) @[RegFile.scala 22:{25,25}]
    node _GEN_76 = mux(eq(UInt<4>("hc"), io_rs1_index), registers_12, _GEN_75) @[RegFile.scala 22:{25,25}]
    node _GEN_77 = mux(eq(UInt<4>("hd"), io_rs1_index), registers_13, _GEN_76) @[RegFile.scala 22:{25,25}]
    node _GEN_78 = mux(eq(UInt<4>("he"), io_rs1_index), registers_14, _GEN_77) @[RegFile.scala 22:{25,25}]
    node _GEN_79 = mux(eq(UInt<4>("hf"), io_rs1_index), registers_15, _GEN_78) @[RegFile.scala 22:{25,25}]
    node _GEN_80 = mux(eq(UInt<5>("h10"), io_rs1_index), registers_16, _GEN_79) @[RegFile.scala 22:{25,25}]
    node _GEN_81 = mux(eq(UInt<5>("h11"), io_rs1_index), registers_17, _GEN_80) @[RegFile.scala 22:{25,25}]
    node _GEN_82 = mux(eq(UInt<5>("h12"), io_rs1_index), registers_18, _GEN_81) @[RegFile.scala 22:{25,25}]
    node _GEN_83 = mux(eq(UInt<5>("h13"), io_rs1_index), registers_19, _GEN_82) @[RegFile.scala 22:{25,25}]
    node _GEN_84 = mux(eq(UInt<5>("h14"), io_rs1_index), registers_20, _GEN_83) @[RegFile.scala 22:{25,25}]
    node _GEN_85 = mux(eq(UInt<5>("h15"), io_rs1_index), registers_21, _GEN_84) @[RegFile.scala 22:{25,25}]
    node _GEN_86 = mux(eq(UInt<5>("h16"), io_rs1_index), registers_22, _GEN_85) @[RegFile.scala 22:{25,25}]
    node _GEN_87 = mux(eq(UInt<5>("h17"), io_rs1_index), registers_23, _GEN_86) @[RegFile.scala 22:{25,25}]
    node _GEN_88 = mux(eq(UInt<5>("h18"), io_rs1_index), registers_24, _GEN_87) @[RegFile.scala 22:{25,25}]
    node _GEN_89 = mux(eq(UInt<5>("h19"), io_rs1_index), registers_25, _GEN_88) @[RegFile.scala 22:{25,25}]
    node _GEN_90 = mux(eq(UInt<5>("h1a"), io_rs1_index), registers_26, _GEN_89) @[RegFile.scala 22:{25,25}]
    node _GEN_91 = mux(eq(UInt<5>("h1b"), io_rs1_index), registers_27, _GEN_90) @[RegFile.scala 22:{25,25}]
    node _GEN_92 = mux(eq(UInt<5>("h1c"), io_rs1_index), registers_28, _GEN_91) @[RegFile.scala 22:{25,25}]
    node _GEN_93 = mux(eq(UInt<5>("h1d"), io_rs1_index), registers_29, _GEN_92) @[RegFile.scala 22:{25,25}]
    node _GEN_94 = mux(eq(UInt<5>("h1e"), io_rs1_index), registers_30, _GEN_93) @[RegFile.scala 22:{25,25}]
    node _GEN_95 = mux(eq(UInt<5>("h1f"), io_rs1_index), registers_31, _GEN_94) @[RegFile.scala 22:{25,25}]
    node _registers_io_rs1_index = _GEN_95 @[RegFile.scala 22:25]
    node _io_rs1_data_out_T_1 = mux(_io_rs1_data_out_T, UInt<1>("h0"), _registers_io_rs1_index) @[RegFile.scala 22:25]
    node _io_rs2_data_out_T = eq(io_rs2_index, UInt<1>("h0")) @[RegFile.scala 23:39]
    node _GEN_96 = validif(eq(UInt<1>("h0"), io_rs2_index), registers_0) @[RegFile.scala 23:{25,25}]
    node _GEN_97 = mux(eq(UInt<1>("h1"), io_rs2_index), registers_1, _GEN_96) @[RegFile.scala 23:{25,25}]
    node _GEN_98 = mux(eq(UInt<2>("h2"), io_rs2_index), registers_2, _GEN_97) @[RegFile.scala 23:{25,25}]
    node _GEN_99 = mux(eq(UInt<2>("h3"), io_rs2_index), registers_3, _GEN_98) @[RegFile.scala 23:{25,25}]
    node _GEN_100 = mux(eq(UInt<3>("h4"), io_rs2_index), registers_4, _GEN_99) @[RegFile.scala 23:{25,25}]
    node _GEN_101 = mux(eq(UInt<3>("h5"), io_rs2_index), registers_5, _GEN_100) @[RegFile.scala 23:{25,25}]
    node _GEN_102 = mux(eq(UInt<3>("h6"), io_rs2_index), registers_6, _GEN_101) @[RegFile.scala 23:{25,25}]
    node _GEN_103 = mux(eq(UInt<3>("h7"), io_rs2_index), registers_7, _GEN_102) @[RegFile.scala 23:{25,25}]
    node _GEN_104 = mux(eq(UInt<4>("h8"), io_rs2_index), registers_8, _GEN_103) @[RegFile.scala 23:{25,25}]
    node _GEN_105 = mux(eq(UInt<4>("h9"), io_rs2_index), registers_9, _GEN_104) @[RegFile.scala 23:{25,25}]
    node _GEN_106 = mux(eq(UInt<4>("ha"), io_rs2_index), registers_10, _GEN_105) @[RegFile.scala 23:{25,25}]
    node _GEN_107 = mux(eq(UInt<4>("hb"), io_rs2_index), registers_11, _GEN_106) @[RegFile.scala 23:{25,25}]
    node _GEN_108 = mux(eq(UInt<4>("hc"), io_rs2_index), registers_12, _GEN_107) @[RegFile.scala 23:{25,25}]
    node _GEN_109 = mux(eq(UInt<4>("hd"), io_rs2_index), registers_13, _GEN_108) @[RegFile.scala 23:{25,25}]
    node _GEN_110 = mux(eq(UInt<4>("he"), io_rs2_index), registers_14, _GEN_109) @[RegFile.scala 23:{25,25}]
    node _GEN_111 = mux(eq(UInt<4>("hf"), io_rs2_index), registers_15, _GEN_110) @[RegFile.scala 23:{25,25}]
    node _GEN_112 = mux(eq(UInt<5>("h10"), io_rs2_index), registers_16, _GEN_111) @[RegFile.scala 23:{25,25}]
    node _GEN_113 = mux(eq(UInt<5>("h11"), io_rs2_index), registers_17, _GEN_112) @[RegFile.scala 23:{25,25}]
    node _GEN_114 = mux(eq(UInt<5>("h12"), io_rs2_index), registers_18, _GEN_113) @[RegFile.scala 23:{25,25}]
    node _GEN_115 = mux(eq(UInt<5>("h13"), io_rs2_index), registers_19, _GEN_114) @[RegFile.scala 23:{25,25}]
    node _GEN_116 = mux(eq(UInt<5>("h14"), io_rs2_index), registers_20, _GEN_115) @[RegFile.scala 23:{25,25}]
    node _GEN_117 = mux(eq(UInt<5>("h15"), io_rs2_index), registers_21, _GEN_116) @[RegFile.scala 23:{25,25}]
    node _GEN_118 = mux(eq(UInt<5>("h16"), io_rs2_index), registers_22, _GEN_117) @[RegFile.scala 23:{25,25}]
    node _GEN_119 = mux(eq(UInt<5>("h17"), io_rs2_index), registers_23, _GEN_118) @[RegFile.scala 23:{25,25}]
    node _GEN_120 = mux(eq(UInt<5>("h18"), io_rs2_index), registers_24, _GEN_119) @[RegFile.scala 23:{25,25}]
    node _GEN_121 = mux(eq(UInt<5>("h19"), io_rs2_index), registers_25, _GEN_120) @[RegFile.scala 23:{25,25}]
    node _GEN_122 = mux(eq(UInt<5>("h1a"), io_rs2_index), registers_26, _GEN_121) @[RegFile.scala 23:{25,25}]
    node _GEN_123 = mux(eq(UInt<5>("h1b"), io_rs2_index), registers_27, _GEN_122) @[RegFile.scala 23:{25,25}]
    node _GEN_124 = mux(eq(UInt<5>("h1c"), io_rs2_index), registers_28, _GEN_123) @[RegFile.scala 23:{25,25}]
    node _GEN_125 = mux(eq(UInt<5>("h1d"), io_rs2_index), registers_29, _GEN_124) @[RegFile.scala 23:{25,25}]
    node _GEN_126 = mux(eq(UInt<5>("h1e"), io_rs2_index), registers_30, _GEN_125) @[RegFile.scala 23:{25,25}]
    node _GEN_127 = mux(eq(UInt<5>("h1f"), io_rs2_index), registers_31, _GEN_126) @[RegFile.scala 23:{25,25}]
    node _registers_io_rs2_index = _GEN_127 @[RegFile.scala 23:25]
    node _io_rs2_data_out_T_1 = mux(_io_rs2_data_out_T, UInt<1>("h0"), _registers_io_rs2_index) @[RegFile.scala 23:25]
    node _registers_WIRE_0 = UInt<32>("h0") @[RegFile.scala 16:{34,34}]
    node _registers_WIRE_1 = UInt<32>("h0") @[RegFile.scala 16:{34,34}]
    node _registers_WIRE_2 = UInt<32>("h0") @[RegFile.scala 16:{34,34}]
    node _registers_WIRE_3 = UInt<32>("h0") @[RegFile.scala 16:{34,34}]
    node _registers_WIRE_4 = UInt<32>("h0") @[RegFile.scala 16:{34,34}]
    node _registers_WIRE_5 = UInt<32>("h0") @[RegFile.scala 16:{34,34}]
    node _registers_WIRE_6 = UInt<32>("h0") @[RegFile.scala 16:{34,34}]
    node _registers_WIRE_7 = UInt<32>("h0") @[RegFile.scala 16:{34,34}]
    node _registers_WIRE_8 = UInt<32>("h0") @[RegFile.scala 16:{34,34}]
    node _registers_WIRE_9 = UInt<32>("h0") @[RegFile.scala 16:{34,34}]
    node _registers_WIRE_10 = UInt<32>("h0") @[RegFile.scala 16:{34,34}]
    node _registers_WIRE_11 = UInt<32>("h0") @[RegFile.scala 16:{34,34}]
    node _registers_WIRE_12 = UInt<32>("h0") @[RegFile.scala 16:{34,34}]
    node _registers_WIRE_13 = UInt<32>("h0") @[RegFile.scala 16:{34,34}]
    node _registers_WIRE_14 = UInt<32>("h0") @[RegFile.scala 16:{34,34}]
    node _registers_WIRE_15 = UInt<32>("h0") @[RegFile.scala 16:{34,34}]
    node _registers_WIRE_16 = UInt<32>("h0") @[RegFile.scala 16:{34,34}]
    node _registers_WIRE_17 = UInt<32>("h0") @[RegFile.scala 16:{34,34}]
    node _registers_WIRE_18 = UInt<32>("h0") @[RegFile.scala 16:{34,34}]
    node _registers_WIRE_19 = UInt<32>("h0") @[RegFile.scala 16:{34,34}]
    node _registers_WIRE_20 = UInt<32>("h0") @[RegFile.scala 16:{34,34}]
    node _registers_WIRE_21 = UInt<32>("h0") @[RegFile.scala 16:{34,34}]
    node _registers_WIRE_22 = UInt<32>("h0") @[RegFile.scala 16:{34,34}]
    node _registers_WIRE_23 = UInt<32>("h0") @[RegFile.scala 16:{34,34}]
    node _registers_WIRE_24 = UInt<32>("h0") @[RegFile.scala 16:{34,34}]
    node _registers_WIRE_25 = UInt<32>("h0") @[RegFile.scala 16:{34,34}]
    node _registers_WIRE_26 = UInt<32>("h0") @[RegFile.scala 16:{34,34}]
    node _registers_WIRE_27 = UInt<32>("h0") @[RegFile.scala 16:{34,34}]
    node _registers_WIRE_28 = UInt<32>("h0") @[RegFile.scala 16:{34,34}]
    node _registers_WIRE_29 = UInt<32>("h0") @[RegFile.scala 16:{34,34}]
    node _registers_WIRE_30 = UInt<32>("h0") @[RegFile.scala 16:{34,34}]
    node _registers_WIRE_31 = UInt<32>("h0") @[RegFile.scala 16:{34,34}]
    io_rs1_data_out <= _io_rs1_data_out_T_1 @[RegFile.scala 22:19]
    io_rs2_data_out <= _io_rs2_data_out_T_1 @[RegFile.scala 23:19]
    registers_0 <= mux(reset, _registers_WIRE_0, _GEN_32) @[RegFile.scala 16:{26,26}]
    registers_1 <= mux(reset, _registers_WIRE_1, _GEN_33) @[RegFile.scala 16:{26,26}]
    registers_2 <= mux(reset, _registers_WIRE_2, _GEN_34) @[RegFile.scala 16:{26,26}]
    registers_3 <= mux(reset, _registers_WIRE_3, _GEN_35) @[RegFile.scala 16:{26,26}]
    registers_4 <= mux(reset, _registers_WIRE_4, _GEN_36) @[RegFile.scala 16:{26,26}]
    registers_5 <= mux(reset, _registers_WIRE_5, _GEN_37) @[RegFile.scala 16:{26,26}]
    registers_6 <= mux(reset, _registers_WIRE_6, _GEN_38) @[RegFile.scala 16:{26,26}]
    registers_7 <= mux(reset, _registers_WIRE_7, _GEN_39) @[RegFile.scala 16:{26,26}]
    registers_8 <= mux(reset, _registers_WIRE_8, _GEN_40) @[RegFile.scala 16:{26,26}]
    registers_9 <= mux(reset, _registers_WIRE_9, _GEN_41) @[RegFile.scala 16:{26,26}]
    registers_10 <= mux(reset, _registers_WIRE_10, _GEN_42) @[RegFile.scala 16:{26,26}]
    registers_11 <= mux(reset, _registers_WIRE_11, _GEN_43) @[RegFile.scala 16:{26,26}]
    registers_12 <= mux(reset, _registers_WIRE_12, _GEN_44) @[RegFile.scala 16:{26,26}]
    registers_13 <= mux(reset, _registers_WIRE_13, _GEN_45) @[RegFile.scala 16:{26,26}]
    registers_14 <= mux(reset, _registers_WIRE_14, _GEN_46) @[RegFile.scala 16:{26,26}]
    registers_15 <= mux(reset, _registers_WIRE_15, _GEN_47) @[RegFile.scala 16:{26,26}]
    registers_16 <= mux(reset, _registers_WIRE_16, _GEN_48) @[RegFile.scala 16:{26,26}]
    registers_17 <= mux(reset, _registers_WIRE_17, _GEN_49) @[RegFile.scala 16:{26,26}]
    registers_18 <= mux(reset, _registers_WIRE_18, _GEN_50) @[RegFile.scala 16:{26,26}]
    registers_19 <= mux(reset, _registers_WIRE_19, _GEN_51) @[RegFile.scala 16:{26,26}]
    registers_20 <= mux(reset, _registers_WIRE_20, _GEN_52) @[RegFile.scala 16:{26,26}]
    registers_21 <= mux(reset, _registers_WIRE_21, _GEN_53) @[RegFile.scala 16:{26,26}]
    registers_22 <= mux(reset, _registers_WIRE_22, _GEN_54) @[RegFile.scala 16:{26,26}]
    registers_23 <= mux(reset, _registers_WIRE_23, _GEN_55) @[RegFile.scala 16:{26,26}]
    registers_24 <= mux(reset, _registers_WIRE_24, _GEN_56) @[RegFile.scala 16:{26,26}]
    registers_25 <= mux(reset, _registers_WIRE_25, _GEN_57) @[RegFile.scala 16:{26,26}]
    registers_26 <= mux(reset, _registers_WIRE_26, _GEN_58) @[RegFile.scala 16:{26,26}]
    registers_27 <= mux(reset, _registers_WIRE_27, _GEN_59) @[RegFile.scala 16:{26,26}]
    registers_28 <= mux(reset, _registers_WIRE_28, _GEN_60) @[RegFile.scala 16:{26,26}]
    registers_29 <= mux(reset, _registers_WIRE_29, _GEN_61) @[RegFile.scala 16:{26,26}]
    registers_30 <= mux(reset, _registers_WIRE_30, _GEN_62) @[RegFile.scala 16:{26,26}]
    registers_31 <= mux(reset, _registers_WIRE_31, _GEN_63) @[RegFile.scala 16:{26,26}]

  module Reg_E :
    input clock : Clock
    input reset : UInt<1>
    input io_stall : UInt<1>
    input io_jb : UInt<1>
    input io_pc : UInt<32>
    input io_rs1_data : UInt<32>
    input io_rs2_data : UInt<32>
    input io_sext_imme : UInt<32>
    output io_out_Reg_E_pc : UInt<32>
    output io_out_Reg_E_rs1_data : UInt<32>
    output io_out_Reg_E_rs2_data : UInt<32>
    output io_out_Reg_E_sext_imme : UInt<32>

    reg E_PC_REG : UInt<32>, clock with :
      reset => (UInt<1>("h0"), E_PC_REG) @[Reg_E.scala 19:43]
    reg E_RS1_DATA_REG : UInt<32>, clock with :
      reset => (UInt<1>("h0"), E_RS1_DATA_REG) @[Reg_E.scala 20:43]
    reg E_RS2_DATA_REG : UInt<32>, clock with :
      reset => (UInt<1>("h0"), E_RS2_DATA_REG) @[Reg_E.scala 21:43]
    reg E_SEXT_IMME_REG : UInt<32>, clock with :
      reset => (UInt<1>("h0"), E_SEXT_IMME_REG) @[Reg_E.scala 22:43]
    node _T = or(io_jb, io_stall) @[Reg_E.scala 24:14]
    node _GEN_0 = mux(_T, UInt<32>("h0"), io_pc) @[Reg_E.scala 24:26 25:23 30:23]
    node _GEN_1 = mux(_T, UInt<32>("h0"), io_rs1_data) @[Reg_E.scala 24:26 26:23 31:23]
    node _GEN_2 = mux(_T, UInt<32>("h0"), io_rs2_data) @[Reg_E.scala 24:26 27:23 32:23]
    node _GEN_3 = mux(_T, UInt<32>("h0"), io_sext_imme) @[Reg_E.scala 24:26 28:23 33:23]
    io_out_Reg_E_pc <= E_PC_REG @[Reg_E.scala 36:28]
    io_out_Reg_E_rs1_data <= E_RS1_DATA_REG @[Reg_E.scala 37:28]
    io_out_Reg_E_rs2_data <= E_RS2_DATA_REG @[Reg_E.scala 38:28]
    io_out_Reg_E_sext_imme <= E_SEXT_IMME_REG @[Reg_E.scala 39:28]
    E_PC_REG <= mux(reset, UInt<32>("h0"), _GEN_0) @[Reg_E.scala 19:{43,43}]
    E_RS1_DATA_REG <= mux(reset, UInt<32>("h0"), _GEN_1) @[Reg_E.scala 20:{43,43}]
    E_RS2_DATA_REG <= mux(reset, UInt<32>("h0"), _GEN_2) @[Reg_E.scala 21:{43,43}]
    E_SEXT_IMME_REG <= mux(reset, UInt<32>("h0"), _GEN_3) @[Reg_E.scala 22:{43,43}]

  module ALU :
    input clock : Clock
    input reset : UInt<1>
    input io_opcode : UInt<5>
    input io_func3 : UInt<3>
    input io_func7 : UInt<1>
    input io_operand1 : UInt<32>
    input io_operand2 : UInt<32>
    output io_alu_out : UInt<32>

    node func7_and_func3 = cat(io_func7, io_func3) @[Cat.scala 31:58]
    node _T = eq(io_opcode, UInt<5>("hc")) @[ALU.scala 17:20]
    node _T_1 = eq(UInt<4>("h0"), func7_and_func3) @[ALU.scala 18:33]
    node _io_alu_out_T = asSInt(io_operand1) @[ALU.scala 20:44]
    node _io_alu_out_T_1 = asSInt(io_operand2) @[ALU.scala 20:65]
    node _io_alu_out_T_2 = add(_io_alu_out_T, _io_alu_out_T_1) @[ALU.scala 20:51]
    node _io_alu_out_T_3 = tail(_io_alu_out_T_2, 1) @[ALU.scala 20:51]
    node _io_alu_out_T_4 = asSInt(_io_alu_out_T_3) @[ALU.scala 20:51]
    node _io_alu_out_T_5 = asUInt(_io_alu_out_T_4) @[ALU.scala 20:73]
    node _T_2 = eq(UInt<4>("h8"), func7_and_func3) @[ALU.scala 18:33]
    node _io_alu_out_T_6 = asSInt(io_operand1) @[ALU.scala 23:44]
    node _io_alu_out_T_7 = asSInt(io_operand2) @[ALU.scala 23:65]
    node _io_alu_out_T_8 = sub(_io_alu_out_T_6, _io_alu_out_T_7) @[ALU.scala 23:51]
    node _io_alu_out_T_9 = tail(_io_alu_out_T_8, 1) @[ALU.scala 23:51]
    node _io_alu_out_T_10 = asSInt(_io_alu_out_T_9) @[ALU.scala 23:51]
    node _io_alu_out_T_11 = asUInt(_io_alu_out_T_10) @[ALU.scala 23:74]
    node _T_3 = eq(UInt<4>("h1"), func7_and_func3) @[ALU.scala 18:33]
    node _io_alu_out_T_12 = bits(io_operand2, 4, 0) @[ALU.scala 26:58]
    node _io_alu_out_T_13 = dshl(io_operand1, _io_alu_out_T_12) @[ALU.scala 26:44]
    node _T_4 = eq(UInt<4>("h2"), func7_and_func3) @[ALU.scala 18:33]
    node _io_alu_out_T_14 = asSInt(io_operand1) @[ALU.scala 29:44]
    node _io_alu_out_T_15 = asSInt(io_operand2) @[ALU.scala 29:65]
    node _io_alu_out_T_16 = lt(_io_alu_out_T_14, _io_alu_out_T_15) @[ALU.scala 29:51]
    node _T_5 = eq(UInt<4>("h3"), func7_and_func3) @[ALU.scala 18:33]
    node _io_alu_out_T_17 = lt(io_operand1, io_operand2) @[ALU.scala 32:44]
    node _T_6 = eq(UInt<4>("h4"), func7_and_func3) @[ALU.scala 18:33]
    node _io_alu_out_T_18 = xor(io_operand1, io_operand2) @[ALU.scala 35:44]
    node _T_7 = eq(UInt<4>("h5"), func7_and_func3) @[ALU.scala 18:33]
    node _io_alu_out_T_19 = bits(io_operand2, 4, 0) @[ALU.scala 38:58]
    node _io_alu_out_T_20 = dshr(io_operand1, _io_alu_out_T_19) @[ALU.scala 38:44]
    node _T_8 = eq(UInt<4>("hd"), func7_and_func3) @[ALU.scala 18:33]
    node _io_alu_out_T_21 = asSInt(io_operand1) @[ALU.scala 41:44]
    node _io_alu_out_T_22 = bits(io_operand2, 4, 0) @[ALU.scala 41:65]
    node _io_alu_out_T_23 = dshr(_io_alu_out_T_21, _io_alu_out_T_22) @[ALU.scala 41:51]
    node _io_alu_out_T_24 = asUInt(_io_alu_out_T_23) @[ALU.scala 41:73]
    node _T_9 = eq(UInt<4>("h6"), func7_and_func3) @[ALU.scala 18:33]
    node _io_alu_out_T_25 = or(io_operand1, io_operand2) @[ALU.scala 44:44]
    node _T_10 = eq(UInt<4>("h7"), func7_and_func3) @[ALU.scala 18:33]
    node _io_alu_out_T_26 = and(io_operand1, io_operand2) @[ALU.scala 47:44]
    node _GEN_0 = mux(_T_10, _io_alu_out_T_26, UInt<32>("h0")) @[ALU.scala 16:16 18:33 47:28]
    node _GEN_1 = mux(_T_9, _io_alu_out_T_25, _GEN_0) @[ALU.scala 18:33 44:28]
    node _GEN_2 = mux(_T_8, _io_alu_out_T_24, _GEN_1) @[ALU.scala 18:33 41:28]
    node _GEN_3 = mux(_T_7, _io_alu_out_T_20, _GEN_2) @[ALU.scala 18:33 38:28]
    node _GEN_4 = mux(_T_6, _io_alu_out_T_18, _GEN_3) @[ALU.scala 18:33 35:28]
    node _GEN_5 = mux(_T_5, _io_alu_out_T_17, _GEN_4) @[ALU.scala 18:33 32:28]
    node _GEN_6 = mux(_T_4, _io_alu_out_T_16, _GEN_5) @[ALU.scala 18:33 29:28]
    node _GEN_7 = mux(_T_3, _io_alu_out_T_13, _GEN_6) @[ALU.scala 18:33 26:28]
    node _GEN_8 = mux(_T_2, _io_alu_out_T_11, _GEN_7) @[ALU.scala 18:33 23:28]
    node _GEN_9 = mux(_T_1, _io_alu_out_T_5, _GEN_8) @[ALU.scala 18:33 20:28]
    node _T_11 = eq(io_opcode, UInt<5>("h4")) @[ALU.scala 51:27]
    node _T_12 = eq(UInt<1>("h0"), io_func3) @[ALU.scala 52:26]
    node _io_alu_out_T_27 = asSInt(io_operand1) @[ALU.scala 54:44]
    node _io_alu_out_T_28 = asSInt(io_operand2) @[ALU.scala 54:65]
    node _io_alu_out_T_29 = add(_io_alu_out_T_27, _io_alu_out_T_28) @[ALU.scala 54:51]
    node _io_alu_out_T_30 = tail(_io_alu_out_T_29, 1) @[ALU.scala 54:51]
    node _io_alu_out_T_31 = asSInt(_io_alu_out_T_30) @[ALU.scala 54:51]
    node _io_alu_out_T_32 = asUInt(_io_alu_out_T_31) @[ALU.scala 54:73]
    node _T_13 = eq(UInt<2>("h2"), io_func3) @[ALU.scala 52:26]
    node _io_alu_out_T_33 = asSInt(io_operand1) @[ALU.scala 57:44]
    node _io_alu_out_T_34 = asSInt(io_operand2) @[ALU.scala 57:65]
    node _io_alu_out_T_35 = lt(_io_alu_out_T_33, _io_alu_out_T_34) @[ALU.scala 57:51]
    node _T_14 = eq(UInt<2>("h3"), io_func3) @[ALU.scala 52:26]
    node _io_alu_out_T_36 = lt(io_operand1, io_operand2) @[ALU.scala 60:44]
    node _T_15 = eq(UInt<3>("h4"), io_func3) @[ALU.scala 52:26]
    node _io_alu_out_T_37 = xor(io_operand1, io_operand2) @[ALU.scala 63:44]
    node _T_16 = eq(UInt<3>("h6"), io_func3) @[ALU.scala 52:26]
    node _io_alu_out_T_38 = or(io_operand1, io_operand2) @[ALU.scala 66:44]
    node _T_17 = eq(UInt<3>("h7"), io_func3) @[ALU.scala 52:26]
    node _io_alu_out_T_39 = and(io_operand1, io_operand2) @[ALU.scala 69:44]
    node _T_18 = eq(UInt<1>("h1"), io_func3) @[ALU.scala 52:26]
    node _io_alu_out_T_40 = bits(io_operand2, 4, 0) @[ALU.scala 72:58]
    node _io_alu_out_T_41 = dshl(io_operand1, _io_alu_out_T_40) @[ALU.scala 72:44]
    node _T_19 = eq(UInt<3>("h5"), io_func3) @[ALU.scala 52:26]
    node _T_20 = bits(io_func7, 0, 0) @[ALU.scala 75:31]
    node _io_alu_out_T_42 = asSInt(io_operand1) @[ALU.scala 76:48]
    node _io_alu_out_T_43 = bits(io_operand2, 4, 0) @[ALU.scala 76:69]
    node _io_alu_out_T_44 = dshr(_io_alu_out_T_42, _io_alu_out_T_43) @[ALU.scala 76:55]
    node _io_alu_out_T_45 = asUInt(_io_alu_out_T_44) @[ALU.scala 76:77]
    node _io_alu_out_T_46 = bits(io_operand2, 4, 0) @[ALU.scala 78:62]
    node _io_alu_out_T_47 = dshr(io_operand1, _io_alu_out_T_46) @[ALU.scala 78:48]
    node _GEN_10 = mux(_T_20, _io_alu_out_T_45, _io_alu_out_T_47) @[ALU.scala 75:39 76:32 78:32]
    node _GEN_11 = mux(_T_19, _GEN_10, UInt<32>("h0")) @[ALU.scala 16:16 52:26]
    node _GEN_12 = mux(_T_18, _io_alu_out_T_41, _GEN_11) @[ALU.scala 52:26 72:28]
    node _GEN_13 = mux(_T_17, _io_alu_out_T_39, _GEN_12) @[ALU.scala 52:26 69:28]
    node _GEN_14 = mux(_T_16, _io_alu_out_T_38, _GEN_13) @[ALU.scala 52:26 66:28]
    node _GEN_15 = mux(_T_15, _io_alu_out_T_37, _GEN_14) @[ALU.scala 52:26 63:28]
    node _GEN_16 = mux(_T_14, _io_alu_out_T_36, _GEN_15) @[ALU.scala 52:26 60:28]
    node _GEN_17 = mux(_T_13, _io_alu_out_T_35, _GEN_16) @[ALU.scala 52:26 57:28]
    node _GEN_18 = mux(_T_12, _io_alu_out_T_32, _GEN_17) @[ALU.scala 52:26 54:28]
    node _T_21 = eq(io_opcode, UInt<5>("h18")) @[ALU.scala 83:27]
    node _T_22 = eq(UInt<1>("h0"), io_func3) @[ALU.scala 84:26]
    node _io_alu_out_T_48 = eq(io_operand1, io_operand2) @[ALU.scala 86:44]
    node _T_23 = eq(UInt<1>("h1"), io_func3) @[ALU.scala 84:26]
    node _io_alu_out_T_49 = neq(io_operand1, io_operand2) @[ALU.scala 89:44]
    node _T_24 = eq(UInt<3>("h4"), io_func3) @[ALU.scala 84:26]
    node _io_alu_out_T_50 = asSInt(io_operand1) @[ALU.scala 92:44]
    node _io_alu_out_T_51 = asSInt(io_operand2) @[ALU.scala 92:65]
    node _io_alu_out_T_52 = lt(_io_alu_out_T_50, _io_alu_out_T_51) @[ALU.scala 92:51]
    node _T_25 = eq(UInt<3>("h5"), io_func3) @[ALU.scala 84:26]
    node _io_alu_out_T_53 = asSInt(io_operand1) @[ALU.scala 95:44]
    node _io_alu_out_T_54 = asSInt(io_operand2) @[ALU.scala 95:66]
    node _io_alu_out_T_55 = geq(_io_alu_out_T_53, _io_alu_out_T_54) @[ALU.scala 95:51]
    node _T_26 = eq(UInt<3>("h6"), io_func3) @[ALU.scala 84:26]
    node _io_alu_out_T_56 = lt(io_operand1, io_operand2) @[ALU.scala 98:44]
    node _T_27 = eq(UInt<3>("h7"), io_func3) @[ALU.scala 84:26]
    node _io_alu_out_T_57 = geq(io_operand1, io_operand2) @[ALU.scala 101:44]
    node _GEN_19 = mux(_T_27, _io_alu_out_T_57, UInt<32>("h0")) @[ALU.scala 84:26 101:28 16:16]
    node _GEN_20 = mux(_T_26, _io_alu_out_T_56, _GEN_19) @[ALU.scala 84:26 98:28]
    node _GEN_21 = mux(_T_25, _io_alu_out_T_55, _GEN_20) @[ALU.scala 84:26 95:28]
    node _GEN_22 = mux(_T_24, _io_alu_out_T_52, _GEN_21) @[ALU.scala 84:26 92:28]
    node _GEN_23 = mux(_T_23, _io_alu_out_T_49, _GEN_22) @[ALU.scala 84:26 89:28]
    node _GEN_24 = mux(_T_22, _io_alu_out_T_48, _GEN_23) @[ALU.scala 84:26 86:28]
    node _T_28 = eq(io_opcode, UInt<5>("hd")) @[ALU.scala 107:27]
    node _T_29 = eq(io_opcode, UInt<5>("h5")) @[ALU.scala 109:27]
    node _T_30 = eq(io_opcode, UInt<5>("h8")) @[ALU.scala 109:78]
    node _T_31 = or(_T_29, _T_30) @[ALU.scala 109:65]
    node _T_32 = eq(io_opcode, UInt<5>("h0")) @[ALU.scala 109:125]
    node _T_33 = or(_T_31, _T_32) @[ALU.scala 109:112]
    node _io_alu_out_T_58 = add(io_operand1, io_operand2) @[ALU.scala 110:36]
    node _io_alu_out_T_59 = tail(_io_alu_out_T_58, 1) @[ALU.scala 110:36]
    node _T_34 = eq(io_opcode, UInt<5>("h1b")) @[ALU.scala 111:27]
    node _T_35 = eq(io_opcode, UInt<5>("h19")) @[ALU.scala 111:76]
    node _T_36 = or(_T_34, _T_35) @[ALU.scala 111:63]
    node _io_alu_out_T_60 = add(io_operand1, UInt<3>("h4")) @[ALU.scala 112:36]
    node _io_alu_out_T_61 = tail(_io_alu_out_T_60, 1) @[ALU.scala 112:36]
    node _GEN_25 = mux(_T_36, _io_alu_out_T_61, UInt<1>("h0")) @[ALU.scala 111:114 112:20 114:20]
    node _GEN_26 = mux(_T_33, _io_alu_out_T_59, _GEN_25) @[ALU.scala 109:161 110:20]
    node _GEN_27 = mux(_T_28, io_operand2, _GEN_26) @[ALU.scala 107:64 108:20]
    node _GEN_28 = mux(_T_21, _GEN_24, _GEN_27) @[ALU.scala 83:62]
    node _GEN_29 = mux(_T_11, _GEN_18, _GEN_28) @[ALU.scala 51:63]
    node _GEN_30 = mux(_T, _GEN_9, _GEN_29) @[ALU.scala 17:55]
    io_alu_out <= bits(_GEN_30, 31, 0)

  module JB_Unit :
    input clock : Clock
    input reset : UInt<1>
    input io_operand1 : UInt<32>
    input io_operand2 : UInt<32>
    output io_jb_out : UInt<32>

    node _io_jb_out_T = add(io_operand1, io_operand2) @[JB_Unit.scala 12:32]
    node _io_jb_out_T_1 = tail(_io_jb_out_T, 1) @[JB_Unit.scala 12:32]
    node _io_jb_out_T_2 = and(_io_jb_out_T_1, UInt<32>("hffffffff")) @[JB_Unit.scala 12:47]
    io_jb_out <= _io_jb_out_T_2 @[JB_Unit.scala 12:15]

  module Reg_M :
    input clock : Clock
    input reset : UInt<1>
    input io_alu_out : UInt<32>
    input io_rs2_data : UInt<32>
    output io_out_Reg_M_alu_out : UInt<32>
    output io_out_Reg_M_rs2_data : UInt<32>

    reg ALU_OUT_REG : UInt<32>, clock with :
      reset => (UInt<1>("h0"), ALU_OUT_REG) @[Reg_M.scala 13:40]
    reg RS2_DATA_REG : UInt<32>, clock with :
      reset => (UInt<1>("h0"), RS2_DATA_REG) @[Reg_M.scala 14:40]
    io_out_Reg_M_alu_out <= ALU_OUT_REG @[Reg_M.scala 19:31]
    io_out_Reg_M_rs2_data <= RS2_DATA_REG @[Reg_M.scala 20:31]
    ALU_OUT_REG <= mux(reset, UInt<32>("h0"), io_alu_out) @[Reg_M.scala 13:{40,40} 16:19]
    RS2_DATA_REG <= mux(reset, UInt<32>("h0"), io_rs2_data) @[Reg_M.scala 14:{40,40} 17:19]

  module SRAM_dm :
    input clock : Clock
    input reset : UInt<1>
    input io_w_en : UInt<4>
    input io_address : UInt<16>
    input io_write_data : UInt<32>
    output io_read_data : UInt<32>
    input io_mem_read_test : UInt<1>
    input io_mem_addr_test : UInt<32>
    output io_mem_data_test : UInt<32>

    mem mem : @[SRAM_dm.scala 20:16]
      data-type => UInt<8>
      depth => 65536
      read-latency => 0
      write-latency => 1
      reader => read_data_bytes_0_MPORT
      reader => read_data_bytes_1_MPORT
      reader => read_data_bytes_2_MPORT
      reader => read_data_bytes_3_MPORT
      reader => test_data_bytes_0_MPORT
      reader => test_data_bytes_1_MPORT
      reader => test_data_bytes_2_MPORT
      reader => test_data_bytes_3_MPORT
      writer => MPORT
      writer => MPORT_1
      writer => MPORT_2
      writer => MPORT_3
      read-under-write => undefined
    node _T = neq(io_w_en, UInt<1>("h0")) @[SRAM_dm.scala 23:16]
    node _T_1 = bits(io_w_en, 0, 0) @[SRAM_dm.scala 24:17]
    node _T_2 = bits(io_write_data, 7, 0) @[SRAM_dm.scala 24:59]
    node _GEN_0 = validif(_T_1, io_address) @[SRAM_dm.scala 24:22]
    node _GEN_1 = validif(_T_1, clock) @[SRAM_dm.scala 24:22]
    node _GEN_2 = mux(_T_1, UInt<1>("h1"), UInt<1>("h0")) @[SRAM_dm.scala 20:16 24:22]
    node _GEN_3 = validif(_T_1, UInt<1>("h1")) @[SRAM_dm.scala 24:22]
    node _GEN_4 = validif(_T_1, _T_2) @[SRAM_dm.scala 24:22]
    node _T_3 = bits(io_w_en, 1, 1) @[SRAM_dm.scala 25:17]
    node _T_4 = add(io_address, UInt<1>("h1")) @[SRAM_dm.scala 25:45]
    node _T_5 = tail(_T_4, 1) @[SRAM_dm.scala 25:45]
    node _T_6 = bits(io_write_data, 15, 8) @[SRAM_dm.scala 25:65]
    node _GEN_5 = validif(_T_3, _T_5) @[SRAM_dm.scala 25:22]
    node _GEN_6 = validif(_T_3, clock) @[SRAM_dm.scala 25:22]
    node _GEN_7 = mux(_T_3, UInt<1>("h1"), UInt<1>("h0")) @[SRAM_dm.scala 20:16 25:22]
    node _GEN_8 = validif(_T_3, UInt<1>("h1")) @[SRAM_dm.scala 25:22]
    node _GEN_9 = validif(_T_3, _T_6) @[SRAM_dm.scala 25:22]
    node _T_7 = bits(io_w_en, 2, 2) @[SRAM_dm.scala 26:17]
    node _T_8 = add(io_address, UInt<2>("h2")) @[SRAM_dm.scala 26:45]
    node _T_9 = tail(_T_8, 1) @[SRAM_dm.scala 26:45]
    node _T_10 = bits(io_write_data, 23, 16) @[SRAM_dm.scala 26:65]
    node _GEN_10 = validif(_T_7, _T_9) @[SRAM_dm.scala 26:22]
    node _GEN_11 = validif(_T_7, clock) @[SRAM_dm.scala 26:22]
    node _GEN_12 = mux(_T_7, UInt<1>("h1"), UInt<1>("h0")) @[SRAM_dm.scala 20:16 26:22]
    node _GEN_13 = validif(_T_7, UInt<1>("h1")) @[SRAM_dm.scala 26:22]
    node _GEN_14 = validif(_T_7, _T_10) @[SRAM_dm.scala 26:22]
    node _T_11 = bits(io_w_en, 3, 3) @[SRAM_dm.scala 27:17]
    node _T_12 = add(io_address, UInt<2>("h3")) @[SRAM_dm.scala 27:45]
    node _T_13 = tail(_T_12, 1) @[SRAM_dm.scala 27:45]
    node _T_14 = bits(io_write_data, 31, 24) @[SRAM_dm.scala 27:65]
    node _GEN_15 = validif(_T_11, _T_13) @[SRAM_dm.scala 27:22]
    node _GEN_16 = validif(_T_11, clock) @[SRAM_dm.scala 27:22]
    node _GEN_17 = mux(_T_11, UInt<1>("h1"), UInt<1>("h0")) @[SRAM_dm.scala 20:16 27:22]
    node _GEN_18 = validif(_T_11, UInt<1>("h1")) @[SRAM_dm.scala 27:22]
    node _GEN_19 = validif(_T_11, _T_14) @[SRAM_dm.scala 27:22]
    node _GEN_20 = validif(_T, _GEN_0) @[SRAM_dm.scala 23:25]
    node _GEN_21 = validif(_T, _GEN_1) @[SRAM_dm.scala 23:25]
    node _GEN_22 = mux(_T, _GEN_2, UInt<1>("h0")) @[SRAM_dm.scala 20:16 23:25]
    node _GEN_23 = validif(_T, _GEN_3) @[SRAM_dm.scala 23:25]
    node _GEN_24 = validif(_T, _GEN_4) @[SRAM_dm.scala 23:25]
    node _GEN_25 = validif(_T, _GEN_5) @[SRAM_dm.scala 23:25]
    node _GEN_26 = validif(_T, _GEN_6) @[SRAM_dm.scala 23:25]
    node _GEN_27 = mux(_T, _GEN_7, UInt<1>("h0")) @[SRAM_dm.scala 20:16 23:25]
    node _GEN_28 = validif(_T, _GEN_8) @[SRAM_dm.scala 23:25]
    node _GEN_29 = validif(_T, _GEN_9) @[SRAM_dm.scala 23:25]
    node _GEN_30 = validif(_T, _GEN_10) @[SRAM_dm.scala 23:25]
    node _GEN_31 = validif(_T, _GEN_11) @[SRAM_dm.scala 23:25]
    node _GEN_32 = mux(_T, _GEN_12, UInt<1>("h0")) @[SRAM_dm.scala 20:16 23:25]
    node _GEN_33 = validif(_T, _GEN_13) @[SRAM_dm.scala 23:25]
    node _GEN_34 = validif(_T, _GEN_14) @[SRAM_dm.scala 23:25]
    node _GEN_35 = validif(_T, _GEN_15) @[SRAM_dm.scala 23:25]
    node _GEN_36 = validif(_T, _GEN_16) @[SRAM_dm.scala 23:25]
    node _GEN_37 = mux(_T, _GEN_17, UInt<1>("h0")) @[SRAM_dm.scala 20:16 23:25]
    node _GEN_38 = validif(_T, _GEN_18) @[SRAM_dm.scala 23:25]
    node _GEN_39 = validif(_T, _GEN_19) @[SRAM_dm.scala 23:25]
    node _read_data_bytes_1_T = add(io_address, UInt<1>("h1")) @[SRAM_dm.scala 33:45]
    node _read_data_bytes_1_T_1 = tail(_read_data_bytes_1_T, 1) @[SRAM_dm.scala 33:45]
    node _read_data_bytes_2_T = add(io_address, UInt<2>("h2")) @[SRAM_dm.scala 34:45]
    node _read_data_bytes_2_T_1 = tail(_read_data_bytes_2_T, 1) @[SRAM_dm.scala 34:45]
    node _read_data_bytes_3_T = add(io_address, UInt<2>("h3")) @[SRAM_dm.scala 35:45]
    node _read_data_bytes_3_T_1 = tail(_read_data_bytes_3_T, 1) @[SRAM_dm.scala 35:45]
    node read_data_bytes_1 = mem.read_data_bytes_1_MPORT.data @[SRAM_dm.scala 31:32 33:22]
    node read_data_bytes_0 = mem.read_data_bytes_0_MPORT.data @[SRAM_dm.scala 31:32 32:22]
    node io_read_data_lo = cat(read_data_bytes_1, read_data_bytes_0) @[Cat.scala 31:58]
    node read_data_bytes_3 = mem.read_data_bytes_3_MPORT.data @[SRAM_dm.scala 31:32 35:22]
    node read_data_bytes_2 = mem.read_data_bytes_2_MPORT.data @[SRAM_dm.scala 31:32 34:22]
    node io_read_data_hi = cat(read_data_bytes_3, read_data_bytes_2) @[Cat.scala 31:58]
    node _io_read_data_T = cat(io_read_data_hi, io_read_data_lo) @[Cat.scala 31:58]
    node _test_data_bytes_0_T = bits(io_mem_addr_test, 15, 0) @[SRAM_dm.scala 41:33]
    node _test_data_bytes_1_T = add(io_mem_addr_test, UInt<1>("h1")) @[SRAM_dm.scala 42:51]
    node _test_data_bytes_1_T_1 = tail(_test_data_bytes_1_T, 1) @[SRAM_dm.scala 42:51]
    node _test_data_bytes_1_T_2 = bits(_test_data_bytes_1_T_1, 15, 0) @[SRAM_dm.scala 42:33]
    node _test_data_bytes_2_T = add(io_mem_addr_test, UInt<2>("h2")) @[SRAM_dm.scala 43:51]
    node _test_data_bytes_2_T_1 = tail(_test_data_bytes_2_T, 1) @[SRAM_dm.scala 43:51]
    node _test_data_bytes_2_T_2 = bits(_test_data_bytes_2_T_1, 15, 0) @[SRAM_dm.scala 43:33]
    node _test_data_bytes_3_T = add(io_mem_addr_test, UInt<2>("h3")) @[SRAM_dm.scala 44:51]
    node _test_data_bytes_3_T_1 = tail(_test_data_bytes_3_T, 1) @[SRAM_dm.scala 44:51]
    node _test_data_bytes_3_T_2 = bits(_test_data_bytes_3_T_1, 15, 0) @[SRAM_dm.scala 44:33]
    node test_data_bytes_1 = mem.test_data_bytes_1_MPORT.data @[SRAM_dm.scala 40:32 42:22]
    node test_data_bytes_0 = mem.test_data_bytes_0_MPORT.data @[SRAM_dm.scala 40:32 41:22]
    node io_mem_data_test_lo = cat(test_data_bytes_1, test_data_bytes_0) @[Cat.scala 31:58]
    node test_data_bytes_3 = mem.test_data_bytes_3_MPORT.data @[SRAM_dm.scala 40:32 44:22]
    node test_data_bytes_2 = mem.test_data_bytes_2_MPORT.data @[SRAM_dm.scala 40:32 43:22]
    node io_mem_data_test_hi = cat(test_data_bytes_3, test_data_bytes_2) @[Cat.scala 31:58]
    node _io_mem_data_test_T = cat(io_mem_data_test_hi, io_mem_data_test_lo) @[Cat.scala 31:58]
    node _GEN_40 = mux(io_mem_read_test, _io_mem_data_test_T, UInt<1>("h0")) @[SRAM_dm.scala 46:20 47:25 48:22]
    io_read_data <= _io_read_data_T @[SRAM_dm.scala 37:16]
    io_mem_data_test <= _GEN_40
    mem.read_data_bytes_0_MPORT.addr <= io_address @[SRAM_dm.scala 32:33]
    mem.read_data_bytes_0_MPORT.en <= UInt<1>("h1") @[SRAM_dm.scala 32:33]
    mem.read_data_bytes_0_MPORT.clk <= clock @[SRAM_dm.scala 32:33]
    mem.read_data_bytes_1_MPORT.addr <= _read_data_bytes_1_T_1 @[SRAM_dm.scala 33:33]
    mem.read_data_bytes_1_MPORT.en <= UInt<1>("h1") @[SRAM_dm.scala 33:33]
    mem.read_data_bytes_1_MPORT.clk <= clock @[SRAM_dm.scala 33:33]
    mem.read_data_bytes_2_MPORT.addr <= _read_data_bytes_2_T_1 @[SRAM_dm.scala 34:33]
    mem.read_data_bytes_2_MPORT.en <= UInt<1>("h1") @[SRAM_dm.scala 34:33]
    mem.read_data_bytes_2_MPORT.clk <= clock @[SRAM_dm.scala 34:33]
    mem.read_data_bytes_3_MPORT.addr <= _read_data_bytes_3_T_1 @[SRAM_dm.scala 35:33]
    mem.read_data_bytes_3_MPORT.en <= UInt<1>("h1") @[SRAM_dm.scala 35:33]
    mem.read_data_bytes_3_MPORT.clk <= clock @[SRAM_dm.scala 35:33]
    mem.test_data_bytes_0_MPORT.addr <= _test_data_bytes_0_T @[SRAM_dm.scala 41:33]
    mem.test_data_bytes_0_MPORT.en <= UInt<1>("h1") @[SRAM_dm.scala 41:33]
    mem.test_data_bytes_0_MPORT.clk <= clock @[SRAM_dm.scala 41:33]
    mem.test_data_bytes_1_MPORT.addr <= _test_data_bytes_1_T_2 @[SRAM_dm.scala 42:33]
    mem.test_data_bytes_1_MPORT.en <= UInt<1>("h1") @[SRAM_dm.scala 42:33]
    mem.test_data_bytes_1_MPORT.clk <= clock @[SRAM_dm.scala 42:33]
    mem.test_data_bytes_2_MPORT.addr <= _test_data_bytes_2_T_2 @[SRAM_dm.scala 43:33]
    mem.test_data_bytes_2_MPORT.en <= UInt<1>("h1") @[SRAM_dm.scala 43:33]
    mem.test_data_bytes_2_MPORT.clk <= clock @[SRAM_dm.scala 43:33]
    mem.test_data_bytes_3_MPORT.addr <= _test_data_bytes_3_T_2 @[SRAM_dm.scala 44:33]
    mem.test_data_bytes_3_MPORT.en <= UInt<1>("h1") @[SRAM_dm.scala 44:33]
    mem.test_data_bytes_3_MPORT.clk <= clock @[SRAM_dm.scala 44:33]
    mem.MPORT.addr <= _GEN_20
    mem.MPORT.en <= _GEN_22
    mem.MPORT.clk <= _GEN_21
    mem.MPORT.data <= _GEN_24
    mem.MPORT.mask <= _GEN_23
    mem.MPORT_1.addr <= _GEN_25
    mem.MPORT_1.en <= _GEN_27
    mem.MPORT_1.clk <= _GEN_26
    mem.MPORT_1.data <= _GEN_29
    mem.MPORT_1.mask <= _GEN_28
    mem.MPORT_2.addr <= _GEN_30
    mem.MPORT_2.en <= _GEN_32
    mem.MPORT_2.clk <= _GEN_31
    mem.MPORT_2.data <= _GEN_34
    mem.MPORT_2.mask <= _GEN_33
    mem.MPORT_3.addr <= _GEN_35
    mem.MPORT_3.en <= _GEN_37
    mem.MPORT_3.clk <= _GEN_36
    mem.MPORT_3.data <= _GEN_39
    mem.MPORT_3.mask <= _GEN_38

  module LD_Filter :
    input clock : Clock
    input reset : UInt<1>
    input io_func3 : UInt<3>
    input io_ld_data : UInt<32>
    output io_ld_data_f : UInt<32>

    node _T = eq(UInt<3>("h0"), io_func3) @[LD_Filter.scala 14:21]
    node _io_ld_data_f_T = bits(io_ld_data, 7, 7) @[LD_Filter.scala 16:55]
    node _io_ld_data_f_T_1 = bits(_io_ld_data_f_T, 0, 0) @[Bitwise.scala 74:15]
    node _io_ld_data_f_T_2 = mux(_io_ld_data_f_T_1, UInt<24>("hffffff"), UInt<24>("h0")) @[Bitwise.scala 74:12]
    node _io_ld_data_f_T_3 = bits(io_ld_data, 7, 0) @[LD_Filter.scala 16:71]
    node _io_ld_data_f_T_4 = cat(_io_ld_data_f_T_2, _io_ld_data_f_T_3) @[Cat.scala 31:58]
    node _T_1 = eq(UInt<3>("h1"), io_func3) @[LD_Filter.scala 14:21]
    node _io_ld_data_f_T_5 = bits(io_ld_data, 15, 15) @[LD_Filter.scala 19:55]
    node _io_ld_data_f_T_6 = bits(_io_ld_data_f_T_5, 0, 0) @[Bitwise.scala 74:15]
    node _io_ld_data_f_T_7 = mux(_io_ld_data_f_T_6, UInt<16>("hffff"), UInt<16>("h0")) @[Bitwise.scala 74:12]
    node _io_ld_data_f_T_8 = bits(io_ld_data, 15, 0) @[LD_Filter.scala 19:72]
    node _io_ld_data_f_T_9 = cat(_io_ld_data_f_T_7, _io_ld_data_f_T_8) @[Cat.scala 31:58]
    node _T_2 = eq(UInt<3>("h2"), io_func3) @[LD_Filter.scala 14:21]
    node _T_3 = eq(UInt<3>("h4"), io_func3) @[LD_Filter.scala 14:21]
    node _io_ld_data_f_T_10 = bits(io_ld_data, 7, 0) @[LD_Filter.scala 25:57]
    node _io_ld_data_f_T_11 = cat(UInt<24>("h0"), _io_ld_data_f_T_10) @[Cat.scala 31:58]
    node _T_4 = eq(UInt<3>("h5"), io_func3) @[LD_Filter.scala 14:21]
    node _io_ld_data_f_T_12 = bits(io_ld_data, 15, 0) @[LD_Filter.scala 28:57]
    node _io_ld_data_f_T_13 = cat(UInt<16>("h0"), _io_ld_data_f_T_12) @[Cat.scala 31:58]
    node _GEN_0 = mux(_T_4, _io_ld_data_f_T_13, UInt<32>("h0")) @[LD_Filter.scala 14:21 13:25 28:29]
    node _GEN_1 = mux(_T_3, _io_ld_data_f_T_11, _GEN_0) @[LD_Filter.scala 14:21 25:29]
    node _GEN_2 = mux(_T_2, io_ld_data, _GEN_1) @[LD_Filter.scala 14:21 22:29]
    node _GEN_3 = mux(_T_1, _io_ld_data_f_T_9, _GEN_2) @[LD_Filter.scala 14:21 19:29]
    node _GEN_4 = mux(_T, _io_ld_data_f_T_4, _GEN_3) @[LD_Filter.scala 14:21 16:29]
    io_ld_data_f <= _GEN_4

  module Controller :
    input clock : Clock
    input reset : UInt<1>
    input io_op : UInt<5>
    input io_f3 : UInt<3>
    input io_rd : UInt<5>
    input io_rs1 : UInt<5>
    input io_rs2 : UInt<5>
    input io_f7 : UInt<1>
    input io_alu_out : UInt<1>
    output io_stall : UInt<1>
    output io_next_pc_sel : UInt<1>
    output io_F_im_w_en : UInt<4>
    output io_D_rs1_data_sel : UInt<1>
    output io_D_rs2_data_sel : UInt<1>
    output io_E_rs1_data_sel : UInt<2>
    output io_E_rs2_data_sel : UInt<2>
    output io_E_jb_op1_sel : UInt<1>
    output io_E_alu_op1_sel : UInt<1>
    output io_E_alu_op2_sel : UInt<1>
    output io_E_op : UInt<5>
    output io_E_f3 : UInt<3>
    output io_E_f7 : UInt<1>
    output io_M_dm_w_en : UInt<4>
    output io_W_wb_en : UInt<1>
    output io_W_rd_index : UInt<5>
    output io_W_f3 : UInt<3>
    output io_W_wb_data_sel : UInt<1>

    reg IN_E_OP_REG : UInt<5>, clock with :
      reset => (UInt<1>("h0"), IN_E_OP_REG) @[Controller.scala 47:38]
    reg IN_E_F3_REG : UInt<3>, clock with :
      reset => (UInt<1>("h0"), IN_E_F3_REG) @[Controller.scala 48:38]
    reg IN_E_RD_REG : UInt<5>, clock with :
      reset => (UInt<1>("h0"), IN_E_RD_REG) @[Controller.scala 49:38]
    reg IN_E_RS1_REG : UInt<5>, clock with :
      reset => (UInt<1>("h0"), IN_E_RS1_REG) @[Controller.scala 50:38]
    reg IN_E_RS2_REG : UInt<5>, clock with :
      reset => (UInt<1>("h0"), IN_E_RS2_REG) @[Controller.scala 51:38]
    reg IN_E_F7_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), IN_E_F7_REG) @[Controller.scala 52:38]
    reg IN_M_OP_REG : UInt<5>, clock with :
      reset => (UInt<1>("h0"), IN_M_OP_REG) @[Controller.scala 54:38]
    reg IN_M_F3_REG : UInt<3>, clock with :
      reset => (UInt<1>("h0"), IN_M_F3_REG) @[Controller.scala 55:38]
    reg IN_M_RD_REG : UInt<5>, clock with :
      reset => (UInt<1>("h0"), IN_M_RD_REG) @[Controller.scala 56:38]
    reg IN_W_OP_REG : UInt<5>, clock with :
      reset => (UInt<1>("h0"), IN_W_OP_REG) @[Controller.scala 58:38]
    reg IN_W_F3_REG : UInt<3>, clock with :
      reset => (UInt<1>("h0"), IN_W_F3_REG) @[Controller.scala 59:38]
    reg IN_W_RD_REG : UInt<5>, clock with :
      reset => (UInt<1>("h0"), IN_W_RD_REG) @[Controller.scala 60:38]
    node _T = or(io_stall, io_next_pc_sel) @[Controller.scala 62:19]
    node _GEN_0 = mux(_T, UInt<5>("hc"), io_op) @[Controller.scala 62:37 64:25 82:25]
    node _GEN_1 = mux(_T, UInt<3>("h0"), io_f3) @[Controller.scala 62:37 65:25 83:25]
    node _GEN_2 = mux(_T, UInt<5>("h0"), io_rd) @[Controller.scala 62:37 66:25 84:25]
    node _GEN_3 = mux(_T, UInt<5>("h0"), io_rs1) @[Controller.scala 62:37 67:25 85:25]
    node _GEN_4 = mux(_T, UInt<5>("h0"), io_rs2) @[Controller.scala 62:37 68:25 86:25]
    node _GEN_5 = mux(_T, UInt<1>("h0"), io_f7) @[Controller.scala 62:37 69:25 87:25]
    node _GEN_6 = mux(_T, IN_E_OP_REG, IN_E_OP_REG) @[Controller.scala 62:37 72:25 90:25]
    node _GEN_7 = mux(_T, IN_E_F3_REG, IN_E_F3_REG) @[Controller.scala 62:37 73:25 91:25]
    node _GEN_8 = mux(_T, IN_E_RD_REG, IN_E_RD_REG) @[Controller.scala 62:37 74:25 92:25]
    node _GEN_9 = mux(_T, IN_M_OP_REG, IN_M_OP_REG) @[Controller.scala 62:37 77:25 95:25]
    node _GEN_10 = mux(_T, IN_M_F3_REG, IN_M_F3_REG) @[Controller.scala 62:37 78:25 96:25]
    node _GEN_11 = mux(_T, IN_M_RD_REG, IN_M_RD_REG) @[Controller.scala 62:37 79:25 97:25]
    node _T_1 = eq(io_op, UInt<5>("hd")) @[Controller.scala 122:15]
    node _T_2 = eq(io_op, UInt<5>("h5")) @[Controller.scala 123:15]
    node _T_3 = or(_T_1, _T_2) @[Controller.scala 122:51]
    node _T_4 = eq(io_op, UInt<5>("h1b")) @[Controller.scala 124:15]
    node _T_5 = or(_T_3, _T_4) @[Controller.scala 123:53]
    node _GEN_12 = mux(_T_5, UInt<1>("h0"), UInt<1>("h1")) @[Controller.scala 125:6 126:22 128:22]
    node _T_6 = eq(io_op, UInt<5>("hc")) @[Controller.scala 133:15]
    node _T_7 = eq(io_op, UInt<5>("h8")) @[Controller.scala 134:15]
    node _T_8 = or(_T_6, _T_7) @[Controller.scala 133:49]
    node _T_9 = eq(io_op, UInt<5>("h18")) @[Controller.scala 135:15]
    node _T_10 = or(_T_8, _T_9) @[Controller.scala 134:49]
    node _GEN_13 = mux(_T_10, UInt<1>("h1"), UInt<1>("h0")) @[Controller.scala 136:6 137:22 139:22]
    node _T_11 = eq(IN_E_OP_REG, UInt<5>("hd")) @[Controller.scala 144:21]
    node _T_12 = eq(IN_E_OP_REG, UInt<5>("h5")) @[Controller.scala 145:21]
    node _T_13 = or(_T_11, _T_12) @[Controller.scala 144:57]
    node _T_14 = eq(IN_E_OP_REG, UInt<5>("h1b")) @[Controller.scala 146:21]
    node _T_15 = or(_T_13, _T_14) @[Controller.scala 145:59]
    node _GEN_14 = mux(_T_15, UInt<1>("h0"), UInt<1>("h1")) @[Controller.scala 147:6 148:22 150:22]
    node _T_16 = eq(IN_E_OP_REG, UInt<5>("hc")) @[Controller.scala 155:21]
    node _T_17 = eq(IN_E_OP_REG, UInt<5>("h8")) @[Controller.scala 156:21]
    node _T_18 = or(_T_16, _T_17) @[Controller.scala 155:55]
    node _T_19 = eq(IN_E_OP_REG, UInt<5>("h18")) @[Controller.scala 157:21]
    node _T_20 = or(_T_18, _T_19) @[Controller.scala 156:55]
    node _GEN_15 = mux(_T_20, UInt<1>("h1"), UInt<1>("h0")) @[Controller.scala 158:6 159:22 161:22]
    node _T_21 = eq(IN_M_OP_REG, UInt<5>("h18")) @[Controller.scala 166:21]
    node _T_22 = eq(IN_M_OP_REG, UInt<5>("h8")) @[Controller.scala 167:21]
    node _T_23 = or(_T_21, _T_22) @[Controller.scala 166:55]
    node _GEN_16 = mux(_T_23, UInt<1>("h0"), UInt<1>("h1")) @[Controller.scala 168:7 169:21 171:21]
    node _T_24 = eq(IN_W_OP_REG, UInt<5>("h18")) @[Controller.scala 176:21]
    node _T_25 = eq(IN_W_OP_REG, UInt<5>("h8")) @[Controller.scala 177:21]
    node _T_26 = or(_T_24, _T_25) @[Controller.scala 176:55]
    node _GEN_17 = mux(_T_26, UInt<1>("h0"), UInt<1>("h1")) @[Controller.scala 178:7 179:21 181:21]
    node is_D_use_rs1 = _GEN_12 @[Controller.scala 102:28]
    node is_W_use_rd = _GEN_17 @[Controller.scala 104:27]
    node _is_D_rs1_W_rd_overlap_T = and(is_D_use_rs1, is_W_use_rd) @[Controller.scala 185:43]
    node _is_D_rs1_W_rd_overlap_T_1 = eq(io_rs1, IN_W_RD_REG) @[Controller.scala 185:69]
    node _is_D_rs1_W_rd_overlap_T_2 = and(_is_D_rs1_W_rd_overlap_T, _is_D_rs1_W_rd_overlap_T_1) @[Controller.scala 185:58]
    node _is_D_rs1_W_rd_overlap_T_3 = neq(IN_W_RD_REG, UInt<1>("h0")) @[Controller.scala 185:102]
    node _is_D_rs1_W_rd_overlap_T_4 = and(_is_D_rs1_W_rd_overlap_T_2, _is_D_rs1_W_rd_overlap_T_3) @[Controller.scala 185:86]
    node is_D_use_rs2 = _GEN_13 @[Controller.scala 103:28]
    node _is_D_rs2_W_rd_overlap_T = and(is_D_use_rs2, is_W_use_rd) @[Controller.scala 186:43]
    node _is_D_rs2_W_rd_overlap_T_1 = eq(io_rs2, IN_W_RD_REG) @[Controller.scala 186:69]
    node _is_D_rs2_W_rd_overlap_T_2 = and(_is_D_rs2_W_rd_overlap_T, _is_D_rs2_W_rd_overlap_T_1) @[Controller.scala 186:58]
    node _is_D_rs2_W_rd_overlap_T_3 = neq(IN_W_RD_REG, UInt<1>("h0")) @[Controller.scala 186:102]
    node _is_D_rs2_W_rd_overlap_T_4 = and(_is_D_rs2_W_rd_overlap_T_2, _is_D_rs2_W_rd_overlap_T_3) @[Controller.scala 186:86]
    node is_D_rs1_W_rd_overlap = _is_D_rs1_W_rd_overlap_T_4 @[Controller.scala 105:37 185:27]
    node _io_D_rs1_data_sel_T = mux(is_D_rs1_W_rd_overlap, UInt<1>("h1"), UInt<1>("h0")) @[Controller.scala 187:29]
    node is_D_rs2_W_rd_overlap = _is_D_rs2_W_rd_overlap_T_4 @[Controller.scala 106:37 186:27]
    node _io_D_rs2_data_sel_T = mux(is_D_rs2_W_rd_overlap, UInt<1>("h1"), UInt<1>("h0")) @[Controller.scala 188:29]
    node is_E_use_rs1 = _GEN_14 @[Controller.scala 108:28]
    node _is_E_rs1_W_rd_overlap_T = and(is_E_use_rs1, is_W_use_rd) @[Controller.scala 191:43]
    node _is_E_rs1_W_rd_overlap_T_1 = eq(IN_E_RS1_REG, IN_W_RD_REG) @[Controller.scala 191:75]
    node _is_E_rs1_W_rd_overlap_T_2 = and(_is_E_rs1_W_rd_overlap_T, _is_E_rs1_W_rd_overlap_T_1) @[Controller.scala 191:58]
    node _is_E_rs1_W_rd_overlap_T_3 = neq(IN_W_RD_REG, UInt<1>("h0")) @[Controller.scala 191:108]
    node _is_E_rs1_W_rd_overlap_T_4 = and(_is_E_rs1_W_rd_overlap_T_2, _is_E_rs1_W_rd_overlap_T_3) @[Controller.scala 191:92]
    node is_M_use_rd = _GEN_16 @[Controller.scala 110:27]
    node _is_E_rs1_M_rd_overlap_T = and(is_E_use_rs1, is_M_use_rd) @[Controller.scala 192:43]
    node _is_E_rs1_M_rd_overlap_T_1 = eq(IN_E_RS1_REG, IN_M_RD_REG) @[Controller.scala 192:75]
    node _is_E_rs1_M_rd_overlap_T_2 = and(_is_E_rs1_M_rd_overlap_T, _is_E_rs1_M_rd_overlap_T_1) @[Controller.scala 192:58]
    node _is_E_rs1_M_rd_overlap_T_3 = neq(IN_M_RD_REG, UInt<1>("h0")) @[Controller.scala 192:108]
    node _is_E_rs1_M_rd_overlap_T_4 = and(_is_E_rs1_M_rd_overlap_T_2, _is_E_rs1_M_rd_overlap_T_3) @[Controller.scala 192:92]
    node is_E_rs1_W_rd_overlap = _is_E_rs1_W_rd_overlap_T_4 @[Controller.scala 111:37 191:27]
    node _io_E_rs1_data_sel_T = mux(is_E_rs1_W_rd_overlap, UInt<2>("h0"), UInt<2>("h2")) @[Controller.scala 193:67]
    node is_E_rs1_M_rd_overlap = _is_E_rs1_M_rd_overlap_T_4 @[Controller.scala 112:37 192:27]
    node _io_E_rs1_data_sel_T_1 = mux(is_E_rs1_M_rd_overlap, UInt<2>("h1"), _io_E_rs1_data_sel_T) @[Controller.scala 193:30]
    node is_E_use_rs2 = _GEN_15 @[Controller.scala 109:28]
    node _is_E_rs2_W_rd_overlap_T = and(is_E_use_rs2, is_W_use_rd) @[Controller.scala 194:43]
    node _is_E_rs2_W_rd_overlap_T_1 = eq(IN_E_RS2_REG, IN_W_RD_REG) @[Controller.scala 194:75]
    node _is_E_rs2_W_rd_overlap_T_2 = and(_is_E_rs2_W_rd_overlap_T, _is_E_rs2_W_rd_overlap_T_1) @[Controller.scala 194:58]
    node _is_E_rs2_W_rd_overlap_T_3 = neq(IN_W_RD_REG, UInt<1>("h0")) @[Controller.scala 194:108]
    node _is_E_rs2_W_rd_overlap_T_4 = and(_is_E_rs2_W_rd_overlap_T_2, _is_E_rs2_W_rd_overlap_T_3) @[Controller.scala 194:92]
    node _is_E_rs2_M_rd_overlap_T = and(is_E_use_rs2, is_M_use_rd) @[Controller.scala 195:43]
    node _is_E_rs2_M_rd_overlap_T_1 = eq(IN_E_RS2_REG, IN_M_RD_REG) @[Controller.scala 195:75]
    node _is_E_rs2_M_rd_overlap_T_2 = and(_is_E_rs2_M_rd_overlap_T, _is_E_rs2_M_rd_overlap_T_1) @[Controller.scala 195:58]
    node _is_E_rs2_M_rd_overlap_T_3 = neq(IN_M_RD_REG, UInt<1>("h0")) @[Controller.scala 195:108]
    node _is_E_rs2_M_rd_overlap_T_4 = and(_is_E_rs2_M_rd_overlap_T_2, _is_E_rs2_M_rd_overlap_T_3) @[Controller.scala 195:92]
    node is_E_rs2_W_rd_overlap = _is_E_rs2_W_rd_overlap_T_4 @[Controller.scala 113:37 194:27]
    node _io_E_rs2_data_sel_T = mux(is_E_rs2_W_rd_overlap, UInt<2>("h0"), UInt<2>("h2")) @[Controller.scala 196:67]
    node is_E_rs2_M_rd_overlap = _is_E_rs2_M_rd_overlap_T_4 @[Controller.scala 114:37 195:27]
    node _io_E_rs2_data_sel_T_1 = mux(is_E_rs2_M_rd_overlap, UInt<2>("h1"), _io_E_rs2_data_sel_T) @[Controller.scala 196:30]
    node _is_D_rs1_E_rd_overlap_T = eq(io_rs1, IN_E_RD_REG) @[Controller.scala 199:54]
    node _is_D_rs1_E_rd_overlap_T_1 = and(is_D_use_rs1, _is_D_rs1_E_rd_overlap_T) @[Controller.scala 199:43]
    node _is_D_rs1_E_rd_overlap_T_2 = neq(IN_E_RD_REG, UInt<1>("h0")) @[Controller.scala 199:87]
    node _is_D_rs1_E_rd_overlap_T_3 = and(_is_D_rs1_E_rd_overlap_T_1, _is_D_rs1_E_rd_overlap_T_2) @[Controller.scala 199:71]
    node _is_D_rs2_E_rd_overlap_T = eq(io_rs2, IN_E_RD_REG) @[Controller.scala 200:54]
    node _is_D_rs2_E_rd_overlap_T_1 = and(is_D_use_rs2, _is_D_rs2_E_rd_overlap_T) @[Controller.scala 200:43]
    node _is_D_rs2_E_rd_overlap_T_2 = neq(IN_E_RD_REG, UInt<1>("h0")) @[Controller.scala 200:87]
    node _is_D_rs2_E_rd_overlap_T_3 = and(_is_D_rs2_E_rd_overlap_T_1, _is_D_rs2_E_rd_overlap_T_2) @[Controller.scala 200:71]
    node is_D_rs1_E_rd_overlap = _is_D_rs1_E_rd_overlap_T_3 @[Controller.scala 117:37 199:27]
    node is_D_rs2_E_rd_overlap = _is_D_rs2_E_rd_overlap_T_3 @[Controller.scala 118:37 200:27]
    node _is_DE_overlap_T = or(is_D_rs1_E_rd_overlap, is_D_rs2_E_rd_overlap) @[Controller.scala 201:45]
    node _io_stall_T = eq(IN_E_OP_REG, UInt<5>("h0")) @[Controller.scala 202:30]
    node is_DE_overlap = _is_DE_overlap_T @[Controller.scala 116:29 201:19]
    node _io_stall_T_1 = and(_io_stall_T, is_DE_overlap) @[Controller.scala 202:66]
    node _T_27 = eq(UInt<5>("h1b"), IN_E_OP_REG) @[Controller.scala 218:24]
    node _T_28 = eq(UInt<5>("h19"), IN_E_OP_REG) @[Controller.scala 218:24]
    node _T_29 = eq(UInt<5>("h18"), IN_E_OP_REG) @[Controller.scala 218:24]
    node _T_30 = eq(UInt<5>("hc"), IN_E_OP_REG) @[Controller.scala 218:24]
    node _T_31 = eq(UInt<5>("h4"), IN_E_OP_REG) @[Controller.scala 218:24]
    node _T_32 = eq(UInt<5>("h0"), IN_E_OP_REG) @[Controller.scala 218:24]
    node _T_33 = eq(UInt<5>("h8"), IN_E_OP_REG) @[Controller.scala 218:24]
    node _T_34 = eq(UInt<5>("h5"), IN_E_OP_REG) @[Controller.scala 218:24]
    node _T_35 = eq(UInt<5>("hd"), IN_E_OP_REG) @[Controller.scala 218:24]
    node _GEN_18 = mux(_T_35, UInt<1>("h0"), UInt<1>("h0")) @[Controller.scala 218:24 213:25 268:33]
    node _GEN_19 = mux(_T_34, UInt<1>("h0"), _GEN_18) @[Controller.scala 218:24 262:33]
    node _GEN_20 = mux(_T_33, UInt<1>("h0"), _GEN_19) @[Controller.scala 218:24 256:33]
    node _GEN_21 = mux(_T_33, UInt<1>("h1"), _GEN_19) @[Controller.scala 218:24 258:33]
    node _GEN_22 = mux(_T_32, UInt<1>("h0"), _GEN_20) @[Controller.scala 218:24 250:33]
    node _GEN_23 = mux(_T_32, UInt<1>("h1"), _GEN_21) @[Controller.scala 218:24 252:33]
    node _GEN_24 = mux(_T_31, UInt<1>("h0"), _GEN_22) @[Controller.scala 218:24 244:33]
    node _GEN_25 = mux(_T_31, UInt<1>("h1"), _GEN_23) @[Controller.scala 218:24 246:33]
    node _GEN_26 = mux(_T_30, UInt<1>("h0"), _GEN_24) @[Controller.scala 218:24 238:33]
    node _GEN_27 = mux(_T_30, UInt<1>("h1"), _GEN_25) @[Controller.scala 218:24 240:33]
    node _GEN_28 = mux(_T_30, UInt<1>("h1"), _GEN_24) @[Controller.scala 218:24 241:33]
    node _GEN_29 = mux(_T_29, io_alu_out, _GEN_26) @[Controller.scala 218:24 232:33]
    node _GEN_30 = mux(_T_29, UInt<1>("h0"), _GEN_26) @[Controller.scala 218:24 233:33]
    node _GEN_31 = mux(_T_29, UInt<1>("h1"), _GEN_27) @[Controller.scala 218:24 234:33]
    node _GEN_32 = mux(_T_29, UInt<1>("h1"), _GEN_28) @[Controller.scala 218:24 235:33]
    node _GEN_33 = mux(_T_28, UInt<1>("h1"), _GEN_29) @[Controller.scala 218:24 226:33]
    node _GEN_34 = mux(_T_28, UInt<1>("h1"), _GEN_30) @[Controller.scala 218:24 227:33]
    node _GEN_35 = mux(_T_28, UInt<1>("h0"), _GEN_31) @[Controller.scala 218:24 228:33]
    node _GEN_36 = mux(_T_28, UInt<1>("h0"), _GEN_32) @[Controller.scala 218:24 229:33]
    node _GEN_37 = mux(_T_27, UInt<1>("h1"), _GEN_33) @[Controller.scala 218:24 220:33]
    node _GEN_38 = mux(_T_27, UInt<1>("h0"), _GEN_34) @[Controller.scala 218:24 221:33]
    node _GEN_39 = mux(_T_27, UInt<1>("h0"), _GEN_35) @[Controller.scala 218:24 222:33]
    node _GEN_40 = mux(_T_27, UInt<1>("h0"), _GEN_36) @[Controller.scala 218:24 223:33]
    node _T_36 = eq(IN_M_OP_REG, UInt<5>("h8")) @[Controller.scala 276:22]
    node _T_37 = eq(UInt<1>("h0"), IN_M_F3_REG) @[Controller.scala 278:28]
    node _T_38 = eq(UInt<1>("h1"), IN_M_F3_REG) @[Controller.scala 278:28]
    node _T_39 = eq(UInt<2>("h2"), IN_M_F3_REG) @[Controller.scala 278:28]
    node _GEN_41 = mux(_T_39, UInt<4>("hf"), UInt<4>("h0")) @[Controller.scala 277:22 278:28 286:30]
    node _GEN_42 = mux(_T_38, UInt<4>("h3"), _GEN_41) @[Controller.scala 278:28 283:30]
    node _GEN_43 = mux(_T_37, UInt<4>("h1"), _GEN_42) @[Controller.scala 278:28 280:30]
    node _GEN_44 = mux(_T_36, _GEN_43, UInt<4>("h0")) @[Controller.scala 276:56 290:22]
    node _T_40 = eq(IN_W_OP_REG, UInt<5>("h18")) @[Controller.scala 298:21]
    node _T_41 = eq(IN_W_OP_REG, UInt<5>("h8")) @[Controller.scala 299:21]
    node _T_42 = or(_T_40, _T_41) @[Controller.scala 298:55]
    node _T_43 = eq(IN_W_OP_REG, UInt<5>("h0")) @[Controller.scala 305:26]
    node _GEN_45 = mux(_T_43, UInt<1>("h0"), UInt<1>("h1")) @[Controller.scala 305:61 306:30 308:30]
    node _GEN_46 = mux(_T_42, UInt<1>("h0"), UInt<1>("h1")) @[Controller.scala 300:6 301:20 304:20]
    node _GEN_47 = mux(_T_42, UInt<1>("h0"), _GEN_45) @[Controller.scala 300:6 302:26]
    io_stall <= _io_stall_T_1 @[Controller.scala 202:14]
    io_next_pc_sel <= _GEN_37
    io_F_im_w_en <= UInt<4>("h0") @[Controller.scala 311:18]
    io_D_rs1_data_sel <= _io_D_rs1_data_sel_T @[Controller.scala 187:23]
    io_D_rs2_data_sel <= _io_D_rs2_data_sel_T @[Controller.scala 188:23]
    io_E_rs1_data_sel <= _io_E_rs1_data_sel_T_1 @[Controller.scala 193:24]
    io_E_rs2_data_sel <= _io_E_rs2_data_sel_T_1 @[Controller.scala 196:24]
    io_E_jb_op1_sel <= _GEN_38
    io_E_alu_op1_sel <= _GEN_39
    io_E_alu_op2_sel <= _GEN_40
    io_E_op <= IN_E_OP_REG @[Controller.scala 208:13]
    io_E_f3 <= IN_E_F3_REG @[Controller.scala 209:13]
    io_E_f7 <= IN_E_F7_REG @[Controller.scala 210:13]
    io_M_dm_w_en <= _GEN_44
    io_W_wb_en <= _GEN_46
    io_W_rd_index <= IN_W_RD_REG @[Controller.scala 294:21]
    io_W_f3 <= IN_W_F3_REG @[Controller.scala 295:21]
    io_W_wb_data_sel <= _GEN_47
    IN_E_OP_REG <= mux(reset, UInt<5>("h0"), _GEN_0) @[Controller.scala 47:{38,38}]
    IN_E_F3_REG <= mux(reset, UInt<3>("h0"), _GEN_1) @[Controller.scala 48:{38,38}]
    IN_E_RD_REG <= mux(reset, UInt<5>("h0"), _GEN_2) @[Controller.scala 49:{38,38}]
    IN_E_RS1_REG <= mux(reset, UInt<5>("h0"), _GEN_3) @[Controller.scala 50:{38,38}]
    IN_E_RS2_REG <= mux(reset, UInt<5>("h0"), _GEN_4) @[Controller.scala 51:{38,38}]
    IN_E_F7_REG <= mux(reset, UInt<1>("h0"), _GEN_5) @[Controller.scala 52:{38,38}]
    IN_M_OP_REG <= mux(reset, UInt<5>("h0"), _GEN_6) @[Controller.scala 54:{38,38}]
    IN_M_F3_REG <= mux(reset, UInt<3>("h0"), _GEN_7) @[Controller.scala 55:{38,38}]
    IN_M_RD_REG <= mux(reset, UInt<5>("h0"), _GEN_8) @[Controller.scala 56:{38,38}]
    IN_W_OP_REG <= mux(reset, UInt<5>("h0"), _GEN_9) @[Controller.scala 58:{38,38}]
    IN_W_F3_REG <= mux(reset, UInt<3>("h0"), _GEN_10) @[Controller.scala 59:{38,38}]
    IN_W_RD_REG <= mux(reset, UInt<5>("h0"), _GEN_11) @[Controller.scala 60:{38,38}]

  module Top :
    input clock : Clock
    input reset : UInt<1>
    input io_mem_read_test : UInt<1>
    input io_mem_addr_test : UInt<32>
    output io_mem_data_test : UInt<32>

    inst reg_pc of Reg_PC @[Top.scala 13:33]
    inst im of SRAM @[Top.scala 14:33]
    inst reg_d of Reg_D @[Top.scala 15:33]
    inst decoder of Decoder @[Top.scala 16:33]
    inst imm_ext of Imm_Ext @[Top.scala 17:33]
    inst regfile of RegFile @[Top.scala 18:33]
    inst reg_e of Reg_E @[Top.scala 19:33]
    inst alu of ALU @[Top.scala 20:33]
    inst jb_unit of JB_Unit @[Top.scala 21:33]
    inst reg_m of Reg_M @[Top.scala 22:33]
    inst dm of SRAM_dm @[Top.scala 23:33]
    inst reg_w of Reg_M @[Top.scala 24:33]
    inst Ld_filter of LD_Filter @[Top.scala 25:33]
    inst controller of Controller @[Top.scala 26:33]
    node out_pc_reg = reg_pc.io_current_pc @[Top.scala 100:33 31:39]
    node _to_pc_reg_T = add(out_pc_reg, UInt<3>("h4")) @[Top.scala 97:71]
    node _to_pc_reg_T_1 = tail(_to_pc_reg_T, 1) @[Top.scala 97:71]
    node next_pc_sel = controller.io_next_pc_sel @[Top.scala 214:33 74:39]
    node jb_pc = jb_unit.io_jb_out @[Top.scala 180:33 68:39]
    node _to_pc_reg_T_2 = mux(next_pc_sel, jb_pc, _to_pc_reg_T_1) @[Top.scala 97:39]
    node _im_io_address_T = bits(out_pc_reg, 15, 0) @[Top.scala 104:46]
    node W_wb_sel = controller.io_W_wb_data_sel @[Top.scala 230:33 94:39]
    node out_Reg_W_alu_out = reg_w.io_out_Reg_M_alu_out @[Top.scala 197:33 65:39]
    node ld_data_f = Ld_filter.io_ld_data_f @[Top.scala 203:33 66:39]
    node _wb_data_T = mux(W_wb_sel, out_Reg_W_alu_out, ld_data_f) @[Top.scala 130:39]
    node D_rs1_data_sel = controller.io_D_rs1_data_sel @[Top.scala 216:33 77:39]
    node wb_data = _wb_data_T @[Top.scala 130:33 67:39]
    node out_reg_file_rs1_data = regfile.io_rs1_data_out @[Top.scala 136:33 48:39]
    node _to_Reg_E_rs1_data_T = mux(D_rs1_data_sel, wb_data, out_reg_file_rs1_data) @[Top.scala 140:39]
    node D_rs2_data_sel = controller.io_D_rs2_data_sel @[Top.scala 217:33 78:39]
    node out_reg_file_rs2_data = regfile.io_rs2_data_out @[Top.scala 137:33 49:39]
    node _to_Reg_E_rs2_data_T = mux(D_rs2_data_sel, wb_data, out_reg_file_rs2_data) @[Top.scala 141:39]
    node E_rs1_data_sel = controller.io_E_rs1_data_sel @[Top.scala 218:33 80:39]
    node _rs1_data_final_T = eq(UInt<2>("h0"), E_rs1_data_sel) @[Mux.scala 81:61]
    node _rs1_data_final_T_1 = mux(_rs1_data_final_T, wb_data, wb_data) @[Mux.scala 81:58]
    node _rs1_data_final_T_2 = eq(UInt<2>("h1"), E_rs1_data_sel) @[Mux.scala 81:61]
    node alu_out_forward = reg_m.io_out_Reg_M_alu_out @[Top.scala 185:33 59:39]
    node _rs1_data_final_T_3 = mux(_rs1_data_final_T_2, alu_out_forward, _rs1_data_final_T_1) @[Mux.scala 81:58]
    node _rs1_data_final_T_4 = eq(UInt<2>("h2"), E_rs1_data_sel) @[Mux.scala 81:61]
    node rs1_data = reg_e.io_out_Reg_E_rs1_data @[Top.scala 149:33 52:39]
    node _rs1_data_final_T_5 = mux(_rs1_data_final_T_4, rs1_data, _rs1_data_final_T_3) @[Mux.scala 81:58]
    node E_rs2_data_sel = controller.io_E_rs2_data_sel @[Top.scala 219:33 81:39]
    node _rs2_data_final_T = eq(UInt<2>("h0"), E_rs2_data_sel) @[Mux.scala 81:61]
    node _rs2_data_final_T_1 = mux(_rs2_data_final_T, wb_data, wb_data) @[Mux.scala 81:58]
    node _rs2_data_final_T_2 = eq(UInt<2>("h1"), E_rs2_data_sel) @[Mux.scala 81:61]
    node _rs2_data_final_T_3 = mux(_rs2_data_final_T_2, alu_out_forward, _rs2_data_final_T_1) @[Mux.scala 81:58]
    node _rs2_data_final_T_4 = eq(UInt<2>("h2"), E_rs2_data_sel) @[Mux.scala 81:61]
    node rs2_data = reg_e.io_out_Reg_E_rs2_data @[Top.scala 150:33 53:39]
    node _rs2_data_final_T_5 = mux(_rs2_data_final_T_4, rs2_data, _rs2_data_final_T_3) @[Mux.scala 81:58]
    node E_alu_op1_sel = controller.io_E_alu_op1_sel @[Top.scala 221:33 83:39]
    node rs1_data_final = _rs1_data_final_T_5 @[Top.scala 154:33 55:39]
    node out_Reg_E_pc = reg_e.io_out_Reg_E_pc @[Top.scala 148:33 33:39]
    node _alu_src1_mux_T = mux(E_alu_op1_sel, rs1_data_final, out_Reg_E_pc) @[Top.scala 164:39]
    node E_alu_op2_sel = controller.io_E_alu_op2_sel @[Top.scala 222:33 84:39]
    node rs2_data_final = _rs2_data_final_T_5 @[Top.scala 159:33 56:39]
    node out_Reg_E_sext_imme = reg_e.io_out_Reg_E_sext_imme @[Top.scala 151:33 46:39]
    node _alu_src2_mux_T = mux(E_alu_op2_sel, rs2_data_final, out_Reg_E_sext_imme) @[Top.scala 165:39]
    node E_jb_op1_sel = controller.io_E_jb_op1_sel @[Top.scala 220:33 82:39]
    node _jb_src_mux_T = mux(E_jb_op1_sel, rs1_data_final, out_Reg_E_pc) @[Top.scala 175:39]
    node _dm_io_address_T = bits(alu_out_forward, 15, 0) @[Top.scala 190:51]
    node alu_out = alu.io_alu_out @[Top.scala 173:33 58:39]
    node _controller_io_alu_out_T = bits(alu_out, 0, 0) @[Top.scala 212:43]
    node to_pc_reg = _to_pc_reg_T_2 @[Top.scala 30:39 97:33]
    node out_Reg_D_pc = reg_d.io_out_Reg_D_pc @[Top.scala 113:33 32:39]
    node inst_to_Reg_D = im.io_read_data @[Top.scala 106:33 35:39]
    node inst_out_Reg_D = reg_d.io_out_Reg_D_inst @[Top.scala 114:33 36:39]
    node opcode = decoder.io_dc_out_opcode @[Top.scala 118:33 38:39]
    node func3 = decoder.io_dc_out_func3 @[Top.scala 119:33 39:39]
    node func7 = decoder.io_dc_out_func7 @[Top.scala 120:33 40:39]
    node rs1_index = decoder.io_dc_out_rs1_index @[Top.scala 121:33 41:39]
    node rs2_index = decoder.io_dc_out_rs2_index @[Top.scala 122:33 42:39]
    node rd_index = decoder.io_dc_out_rd_index @[Top.scala 123:33 43:39]
    node to_Reg_E_sext_imme = imm_ext.io_imm_ext_out @[Top.scala 127:33 45:39]
    node to_Reg_E_rs1_data = _to_Reg_E_rs1_data_T @[Top.scala 140:33 50:39]
    node to_Reg_E_rs2_data = _to_Reg_E_rs2_data_T @[Top.scala 141:33 51:39]
    node out_Reg_M_rs2_data = reg_m.io_out_Reg_M_rs2_data @[Top.scala 186:33 61:39]
    node to_Reg_W_ld_data = dm.io_read_data @[Top.scala 192:33 63:39]
    node out_Reg_W_ld_data = reg_w.io_out_Reg_M_rs2_data @[Top.scala 198:33 64:39]
    node alu_src1_mux = _alu_src1_mux_T @[Top.scala 164:33 69:39]
    node alu_src2_mux = _alu_src2_mux_T @[Top.scala 165:33 70:39]
    node jb_src_mux = _jb_src_mux_T @[Top.scala 175:33 71:39]
    node stall = controller.io_stall @[Top.scala 213:33 75:39]
    node F_im_w_en = controller.io_F_im_w_en @[Top.scala 215:33 76:39]
    node E_op = controller.io_E_op @[Top.scala 223:33 85:39]
    node E_f3 = controller.io_E_f3 @[Top.scala 224:33 86:39]
    node E_f7 = controller.io_E_f7 @[Top.scala 225:33 87:39]
    node M_dm_w_en = controller.io_M_dm_w_en @[Top.scala 226:33 89:39]
    node W_wb_en = controller.io_W_wb_en @[Top.scala 227:33 91:39]
    node W_rd_index = controller.io_W_rd_index @[Top.scala 228:33 92:39]
    node W_f3 = controller.io_W_f3 @[Top.scala 229:33 93:39]
    io_mem_data_test <= dm.io_mem_data_test @[Top.scala 237:33]
    reg_pc.clock <= clock
    reg_pc.reset <= reset
    reg_pc.io_stall <= stall @[Top.scala 98:33]
    reg_pc.io_next_pc <= to_pc_reg @[Top.scala 99:33]
    im.clock <= clock
    im.reset <= reset
    im.io_w_en <= F_im_w_en @[Top.scala 103:33]
    im.io_address <= _im_io_address_T @[Top.scala 104:33]
    im.io_write_data <= UInt<32>("h0") @[Top.scala 105:33]
    reg_d.clock <= clock
    reg_d.reset <= reset
    reg_d.io_stall <= stall @[Top.scala 109:33]
    reg_d.io_jb <= next_pc_sel @[Top.scala 110:33]
    reg_d.io_pc <= out_pc_reg @[Top.scala 111:33]
    reg_d.io_inst <= inst_to_Reg_D @[Top.scala 112:33]
    decoder.clock <= clock
    decoder.reset <= reset
    decoder.io_inst <= inst_out_Reg_D @[Top.scala 117:33]
    imm_ext.clock <= clock
    imm_ext.reset <= reset
    imm_ext.io_inst <= inst_out_Reg_D @[Top.scala 126:33]
    regfile.clock <= clock
    regfile.reset <= reset
    regfile.io_wb_en <= W_wb_en @[Top.scala 131:33]
    regfile.io_wb_data <= wb_data @[Top.scala 132:33]
    regfile.io_rd_index <= W_rd_index @[Top.scala 133:33]
    regfile.io_rs1_index <= rs1_index @[Top.scala 134:33]
    regfile.io_rs2_index <= rs2_index @[Top.scala 135:33]
    reg_e.clock <= clock
    reg_e.reset <= reset
    reg_e.io_stall <= stall @[Top.scala 142:33]
    reg_e.io_jb <= next_pc_sel @[Top.scala 143:33]
    reg_e.io_pc <= out_Reg_D_pc @[Top.scala 144:33]
    reg_e.io_rs1_data <= to_Reg_E_rs1_data @[Top.scala 145:33]
    reg_e.io_rs2_data <= to_Reg_E_rs2_data @[Top.scala 146:33]
    reg_e.io_sext_imme <= to_Reg_E_sext_imme @[Top.scala 147:33]
    alu.clock <= clock
    alu.reset <= reset
    alu.io_opcode <= E_op @[Top.scala 168:33]
    alu.io_func3 <= E_f3 @[Top.scala 169:33]
    alu.io_func7 <= E_f7 @[Top.scala 170:33]
    alu.io_operand1 <= alu_src1_mux @[Top.scala 171:33]
    alu.io_operand2 <= alu_src2_mux @[Top.scala 172:33]
    jb_unit.clock <= clock
    jb_unit.reset <= reset
    jb_unit.io_operand1 <= jb_src_mux @[Top.scala 178:33]
    jb_unit.io_operand2 <= out_Reg_E_sext_imme @[Top.scala 179:33]
    reg_m.clock <= clock
    reg_m.reset <= reset
    reg_m.io_alu_out <= alu_out @[Top.scala 183:33]
    reg_m.io_rs2_data <= rs2_data_final @[Top.scala 184:33]
    dm.clock <= clock
    dm.reset <= reset
    dm.io_w_en <= M_dm_w_en @[Top.scala 189:33]
    dm.io_address <= _dm_io_address_T @[Top.scala 190:33]
    dm.io_write_data <= out_Reg_M_rs2_data @[Top.scala 191:33]
    dm.io_mem_read_test <= io_mem_read_test @[Top.scala 235:33]
    dm.io_mem_addr_test <= io_mem_addr_test @[Top.scala 236:33]
    reg_w.clock <= clock
    reg_w.reset <= reset
    reg_w.io_alu_out <= alu_out_forward @[Top.scala 195:33]
    reg_w.io_rs2_data <= to_Reg_W_ld_data @[Top.scala 196:33]
    Ld_filter.clock <= clock
    Ld_filter.reset <= reset
    Ld_filter.io_func3 <= W_f3 @[Top.scala 201:33]
    Ld_filter.io_ld_data <= out_Reg_W_ld_data @[Top.scala 202:33]
    controller.clock <= clock
    controller.reset <= reset
    controller.io_op <= opcode @[Top.scala 206:33]
    controller.io_f3 <= func3 @[Top.scala 207:33]
    controller.io_rd <= rd_index @[Top.scala 208:33]
    controller.io_rs1 <= rs1_index @[Top.scala 209:33]
    controller.io_rs2 <= rs2_index @[Top.scala 210:33]
    controller.io_f7 <= func7 @[Top.scala 211:33]
    controller.io_alu_out <= _controller_io_alu_out_T @[Top.scala 212:33]
