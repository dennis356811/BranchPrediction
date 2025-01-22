## directory
`{DIR_NAME}/generated`

Store generated verilog file

`{DIR_NAME}/src/main`

Store module file and test program

`{DIR_NAME}/src/test`

Store Chisel test program

`{DIR_NAME}/target`

Store temp file during runtime

`{DIR_NAME}/test_run_dir`

Store .vcd waveform file

## file
`testbench.cpp`

Convert a **Verilog-formatted** memory file to a file type readable by **Chisel** memory.

`RV32I_compile/riscv-compile.sh`

Automatically compile RISC-V RV32I assembly code
usage:
```
cd RV32I_compile
./riscv-compile.sh <directory_name>
```

`RV32I_compile/link.ld`

Linker file for linking 

`push_to_github.sh`

usage:
```
./push_to_github.sh "your commit message"
```
automatically push to github.

`test.sh`

usage:
in /ChiselTest/
```
./test.sh "subproject you want test"
```

`run.sh`

usage:
in /ChiselTest/
```
./run.sh "subproject you want run"
```