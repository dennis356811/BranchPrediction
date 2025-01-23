circuit FIR :
  module FIR :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip data : UInt<8>, out : UInt<8>}

    reg x0 : UInt, clock with :
      reset => (reset, UInt<1>("h0")) @[FIR.scala 9:19]
    x0 <= io.data @[FIR.scala 9:19]
    reg x1 : UInt, clock with :
      reset => (reset, UInt<1>("h0")) @[FIR.scala 10:19]
    x1 <= x0 @[FIR.scala 10:19]
    reg x2 : UInt, clock with :
      reset => (reset, UInt<1>("h0")) @[FIR.scala 11:19]
    x2 <= x1 @[FIR.scala 11:19]
    node _io_out_T = mul(io.data, UInt<8>("h1")) @[FIR.scala 13:20]
    node _io_out_T_1 = mul(x0, UInt<8>("h1")) @[FIR.scala 13:35]
    node _io_out_T_2 = add(_io_out_T, _io_out_T_1) @[FIR.scala 13:31]
    node _io_out_T_3 = tail(_io_out_T_2, 1) @[FIR.scala 13:31]
    node _io_out_T_4 = mul(x1, UInt<8>("h1")) @[FIR.scala 13:50]
    node _io_out_T_5 = add(_io_out_T_3, _io_out_T_4) @[FIR.scala 13:46]
    node _io_out_T_6 = tail(_io_out_T_5, 1) @[FIR.scala 13:46]
    node _io_out_T_7 = mul(x2, UInt<8>("h1")) @[FIR.scala 13:65]
    node _io_out_T_8 = add(_io_out_T_6, _io_out_T_7) @[FIR.scala 13:61]
    node _io_out_T_9 = tail(_io_out_T_8, 1) @[FIR.scala 13:61]
    io.out <= _io_out_T_9 @[FIR.scala 13:10]

