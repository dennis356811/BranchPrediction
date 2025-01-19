package Pipeline
import chisel3._
import org.scalatest.FreeSpec
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import scala.io.Source


class TopTest extends AnyFlatSpec with ChiselScalatestTester{
   "5-Stage test" should "pass" in{
    val filename = "./src/main/scala/Pipeline/prog1/golden.hex"
    val goldenData = Source.fromFile(filename).getLines().map(_.trim).toArray
    val startAddress = 0x9000
    val step = 0x4
    val endAddress = startAddress + step * (goldenData.length - 1)
    test(new Top())
        .withAnnotations(Seq(WriteVcdAnnotation)){
            x =>
            x.clock.setTimeout(0)
            x.clock.step(30000)
            for ((i, expectedData) <- (startAddress to endAddress by step).zip(goldenData)){
                x.io.mem_read_test.poke(true.B)
                x.io.mem_addr_test.poke(i.U)
                val actualData = x.io.mem_data_test.peek().litValue
                val expectedValue = BigInt(expectedData, 16)
                if(actualData === expectedValue){
                    println(f"addr: 0x${i.toHexString}, pass")
                }
                else{
                    println(f"addr: 0x${i.toHexString}, actual data: 0x${actualData}%08x, expected data: 0x${expectedValue}%08x")
                }
            }
        }
    }    
}