package Pipeline
import chisel3._
import org.scalatest.FreeSpec
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import scala.io.Source


class TopTest extends AnyFlatSpec with ChiselScalatestTester{
   "5-Stage test" should "pass" in{
    val filename = "./src/main/scala/Pipeline/prog0/golden.hex"
    val data = Source.fromFile(filename).getLines.toArray
    test(new Top())
        .withAnnotations(Seq(WriteVcdAnnotation)){
            x =>
            x.clock.setTimeout(0)
            x.clock.step(10000)
            for(i <- 0x9000 to 0x90b0 by 0x4){
                x.io.mem_read_test.poke(true.B)
                x.io.mem_addr_test.poke(i)
                println(s"addr: ${i.toHexString}, data: ${x.io.mem_data_test.peek().litValue.toString(16)}")
            } 
        }
    }    
}