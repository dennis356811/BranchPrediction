circuit Static_Jump_Unit :
  module Static_Jump_Unit :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip to_static_jump : UInt<32>, flip current_pc : UInt<32>, flip inst : UInt<32>, flip E_op : UInt<5>, flip E_alu_out : UInt<1>, out_static_jump : UInt<32>}

    wire target_address_offset : UInt<32> @[Static_Jump_Unit.scala 15:37]
    wire target_address : UInt<32> @[Static_Jump_Unit.scala 16:30]
    node _target_address_offset_T = bits(io.inst, 31, 31) @[Static_Jump_Unit.scala 17:52]
    node _target_address_offset_T_1 = bits(_target_address_offset_T, 0, 0) @[Bitwise.scala 74:15]
    node _target_address_offset_T_2 = mux(_target_address_offset_T_1, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 74:12]
    node _target_address_offset_T_3 = bits(io.inst, 7, 7) @[Static_Jump_Unit.scala 17:66]
    node _target_address_offset_T_4 = bits(io.inst, 30, 25) @[Static_Jump_Unit.scala 17:78]
    node _target_address_offset_T_5 = bits(io.inst, 11, 8) @[Static_Jump_Unit.scala 17:95]
    node target_address_offset_lo = cat(_target_address_offset_T_5, UInt<1>("h0")) @[Cat.scala 31:58]
    node target_address_offset_hi_hi = cat(_target_address_offset_T_2, _target_address_offset_T_3) @[Cat.scala 31:58]
    node target_address_offset_hi = cat(target_address_offset_hi_hi, _target_address_offset_T_4) @[Cat.scala 31:58]
    node _target_address_offset_T_6 = cat(target_address_offset_hi, target_address_offset_lo) @[Cat.scala 31:58]
    target_address_offset <= _target_address_offset_T_6 @[Static_Jump_Unit.scala 17:29]
    node _target_address_T = add(io.current_pc, target_address_offset) @[Static_Jump_Unit.scala 18:48]
    node _target_address_T_1 = tail(_target_address_T, 1) @[Static_Jump_Unit.scala 18:48]
    node _target_address_T_2 = and(_target_address_T_1, UInt<32>("hffffffff")) @[Static_Jump_Unit.scala 18:73]
    target_address <= _target_address_T_2 @[Static_Jump_Unit.scala 18:29]
    node _T = eq(io.E_op, UInt<5>("h18")) @[Static_Jump_Unit.scala 20:18]
    node _T_1 = eq(io.E_alu_out, UInt<1>("h0")) @[Static_Jump_Unit.scala 20:55]
    node _T_2 = and(_T, _T_1) @[Static_Jump_Unit.scala 20:52]
    when _T_2 : @[Static_Jump_Unit.scala 20:69]
      io.out_static_jump <= io.to_static_jump @[Static_Jump_Unit.scala 21:29]
    else :
      node _T_3 = eq(io.E_op, UInt<5>("h1b")) @[Static_Jump_Unit.scala 23:17]
      node _T_4 = eq(io.E_op, UInt<5>("h19")) @[Static_Jump_Unit.scala 24:17]
      node _T_5 = or(_T_3, _T_4) @[Static_Jump_Unit.scala 23:53]
      when _T_5 : @[Static_Jump_Unit.scala 25:6]
        io.out_static_jump <= io.to_static_jump @[Static_Jump_Unit.scala 26:29]
      else :
        node _T_6 = bits(io.inst, 6, 2) @[Static_Jump_Unit.scala 27:23]
        node _T_7 = eq(_T_6, UInt<5>("h18")) @[Static_Jump_Unit.scala 27:30]
        when _T_7 : @[Static_Jump_Unit.scala 27:64]
          io.out_static_jump <= target_address @[Static_Jump_Unit.scala 28:29]
        else :
          io.out_static_jump <= io.to_static_jump @[Static_Jump_Unit.scala 30:29]

