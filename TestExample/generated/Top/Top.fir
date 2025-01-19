circuit Top :
  module Reg_PC :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip next_pc : UInt<32>, current_pc : UInt<32>}

    reg PC_REG : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[Reg_PC.scala 11:35]
    when io.stall : @[Reg_PC.scala 13:17]
      PC_REG <= PC_REG @[Reg_PC.scala 14:12]
    else :
      PC_REG <= io.next_pc @[Reg_PC.scala 16:12]
    io.current_pc <= PC_REG @[Reg_PC.scala 19:24]

  module SRAM :
    input clock : Clock
    input reset : Reset
    output io : { flip w_en : UInt<4>, flip address : UInt<16>, flip write_data : UInt<32>, read_data : UInt<32>}

    cmem mem : UInt<8> [65536] @[SRAM.scala 12:16]
    node _T = neq(io.w_en, UInt<1>("h0")) @[SRAM.scala 15:16]
    when _T : @[SRAM.scala 15:25]
      node _T_1 = bits(io.w_en, 0, 0) @[SRAM.scala 16:17]
      when _T_1 : @[SRAM.scala 16:22]
        node _T_2 = bits(io.write_data, 7, 0) @[SRAM.scala 16:59]
        write mport MPORT = mem[io.address], clock
        MPORT <= _T_2
      node _T_3 = bits(io.w_en, 1, 1) @[SRAM.scala 17:17]
      when _T_3 : @[SRAM.scala 17:22]
        node _T_4 = add(io.address, UInt<1>("h1")) @[SRAM.scala 17:45]
        node _T_5 = tail(_T_4, 1) @[SRAM.scala 17:45]
        node _T_6 = bits(io.write_data, 15, 8) @[SRAM.scala 17:65]
        write mport MPORT_1 = mem[_T_5], clock
        MPORT_1 <= _T_6
      node _T_7 = bits(io.w_en, 2, 2) @[SRAM.scala 18:17]
      when _T_7 : @[SRAM.scala 18:22]
        node _T_8 = add(io.address, UInt<2>("h2")) @[SRAM.scala 18:45]
        node _T_9 = tail(_T_8, 1) @[SRAM.scala 18:45]
        node _T_10 = bits(io.write_data, 23, 16) @[SRAM.scala 18:65]
        write mport MPORT_2 = mem[_T_9], clock
        MPORT_2 <= _T_10
      node _T_11 = bits(io.w_en, 3, 3) @[SRAM.scala 19:17]
      when _T_11 : @[SRAM.scala 19:22]
        node _T_12 = add(io.address, UInt<2>("h3")) @[SRAM.scala 19:45]
        node _T_13 = tail(_T_12, 1) @[SRAM.scala 19:45]
        node _T_14 = bits(io.write_data, 31, 24) @[SRAM.scala 19:65]
        write mport MPORT_3 = mem[_T_13], clock
        MPORT_3 <= _T_14
    wire read_data_bytes : UInt<8>[4] @[SRAM.scala 23:32]
    read_data_bytes[0] <= UInt<8>("h0") @[SRAM.scala 23:32]
    read_data_bytes[1] <= UInt<8>("h0") @[SRAM.scala 23:32]
    read_data_bytes[2] <= UInt<8>("h0") @[SRAM.scala 23:32]
    read_data_bytes[3] <= UInt<8>("h0") @[SRAM.scala 23:32]
    read mport read_data_bytes_0_MPORT = mem[io.address], clock @[SRAM.scala 24:33]
    read_data_bytes[0] <= read_data_bytes_0_MPORT @[SRAM.scala 24:22]
    node _read_data_bytes_1_T = add(io.address, UInt<1>("h1")) @[SRAM.scala 25:45]
    node _read_data_bytes_1_T_1 = tail(_read_data_bytes_1_T, 1) @[SRAM.scala 25:45]
    read mport read_data_bytes_1_MPORT = mem[_read_data_bytes_1_T_1], clock @[SRAM.scala 25:33]
    read_data_bytes[1] <= read_data_bytes_1_MPORT @[SRAM.scala 25:22]
    node _read_data_bytes_2_T = add(io.address, UInt<2>("h2")) @[SRAM.scala 26:45]
    node _read_data_bytes_2_T_1 = tail(_read_data_bytes_2_T, 1) @[SRAM.scala 26:45]
    read mport read_data_bytes_2_MPORT = mem[_read_data_bytes_2_T_1], clock @[SRAM.scala 26:33]
    read_data_bytes[2] <= read_data_bytes_2_MPORT @[SRAM.scala 26:22]
    node _read_data_bytes_3_T = add(io.address, UInt<2>("h3")) @[SRAM.scala 27:45]
    node _read_data_bytes_3_T_1 = tail(_read_data_bytes_3_T, 1) @[SRAM.scala 27:45]
    read mport read_data_bytes_3_MPORT = mem[_read_data_bytes_3_T_1], clock @[SRAM.scala 27:33]
    read_data_bytes[3] <= read_data_bytes_3_MPORT @[SRAM.scala 27:22]
    node io_read_data_lo = cat(read_data_bytes[1], read_data_bytes[0]) @[Cat.scala 31:58]
    node io_read_data_hi = cat(read_data_bytes[3], read_data_bytes[2]) @[Cat.scala 31:58]
    node _io_read_data_T = cat(io_read_data_hi, io_read_data_lo) @[Cat.scala 31:58]
    io.read_data <= _io_read_data_T @[SRAM.scala 29:16]

  module Reg_D :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip jb : UInt<1>, flip pc : UInt<32>, flip inst : UInt<32>, out_Reg_D_pc : UInt<32>, out_Reg_D_inst : UInt<32>}

    reg PC_REG : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[Reg_D.scala 14:35]
    reg INST_REG : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[Reg_D.scala 15:35]
    when io.jb : @[Reg_D.scala 17:14]
      PC_REG <= UInt<32>("h0") @[Reg_D.scala 18:17]
      INST_REG <= UInt<32>("h0") @[Reg_D.scala 19:17]
    else :
      when io.stall : @[Reg_D.scala 20:23]
        PC_REG <= PC_REG @[Reg_D.scala 21:17]
        INST_REG <= INST_REG @[Reg_D.scala 22:17]
      else :
        PC_REG <= io.pc @[Reg_D.scala 24:17]
        INST_REG <= io.inst @[Reg_D.scala 25:17]
    io.out_Reg_D_pc <= PC_REG @[Reg_D.scala 27:25]
    io.out_Reg_D_inst <= INST_REG @[Reg_D.scala 28:25]

  module Decoder :
    input clock : Clock
    input reset : Reset
    output io : { flip inst : UInt<32>, dc_out_opcode : UInt<5>, dc_out_func3 : UInt<3>, dc_out_func7 : UInt<1>, dc_out_rs1_index : UInt<5>, dc_out_rs2_index : UInt<5>, dc_out_rd_index : UInt<5>}

    node _io_dc_out_opcode_T = bits(io.inst, 6, 2) @[Deocder.scala 14:30]
    io.dc_out_opcode <= _io_dc_out_opcode_T @[Deocder.scala 14:20]
    node _io_dc_out_func3_T = bits(io.inst, 14, 12) @[Deocder.scala 15:29]
    io.dc_out_func3 <= _io_dc_out_func3_T @[Deocder.scala 15:19]
    node _io_dc_out_func7_T = bits(io.inst, 30, 30) @[Deocder.scala 16:29]
    io.dc_out_func7 <= _io_dc_out_func7_T @[Deocder.scala 16:19]
    node _io_dc_out_rs1_index_T = bits(io.inst, 19, 15) @[Deocder.scala 17:33]
    io.dc_out_rs1_index <= _io_dc_out_rs1_index_T @[Deocder.scala 17:23]
    node _io_dc_out_rs2_index_T = bits(io.inst, 24, 20) @[Deocder.scala 18:33]
    io.dc_out_rs2_index <= _io_dc_out_rs2_index_T @[Deocder.scala 18:23]
    node _io_dc_out_rd_index_T = bits(io.inst, 11, 7) @[Deocder.scala 19:32]
    io.dc_out_rd_index <= _io_dc_out_rd_index_T @[Deocder.scala 19:22]

  module Imm_Ext :
    input clock : Clock
    input reset : Reset
    output io : { flip inst : UInt<32>, imm_ext_out : UInt<32>}

    io.imm_ext_out <= UInt<32>("h0") @[Imm_Ext.scala 12:24]
    node _T = bits(io.inst, 6, 2) @[Imm_Ext.scala 15:19]
    node _T_1 = eq(UInt<5>("h0"), _T) @[Imm_Ext.scala 15:26]
    when _T_1 : @[Imm_Ext.scala 15:26]
      node _io_imm_ext_out_T = bits(io.inst, 31, 31) @[Imm_Ext.scala 17:56]
      node _io_imm_ext_out_T_1 = bits(_io_imm_ext_out_T, 0, 0) @[Bitwise.scala 74:15]
      node _io_imm_ext_out_T_2 = mux(_io_imm_ext_out_T_1, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 74:12]
      node _io_imm_ext_out_T_3 = bits(io.inst, 31, 20) @[Imm_Ext.scala 17:70]
      node _io_imm_ext_out_T_4 = cat(_io_imm_ext_out_T_2, _io_imm_ext_out_T_3) @[Cat.scala 31:58]
      io.imm_ext_out <= _io_imm_ext_out_T_4 @[Imm_Ext.scala 17:33]
    else :
      node _T_2 = eq(UInt<5>("h4"), _T) @[Imm_Ext.scala 15:26]
      when _T_2 : @[Imm_Ext.scala 15:26]
        node _io_imm_ext_out_T_5 = bits(io.inst, 31, 31) @[Imm_Ext.scala 20:56]
        node _io_imm_ext_out_T_6 = bits(_io_imm_ext_out_T_5, 0, 0) @[Bitwise.scala 74:15]
        node _io_imm_ext_out_T_7 = mux(_io_imm_ext_out_T_6, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 74:12]
        node _io_imm_ext_out_T_8 = bits(io.inst, 31, 20) @[Imm_Ext.scala 20:70]
        node _io_imm_ext_out_T_9 = cat(_io_imm_ext_out_T_7, _io_imm_ext_out_T_8) @[Cat.scala 31:58]
        io.imm_ext_out <= _io_imm_ext_out_T_9 @[Imm_Ext.scala 20:33]
      else :
        node _T_3 = eq(UInt<5>("h19"), _T) @[Imm_Ext.scala 15:26]
        when _T_3 : @[Imm_Ext.scala 15:26]
          node _io_imm_ext_out_T_10 = bits(io.inst, 31, 31) @[Imm_Ext.scala 23:56]
          node _io_imm_ext_out_T_11 = bits(_io_imm_ext_out_T_10, 0, 0) @[Bitwise.scala 74:15]
          node _io_imm_ext_out_T_12 = mux(_io_imm_ext_out_T_11, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 74:12]
          node _io_imm_ext_out_T_13 = bits(io.inst, 31, 20) @[Imm_Ext.scala 23:70]
          node _io_imm_ext_out_T_14 = cat(_io_imm_ext_out_T_12, _io_imm_ext_out_T_13) @[Cat.scala 31:58]
          io.imm_ext_out <= _io_imm_ext_out_T_14 @[Imm_Ext.scala 23:33]
        else :
          node _T_4 = eq(UInt<5>("h8"), _T) @[Imm_Ext.scala 15:26]
          when _T_4 : @[Imm_Ext.scala 15:26]
            node _io_imm_ext_out_T_15 = bits(io.inst, 31, 31) @[Imm_Ext.scala 26:56]
            node _io_imm_ext_out_T_16 = bits(_io_imm_ext_out_T_15, 0, 0) @[Bitwise.scala 74:15]
            node _io_imm_ext_out_T_17 = mux(_io_imm_ext_out_T_16, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 74:12]
            node _io_imm_ext_out_T_18 = bits(io.inst, 31, 25) @[Imm_Ext.scala 26:70]
            node _io_imm_ext_out_T_19 = bits(io.inst, 11, 7) @[Imm_Ext.scala 26:87]
            node io_imm_ext_out_hi = cat(_io_imm_ext_out_T_17, _io_imm_ext_out_T_18) @[Cat.scala 31:58]
            node _io_imm_ext_out_T_20 = cat(io_imm_ext_out_hi, _io_imm_ext_out_T_19) @[Cat.scala 31:58]
            io.imm_ext_out <= _io_imm_ext_out_T_20 @[Imm_Ext.scala 26:33]
          else :
            node _T_5 = eq(UInt<5>("h18"), _T) @[Imm_Ext.scala 15:26]
            when _T_5 : @[Imm_Ext.scala 15:26]
              node _io_imm_ext_out_T_21 = bits(io.inst, 31, 31) @[Imm_Ext.scala 29:56]
              node _io_imm_ext_out_T_22 = bits(_io_imm_ext_out_T_21, 0, 0) @[Bitwise.scala 74:15]
              node _io_imm_ext_out_T_23 = mux(_io_imm_ext_out_T_22, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 74:12]
              node _io_imm_ext_out_T_24 = bits(io.inst, 7, 7) @[Imm_Ext.scala 29:70]
              node _io_imm_ext_out_T_25 = bits(io.inst, 30, 25) @[Imm_Ext.scala 29:82]
              node _io_imm_ext_out_T_26 = bits(io.inst, 11, 8) @[Imm_Ext.scala 29:99]
              node io_imm_ext_out_lo = cat(_io_imm_ext_out_T_26, UInt<1>("h0")) @[Cat.scala 31:58]
              node io_imm_ext_out_hi_hi = cat(_io_imm_ext_out_T_23, _io_imm_ext_out_T_24) @[Cat.scala 31:58]
              node io_imm_ext_out_hi_1 = cat(io_imm_ext_out_hi_hi, _io_imm_ext_out_T_25) @[Cat.scala 31:58]
              node _io_imm_ext_out_T_27 = cat(io_imm_ext_out_hi_1, io_imm_ext_out_lo) @[Cat.scala 31:58]
              io.imm_ext_out <= _io_imm_ext_out_T_27 @[Imm_Ext.scala 29:33]
            else :
              node _T_6 = eq(UInt<5>("hd"), _T) @[Imm_Ext.scala 15:26]
              when _T_6 : @[Imm_Ext.scala 15:26]
                node _io_imm_ext_out_T_28 = bits(io.inst, 31, 12) @[Imm_Ext.scala 32:47]
                node _io_imm_ext_out_T_29 = cat(_io_imm_ext_out_T_28, UInt<12>("h0")) @[Cat.scala 31:58]
                io.imm_ext_out <= _io_imm_ext_out_T_29 @[Imm_Ext.scala 32:33]
              else :
                node _T_7 = eq(UInt<5>("h5"), _T) @[Imm_Ext.scala 15:26]
                when _T_7 : @[Imm_Ext.scala 15:26]
                  node _io_imm_ext_out_T_30 = bits(io.inst, 31, 12) @[Imm_Ext.scala 35:47]
                  node _io_imm_ext_out_T_31 = cat(_io_imm_ext_out_T_30, UInt<12>("h0")) @[Cat.scala 31:58]
                  io.imm_ext_out <= _io_imm_ext_out_T_31 @[Imm_Ext.scala 35:33]
                else :
                  node _T_8 = eq(UInt<5>("h1b"), _T) @[Imm_Ext.scala 15:26]
                  when _T_8 : @[Imm_Ext.scala 15:26]
                    node _io_imm_ext_out_T_32 = bits(io.inst, 31, 31) @[Imm_Ext.scala 38:56]
                    node _io_imm_ext_out_T_33 = bits(_io_imm_ext_out_T_32, 0, 0) @[Bitwise.scala 74:15]
                    node _io_imm_ext_out_T_34 = mux(_io_imm_ext_out_T_33, UInt<12>("hfff"), UInt<12>("h0")) @[Bitwise.scala 74:12]
                    node _io_imm_ext_out_T_35 = bits(io.inst, 19, 12) @[Imm_Ext.scala 38:70]
                    node _io_imm_ext_out_T_36 = bits(io.inst, 20, 20) @[Imm_Ext.scala 38:87]
                    node _io_imm_ext_out_T_37 = bits(io.inst, 30, 21) @[Imm_Ext.scala 38:100]
                    node io_imm_ext_out_lo_1 = cat(_io_imm_ext_out_T_37, UInt<1>("h0")) @[Cat.scala 31:58]
                    node io_imm_ext_out_hi_hi_1 = cat(_io_imm_ext_out_T_34, _io_imm_ext_out_T_35) @[Cat.scala 31:58]
                    node io_imm_ext_out_hi_2 = cat(io_imm_ext_out_hi_hi_1, _io_imm_ext_out_T_36) @[Cat.scala 31:58]
                    node _io_imm_ext_out_T_38 = cat(io_imm_ext_out_hi_2, io_imm_ext_out_lo_1) @[Cat.scala 31:58]
                    io.imm_ext_out <= _io_imm_ext_out_T_38 @[Imm_Ext.scala 38:33]

  module RegFile :
    input clock : Clock
    input reset : Reset
    output io : { flip wb_en : UInt<1>, flip wb_data : UInt<32>, flip rd_index : UInt<5>, flip rs1_index : UInt<5>, flip rs2_index : UInt<5>, rs1_data_out : UInt<32>, rs2_data_out : UInt<32>}

    wire _registers_WIRE : UInt<32>[32] @[RegFile.scala 15:34]
    _registers_WIRE[0] <= UInt<32>("h0") @[RegFile.scala 15:34]
    _registers_WIRE[1] <= UInt<32>("h0") @[RegFile.scala 15:34]
    _registers_WIRE[2] <= UInt<32>("h0") @[RegFile.scala 15:34]
    _registers_WIRE[3] <= UInt<32>("h0") @[RegFile.scala 15:34]
    _registers_WIRE[4] <= UInt<32>("h0") @[RegFile.scala 15:34]
    _registers_WIRE[5] <= UInt<32>("h0") @[RegFile.scala 15:34]
    _registers_WIRE[6] <= UInt<32>("h0") @[RegFile.scala 15:34]
    _registers_WIRE[7] <= UInt<32>("h0") @[RegFile.scala 15:34]
    _registers_WIRE[8] <= UInt<32>("h0") @[RegFile.scala 15:34]
    _registers_WIRE[9] <= UInt<32>("h0") @[RegFile.scala 15:34]
    _registers_WIRE[10] <= UInt<32>("h0") @[RegFile.scala 15:34]
    _registers_WIRE[11] <= UInt<32>("h0") @[RegFile.scala 15:34]
    _registers_WIRE[12] <= UInt<32>("h0") @[RegFile.scala 15:34]
    _registers_WIRE[13] <= UInt<32>("h0") @[RegFile.scala 15:34]
    _registers_WIRE[14] <= UInt<32>("h0") @[RegFile.scala 15:34]
    _registers_WIRE[15] <= UInt<32>("h0") @[RegFile.scala 15:34]
    _registers_WIRE[16] <= UInt<32>("h0") @[RegFile.scala 15:34]
    _registers_WIRE[17] <= UInt<32>("h0") @[RegFile.scala 15:34]
    _registers_WIRE[18] <= UInt<32>("h0") @[RegFile.scala 15:34]
    _registers_WIRE[19] <= UInt<32>("h0") @[RegFile.scala 15:34]
    _registers_WIRE[20] <= UInt<32>("h0") @[RegFile.scala 15:34]
    _registers_WIRE[21] <= UInt<32>("h0") @[RegFile.scala 15:34]
    _registers_WIRE[22] <= UInt<32>("h0") @[RegFile.scala 15:34]
    _registers_WIRE[23] <= UInt<32>("h0") @[RegFile.scala 15:34]
    _registers_WIRE[24] <= UInt<32>("h0") @[RegFile.scala 15:34]
    _registers_WIRE[25] <= UInt<32>("h0") @[RegFile.scala 15:34]
    _registers_WIRE[26] <= UInt<32>("h0") @[RegFile.scala 15:34]
    _registers_WIRE[27] <= UInt<32>("h0") @[RegFile.scala 15:34]
    _registers_WIRE[28] <= UInt<32>("h0") @[RegFile.scala 15:34]
    _registers_WIRE[29] <= UInt<32>("h0") @[RegFile.scala 15:34]
    _registers_WIRE[30] <= UInt<32>("h0") @[RegFile.scala 15:34]
    _registers_WIRE[31] <= UInt<32>("h0") @[RegFile.scala 15:34]
    reg registers : UInt<32>[32], clock with :
      reset => (reset, _registers_WIRE) @[RegFile.scala 15:26]
    node _T = neq(io.rd_index, UInt<1>("h0")) @[RegFile.scala 17:32]
    node _T_1 = and(io.wb_en, _T) @[RegFile.scala 17:17]
    when _T_1 : @[RegFile.scala 17:41]
      registers[io.rd_index] <= io.wb_data @[RegFile.scala 18:28]
    node _io_rs1_data_out_T = eq(io.rs1_index, UInt<1>("h0")) @[RegFile.scala 21:39]
    node _io_rs1_data_out_T_1 = mux(_io_rs1_data_out_T, UInt<1>("h0"), registers[io.rs1_index]) @[RegFile.scala 21:25]
    io.rs1_data_out <= _io_rs1_data_out_T_1 @[RegFile.scala 21:19]
    node _io_rs2_data_out_T = eq(io.rs2_index, UInt<1>("h0")) @[RegFile.scala 22:39]
    node _io_rs2_data_out_T_1 = mux(_io_rs2_data_out_T, UInt<1>("h0"), registers[io.rs2_index]) @[RegFile.scala 22:25]
    io.rs2_data_out <= _io_rs2_data_out_T_1 @[RegFile.scala 22:19]

  module Reg_E :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip jb : UInt<1>, flip pc : UInt<32>, flip rs1_data : UInt<32>, flip rs2_data : UInt<32>, flip sext_imme : UInt<32>, out_Reg_E_pc : UInt<32>, out_Reg_E_rs1_data : UInt<32>, out_Reg_E_rs2_data : UInt<32>, out_Reg_E_sext_imme : UInt<32>}

    reg E_PC_REG : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[Reg_E.scala 18:43]
    reg E_RS1_DATA_REG : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[Reg_E.scala 19:43]
    reg E_RS2_DATA_REG : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[Reg_E.scala 20:43]
    reg E_SEXT_IMME_REG : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[Reg_E.scala 21:43]
    node _T = or(io.jb, io.stall) @[Reg_E.scala 23:14]
    when _T : @[Reg_E.scala 23:26]
      E_PC_REG <= UInt<32>("h0") @[Reg_E.scala 24:23]
      E_RS1_DATA_REG <= UInt<32>("h0") @[Reg_E.scala 25:23]
      E_RS2_DATA_REG <= UInt<32>("h0") @[Reg_E.scala 26:23]
      E_SEXT_IMME_REG <= UInt<32>("h0") @[Reg_E.scala 27:23]
    else :
      E_PC_REG <= io.pc @[Reg_E.scala 29:23]
      E_RS1_DATA_REG <= io.rs1_data @[Reg_E.scala 30:23]
      E_RS2_DATA_REG <= io.rs2_data @[Reg_E.scala 31:23]
      E_SEXT_IMME_REG <= io.sext_imme @[Reg_E.scala 32:23]
    io.out_Reg_E_pc <= E_PC_REG @[Reg_E.scala 35:28]
    io.out_Reg_E_rs1_data <= E_RS1_DATA_REG @[Reg_E.scala 36:28]
    io.out_Reg_E_rs2_data <= E_RS2_DATA_REG @[Reg_E.scala 37:28]
    io.out_Reg_E_sext_imme <= E_SEXT_IMME_REG @[Reg_E.scala 38:28]

  module ALU :
    input clock : Clock
    input reset : Reset
    output io : { flip opcode : UInt<5>, flip func3 : UInt<3>, flip func7 : UInt<1>, flip operand1 : UInt<32>, flip operand2 : UInt<32>, alu_out : UInt<32>}

    node func7_and_func3 = cat(io.func7, io.func3) @[Cat.scala 31:58]
    io.alu_out <= UInt<32>("h0") @[ALU.scala 15:16]
    node _T = eq(io.opcode, UInt<5>("hc")) @[ALU.scala 16:20]
    when _T : @[ALU.scala 16:53]
      node _T_1 = eq(UInt<4>("h0"), func7_and_func3) @[ALU.scala 17:33]
      when _T_1 : @[ALU.scala 17:33]
        node _io_alu_out_T = asSInt(io.operand1) @[ALU.scala 19:44]
        node _io_alu_out_T_1 = asSInt(io.operand2) @[ALU.scala 19:65]
        node _io_alu_out_T_2 = add(_io_alu_out_T, _io_alu_out_T_1) @[ALU.scala 19:51]
        node _io_alu_out_T_3 = tail(_io_alu_out_T_2, 1) @[ALU.scala 19:51]
        node _io_alu_out_T_4 = asSInt(_io_alu_out_T_3) @[ALU.scala 19:51]
        node _io_alu_out_T_5 = asUInt(_io_alu_out_T_4) @[ALU.scala 19:73]
        io.alu_out <= _io_alu_out_T_5 @[ALU.scala 19:28]
      else :
        node _T_2 = eq(UInt<4>("h8"), func7_and_func3) @[ALU.scala 17:33]
        when _T_2 : @[ALU.scala 17:33]
          node _io_alu_out_T_6 = asSInt(io.operand1) @[ALU.scala 22:44]
          node _io_alu_out_T_7 = asSInt(io.operand2) @[ALU.scala 22:65]
          node _io_alu_out_T_8 = sub(_io_alu_out_T_6, _io_alu_out_T_7) @[ALU.scala 22:51]
          node _io_alu_out_T_9 = tail(_io_alu_out_T_8, 1) @[ALU.scala 22:51]
          node _io_alu_out_T_10 = asSInt(_io_alu_out_T_9) @[ALU.scala 22:51]
          node _io_alu_out_T_11 = asUInt(_io_alu_out_T_10) @[ALU.scala 22:74]
          io.alu_out <= _io_alu_out_T_11 @[ALU.scala 22:28]
        else :
          node _T_3 = eq(UInt<4>("h1"), func7_and_func3) @[ALU.scala 17:33]
          when _T_3 : @[ALU.scala 17:33]
            node _io_alu_out_T_12 = bits(io.operand2, 4, 0) @[ALU.scala 25:58]
            node _io_alu_out_T_13 = dshl(io.operand1, _io_alu_out_T_12) @[ALU.scala 25:44]
            io.alu_out <= _io_alu_out_T_13 @[ALU.scala 25:28]
          else :
            node _T_4 = eq(UInt<4>("h2"), func7_and_func3) @[ALU.scala 17:33]
            when _T_4 : @[ALU.scala 17:33]
              node _io_alu_out_T_14 = asSInt(io.operand1) @[ALU.scala 28:44]
              node _io_alu_out_T_15 = asSInt(io.operand2) @[ALU.scala 28:65]
              node _io_alu_out_T_16 = lt(_io_alu_out_T_14, _io_alu_out_T_15) @[ALU.scala 28:51]
              io.alu_out <= _io_alu_out_T_16 @[ALU.scala 28:28]
            else :
              node _T_5 = eq(UInt<4>("h3"), func7_and_func3) @[ALU.scala 17:33]
              when _T_5 : @[ALU.scala 17:33]
                node _io_alu_out_T_17 = lt(io.operand1, io.operand2) @[ALU.scala 31:44]
                io.alu_out <= _io_alu_out_T_17 @[ALU.scala 31:28]
              else :
                node _T_6 = eq(UInt<4>("h4"), func7_and_func3) @[ALU.scala 17:33]
                when _T_6 : @[ALU.scala 17:33]
                  node _io_alu_out_T_18 = xor(io.operand1, io.operand2) @[ALU.scala 34:44]
                  io.alu_out <= _io_alu_out_T_18 @[ALU.scala 34:28]
                else :
                  node _T_7 = eq(UInt<4>("h5"), func7_and_func3) @[ALU.scala 17:33]
                  when _T_7 : @[ALU.scala 17:33]
                    node _io_alu_out_T_19 = bits(io.operand2, 4, 0) @[ALU.scala 37:58]
                    node _io_alu_out_T_20 = dshr(io.operand1, _io_alu_out_T_19) @[ALU.scala 37:44]
                    io.alu_out <= _io_alu_out_T_20 @[ALU.scala 37:28]
                  else :
                    node _T_8 = eq(UInt<4>("hd"), func7_and_func3) @[ALU.scala 17:33]
                    when _T_8 : @[ALU.scala 17:33]
                      node _io_alu_out_T_21 = asSInt(io.operand1) @[ALU.scala 40:44]
                      node _io_alu_out_T_22 = bits(io.operand2, 4, 0) @[ALU.scala 40:65]
                      node _io_alu_out_T_23 = dshr(_io_alu_out_T_21, _io_alu_out_T_22) @[ALU.scala 40:51]
                      node _io_alu_out_T_24 = asUInt(_io_alu_out_T_23) @[ALU.scala 40:73]
                      io.alu_out <= _io_alu_out_T_24 @[ALU.scala 40:28]
                    else :
                      node _T_9 = eq(UInt<4>("h6"), func7_and_func3) @[ALU.scala 17:33]
                      when _T_9 : @[ALU.scala 17:33]
                        node _io_alu_out_T_25 = or(io.operand1, io.operand2) @[ALU.scala 43:44]
                        io.alu_out <= _io_alu_out_T_25 @[ALU.scala 43:28]
                      else :
                        node _T_10 = eq(UInt<4>("h7"), func7_and_func3) @[ALU.scala 17:33]
                        when _T_10 : @[ALU.scala 17:33]
                          node _io_alu_out_T_26 = and(io.operand1, io.operand2) @[ALU.scala 46:44]
                          io.alu_out <= _io_alu_out_T_26 @[ALU.scala 46:28]
    else :
      node _T_11 = eq(io.opcode, UInt<5>("h4")) @[ALU.scala 50:27]
      when _T_11 : @[ALU.scala 50:61]
        node _T_12 = eq(UInt<1>("h0"), io.func3) @[ALU.scala 51:26]
        when _T_12 : @[ALU.scala 51:26]
          node _io_alu_out_T_27 = asSInt(io.operand1) @[ALU.scala 53:44]
          node _io_alu_out_T_28 = asSInt(io.operand2) @[ALU.scala 53:65]
          node _io_alu_out_T_29 = add(_io_alu_out_T_27, _io_alu_out_T_28) @[ALU.scala 53:51]
          node _io_alu_out_T_30 = tail(_io_alu_out_T_29, 1) @[ALU.scala 53:51]
          node _io_alu_out_T_31 = asSInt(_io_alu_out_T_30) @[ALU.scala 53:51]
          node _io_alu_out_T_32 = asUInt(_io_alu_out_T_31) @[ALU.scala 53:73]
          io.alu_out <= _io_alu_out_T_32 @[ALU.scala 53:28]
        else :
          node _T_13 = eq(UInt<2>("h2"), io.func3) @[ALU.scala 51:26]
          when _T_13 : @[ALU.scala 51:26]
            node _io_alu_out_T_33 = asSInt(io.operand1) @[ALU.scala 56:44]
            node _io_alu_out_T_34 = asSInt(io.operand2) @[ALU.scala 56:65]
            node _io_alu_out_T_35 = lt(_io_alu_out_T_33, _io_alu_out_T_34) @[ALU.scala 56:51]
            io.alu_out <= _io_alu_out_T_35 @[ALU.scala 56:28]
          else :
            node _T_14 = eq(UInt<2>("h3"), io.func3) @[ALU.scala 51:26]
            when _T_14 : @[ALU.scala 51:26]
              node _io_alu_out_T_36 = lt(io.operand1, io.operand2) @[ALU.scala 59:44]
              io.alu_out <= _io_alu_out_T_36 @[ALU.scala 59:28]
            else :
              node _T_15 = eq(UInt<3>("h4"), io.func3) @[ALU.scala 51:26]
              when _T_15 : @[ALU.scala 51:26]
                node _io_alu_out_T_37 = xor(io.operand1, io.operand2) @[ALU.scala 62:44]
                io.alu_out <= _io_alu_out_T_37 @[ALU.scala 62:28]
              else :
                node _T_16 = eq(UInt<3>("h6"), io.func3) @[ALU.scala 51:26]
                when _T_16 : @[ALU.scala 51:26]
                  node _io_alu_out_T_38 = or(io.operand1, io.operand2) @[ALU.scala 65:44]
                  io.alu_out <= _io_alu_out_T_38 @[ALU.scala 65:28]
                else :
                  node _T_17 = eq(UInt<3>("h7"), io.func3) @[ALU.scala 51:26]
                  when _T_17 : @[ALU.scala 51:26]
                    node _io_alu_out_T_39 = and(io.operand1, io.operand2) @[ALU.scala 68:44]
                    io.alu_out <= _io_alu_out_T_39 @[ALU.scala 68:28]
                  else :
                    node _T_18 = eq(UInt<1>("h1"), io.func3) @[ALU.scala 51:26]
                    when _T_18 : @[ALU.scala 51:26]
                      node _io_alu_out_T_40 = bits(io.operand2, 4, 0) @[ALU.scala 71:58]
                      node _io_alu_out_T_41 = dshl(io.operand1, _io_alu_out_T_40) @[ALU.scala 71:44]
                      io.alu_out <= _io_alu_out_T_41 @[ALU.scala 71:28]
                    else :
                      node _T_19 = eq(UInt<3>("h5"), io.func3) @[ALU.scala 51:26]
                      when _T_19 : @[ALU.scala 51:26]
                        node _T_20 = bits(io.func7, 0, 0) @[ALU.scala 74:31]
                        when _T_20 : @[ALU.scala 74:39]
                          node _io_alu_out_T_42 = asSInt(io.operand1) @[ALU.scala 75:48]
                          node _io_alu_out_T_43 = bits(io.operand2, 4, 0) @[ALU.scala 75:69]
                          node _io_alu_out_T_44 = dshr(_io_alu_out_T_42, _io_alu_out_T_43) @[ALU.scala 75:55]
                          node _io_alu_out_T_45 = asUInt(_io_alu_out_T_44) @[ALU.scala 75:77]
                          io.alu_out <= _io_alu_out_T_45 @[ALU.scala 75:32]
                        else :
                          node _io_alu_out_T_46 = bits(io.operand2, 4, 0) @[ALU.scala 77:62]
                          node _io_alu_out_T_47 = dshr(io.operand1, _io_alu_out_T_46) @[ALU.scala 77:48]
                          io.alu_out <= _io_alu_out_T_47 @[ALU.scala 77:32]
      else :
        node _T_21 = eq(io.opcode, UInt<5>("h18")) @[ALU.scala 82:27]
        when _T_21 : @[ALU.scala 82:60]
          node _T_22 = eq(UInt<1>("h0"), io.func3) @[ALU.scala 83:26]
          when _T_22 : @[ALU.scala 83:26]
            node _io_alu_out_T_48 = eq(io.operand1, io.operand2) @[ALU.scala 85:44]
            io.alu_out <= _io_alu_out_T_48 @[ALU.scala 85:28]
          else :
            node _T_23 = eq(UInt<1>("h1"), io.func3) @[ALU.scala 83:26]
            when _T_23 : @[ALU.scala 83:26]
              node _io_alu_out_T_49 = neq(io.operand1, io.operand2) @[ALU.scala 88:44]
              io.alu_out <= _io_alu_out_T_49 @[ALU.scala 88:28]
            else :
              node _T_24 = eq(UInt<3>("h4"), io.func3) @[ALU.scala 83:26]
              when _T_24 : @[ALU.scala 83:26]
                node _io_alu_out_T_50 = asSInt(io.operand1) @[ALU.scala 91:44]
                node _io_alu_out_T_51 = asSInt(io.operand2) @[ALU.scala 91:65]
                node _io_alu_out_T_52 = lt(_io_alu_out_T_50, _io_alu_out_T_51) @[ALU.scala 91:51]
                io.alu_out <= _io_alu_out_T_52 @[ALU.scala 91:28]
              else :
                node _T_25 = eq(UInt<3>("h5"), io.func3) @[ALU.scala 83:26]
                when _T_25 : @[ALU.scala 83:26]
                  node _io_alu_out_T_53 = asSInt(io.operand1) @[ALU.scala 94:44]
                  node _io_alu_out_T_54 = asSInt(io.operand2) @[ALU.scala 94:66]
                  node _io_alu_out_T_55 = geq(_io_alu_out_T_53, _io_alu_out_T_54) @[ALU.scala 94:51]
                  io.alu_out <= _io_alu_out_T_55 @[ALU.scala 94:28]
                else :
                  node _T_26 = eq(UInt<3>("h6"), io.func3) @[ALU.scala 83:26]
                  when _T_26 : @[ALU.scala 83:26]
                    node _io_alu_out_T_56 = lt(io.operand1, io.operand2) @[ALU.scala 97:44]
                    io.alu_out <= _io_alu_out_T_56 @[ALU.scala 97:28]
                  else :
                    node _T_27 = eq(UInt<3>("h7"), io.func3) @[ALU.scala 83:26]
                    when _T_27 : @[ALU.scala 83:26]
                      node _io_alu_out_T_57 = geq(io.operand1, io.operand2) @[ALU.scala 100:44]
                      io.alu_out <= _io_alu_out_T_57 @[ALU.scala 100:28]
        else :
          node _T_28 = eq(io.opcode, UInt<5>("hd")) @[ALU.scala 106:27]
          when _T_28 : @[ALU.scala 106:62]
            io.alu_out <= io.operand2 @[ALU.scala 107:20]
          else :
            node _T_29 = eq(io.opcode, UInt<5>("h5")) @[ALU.scala 108:27]
            node _T_30 = eq(io.opcode, UInt<5>("h8")) @[ALU.scala 108:76]
            node _T_31 = or(_T_29, _T_30) @[ALU.scala 108:63]
            node _T_32 = eq(io.opcode, UInt<5>("h0")) @[ALU.scala 108:121]
            node _T_33 = or(_T_31, _T_32) @[ALU.scala 108:108]
            when _T_33 : @[ALU.scala 108:155]
              node _io_alu_out_T_58 = add(io.operand1, io.operand2) @[ALU.scala 109:36]
              node _io_alu_out_T_59 = tail(_io_alu_out_T_58, 1) @[ALU.scala 109:36]
              io.alu_out <= _io_alu_out_T_59 @[ALU.scala 109:20]
            else :
              node _T_34 = eq(io.opcode, UInt<5>("h1b")) @[ALU.scala 110:27]
              node _T_35 = eq(io.opcode, UInt<5>("h19")) @[ALU.scala 110:74]
              node _T_36 = or(_T_34, _T_35) @[ALU.scala 110:61]
              when _T_36 : @[ALU.scala 110:110]
                node _io_alu_out_T_60 = add(io.operand1, UInt<3>("h4")) @[ALU.scala 111:36]
                node _io_alu_out_T_61 = tail(_io_alu_out_T_60, 1) @[ALU.scala 111:36]
                io.alu_out <= _io_alu_out_T_61 @[ALU.scala 111:20]
              else :
                io.alu_out <= UInt<1>("h0") @[ALU.scala 113:20]

  module JB_Unit :
    input clock : Clock
    input reset : Reset
    output io : { flip operand1 : UInt<32>, flip operand2 : UInt<32>, jb_out : UInt<32>}

    node _io_jb_out_T = add(io.operand1, io.operand2) @[JB_Unit.scala 11:32]
    node _io_jb_out_T_1 = tail(_io_jb_out_T, 1) @[JB_Unit.scala 11:32]
    node _io_jb_out_T_2 = and(_io_jb_out_T_1, UInt<32>("hffffffff")) @[JB_Unit.scala 11:47]
    io.jb_out <= _io_jb_out_T_2 @[JB_Unit.scala 11:15]

  module Reg_M :
    input clock : Clock
    input reset : Reset
    output io : { flip alu_out : UInt<32>, flip rs2_data : UInt<32>, out_Reg_M_alu_out : UInt<32>, out_Reg_M_rs2_data : UInt<32>}

    reg ALU_OUT_REG : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[Reg_M.scala 12:40]
    reg RS2_DATA_REG : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[Reg_M.scala 13:40]
    ALU_OUT_REG <= io.alu_out @[Reg_M.scala 15:19]
    RS2_DATA_REG <= io.rs2_data @[Reg_M.scala 16:19]
    io.out_Reg_M_alu_out <= ALU_OUT_REG @[Reg_M.scala 18:31]
    io.out_Reg_M_rs2_data <= RS2_DATA_REG @[Reg_M.scala 19:31]

  module SRAM_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip w_en : UInt<4>, flip address : UInt<16>, flip write_data : UInt<32>, read_data : UInt<32>}

    cmem mem : UInt<8> [65536] @[SRAM.scala 12:16]
    node _T = neq(io.w_en, UInt<1>("h0")) @[SRAM.scala 15:16]
    when _T : @[SRAM.scala 15:25]
      node _T_1 = bits(io.w_en, 0, 0) @[SRAM.scala 16:17]
      when _T_1 : @[SRAM.scala 16:22]
        node _T_2 = bits(io.write_data, 7, 0) @[SRAM.scala 16:59]
        write mport MPORT = mem[io.address], clock
        MPORT <= _T_2
      node _T_3 = bits(io.w_en, 1, 1) @[SRAM.scala 17:17]
      when _T_3 : @[SRAM.scala 17:22]
        node _T_4 = add(io.address, UInt<1>("h1")) @[SRAM.scala 17:45]
        node _T_5 = tail(_T_4, 1) @[SRAM.scala 17:45]
        node _T_6 = bits(io.write_data, 15, 8) @[SRAM.scala 17:65]
        write mport MPORT_1 = mem[_T_5], clock
        MPORT_1 <= _T_6
      node _T_7 = bits(io.w_en, 2, 2) @[SRAM.scala 18:17]
      when _T_7 : @[SRAM.scala 18:22]
        node _T_8 = add(io.address, UInt<2>("h2")) @[SRAM.scala 18:45]
        node _T_9 = tail(_T_8, 1) @[SRAM.scala 18:45]
        node _T_10 = bits(io.write_data, 23, 16) @[SRAM.scala 18:65]
        write mport MPORT_2 = mem[_T_9], clock
        MPORT_2 <= _T_10
      node _T_11 = bits(io.w_en, 3, 3) @[SRAM.scala 19:17]
      when _T_11 : @[SRAM.scala 19:22]
        node _T_12 = add(io.address, UInt<2>("h3")) @[SRAM.scala 19:45]
        node _T_13 = tail(_T_12, 1) @[SRAM.scala 19:45]
        node _T_14 = bits(io.write_data, 31, 24) @[SRAM.scala 19:65]
        write mport MPORT_3 = mem[_T_13], clock
        MPORT_3 <= _T_14
    wire read_data_bytes : UInt<8>[4] @[SRAM.scala 23:32]
    read_data_bytes[0] <= UInt<8>("h0") @[SRAM.scala 23:32]
    read_data_bytes[1] <= UInt<8>("h0") @[SRAM.scala 23:32]
    read_data_bytes[2] <= UInt<8>("h0") @[SRAM.scala 23:32]
    read_data_bytes[3] <= UInt<8>("h0") @[SRAM.scala 23:32]
    read mport read_data_bytes_0_MPORT = mem[io.address], clock @[SRAM.scala 24:33]
    read_data_bytes[0] <= read_data_bytes_0_MPORT @[SRAM.scala 24:22]
    node _read_data_bytes_1_T = add(io.address, UInt<1>("h1")) @[SRAM.scala 25:45]
    node _read_data_bytes_1_T_1 = tail(_read_data_bytes_1_T, 1) @[SRAM.scala 25:45]
    read mport read_data_bytes_1_MPORT = mem[_read_data_bytes_1_T_1], clock @[SRAM.scala 25:33]
    read_data_bytes[1] <= read_data_bytes_1_MPORT @[SRAM.scala 25:22]
    node _read_data_bytes_2_T = add(io.address, UInt<2>("h2")) @[SRAM.scala 26:45]
    node _read_data_bytes_2_T_1 = tail(_read_data_bytes_2_T, 1) @[SRAM.scala 26:45]
    read mport read_data_bytes_2_MPORT = mem[_read_data_bytes_2_T_1], clock @[SRAM.scala 26:33]
    read_data_bytes[2] <= read_data_bytes_2_MPORT @[SRAM.scala 26:22]
    node _read_data_bytes_3_T = add(io.address, UInt<2>("h3")) @[SRAM.scala 27:45]
    node _read_data_bytes_3_T_1 = tail(_read_data_bytes_3_T, 1) @[SRAM.scala 27:45]
    read mport read_data_bytes_3_MPORT = mem[_read_data_bytes_3_T_1], clock @[SRAM.scala 27:33]
    read_data_bytes[3] <= read_data_bytes_3_MPORT @[SRAM.scala 27:22]
    node io_read_data_lo = cat(read_data_bytes[1], read_data_bytes[0]) @[Cat.scala 31:58]
    node io_read_data_hi = cat(read_data_bytes[3], read_data_bytes[2]) @[Cat.scala 31:58]
    node _io_read_data_T = cat(io_read_data_hi, io_read_data_lo) @[Cat.scala 31:58]
    io.read_data <= _io_read_data_T @[SRAM.scala 29:16]

  module Reg_W :
    input clock : Clock
    input reset : Reset
    output io : { flip alu_out : UInt<32>, flip ld_data : UInt<32>, out_Reg_W_alu_out : UInt<32>, out_Reg_W_ld_data : UInt<32>}

    reg ALU_OUT_REG : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[Reg_W.scala 12:40]
    reg LD_DATA_REG : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[Reg_W.scala 13:40]
    ALU_OUT_REG <= io.alu_out @[Reg_W.scala 15:19]
    LD_DATA_REG <= io.ld_data @[Reg_W.scala 16:19]
    io.out_Reg_W_alu_out <= ALU_OUT_REG @[Reg_W.scala 18:31]
    io.out_Reg_W_ld_data <= LD_DATA_REG @[Reg_W.scala 19:31]

  module LD_Filter :
    input clock : Clock
    input reset : Reset
    output io : { flip func3 : UInt<3>, flip ld_data : UInt<32>, ld_data_f : UInt<32>}

    io.ld_data_f <= UInt<32>("h0") @[LD_Filter.scala 12:25]
    node _T = eq(UInt<3>("h0"), io.func3) @[LD_Filter.scala 13:21]
    when _T : @[LD_Filter.scala 13:21]
      node _io_ld_data_f_T = bits(io.ld_data, 7, 7) @[LD_Filter.scala 15:55]
      node _io_ld_data_f_T_1 = bits(_io_ld_data_f_T, 0, 0) @[Bitwise.scala 74:15]
      node _io_ld_data_f_T_2 = mux(_io_ld_data_f_T_1, UInt<24>("hffffff"), UInt<24>("h0")) @[Bitwise.scala 74:12]
      node _io_ld_data_f_T_3 = bits(io.ld_data, 7, 0) @[LD_Filter.scala 15:71]
      node _io_ld_data_f_T_4 = cat(_io_ld_data_f_T_2, _io_ld_data_f_T_3) @[Cat.scala 31:58]
      io.ld_data_f <= _io_ld_data_f_T_4 @[LD_Filter.scala 15:29]
    else :
      node _T_1 = eq(UInt<3>("h1"), io.func3) @[LD_Filter.scala 13:21]
      when _T_1 : @[LD_Filter.scala 13:21]
        node _io_ld_data_f_T_5 = bits(io.ld_data, 15, 15) @[LD_Filter.scala 18:55]
        node _io_ld_data_f_T_6 = bits(_io_ld_data_f_T_5, 0, 0) @[Bitwise.scala 74:15]
        node _io_ld_data_f_T_7 = mux(_io_ld_data_f_T_6, UInt<16>("hffff"), UInt<16>("h0")) @[Bitwise.scala 74:12]
        node _io_ld_data_f_T_8 = bits(io.ld_data, 15, 0) @[LD_Filter.scala 18:72]
        node _io_ld_data_f_T_9 = cat(_io_ld_data_f_T_7, _io_ld_data_f_T_8) @[Cat.scala 31:58]
        io.ld_data_f <= _io_ld_data_f_T_9 @[LD_Filter.scala 18:29]
      else :
        node _T_2 = eq(UInt<3>("h2"), io.func3) @[LD_Filter.scala 13:21]
        when _T_2 : @[LD_Filter.scala 13:21]
          io.ld_data_f <= io.ld_data @[LD_Filter.scala 21:29]
        else :
          node _T_3 = eq(UInt<3>("h4"), io.func3) @[LD_Filter.scala 13:21]
          when _T_3 : @[LD_Filter.scala 13:21]
            node _io_ld_data_f_T_10 = bits(io.ld_data, 7, 0) @[LD_Filter.scala 24:57]
            node _io_ld_data_f_T_11 = cat(UInt<24>("h0"), _io_ld_data_f_T_10) @[Cat.scala 31:58]
            io.ld_data_f <= _io_ld_data_f_T_11 @[LD_Filter.scala 24:29]
          else :
            node _T_4 = eq(UInt<3>("h5"), io.func3) @[LD_Filter.scala 13:21]
            when _T_4 : @[LD_Filter.scala 13:21]
              node _io_ld_data_f_T_12 = bits(io.ld_data, 15, 0) @[LD_Filter.scala 27:57]
              node _io_ld_data_f_T_13 = cat(UInt<16>("h0"), _io_ld_data_f_T_12) @[Cat.scala 31:58]
              io.ld_data_f <= _io_ld_data_f_T_13 @[LD_Filter.scala 27:29]

  module Controller :
    input clock : Clock
    input reset : Reset
    output io : { flip op : UInt<5>, flip f3 : UInt<3>, flip rd : UInt<5>, flip rs1 : UInt<5>, flip rs2 : UInt<5>, flip f7 : UInt<1>, flip alu_out : UInt<1>, stall : UInt<1>, next_pc_sel : UInt<1>, F_im_w_en : UInt<4>, D_rs1_data_sel : UInt<1>, D_rs2_data_sel : UInt<1>, E_rs1_data_sel : UInt<2>, E_rs2_data_sel : UInt<2>, E_jb_op1_sel : UInt<1>, E_alu_op1_sel : UInt<1>, E_alu_op2_sel : UInt<1>, E_op : UInt<5>, E_f3 : UInt<3>, E_f7 : UInt<1>, M_dm_w_en : UInt<4>, W_wb_en : UInt<1>, W_rd_index : UInt<5>, W_f3 : UInt<3>, W_wb_data_sel : UInt<1>}

    reg IN_E_OP_REG : UInt<5>, clock with :
      reset => (reset, UInt<5>("h0")) @[Controller.scala 46:38]
    reg IN_E_F3_REG : UInt<3>, clock with :
      reset => (reset, UInt<3>("h0")) @[Controller.scala 47:38]
    reg IN_E_RD_REG : UInt<5>, clock with :
      reset => (reset, UInt<5>("h0")) @[Controller.scala 48:38]
    reg IN_E_RS1_REG : UInt<5>, clock with :
      reset => (reset, UInt<5>("h0")) @[Controller.scala 49:38]
    reg IN_E_RS2_REG : UInt<5>, clock with :
      reset => (reset, UInt<5>("h0")) @[Controller.scala 50:38]
    reg IN_E_F7_REG : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[Controller.scala 51:38]
    reg IN_M_OP_REG : UInt<5>, clock with :
      reset => (reset, UInt<5>("h0")) @[Controller.scala 53:38]
    reg IN_M_F3_REG : UInt<3>, clock with :
      reset => (reset, UInt<3>("h0")) @[Controller.scala 54:38]
    reg IN_M_RD_REG : UInt<5>, clock with :
      reset => (reset, UInt<5>("h0")) @[Controller.scala 55:38]
    reg IN_W_OP_REG : UInt<5>, clock with :
      reset => (reset, UInt<5>("h0")) @[Controller.scala 57:38]
    reg IN_W_F3_REG : UInt<3>, clock with :
      reset => (reset, UInt<3>("h0")) @[Controller.scala 58:38]
    reg IN_W_RD_REG : UInt<5>, clock with :
      reset => (reset, UInt<5>("h0")) @[Controller.scala 59:38]
    node _T = or(io.stall, io.next_pc_sel) @[Controller.scala 61:19]
    when _T : @[Controller.scala 61:37]
      IN_E_OP_REG <= UInt<5>("hc") @[Controller.scala 63:25]
      IN_E_F3_REG <= UInt<3>("h0") @[Controller.scala 64:25]
      IN_E_RD_REG <= UInt<5>("h0") @[Controller.scala 65:25]
      IN_E_RS1_REG <= UInt<5>("h0") @[Controller.scala 66:25]
      IN_E_RS2_REG <= UInt<5>("h0") @[Controller.scala 67:25]
      IN_E_F7_REG <= UInt<1>("h0") @[Controller.scala 68:25]
      IN_M_OP_REG <= IN_E_OP_REG @[Controller.scala 71:25]
      IN_M_F3_REG <= IN_E_F3_REG @[Controller.scala 72:25]
      IN_M_RD_REG <= IN_E_RD_REG @[Controller.scala 73:25]
      IN_W_OP_REG <= IN_M_OP_REG @[Controller.scala 76:25]
      IN_W_F3_REG <= IN_M_F3_REG @[Controller.scala 77:25]
      IN_W_RD_REG <= IN_M_RD_REG @[Controller.scala 78:25]
    else :
      IN_E_OP_REG <= io.op @[Controller.scala 81:25]
      IN_E_F3_REG <= io.f3 @[Controller.scala 82:25]
      IN_E_RD_REG <= io.rd @[Controller.scala 83:25]
      IN_E_RS1_REG <= io.rs1 @[Controller.scala 84:25]
      IN_E_RS2_REG <= io.rs2 @[Controller.scala 85:25]
      IN_E_F7_REG <= io.f7 @[Controller.scala 86:25]
      IN_M_OP_REG <= IN_E_OP_REG @[Controller.scala 89:25]
      IN_M_F3_REG <= IN_E_F3_REG @[Controller.scala 90:25]
      IN_M_RD_REG <= IN_E_RD_REG @[Controller.scala 91:25]
      IN_W_OP_REG <= IN_M_OP_REG @[Controller.scala 94:25]
      IN_W_F3_REG <= IN_M_F3_REG @[Controller.scala 95:25]
      IN_W_RD_REG <= IN_M_RD_REG @[Controller.scala 96:25]
    wire is_D_use_rs1 : UInt<1> @[Controller.scala 101:28]
    wire is_D_use_rs2 : UInt<1> @[Controller.scala 102:28]
    wire is_W_use_rd : UInt<1> @[Controller.scala 103:27]
    wire is_D_rs1_W_rd_overlap : UInt<1> @[Controller.scala 104:37]
    wire is_D_rs2_W_rd_overlap : UInt<1> @[Controller.scala 105:37]
    wire is_E_use_rs1 : UInt<1> @[Controller.scala 107:28]
    wire is_E_use_rs2 : UInt<1> @[Controller.scala 108:28]
    wire is_M_use_rd : UInt<1> @[Controller.scala 109:27]
    wire is_E_rs1_W_rd_overlap : UInt<1> @[Controller.scala 110:37]
    wire is_E_rs1_M_rd_overlap : UInt<1> @[Controller.scala 111:37]
    wire is_E_rs2_W_rd_overlap : UInt<1> @[Controller.scala 112:37]
    wire is_E_rs2_M_rd_overlap : UInt<1> @[Controller.scala 113:37]
    wire is_DE_overlap : UInt<1> @[Controller.scala 115:29]
    wire is_D_rs1_E_rd_overlap : UInt<1> @[Controller.scala 116:37]
    wire is_D_rs2_E_rd_overlap : UInt<1> @[Controller.scala 117:37]
    node _T_1 = eq(io.op, UInt<5>("hd")) @[Controller.scala 121:15]
    node _T_2 = eq(io.op, UInt<5>("h5")) @[Controller.scala 122:15]
    node _T_3 = or(_T_1, _T_2) @[Controller.scala 121:49]
    node _T_4 = eq(io.op, UInt<5>("h1b")) @[Controller.scala 123:15]
    node _T_5 = or(_T_3, _T_4) @[Controller.scala 122:51]
    when _T_5 : @[Controller.scala 124:6]
      is_D_use_rs1 <= UInt<1>("h0") @[Controller.scala 125:22]
    else :
      is_D_use_rs1 <= UInt<1>("h1") @[Controller.scala 127:22]
    node _T_6 = eq(io.op, UInt<5>("hc")) @[Controller.scala 132:15]
    node _T_7 = eq(io.op, UInt<5>("h8")) @[Controller.scala 133:15]
    node _T_8 = or(_T_6, _T_7) @[Controller.scala 132:47]
    node _T_9 = eq(io.op, UInt<5>("h18")) @[Controller.scala 134:15]
    node _T_10 = or(_T_8, _T_9) @[Controller.scala 133:47]
    when _T_10 : @[Controller.scala 135:6]
      is_D_use_rs2 <= UInt<1>("h1") @[Controller.scala 136:22]
    else :
      is_D_use_rs2 <= UInt<1>("h0") @[Controller.scala 138:22]
    node _T_11 = eq(IN_E_OP_REG, UInt<5>("hd")) @[Controller.scala 143:21]
    node _T_12 = eq(IN_E_OP_REG, UInt<5>("h5")) @[Controller.scala 144:21]
    node _T_13 = or(_T_11, _T_12) @[Controller.scala 143:55]
    node _T_14 = eq(IN_E_OP_REG, UInt<5>("h1b")) @[Controller.scala 145:21]
    node _T_15 = or(_T_13, _T_14) @[Controller.scala 144:57]
    when _T_15 : @[Controller.scala 146:6]
      is_E_use_rs1 <= UInt<1>("h0") @[Controller.scala 147:22]
    else :
      is_E_use_rs1 <= UInt<1>("h1") @[Controller.scala 149:22]
    node _T_16 = eq(IN_E_OP_REG, UInt<5>("hc")) @[Controller.scala 154:21]
    node _T_17 = eq(IN_E_OP_REG, UInt<5>("h8")) @[Controller.scala 155:21]
    node _T_18 = or(_T_16, _T_17) @[Controller.scala 154:53]
    node _T_19 = eq(IN_E_OP_REG, UInt<5>("h18")) @[Controller.scala 156:21]
    node _T_20 = or(_T_18, _T_19) @[Controller.scala 155:53]
    when _T_20 : @[Controller.scala 157:6]
      is_E_use_rs2 <= UInt<1>("h1") @[Controller.scala 158:22]
    else :
      is_E_use_rs2 <= UInt<1>("h0") @[Controller.scala 160:22]
    node _T_21 = eq(IN_M_OP_REG, UInt<5>("h18")) @[Controller.scala 165:21]
    node _T_22 = eq(IN_M_OP_REG, UInt<5>("h8")) @[Controller.scala 166:21]
    node _T_23 = or(_T_21, _T_22) @[Controller.scala 165:53]
    when _T_23 : @[Controller.scala 167:7]
      is_M_use_rd <= UInt<1>("h0") @[Controller.scala 168:21]
    else :
      is_M_use_rd <= UInt<1>("h1") @[Controller.scala 170:21]
    node _T_24 = eq(IN_W_OP_REG, UInt<5>("h18")) @[Controller.scala 175:21]
    node _T_25 = eq(IN_W_OP_REG, UInt<5>("h8")) @[Controller.scala 176:21]
    node _T_26 = or(_T_24, _T_25) @[Controller.scala 175:53]
    when _T_26 : @[Controller.scala 177:7]
      is_W_use_rd <= UInt<1>("h0") @[Controller.scala 178:21]
    else :
      is_W_use_rd <= UInt<1>("h1") @[Controller.scala 180:21]
    node _is_D_rs1_W_rd_overlap_T = and(is_D_use_rs1, is_W_use_rd) @[Controller.scala 184:43]
    node _is_D_rs1_W_rd_overlap_T_1 = eq(io.rs1, IN_W_RD_REG) @[Controller.scala 184:69]
    node _is_D_rs1_W_rd_overlap_T_2 = and(_is_D_rs1_W_rd_overlap_T, _is_D_rs1_W_rd_overlap_T_1) @[Controller.scala 184:58]
    node _is_D_rs1_W_rd_overlap_T_3 = neq(IN_W_RD_REG, UInt<1>("h0")) @[Controller.scala 184:102]
    node _is_D_rs1_W_rd_overlap_T_4 = and(_is_D_rs1_W_rd_overlap_T_2, _is_D_rs1_W_rd_overlap_T_3) @[Controller.scala 184:86]
    is_D_rs1_W_rd_overlap <= _is_D_rs1_W_rd_overlap_T_4 @[Controller.scala 184:27]
    node _is_D_rs2_W_rd_overlap_T = and(is_D_use_rs2, is_W_use_rd) @[Controller.scala 185:43]
    node _is_D_rs2_W_rd_overlap_T_1 = eq(io.rs2, IN_W_RD_REG) @[Controller.scala 185:69]
    node _is_D_rs2_W_rd_overlap_T_2 = and(_is_D_rs2_W_rd_overlap_T, _is_D_rs2_W_rd_overlap_T_1) @[Controller.scala 185:58]
    node _is_D_rs2_W_rd_overlap_T_3 = neq(IN_W_RD_REG, UInt<1>("h0")) @[Controller.scala 185:102]
    node _is_D_rs2_W_rd_overlap_T_4 = and(_is_D_rs2_W_rd_overlap_T_2, _is_D_rs2_W_rd_overlap_T_3) @[Controller.scala 185:86]
    is_D_rs2_W_rd_overlap <= _is_D_rs2_W_rd_overlap_T_4 @[Controller.scala 185:27]
    node _io_D_rs1_data_sel_T = mux(is_D_rs1_W_rd_overlap, UInt<1>("h1"), UInt<1>("h0")) @[Controller.scala 186:29]
    io.D_rs1_data_sel <= _io_D_rs1_data_sel_T @[Controller.scala 186:23]
    node _io_D_rs2_data_sel_T = mux(is_D_rs2_W_rd_overlap, UInt<1>("h1"), UInt<1>("h0")) @[Controller.scala 187:29]
    io.D_rs2_data_sel <= _io_D_rs2_data_sel_T @[Controller.scala 187:23]
    node _is_E_rs1_W_rd_overlap_T = and(is_E_use_rs1, is_W_use_rd) @[Controller.scala 190:43]
    node _is_E_rs1_W_rd_overlap_T_1 = eq(IN_E_RS1_REG, IN_W_RD_REG) @[Controller.scala 190:75]
    node _is_E_rs1_W_rd_overlap_T_2 = and(_is_E_rs1_W_rd_overlap_T, _is_E_rs1_W_rd_overlap_T_1) @[Controller.scala 190:58]
    node _is_E_rs1_W_rd_overlap_T_3 = neq(IN_W_RD_REG, UInt<1>("h0")) @[Controller.scala 190:108]
    node _is_E_rs1_W_rd_overlap_T_4 = and(_is_E_rs1_W_rd_overlap_T_2, _is_E_rs1_W_rd_overlap_T_3) @[Controller.scala 190:92]
    is_E_rs1_W_rd_overlap <= _is_E_rs1_W_rd_overlap_T_4 @[Controller.scala 190:27]
    node _is_E_rs1_M_rd_overlap_T = and(is_E_use_rs1, is_M_use_rd) @[Controller.scala 191:43]
    node _is_E_rs1_M_rd_overlap_T_1 = eq(IN_E_RS1_REG, IN_M_RD_REG) @[Controller.scala 191:75]
    node _is_E_rs1_M_rd_overlap_T_2 = and(_is_E_rs1_M_rd_overlap_T, _is_E_rs1_M_rd_overlap_T_1) @[Controller.scala 191:58]
    node _is_E_rs1_M_rd_overlap_T_3 = neq(IN_M_RD_REG, UInt<1>("h0")) @[Controller.scala 191:108]
    node _is_E_rs1_M_rd_overlap_T_4 = and(_is_E_rs1_M_rd_overlap_T_2, _is_E_rs1_M_rd_overlap_T_3) @[Controller.scala 191:92]
    is_E_rs1_M_rd_overlap <= _is_E_rs1_M_rd_overlap_T_4 @[Controller.scala 191:27]
    node _io_E_rs1_data_sel_T = mux(is_E_rs1_W_rd_overlap, UInt<2>("h0"), UInt<2>("h2")) @[Controller.scala 192:67]
    node _io_E_rs1_data_sel_T_1 = mux(is_E_rs1_M_rd_overlap, UInt<2>("h1"), _io_E_rs1_data_sel_T) @[Controller.scala 192:30]
    io.E_rs1_data_sel <= _io_E_rs1_data_sel_T_1 @[Controller.scala 192:24]
    node _is_E_rs2_W_rd_overlap_T = and(is_E_use_rs2, is_W_use_rd) @[Controller.scala 193:43]
    node _is_E_rs2_W_rd_overlap_T_1 = eq(IN_E_RS2_REG, IN_W_RD_REG) @[Controller.scala 193:75]
    node _is_E_rs2_W_rd_overlap_T_2 = and(_is_E_rs2_W_rd_overlap_T, _is_E_rs2_W_rd_overlap_T_1) @[Controller.scala 193:58]
    node _is_E_rs2_W_rd_overlap_T_3 = neq(IN_W_RD_REG, UInt<1>("h0")) @[Controller.scala 193:108]
    node _is_E_rs2_W_rd_overlap_T_4 = and(_is_E_rs2_W_rd_overlap_T_2, _is_E_rs2_W_rd_overlap_T_3) @[Controller.scala 193:92]
    is_E_rs2_W_rd_overlap <= _is_E_rs2_W_rd_overlap_T_4 @[Controller.scala 193:27]
    node _is_E_rs2_M_rd_overlap_T = and(is_E_use_rs2, is_M_use_rd) @[Controller.scala 194:43]
    node _is_E_rs2_M_rd_overlap_T_1 = eq(IN_E_RS2_REG, IN_M_RD_REG) @[Controller.scala 194:75]
    node _is_E_rs2_M_rd_overlap_T_2 = and(_is_E_rs2_M_rd_overlap_T, _is_E_rs2_M_rd_overlap_T_1) @[Controller.scala 194:58]
    node _is_E_rs2_M_rd_overlap_T_3 = neq(IN_M_RD_REG, UInt<1>("h0")) @[Controller.scala 194:108]
    node _is_E_rs2_M_rd_overlap_T_4 = and(_is_E_rs2_M_rd_overlap_T_2, _is_E_rs2_M_rd_overlap_T_3) @[Controller.scala 194:92]
    is_E_rs2_M_rd_overlap <= _is_E_rs2_M_rd_overlap_T_4 @[Controller.scala 194:27]
    node _io_E_rs2_data_sel_T = mux(is_E_rs2_W_rd_overlap, UInt<2>("h0"), UInt<2>("h2")) @[Controller.scala 195:67]
    node _io_E_rs2_data_sel_T_1 = mux(is_E_rs2_M_rd_overlap, UInt<2>("h1"), _io_E_rs2_data_sel_T) @[Controller.scala 195:30]
    io.E_rs2_data_sel <= _io_E_rs2_data_sel_T_1 @[Controller.scala 195:24]
    node _is_D_rs1_E_rd_overlap_T = eq(io.rs1, IN_E_RD_REG) @[Controller.scala 198:54]
    node _is_D_rs1_E_rd_overlap_T_1 = and(is_D_use_rs1, _is_D_rs1_E_rd_overlap_T) @[Controller.scala 198:43]
    node _is_D_rs1_E_rd_overlap_T_2 = neq(IN_E_RD_REG, UInt<1>("h0")) @[Controller.scala 198:87]
    node _is_D_rs1_E_rd_overlap_T_3 = and(_is_D_rs1_E_rd_overlap_T_1, _is_D_rs1_E_rd_overlap_T_2) @[Controller.scala 198:71]
    is_D_rs1_E_rd_overlap <= _is_D_rs1_E_rd_overlap_T_3 @[Controller.scala 198:27]
    node _is_D_rs2_E_rd_overlap_T = eq(io.rs2, IN_E_RD_REG) @[Controller.scala 199:54]
    node _is_D_rs2_E_rd_overlap_T_1 = and(is_D_use_rs2, _is_D_rs2_E_rd_overlap_T) @[Controller.scala 199:43]
    node _is_D_rs2_E_rd_overlap_T_2 = neq(IN_E_RD_REG, UInt<1>("h0")) @[Controller.scala 199:87]
    node _is_D_rs2_E_rd_overlap_T_3 = and(_is_D_rs2_E_rd_overlap_T_1, _is_D_rs2_E_rd_overlap_T_2) @[Controller.scala 199:71]
    is_D_rs2_E_rd_overlap <= _is_D_rs2_E_rd_overlap_T_3 @[Controller.scala 199:27]
    node _is_DE_overlap_T = or(is_D_rs1_E_rd_overlap, is_D_rs2_E_rd_overlap) @[Controller.scala 200:45]
    is_DE_overlap <= _is_DE_overlap_T @[Controller.scala 200:19]
    node _io_stall_T = eq(IN_E_OP_REG, UInt<5>("h0")) @[Controller.scala 201:30]
    node _io_stall_T_1 = and(_io_stall_T, is_DE_overlap) @[Controller.scala 201:64]
    io.stall <= _io_stall_T_1 @[Controller.scala 201:14]
    io.E_op <= IN_E_OP_REG @[Controller.scala 207:13]
    io.E_f3 <= IN_E_F3_REG @[Controller.scala 208:13]
    io.E_f7 <= IN_E_F7_REG @[Controller.scala 209:13]
    io.next_pc_sel <= UInt<1>("h0") @[Controller.scala 212:25]
    io.E_jb_op1_sel <= UInt<1>("h0") @[Controller.scala 213:25]
    io.E_alu_op1_sel <= UInt<1>("h0") @[Controller.scala 214:25]
    io.E_alu_op2_sel <= UInt<1>("h0") @[Controller.scala 215:25]
    node _T_27 = eq(UInt<5>("h1b"), IN_E_OP_REG) @[Controller.scala 217:24]
    when _T_27 : @[Controller.scala 217:24]
      io.next_pc_sel <= UInt<1>("h1") @[Controller.scala 219:33]
      io.E_jb_op1_sel <= UInt<1>("h0") @[Controller.scala 220:33]
      io.E_alu_op1_sel <= UInt<1>("h0") @[Controller.scala 221:33]
      io.E_alu_op2_sel <= UInt<1>("h0") @[Controller.scala 222:33]
    else :
      node _T_28 = eq(UInt<5>("h19"), IN_E_OP_REG) @[Controller.scala 217:24]
      when _T_28 : @[Controller.scala 217:24]
        io.next_pc_sel <= UInt<1>("h1") @[Controller.scala 225:33]
        io.E_jb_op1_sel <= UInt<1>("h1") @[Controller.scala 226:33]
        io.E_alu_op1_sel <= UInt<1>("h0") @[Controller.scala 227:33]
        io.E_alu_op2_sel <= UInt<1>("h0") @[Controller.scala 228:33]
      else :
        node _T_29 = eq(UInt<5>("h18"), IN_E_OP_REG) @[Controller.scala 217:24]
        when _T_29 : @[Controller.scala 217:24]
          io.next_pc_sel <= io.alu_out @[Controller.scala 231:33]
          io.E_jb_op1_sel <= UInt<1>("h0") @[Controller.scala 232:33]
          io.E_alu_op1_sel <= UInt<1>("h1") @[Controller.scala 233:33]
          io.E_alu_op2_sel <= UInt<1>("h1") @[Controller.scala 234:33]
        else :
          node _T_30 = eq(UInt<5>("hc"), IN_E_OP_REG) @[Controller.scala 217:24]
          when _T_30 : @[Controller.scala 217:24]
            io.next_pc_sel <= UInt<1>("h0") @[Controller.scala 237:33]
            io.E_jb_op1_sel <= UInt<1>("h0") @[Controller.scala 238:33]
            io.E_alu_op1_sel <= UInt<1>("h1") @[Controller.scala 239:33]
            io.E_alu_op2_sel <= UInt<1>("h1") @[Controller.scala 240:33]
          else :
            node _T_31 = eq(UInt<5>("h4"), IN_E_OP_REG) @[Controller.scala 217:24]
            when _T_31 : @[Controller.scala 217:24]
              io.next_pc_sel <= UInt<1>("h0") @[Controller.scala 243:33]
              io.E_jb_op1_sel <= UInt<1>("h0") @[Controller.scala 244:33]
              io.E_alu_op1_sel <= UInt<1>("h1") @[Controller.scala 245:33]
              io.E_alu_op2_sel <= UInt<1>("h0") @[Controller.scala 246:33]
            else :
              node _T_32 = eq(UInt<5>("h0"), IN_E_OP_REG) @[Controller.scala 217:24]
              when _T_32 : @[Controller.scala 217:24]
                io.next_pc_sel <= UInt<1>("h0") @[Controller.scala 249:33]
                io.E_jb_op1_sel <= UInt<1>("h0") @[Controller.scala 250:33]
                io.E_alu_op1_sel <= UInt<1>("h1") @[Controller.scala 251:33]
                io.E_alu_op2_sel <= UInt<1>("h0") @[Controller.scala 252:33]
              else :
                node _T_33 = eq(UInt<5>("h8"), IN_E_OP_REG) @[Controller.scala 217:24]
                when _T_33 : @[Controller.scala 217:24]
                  io.next_pc_sel <= UInt<1>("h0") @[Controller.scala 255:33]
                  io.E_jb_op1_sel <= UInt<1>("h0") @[Controller.scala 256:33]
                  io.E_alu_op1_sel <= UInt<1>("h1") @[Controller.scala 257:33]
                  io.E_alu_op2_sel <= UInt<1>("h0") @[Controller.scala 258:33]
                else :
                  node _T_34 = eq(UInt<5>("h5"), IN_E_OP_REG) @[Controller.scala 217:24]
                  when _T_34 : @[Controller.scala 217:24]
                    io.next_pc_sel <= UInt<1>("h0") @[Controller.scala 261:33]
                    io.E_jb_op1_sel <= UInt<1>("h0") @[Controller.scala 262:33]
                    io.E_alu_op1_sel <= UInt<1>("h0") @[Controller.scala 263:33]
                    io.E_alu_op2_sel <= UInt<1>("h0") @[Controller.scala 264:33]
                  else :
                    node _T_35 = eq(UInt<5>("hd"), IN_E_OP_REG) @[Controller.scala 217:24]
                    when _T_35 : @[Controller.scala 217:24]
                      io.next_pc_sel <= UInt<1>("h0") @[Controller.scala 267:33]
                      io.E_jb_op1_sel <= UInt<1>("h0") @[Controller.scala 268:33]
                      io.E_alu_op1_sel <= UInt<1>("h0") @[Controller.scala 269:33]
                      io.E_alu_op2_sel <= UInt<1>("h0") @[Controller.scala 270:33]
    node _T_36 = eq(IN_M_OP_REG, UInt<5>("h8")) @[Controller.scala 275:22]
    when _T_36 : @[Controller.scala 275:54]
      io.M_dm_w_en <= UInt<4>("h0") @[Controller.scala 276:22]
      node _T_37 = eq(UInt<1>("h0"), IN_M_F3_REG) @[Controller.scala 277:28]
      when _T_37 : @[Controller.scala 277:28]
        io.M_dm_w_en <= UInt<4>("h1") @[Controller.scala 279:30]
      else :
        node _T_38 = eq(UInt<1>("h1"), IN_M_F3_REG) @[Controller.scala 277:28]
        when _T_38 : @[Controller.scala 277:28]
          io.M_dm_w_en <= UInt<4>("h3") @[Controller.scala 282:30]
        else :
          node _T_39 = eq(UInt<2>("h2"), IN_M_F3_REG) @[Controller.scala 277:28]
          when _T_39 : @[Controller.scala 277:28]
            io.M_dm_w_en <= UInt<4>("hf") @[Controller.scala 285:30]
    else :
      io.M_dm_w_en <= UInt<4>("h0") @[Controller.scala 289:22]
    io.W_rd_index <= IN_W_RD_REG @[Controller.scala 293:21]
    io.W_f3 <= IN_W_F3_REG @[Controller.scala 294:21]
    node _T_40 = eq(IN_W_OP_REG, UInt<5>("h18")) @[Controller.scala 297:21]
    node _T_41 = eq(IN_W_OP_REG, UInt<5>("h8")) @[Controller.scala 298:21]
    node _T_42 = or(_T_40, _T_41) @[Controller.scala 297:53]
    when _T_42 : @[Controller.scala 299:6]
      io.W_wb_en <= UInt<1>("h0") @[Controller.scala 300:20]
      io.W_wb_data_sel <= UInt<1>("h0") @[Controller.scala 301:26]
    else :
      io.W_wb_en <= UInt<1>("h1") @[Controller.scala 303:20]
      node _T_43 = eq(IN_W_OP_REG, UInt<5>("h0")) @[Controller.scala 304:26]
      when _T_43 : @[Controller.scala 304:59]
        io.W_wb_data_sel <= UInt<1>("h0") @[Controller.scala 305:30]
      else :
        io.W_wb_data_sel <= UInt<1>("h1") @[Controller.scala 307:30]
    io.F_im_w_en <= UInt<4>("h0") @[Controller.scala 310:18]

  module Top :
    input clock : Clock
    input reset : UInt<1>
    output io : { pc_out : UInt<32>}

    inst reg_pc of Reg_PC @[Top.scala 9:33]
    reg_pc.clock <= clock
    reg_pc.reset <= reset
    inst im of SRAM @[Top.scala 10:33]
    im.clock <= clock
    im.reset <= reset
    inst reg_d of Reg_D @[Top.scala 11:33]
    reg_d.clock <= clock
    reg_d.reset <= reset
    inst decoder of Decoder @[Top.scala 12:33]
    decoder.clock <= clock
    decoder.reset <= reset
    inst imm_ext of Imm_Ext @[Top.scala 13:33]
    imm_ext.clock <= clock
    imm_ext.reset <= reset
    inst regfile of RegFile @[Top.scala 14:33]
    regfile.clock <= clock
    regfile.reset <= reset
    inst reg_e of Reg_E @[Top.scala 15:33]
    reg_e.clock <= clock
    reg_e.reset <= reset
    inst alu of ALU @[Top.scala 16:33]
    alu.clock <= clock
    alu.reset <= reset
    inst jb_unit of JB_Unit @[Top.scala 17:33]
    jb_unit.clock <= clock
    jb_unit.reset <= reset
    inst reg_m of Reg_M @[Top.scala 18:33]
    reg_m.clock <= clock
    reg_m.reset <= reset
    inst dm of SRAM_1 @[Top.scala 19:33]
    dm.clock <= clock
    dm.reset <= reset
    inst reg_w of Reg_W @[Top.scala 20:33]
    reg_w.clock <= clock
    reg_w.reset <= reset
    inst Ld_filter of LD_Filter @[Top.scala 21:33]
    Ld_filter.clock <= clock
    Ld_filter.reset <= reset
    inst controller of Controller @[Top.scala 22:33]
    controller.clock <= clock
    controller.reset <= reset
    wire to_pc_reg : UInt<32> @[Top.scala 26:39]
    wire out_pc_reg : UInt<32> @[Top.scala 27:39]
    wire out_Reg_D_pc : UInt<32> @[Top.scala 28:39]
    wire out_Reg_E_pc : UInt<32> @[Top.scala 29:39]
    wire inst_to_Reg_D : UInt<32> @[Top.scala 31:39]
    wire inst_out_Reg_D : UInt<32> @[Top.scala 32:39]
    wire opcode : UInt<5> @[Top.scala 34:39]
    wire func3 : UInt<3> @[Top.scala 35:39]
    wire func7 : UInt<1> @[Top.scala 36:39]
    wire rs1_index : UInt<5> @[Top.scala 37:39]
    wire rs2_index : UInt<5> @[Top.scala 38:39]
    wire rd_index : UInt<5> @[Top.scala 39:39]
    wire to_Reg_E_sext_imme : UInt<32> @[Top.scala 41:39]
    wire out_Reg_E_sext_imme : UInt<32> @[Top.scala 42:39]
    wire out_reg_file_rs1_data : UInt<32> @[Top.scala 44:39]
    wire out_reg_file_rs2_data : UInt<32> @[Top.scala 45:39]
    wire to_Reg_E_rs1_data : UInt<32> @[Top.scala 46:39]
    wire to_Reg_E_rs2_data : UInt<32> @[Top.scala 47:39]
    wire rs1_data : UInt<32> @[Top.scala 48:39]
    wire rs2_data : UInt<32> @[Top.scala 49:39]
    wire rs1_data_final : UInt<32> @[Top.scala 51:39]
    wire rs2_data_final : UInt<32> @[Top.scala 52:39]
    wire alu_out : UInt<32> @[Top.scala 54:39]
    wire alu_out_forward : UInt<32> @[Top.scala 55:39]
    wire out_Reg_M_rs2_data : UInt<32> @[Top.scala 57:39]
    wire to_Reg_W_ld_data : UInt<32> @[Top.scala 59:39]
    wire out_Reg_W_ld_data : UInt<32> @[Top.scala 60:39]
    wire out_Reg_W_alu_out : UInt<32> @[Top.scala 61:39]
    wire ld_data_f : UInt<32> @[Top.scala 62:39]
    wire wb_data : UInt<32> @[Top.scala 63:39]
    wire jb_pc : UInt<32> @[Top.scala 64:39]
    wire alu_src1_mux : UInt<32> @[Top.scala 65:39]
    wire alu_src2_mux : UInt<32> @[Top.scala 66:39]
    wire jb_src_mux : UInt<32> @[Top.scala 67:39]
    wire next_pc_sel : UInt<1> @[Top.scala 70:39]
    wire stall : UInt<1> @[Top.scala 71:39]
    wire F_im_w_en : UInt<4> @[Top.scala 72:39]
    wire D_rs1_data_sel : UInt<1> @[Top.scala 73:39]
    wire D_rs2_data_sel : UInt<1> @[Top.scala 74:39]
    wire E_rs1_data_sel : UInt<2> @[Top.scala 76:39]
    wire E_rs2_data_sel : UInt<2> @[Top.scala 77:39]
    wire E_jb_op1_sel : UInt<1> @[Top.scala 78:39]
    wire E_alu_op1_sel : UInt<1> @[Top.scala 79:39]
    wire E_alu_op2_sel : UInt<1> @[Top.scala 80:39]
    wire E_op : UInt<5> @[Top.scala 81:39]
    wire E_f3 : UInt<3> @[Top.scala 82:39]
    wire E_f7 : UInt<1> @[Top.scala 83:39]
    wire M_dm_w_en : UInt<4> @[Top.scala 85:39]
    wire W_wb_en : UInt<1> @[Top.scala 87:39]
    wire W_rd_index : UInt<5> @[Top.scala 88:39]
    wire W_f3 : UInt<3> @[Top.scala 89:39]
    wire W_wb_sel : UInt<1> @[Top.scala 90:39]
    node _to_pc_reg_T = add(out_pc_reg, UInt<3>("h4")) @[Top.scala 93:71]
    node _to_pc_reg_T_1 = tail(_to_pc_reg_T, 1) @[Top.scala 93:71]
    node _to_pc_reg_T_2 = mux(next_pc_sel, jb_pc, _to_pc_reg_T_1) @[Top.scala 93:39]
    to_pc_reg <= _to_pc_reg_T_2 @[Top.scala 93:33]
    reg_pc.io.stall <= stall @[Top.scala 94:33]
    reg_pc.io.next_pc <= to_pc_reg @[Top.scala 95:33]
    out_pc_reg <= reg_pc.io.current_pc @[Top.scala 96:33]
    im.io.w_en <= F_im_w_en @[Top.scala 99:33]
    node _im_io_address_T = bits(out_pc_reg, 15, 0) @[Top.scala 100:46]
    im.io.address <= _im_io_address_T @[Top.scala 100:33]
    im.io.write_data <= UInt<32>("h0") @[Top.scala 101:33]
    inst_to_Reg_D <= im.io.read_data @[Top.scala 102:33]
    reg_d.io.stall <= stall @[Top.scala 105:33]
    reg_d.io.jb <= next_pc_sel @[Top.scala 106:33]
    reg_d.io.pc <= out_pc_reg @[Top.scala 107:33]
    reg_d.io.inst <= inst_to_Reg_D @[Top.scala 108:33]
    out_Reg_D_pc <= reg_d.io.out_Reg_D_pc @[Top.scala 109:33]
    inst_out_Reg_D <= reg_d.io.out_Reg_D_inst @[Top.scala 110:33]
    decoder.io.inst <= inst_out_Reg_D @[Top.scala 113:33]
    opcode <= decoder.io.dc_out_opcode @[Top.scala 114:33]
    func3 <= decoder.io.dc_out_func3 @[Top.scala 115:33]
    func7 <= decoder.io.dc_out_func7 @[Top.scala 116:33]
    rs1_index <= decoder.io.dc_out_rs1_index @[Top.scala 117:33]
    rs2_index <= decoder.io.dc_out_rs2_index @[Top.scala 118:33]
    rd_index <= decoder.io.dc_out_rd_index @[Top.scala 119:33]
    imm_ext.io.inst <= inst_out_Reg_D @[Top.scala 122:33]
    to_Reg_E_sext_imme <= imm_ext.io.imm_ext_out @[Top.scala 123:33]
    node _wb_data_T = mux(W_wb_sel, out_Reg_W_alu_out, ld_data_f) @[Top.scala 126:39]
    wb_data <= _wb_data_T @[Top.scala 126:33]
    regfile.io.wb_en <= W_wb_en @[Top.scala 127:33]
    regfile.io.wb_data <= wb_data @[Top.scala 128:33]
    regfile.io.rd_index <= W_rd_index @[Top.scala 129:33]
    regfile.io.rs1_index <= rs1_index @[Top.scala 130:33]
    regfile.io.rs2_index <= rs2_index @[Top.scala 131:33]
    out_reg_file_rs1_data <= regfile.io.rs1_data_out @[Top.scala 132:33]
    out_reg_file_rs2_data <= regfile.io.rs2_data_out @[Top.scala 133:33]
    node _to_Reg_E_rs1_data_T = mux(D_rs1_data_sel, wb_data, out_reg_file_rs1_data) @[Top.scala 136:39]
    to_Reg_E_rs1_data <= _to_Reg_E_rs1_data_T @[Top.scala 136:33]
    node _to_Reg_E_rs2_data_T = mux(D_rs2_data_sel, wb_data, out_reg_file_rs2_data) @[Top.scala 137:39]
    to_Reg_E_rs2_data <= _to_Reg_E_rs2_data_T @[Top.scala 137:33]
    reg_e.io.stall <= stall @[Top.scala 138:33]
    reg_e.io.jb <= next_pc_sel @[Top.scala 139:33]
    reg_e.io.pc <= out_Reg_D_pc @[Top.scala 140:33]
    reg_e.io.rs1_data <= to_Reg_E_rs1_data @[Top.scala 141:33]
    reg_e.io.rs2_data <= to_Reg_E_rs2_data @[Top.scala 142:33]
    reg_e.io.sext_imme <= to_Reg_E_sext_imme @[Top.scala 143:33]
    out_Reg_E_pc <= reg_e.io.out_Reg_E_pc @[Top.scala 144:33]
    rs1_data <= reg_e.io.out_Reg_E_rs1_data @[Top.scala 145:33]
    rs2_data <= reg_e.io.out_Reg_E_rs2_data @[Top.scala 146:33]
    out_Reg_E_sext_imme <= reg_e.io.out_Reg_E_sext_imme @[Top.scala 147:33]
    node _rs1_data_final_T = eq(UInt<2>("h0"), E_rs1_data_sel) @[Mux.scala 81:61]
    node _rs1_data_final_T_1 = mux(_rs1_data_final_T, wb_data, wb_data) @[Mux.scala 81:58]
    node _rs1_data_final_T_2 = eq(UInt<2>("h1"), E_rs1_data_sel) @[Mux.scala 81:61]
    node _rs1_data_final_T_3 = mux(_rs1_data_final_T_2, alu_out_forward, _rs1_data_final_T_1) @[Mux.scala 81:58]
    node _rs1_data_final_T_4 = eq(UInt<2>("h2"), E_rs1_data_sel) @[Mux.scala 81:61]
    node _rs1_data_final_T_5 = mux(_rs1_data_final_T_4, rs1_data, _rs1_data_final_T_3) @[Mux.scala 81:58]
    rs1_data_final <= _rs1_data_final_T_5 @[Top.scala 150:33]
    node _rs2_data_final_T = eq(UInt<2>("h0"), E_rs2_data_sel) @[Mux.scala 81:61]
    node _rs2_data_final_T_1 = mux(_rs2_data_final_T, wb_data, wb_data) @[Mux.scala 81:58]
    node _rs2_data_final_T_2 = eq(UInt<2>("h1"), E_rs2_data_sel) @[Mux.scala 81:61]
    node _rs2_data_final_T_3 = mux(_rs2_data_final_T_2, alu_out_forward, _rs2_data_final_T_1) @[Mux.scala 81:58]
    node _rs2_data_final_T_4 = eq(UInt<2>("h2"), E_rs2_data_sel) @[Mux.scala 81:61]
    node _rs2_data_final_T_5 = mux(_rs2_data_final_T_4, rs2_data, _rs2_data_final_T_3) @[Mux.scala 81:58]
    rs2_data_final <= _rs2_data_final_T_5 @[Top.scala 155:33]
    node _alu_src1_mux_T = mux(E_alu_op1_sel, rs1_data_final, out_Reg_E_pc) @[Top.scala 160:39]
    alu_src1_mux <= _alu_src1_mux_T @[Top.scala 160:33]
    node _alu_src2_mux_T = mux(E_alu_op2_sel, rs2_data_final, out_Reg_E_sext_imme) @[Top.scala 161:39]
    alu_src2_mux <= _alu_src2_mux_T @[Top.scala 161:33]
    alu.io.opcode <= E_op @[Top.scala 164:33]
    alu.io.func3 <= E_f3 @[Top.scala 165:33]
    alu.io.func7 <= E_f7 @[Top.scala 166:33]
    alu.io.operand1 <= alu_src1_mux @[Top.scala 167:33]
    alu.io.operand2 <= alu_src2_mux @[Top.scala 168:33]
    alu_out <= alu.io.alu_out @[Top.scala 169:33]
    node _jb_src_mux_T = mux(E_jb_op1_sel, rs1_data_final, out_Reg_E_pc) @[Top.scala 171:39]
    jb_src_mux <= _jb_src_mux_T @[Top.scala 171:33]
    jb_unit.io.operand1 <= jb_src_mux @[Top.scala 174:33]
    jb_unit.io.operand2 <= out_Reg_E_sext_imme @[Top.scala 175:33]
    jb_pc <= jb_unit.io.jb_out @[Top.scala 176:33]
    reg_m.io.alu_out <= alu_out @[Top.scala 179:33]
    reg_m.io.rs2_data <= rs2_data_final @[Top.scala 180:33]
    alu_out_forward <= reg_m.io.out_Reg_M_alu_out @[Top.scala 181:33]
    out_Reg_M_rs2_data <= reg_m.io.out_Reg_M_rs2_data @[Top.scala 182:33]
    dm.io.w_en <= M_dm_w_en @[Top.scala 185:33]
    node _dm_io_address_T = bits(alu_out_forward, 15, 0) @[Top.scala 186:51]
    dm.io.address <= _dm_io_address_T @[Top.scala 186:33]
    dm.io.write_data <= out_Reg_M_rs2_data @[Top.scala 187:33]
    to_Reg_W_ld_data <= dm.io.read_data @[Top.scala 188:33]
    reg_w.io.alu_out <= alu_out_forward @[Top.scala 191:33]
    reg_w.io.ld_data <= to_Reg_W_ld_data @[Top.scala 192:33]
    out_Reg_W_alu_out <= reg_w.io.out_Reg_W_alu_out @[Top.scala 193:33]
    out_Reg_W_ld_data <= reg_w.io.out_Reg_W_ld_data @[Top.scala 194:33]
    Ld_filter.io.func3 <= W_f3 @[Top.scala 197:33]
    Ld_filter.io.ld_data <= out_Reg_W_ld_data @[Top.scala 198:33]
    ld_data_f <= Ld_filter.io.ld_data_f @[Top.scala 199:33]
    controller.io.op <= opcode @[Top.scala 202:33]
    controller.io.f3 <= func3 @[Top.scala 203:33]
    controller.io.rd <= rd_index @[Top.scala 204:33]
    controller.io.rs1 <= rs1_index @[Top.scala 205:33]
    controller.io.rs2 <= rs2_index @[Top.scala 206:33]
    controller.io.f7 <= func7 @[Top.scala 207:33]
    node _controller_io_alu_out_T = bits(alu_out, 0, 0) @[Top.scala 208:43]
    controller.io.alu_out <= _controller_io_alu_out_T @[Top.scala 208:33]
    stall <= controller.io.stall @[Top.scala 209:33]
    next_pc_sel <= controller.io.next_pc_sel @[Top.scala 210:33]
    F_im_w_en <= controller.io.F_im_w_en @[Top.scala 211:33]
    D_rs1_data_sel <= controller.io.D_rs1_data_sel @[Top.scala 212:33]
    D_rs2_data_sel <= controller.io.D_rs2_data_sel @[Top.scala 213:33]
    E_rs1_data_sel <= controller.io.E_rs1_data_sel @[Top.scala 214:33]
    E_rs2_data_sel <= controller.io.E_rs2_data_sel @[Top.scala 215:33]
    E_jb_op1_sel <= controller.io.E_jb_op1_sel @[Top.scala 216:33]
    E_alu_op1_sel <= controller.io.E_alu_op1_sel @[Top.scala 217:33]
    E_alu_op2_sel <= controller.io.E_alu_op2_sel @[Top.scala 218:33]
    E_op <= controller.io.E_op @[Top.scala 219:33]
    E_f3 <= controller.io.E_f3 @[Top.scala 220:33]
    E_f7 <= controller.io.E_f7 @[Top.scala 221:33]
    M_dm_w_en <= controller.io.M_dm_w_en @[Top.scala 222:33]
    W_wb_en <= controller.io.W_wb_en @[Top.scala 223:33]
    W_rd_index <= controller.io.W_rd_index @[Top.scala 224:33]
    W_f3 <= controller.io.W_f3 @[Top.scala 225:33]
    W_wb_sel <= controller.io.W_wb_data_sel @[Top.scala 226:33]
    io.pc_out <= reg_pc.io.current_pc @[Top.scala 229:33]

