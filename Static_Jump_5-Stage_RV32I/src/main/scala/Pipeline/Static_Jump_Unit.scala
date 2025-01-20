package Pipeline
import chisel3._
import chisel3.util._

class Static_Jump_Unit extends Module {
    val io = IO(new Bundle {
        val to_static_jump = Input(Bits(32.W))
        val current_pc = Input(Bits(32.W))
        val inst = Input(Bits(32.W))
        val E_op = Input(Bits(5.W))
        val E_alu_out = Input(Bool())
        
        val out_static_jump = Output(Bits(32.W))
    })
    val target_address_offset = Wire(UInt(32.W))
    val target_address = Wire(UInt(32.W))
    target_address_offset   := Cat(Fill(20, io.inst(31)), io.inst(7), io.inst(30, 25), io.inst(11, 8), 0.U(1.W))
    target_address          := ((io.current_pc + target_address_offset) & "hFFFF_FFFF".U(32.W))

    when(io.E_op === OpcodeFunc7Funct3Definition.B && !io.E_alu_out){
        io.out_static_jump  := io.to_static_jump
    }.elsewhen(
        io.E_op === OpcodeFunc7Funct3Definition.Jal || 
        io.E_op === OpcodeFunc7Funct3Definition.Jalr
    ){
        io.out_static_jump  := io.to_static_jump
    }.elsewhen(io.inst(6, 2) === OpcodeFunc7Funct3Definition.B){
        io.out_static_jump  := target_address
    }.otherwise{
        io.out_static_jump  := io.to_static_jump
    }
}

object Static_Jump_Unit extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new Static_Jump_Unit, Array("--target-dir", "generated/Static_Jump_Unit"))
}
