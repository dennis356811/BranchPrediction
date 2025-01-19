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
            //for(i <- 0 to 10000){
            //    if(x.io.mem_wenable.peek().litToBoolean){
            //        System.out.println(x.io.wb_data.peek().litValue.toString(16))
            //    }
            //    x.clock.step()
            //}
            x.clock.step(10000)
            for(i <- 0 to 1024){
                x.io.mem_read_test.poke(true.B)
                x.io.mem_addr_test.poke(i)
                println(s"addr: ${i}, data: ${x.io.mem_data_test.peek().litValue}")
            } 
        }
    }    
}