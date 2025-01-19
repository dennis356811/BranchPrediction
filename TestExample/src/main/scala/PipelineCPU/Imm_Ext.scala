import chisel3._
import chisel3.util._

object Imm_ExtOpcodeDefition{
    val I1      = "b00000".U(5.W)
    val I2      = "b00100".U(5.W)
    val Jalr    = "b11001".U(5.W)
    val S       = "b01000".U(5.W)
    val B       = "b11000".U(5.W)
    val lui     = "b01101".U(5.W)
    val auipc   = "b00101".U(5.W)
    val Jal     = "b11011".U(5.W)
}


class Imm_Ext extends Module {
    val io = IO(new Bundle {
        val inst = Input(Bits(32.W))
        
        val imm_ext_out = Output(Bits(32.W))
    })
    //default value
    io.imm_ext_out     := 0.U(32.W)

    // switch by opcode
    switch(io.inst(6, 2)){
        is(Imm_ExtOpcodeDefition.I1){
            io.imm_ext_out      := Cat(Fill(20, io.inst(31)), io.inst(31, 20))
        }
        is(Imm_ExtOpcodeDefition.I2){
            io.imm_ext_out      := Cat(Fill(20, io.inst(31)), io.inst(31, 20))
        }
        is(Imm_ExtOpcodeDefition.Jalr){
            io.imm_ext_out      := Cat(Fill(20, io.inst(31)), io.inst(31, 20))
        }
        is(Imm_ExtOpcodeDefition.S){
            io.imm_ext_out      := Cat(Fill(20, io.inst(31)), io.inst(31, 25), io.inst(11, 7))
        }
        is(Imm_ExtOpcodeDefition.B){
            io.imm_ext_out      := Cat(Fill(20, io.inst(31)), io.inst(7), io.inst(30, 25), io.inst(11, 8), 0.U(1.W))
        }
        is(Imm_ExtOpcodeDefition.lui){
            io.imm_ext_out      := Cat(io.inst(31, 12), 0.U(12.W))
        }
        is(Imm_ExtOpcodeDefition.auipc){
            io.imm_ext_out      := Cat(io.inst(31, 12), 0.U(12.W))
        }
        is(Imm_ExtOpcodeDefition.Jal){
            io.imm_ext_out      := Cat(Fill(12, io.inst(31)), io.inst(19, 12), io.inst(20), io.inst(30, 21), 0.U(1.W))
        }
    }
    
}

object Imm_Ext extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new Imm_Ext, Array("--target-dir", "generated/Imm_Ext"))
}
