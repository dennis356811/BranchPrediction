package Pipeline
import chisel3._
import chisel3.util._

class DataMemory extends Module {
  val io = IO(new Bundle {
    val addr        = Input(UInt(32.W))         // Address input
    val dataIn      = Input(SInt(32.W))         // Data to be written
    val mem_read    = Input(Bool())             // Memory read enable
    val mem_write   = Input(Bool())             // Memory write enable
    val dataOut     = Output(SInt(32.W))        // Data output
    val dataRead_test = Input(Bool())
    val dataAddr_test = Input(UInt(32.W))
    val data_test = Output(SInt(32.W))
  })
  val Dmemory = Mem(1024, SInt(32.W))
  io.dataOut := 0.S

  when(io.mem_write) {
    Dmemory.write(io.addr, io.dataIn)
  }
  when(io.mem_read) {
    io.dataOut := Dmemory.read(io.addr)
  }

  io.data_test := 0.S
  when(io.dataRead_test) {
    io.data_test := Dmemory.read(io.dataAddr_test)
  }
}
