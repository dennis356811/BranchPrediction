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