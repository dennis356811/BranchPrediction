circuit Mux3 :
  module Mux3 :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip zeroth : UInt<32>, flip first : UInt<32>, flip second : UInt<32>, flip control : UInt<2>, result : UInt<32>}

    node _io_result_T = eq(UInt<2>("h0"), io.control) @[Mux.scala 81:61]
    node _io_result_T_1 = mux(_io_result_T, io.zeroth, io.zeroth) @[Mux.scala 81:58]
    node _io_result_T_2 = eq(UInt<2>("h1"), io.control) @[Mux.scala 81:61]
    node _io_result_T_3 = mux(_io_result_T_2, io.first, _io_result_T_1) @[Mux.scala 81:58]
    node _io_result_T_4 = eq(UInt<2>("h2"), io.control) @[Mux.scala 81:61]
    node _io_result_T_5 = mux(_io_result_T_4, io.second, _io_result_T_3) @[Mux.scala 81:58]
    io.result <= _io_result_T_5 @[Mux3.scala 13:25]

