## directory
* `{DIR_NAME}/generated`  
Store generated verilog file

* `{DIR_NAME}/src/main`  
Store module file and test program

* `{DIR_NAME}/src/test`  
Store Chisel test program

* `{DIR_NAME}/target`  
Store temp file during runtime

* `{DIR_NAME}/test_run_dir`  
Store .vcd waveform file

## file
* `testbench.cpp`  
Convert a **Verilog-formatted** memory file to a file type readable by **Chisel** memory.

* `RV32I_compile/riscv-compile.sh`  
Automatically compile RISC-V RV32I assembly code if your environment already installed [riscv-gnu-toolchain](https://github.com/riscv-collab/riscv-gnu-toolchain/releases)  
usage:
```bash
cd RV32I_compile
./riscv-compile.sh <directory_name>
```

* `RV32I_compile/link.ld`  
Linker file for linking 

* `test.sh`  
usage:
in /BranchPrediction/
```bash
./test.sh "subproject you want test"
```

* `run.sh`  
usage:
in /BranchPrediction/
```bash
./run.sh "subproject you want run"
```
* `{DIR_NAME}/src/test/scala/Pipline/MainTest.scala`  
In this file
```scala
class TopTest extends AnyFlatSpec with ChiselScalatestTester{
   "5-Stage test" should "pass" in{
    val prog_num = 0
    val prog_filename = f"./src/main/scala/Pipeline/prog${prog_num}/prog${prog_num}.hex"
    val golden_filename = f"./src/main/scala/Pipeline/prog${prog_num}/golden.hex"
    val goldenData = Source.fromFile(golden_filename).getLines().map(_.trim).toArray
```
Change `prog_num` can test different program.
