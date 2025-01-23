#!/bin/bash
if [ $# -ne 1 ]; then
    echo "method: $0 <progfile>"
    exit 1
fi

# get paramter
PROGFILE=$1

# check if directory exists
if [ ! -d "$PROGFILE" ]; then
    echo "error: directory '$PROGFILE' is not exist!"
    exit 1
fi

echo "Starting compilation for directory: $PROGFILE"

# set valuable
OBJ_FILES=""
SETUP_FILE="${PROGFILE}/setup.s"
SETUP_OBJ="${PROGFILE}/setup.o"

# compile setup.s (if exists)
if [ -f "$SETUP_FILE" ]; then
    echo "Compiling $SETUP_FILE to $SETUP_OBJ..."
    riscv32-unknown-elf-as -march=rv32i -mabi=ilp32 "$SETUP_FILE" -o "$SETUP_OBJ"
    if [ $? -ne 0 ]; then
        echo "Error: Assembly failed for $SETUP_FILE"
        exit 1
    fi
    OBJ_FILES="$SETUP_OBJ"
else
    echo "Warning: $SETUP_FILE not found. Skipping..."
fi

# compile other .s file
for ASM_FILE in ${PROGFILE}/*.s; do
    # skip setup.s
    if [ "$ASM_FILE" == "$SETUP_FILE" ]; then
        continue
    fi

    if [ -f "$ASM_FILE" ]; then
        OBJ_FILE="${ASM_FILE%.s}.o" 
        echo "Compiling $ASM_FILE to $OBJ_FILE..."
        riscv32-unknown-elf-as -march=rv32i -mabi=ilp32 "$ASM_FILE" -o "$OBJ_FILE"
        if [ $? -ne 0 ]; then
            echo "Error: Assembly failed for $ASM_FILE"
            exit 1
        fi
        OBJ_FILES="$OBJ_FILES $OBJ_FILE"
    fi
done

if [ -z "$OBJ_FILES" ]; then
    echo "Error: No assembly files found in '$PROGFILE'"
    exit 1
fi

# linking
OUTPUT_ELF="${PROGFILE}/main.elf"
echo "Linking object files to $OUTPUT_ELF..."
riscv32-unknown-elf-ld -b elf32-littleriscv -T link.ld $OBJ_FILES -o "$OUTPUT_ELF"
if [ $? -ne 0 ]; then
    echo "Error: Linking failed!"
    exit 1
fi

# generate .hex file
OUTPUT_HEX="${PROGFILE}/main.hex"
echo "Generating HEX file: $OUTPUT_HEX..."
riscv32-unknown-elf-objcopy -O verilog "$OUTPUT_ELF" "$OUTPUT_HEX"
if [ $? -ne 0 ]; then
    echo "Error: Failed to generate HEX file!"
    exit 1
fi

# generate .dump file
OUTPUT_DUMP="${PROGFILE}/main.dump"
echo "Generating DUMP file: $OUTPUT_DUMP..."
riscv32-unknown-elf-objdump -xsd "$OUTPUT_ELF" > "$OUTPUT_DUMP"
if [ $? -ne 0 ]; then
    echo "Error: Failed to generate DUMP file!"
    exit 1
fi

#riscv32-unknown-elf-as -march=rv32i -mabi=ilp32 ./${PROGFILE}/main.s -o ./${PROGFILE}/main.o
#riscv32-unknown-elf-as -march=rv32i -mabi=ilp32 ./${PROGFILE}/setup.s -o ./${PROGFILE}/setup.o
#riscv32-unknown-elf-ld -b elf32-littleriscv -T link.ld ./${PROGFILE}/setup.o ./${PROGFILE}/main.o -o ./${PROGFILE}/main.elf
#riscv32-unknown-elf-objcopy -O verilog ./${PROGFILE}/main.elf ./${PROGFILE}/main.hex
#riscv32-unknown-elf-objdump -xsd ./${PROGFILE}/main.elf > ./${PROGFILE}/main.dump
if [ $? -eq 0 ]; then
    echo "compile success,  result in ./${PROGFILE}"
else
    echo "compile failed "
    exit 1
fi