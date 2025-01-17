import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class FIRTest extends AnyFlatSpec with ChiselScalatestTester {
    behavior of "Hello"
  it should "pass" in {
    test(new FIR(1,1,1,1))
      .withAnnotations(Seq(WriteVcdAnnotation)) { c =>
        c.io.data.poke(3.U)
        c.io.out.expect(3.U)
        c.clock.step(1)
        c.io.data.poke(3.U)
        c.io.out.expect(6.U)
        c.clock.step(1)
        c.io.data.poke(3.U)
        c.io.out.expect(9.U)
        c.clock.step(1)
        c.io.data.poke(3.U)
        c.io.out.expect(12.U)
        c.clock.step(1)
        c.io.data.poke(3.U)
        c.io.out.expect(12.U)
        c.clock.step(1)
        c.io.data.poke(3.U)
        c.io.out.expect(12.U)}
  }
}
