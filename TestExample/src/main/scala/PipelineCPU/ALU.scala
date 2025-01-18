import chisel3._
import chisel3.util._

object OpcodeFunc7Funct3Defition{
    //opcode
    val lui     = "b01101".U(5.W)
    val auipc   = "b00101".U(5.W)
    val Jal     = "b11011".U(5.W)
    val Jalr    = "b11001".U(5.W)
    val B       = "b11000".U(5.W)
    val S       = "b01000".U(5.W)
    val I1      = "b00000".U(5.W)
    val I2      = "b00100".U(5.W)
    val R       = "b01100".U(5.W)

    // {func7, func3}
    val add     = "b0000".U(4.W)
    val sub     = "b1000".U(4.W)
    val sll     = "b0001".U(4.W)
    val slt     = "b0010".U(4.W)
    val sltu    = "b0011".U(4.W)
    val xor     = "b0100".U(4.W)
    val srl     = "b0101".U(4.W)
    val sra     = "b1101".U(4.W)
    val or      = "b0110".U(4.W)
    val and     = "b0111".U(4.W)
}

class ALU extends Module {
    val io = IO(new Bundle {
        val opcode = Input(Bits(5.W))
        val func3 = Input(Bits(3.W))
        val func7 = Input(Bits(1.W))
        val operand1 = Input(Bits(32.W))
        val operand2 = Input(Bits(32.W))
        val alu_out = Output(Bits(32.W))
    })
    val func7_and_func3 = Cat(io.func7, io.func3)
    io.alu_out := 0.U(32.W)
    when(io.opcode === OpcodeFunc7Funct3Defition.R) { 
        switch(func7_and_func3) { 
            is(OpcodeFunc7Funct3Defition.add) { 
                io.alu_out := (io.operand1.asSInt + io.operand2.asSInt).asUInt 
            } 
            is(OpcodeFunc7Funct3Defition.sub) { 
                io.alu_out := (io.operand1.asSInt - io.operand2.asSInt ).asUInt
            } 
            is(OpcodeFunc7Funct3Defition.sll) { 
                io.alu_out := (io.operand1 << io.operand2(4, 0)).asUInt 
            } 
            is(OpcodeFunc7Funct3Defition.slt) { 
                io.alu_out := (io.operand1.asSInt < io.operand2.asSInt).asUInt 
            } 
            is(OpcodeFunc7Funct3Defition.sltu) { 
                io.alu_out := (io.operand1 < io.operand2).asUInt 
            } 
            is(OpcodeFunc7Funct3Defition.xor) { 
                io.alu_out := (io.operand1 ^ io.operand2).asUInt 
            } 
            is(OpcodeFunc7Funct3Defition.srl) { 
                io.alu_out := (io.operand1 >> io.operand2(4, 0)).asUInt 
            } 
            is(OpcodeFunc7Funct3Defition.sra) { 
                io.alu_out := (io.operand1.asSInt >> io.operand2(4, 0)).asUInt 
            } 
            is(OpcodeFunc7Funct3Defition.or) { 
                io.alu_out := (io.operand1 | io.operand2).asUInt
            } 
            is(OpcodeFunc7Funct3Defition.and) { 
                io.alu_out := (io.operand1 & io.operand2).asUInt
            } 
            //otherwise { io.alu_out := 0.U } 
        } 
    } .elsewhen(io.opcode === OpcodeFunc7Funct3Defition.I2) { 
        switch(io.func3) { 
            is("b000".U) { 
                io.alu_out := (io.operand1.asSInt + io.operand2.asSInt).asUInt
                } 
            is("b010".U) { 
                io.alu_out := (io.operand1.asSInt < io.operand2.asSInt).asUInt 
                } 
            is("b011".U) { 
                io.alu_out := (io.operand1 < io.operand2).asUInt 
            } 
            is("b100".U) { 
                io.alu_out := (io.operand1 ^ io.operand2).asUInt
            } 
            is("b110".U) { 
                io.alu_out := (io.operand1 | io.operand2).asUInt
            }
            is("b111".U) { 
                io.alu_out := (io.operand1 & io.operand2).asUInt
            } 
            is("b001".U) { 
                io.alu_out := (io.operand1 << io.operand2(4, 0)).asUInt
            } 
            is("b101".U) { 
                when(io.func7.asBool) {
                    io.alu_out := (io.operand1.asSInt >> io.operand2(4, 0)).asUInt 
                } .otherwise { 
                    io.alu_out := (io.operand1 >> io.operand2(4, 0)).asUInt 
                }
            } 
            //otherwise { io.alu_out := 0.U } 
        } 
    } .elsewhen(io.opcode === OpcodeFunc7Funct3Defition.B) { 
        switch(io.func3) { 
            is("b000".U) { 
                io.alu_out := (io.operand1 === io.operand2).asUInt 
            } 
            is("b001".U) { 
                io.alu_out := (io.operand1 =/= io.operand2).asUInt 
            } 
            is("b100".U) { 
                io.alu_out := (io.operand1.asSInt < io.operand2.asSInt).asUInt
            }
            is("b101".U) { 
                io.alu_out := (io.operand1.asSInt >= io.operand2.asSInt).asUInt 
            } 
            is("b110".U) { 
                io.alu_out := (io.operand1 < io.operand2).asUInt 
            } 
            is("b111".U) { 
                io.alu_out := (io.operand1 >= io.operand2).asUInt 
            } 
            //otherwise { 
            //    io.alu_out := 0.U 
            //} 
        } 
    } .elsewhen(io.opcode === OpcodeFunc7Funct3Defition.lui) { 
        io.alu_out := io.operand2.asUInt
    } .elsewhen(io.opcode === OpcodeFunc7Funct3Defition.auipc || io.opcode === OpcodeFunc7Funct3Defition.S || io.opcode === OpcodeFunc7Funct3Defition.I1) { 
        io.alu_out := (io.operand1 + io.operand2).asUInt
    } .elsewhen(io.opcode === OpcodeFunc7Funct3Defition.Jal || io.opcode === OpcodeFunc7Funct3Defition.Jalr) { 
        io.alu_out := (io.operand1 + 4.U).asUInt
    } .otherwise { 
        io.alu_out := 0.U 
    } 
}

object ALU extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new ALU, Array("--target-dir", "generated/ALU"))
}
