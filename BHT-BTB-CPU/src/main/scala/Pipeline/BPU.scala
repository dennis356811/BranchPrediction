package Pipeline

import chisel3._
import chisel3.util._

class BPU extends Module {
  val io = IO(new Bundle {
    val IF_pc        = Input(UInt(32.W))
    val IF_inst      = Input(UInt(32.W))
    val EXE_pc       = Input(UInt(32.W))
    val EXE_op       = Input(UInt(5.W))
    val alu_out      = Input(Bool())
    val stall        = Input(Bool())
    val jump         = Input(Bool())
    val jb_pc        = Input(UInt(32.W))
    val predict      = Output(Bool())
    val predict_miss = Output(Bool())
    val BTB_miss     = Output(Bool())
    val next_pc      = Output(UInt(32.W))
  })

  // Registers
  val BHT           = RegInit(VecInit(Seq.fill(32)(3.U(2.W))))
  val BTB           = RegInit(VecInit(Seq.fill(32)(0.U(32.W))))
  val BTB_valid     = RegInit(VecInit(Seq.fill(32)(false.B)))

  val delay         = RegInit(false.B)
  val last_predict  = RegInit(false.B)
  val delay_pc      = RegInit(0.U(32.W))
  val last_pc       = RegInit(0.U(32.W))

  val IF_is_B_type  = io.IF_inst(6, 0) === "b1100011".U
  val EXE_is_B_type = io.EXE_op === "b11000".U

  io.BTB_miss := EXE_is_B_type && last_predict && (BTB(io.EXE_pc(6, 2)) =/= io.jb_pc)
  io.predict := BTB_valid(io.IF_pc(6, 2)) && IF_is_B_type && BHT(io.IF_pc(6, 2)) >= 2.U
  io.predict_miss := EXE_is_B_type && (last_predict ^ io.alu_out)

  io.next_pc := Mux(io.jump, io.jb_pc, // Jump instruction
                Mux(io.predict_miss, Mux(last_predict, last_pc, io.jb_pc), // Predict miss
                Mux(io.BTB_miss, io.jb_pc, // BTB miss
                Mux(io.predict, BTB(io.IF_pc(6, 2)), io.IF_pc + 4.U)))) // Predict jump or not
    
  when(io.stall) {
    delay        := delay
    last_predict := last_predict
    delay_pc     := delay_pc
    last_pc      := last_pc
  }.otherwise{
    delay        := io.predict
    last_predict := delay
    delay_pc     := io.IF_pc + 4.U
    last_pc      := delay_pc
  }

  when(EXE_is_B_type) {
    when(io.alu_out) {
      BHT(io.EXE_pc(6, 2)) := Mux(BHT(io.EXE_pc(6, 2)) === 3.U, 3.U, BHT(io.EXE_pc(6, 2)) + 1.U)
      BTB(io.EXE_pc(6, 2)) := io.jb_pc
      BTB_valid(io.EXE_pc(6, 2)) := true.B
    }.otherwise {
      BHT(io.EXE_pc(6, 2)) := Mux(BHT(io.EXE_pc(6, 2)) === 0.U, 0.U, BHT(io.EXE_pc(6, 2)) - 1.U)
    }
  }
}

