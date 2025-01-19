import chisel3._
import chisel3.util._

class LD_Filter extends Module {
    val io = IO(new Bundle {
        val func3 = Input(Bits(3.W))
        val ld_data = Input(Bits(32.W))
        
        val ld_data_f = Output(Bits(32.W))
    })
    //default value
    io.ld_data_f        := 0.U(32.W)
    switch(io.func3){
        is("b000".U(3.W)){
            io.ld_data_f    := Cat(Fill(24, io.ld_data(7)), io.ld_data(7, 0))
        }
        is("b001".U(3.W)){
            io.ld_data_f    := Cat(Fill(16, io.ld_data(15)), io.ld_data(15, 0))
        }
        is("b010".U(3.W)){
            io.ld_data_f    := io.ld_data
        }
        is("b100".U(3.W)){
            io.ld_data_f    := Cat(0.U(24.W), io.ld_data(7, 0))
        }
        is("b101".U(3.W)){
            io.ld_data_f    := Cat(0.U(16.W), io.ld_data(15, 0))
        }
    }
}

object LD_Filter extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new LD_Filter, Array("--target-dir", "generated/LD_Filter"))
}
