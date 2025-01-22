## directory
### generated 
存放產生出來的verilog

### src
main裡面放module
test裡面放testbench

### target
存放中間產生的廢物

### test_run_dir
存放 .vcd

### push_to_github.sh
usage:
```
./push_to_github.sh "your commit message"
```
automatically push to github.

### test.sh
usage:
in /ChiselTest/
```
./test.sh "subproject you want test"
```

### run.sh
usage:
in /ChiselTest/
```
./run.sh "subproject you want run"
```