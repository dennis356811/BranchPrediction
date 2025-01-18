package Pipeline
import chisel3._
import org.scalatest.FreeSpec
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class TOPTest extends AnyFlatSpec with ChiselScalatestTester{
   "5-Stage test" should "pass" in{
    test(new PIPELINE())
        .withAnnotations(Seq(WriteVcdAnnotation)){
            x =>
            x.clock.setTimeout(0)
            x.clock.step(10000) 
            
        }
    }    
}