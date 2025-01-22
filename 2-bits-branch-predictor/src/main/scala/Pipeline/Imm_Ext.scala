package Pipeline
import chisel3._
import chisel3.util._

class Imm_Ext extends Module {
    val io = IO(new Bundle {
        val inst = Input(Bits(32.W))
        
        val imm_ext_out = Output(Bits(32.W))
    })
    //default value
    io.imm_ext_out     := 0.U(32.W)

    // switch by opcode
    switch(io.inst(6, 2)){
        is(OpcodeFunc7Funct3Definition.I1){
            io.imm_ext_out      := Cat(Fill(20, io.inst(31)), io.inst(31, 20))
        }
        is(OpcodeFunc7Funct3Definition.I2){
            io.imm_ext_out      := Cat(Fill(20, io.inst(31)), io.inst(31, 20))
        }
        is(OpcodeFunc7Funct3Definition.Jalr){
            io.imm_ext_out      := Cat(Fill(20, io.inst(31)), io.inst(31, 20))
        }
        is(OpcodeFunc7Funct3Definition.S){
            io.imm_ext_out      := Cat(Fill(20, io.inst(31)), io.inst(31, 25), io.inst(11, 7))
        }
        is(OpcodeFunc7Funct3Definition.B){
            io.imm_ext_out      := Cat(Fill(20, io.inst(31)), io.inst(7), io.inst(30, 25), io.inst(11, 8), 0.U(1.W))
        }
        is(OpcodeFunc7Funct3Definition.lui){
            io.imm_ext_out      := Cat(io.inst(31, 12), 0.U(12.W))
        }
        is(OpcodeFunc7Funct3Definition.auipc){
            io.imm_ext_out      := Cat(io.inst(31, 12), 0.U(12.W))
        }
        is(OpcodeFunc7Funct3Definition.Jal){
            io.imm_ext_out      := Cat(Fill(12, io.inst(31)), io.inst(19, 12), io.inst(20), io.inst(30, 21), 0.U(1.W))
        }
    }
    
}

object Imm_Ext extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new Imm_Ext, Array("--target-dir", "generated/Imm_Ext"))
}
