package Pipeline
import chisel3._
import org.scalatest.FreeSpec
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import scala.io.Source


class TopTest extends AnyFlatSpec with ChiselScalatestTester{
   "5-Stage test" should "pass" in{
    val prog_num = 3
    val prog_filename = f"./src/main/scala/Pipeline/prog${prog_num}/prog${prog_num}.hex"
    val golden_filename = f"./src/main/scala/Pipeline/prog${prog_num}/golden.hex"
    val goldenData = Source.fromFile(golden_filename).getLines().map(_.trim).toArray
    val startAddress = 0x9000
    val step = 0x4
    val endAddress = startAddress + step * (goldenData.length - 1)
    var counter = 0;
    var branch_times = 0;
    var miss_time = 0;
    var endProgram = true;
    test(new Top(prog_filename))
        .withAnnotations(Seq(WriteVcdAnnotation)){
            x =>
            x.clock.setTimeout(0)
            while(endProgram){
                x.clock.step()
                x.io.mem_read_test.poke(true.B)
                x.io.mem_addr_test.poke("hfffc".U(32.W))
                if(x.io.mem_data_test.peek().litValue === BigInt("ffffffff", 16)){
                    endProgram = false
                }
                if(counter > 40000){
                    endProgram = false
                }
                if(x.io.E_op_test.peek().litValue === BigInt("18", 16)){
                    branch_times = branch_times + 1
                    if(x.io.miss_test.peek().litValue === BigInt("1", 2)){
                        miss_time = miss_time + 1
                    }
                }
                counter = counter + 1
            }
            println(f"program end")
            println(f"Testing prog${prog_num}...")
            for ((i, expectedData) <- (startAddress to endAddress by step).zip(goldenData)){
                x.io.mem_read_test.poke(true.B)
                x.io.mem_addr_test.poke(i.U)
                val actualData = x.io.mem_data_test.peek().litValue
                val expectedValue = BigInt(expectedData, 16)
                if(actualData === expectedValue){
                    println(f"addr: [0x${i.toHexString}], actual data: 0x${actualData}%08x, pass")
                }
                else{
                    println(f"addr: [0x${i.toHexString}], actual data: 0x${actualData}%08x, expected data: 0x${expectedValue}%08x, fail")
                }
            }
            println(f"total cycle: ${counter}")
            println(f"total branch inst: ${branch_times}")
            println(f"total miss time: ${miss_time}")
            println(f"hit rate: ${(branch_times - miss_time).toDouble / branch_times * 100}%%")
        }
    }    
}