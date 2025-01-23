circuit LD_Filter :
  module LD_Filter :
    input clock : Clock
    input reset : UInt<1>
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

