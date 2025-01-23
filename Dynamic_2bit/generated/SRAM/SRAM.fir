circuit SRAM :
  module SRAM :
    input clock : Clock
    input reset : UInt<1>
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

