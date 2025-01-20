package Pipeline
import chisel3._
import chisel3.util._

class JB_Unit extends Module {
    val io = IO(new Bundle {
        val operand1  = Input(Bits(32.W))
        val operand2  = Input(Bits(32.W))
        val opcode    = Input(Bits(5.W))
        
        val jb_out    = Output(Bits(32.W))
    })
    val is_opcode_B_type  = Wire(Bool())
    is_opcode_B_type      := io.opcode === OpcodeFunc7Funct3Definition.B

    io.jb_out := Mux(is_opcode_B_type, io.operand1 + 4.U(32.W), ((io.operand1 + io.operand2) & "hFFFF_FFFF".U(32.W)))
}

object JB_Unit extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new JB_Unit, Array("--target-dir", "generated/JB_Unit"))
}
