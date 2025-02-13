.data
lw_data: .word 0x66666666

.text
.globl main

main:

# ######################################
# ### Load address of _answer to s0 
# ######################################
  
  addi sp, sp, -4
  sw s0, 0(sp)
  la s0, _answer

# ######################################


# ######################################
# ### Main Program
# ######################################
#
add:
  li t0, 0xffffffff   # -1
  li t1, 0xffffffff   # -1
  add t0, t0, t1      # t0 = -2
  add t0, t0, t1      # t0 = -3
  add t0, t0, t1      # t0 = -4
  add t0, t0, t1      # t0 = -5
  add t0, t0, t1      # t0 = -6
  li t1, 0xfffffffe   # -2
  add t0, t1, t0      # t0 = -8
  add t0, t1, t0      # t0 = -10
  add t0, t1, t0      # t0 = -12
  add t0, t1, t0      # t0 = -14
  add t0, t1, t0      # t0 = -16
  sw t0, 0(s0)        # Write Answer (DM[_answer + 0])
  addi s0, s0, 4
sub:
  li t0, 0x00000000   # 0
  li t1, 0xffffffff   # -1
  sub t0, t0, t1      # t0 = 1
  sub t0, t0, t1      # t0 = 2
  sub t0, t0, t1      # t0 = 3
  sub t0, t0, t1      # t0 = 4
  sub t0, t0, t1      # t0 = 5
  li t1, 0xfffffffd   # -3
  sub t0, t1, t0      # t0 = -8
  sub t0, t1, t0      # t0 = 5
  sub t0, t1, t0      # t0 = -8
  sub t0, t1, t0      # t0 = 5
  sub t0, t1, t0      # t0 = -8
  sw t0, 0(s0)        # Write Answer (DM[_answer + 4])
  addi s0, s0, 4
sll:
  li t0, 0x00000001   # 1
  li t1, 0x00000001   # 1
  sll t0, t0, t1      # t0 = 2
  sll t0, t0, t1      # t0 = 4
  sll t0, t0, t1      # t0 = 8
  sll t0, t0, t1      # t0 = 16
  sll t0, t0, t1      # t0 = 32
  li t1, 0x00000002   # 2
  sll t0, t1, t0      # t0 = 2
  sll t0, t1, t0      # t0 = 8
  sll t0, t1, t0      # t0 = 512
  sll t0, t1, t0      # t0 = 2
  sll t0, t1, t0      # t0 = 8
  sw t0, 0(s0)        # Write Answer (DM[_answer + 8])
  addi s0, s0, 4
slt:
  li t0, 0xffffffff   # -1
  li t1, 0x00000001   # 1
  slt t0, t0, t1      # t0 = 1
  slt t0, t0, t1      # t0 = 0
  slt t0, t0, t1      # t0 = 1
  slt t0, t0, t1      # t0 = 0
  slt t0, t0, t1      # t0 = 1
  li t1, 0xffffffff   # -1
  slt t0, t1, t0      # t0 = 1
  slt t0, t1, t0      # t0 = 1
  slt t0, t1, t0      # t0 = 1
  slt t0, t1, t0      # t0 = 1
  slt t0, t1, t0      # t0 = 1
  sw t0, 0(s0)        # Write Answer (DM[_answer + 12])
  addi s0, s0, 4
sltu:
  li t0, 0xffffffff   # large positive number
  li t1, 0x00000001   # 1
  sltu t0, t0, t1     # t0 = 0
  sltu t0, t0, t1     # t0 = 1
  sltu t0, t0, t1     # t0 = 0
  sltu t0, t0, t1     # t0 = 1
  sltu t0, t0, t1     # t0 = 0
  sltu t0, t0, t1     # t0 = 1
  li t1, 0x00000000   # 0
  sltu t0, t1, t0     # t0 = 1
  sltu t0, t1, t0     # t0 = 1
  sltu t0, t1, t0     # t0 = 1
  sltu t0, t1, t0     # t0 = 1
  sltu t0, t1, t0     # t0 = 1
  sw t0, 0(s0)        # Write Answer (DM[_answer + 16])
  addi s0, s0, 4
xor:
  li t0, 0xffffffff   # 
  li t1, 0xf0f0f0f0   # 
  xor t0, t0, t1      # t0 = 0x0f0f0f0f
  xor t0, t0, t1      # t0 = 0xffffffff
  xor t0, t0, t1      # t0 = 0x0f0f0f0f
  xor t0, t0, t1      # t0 = 0xffffffff
  xor t0, t0, t1      # t0 = 0x0f0f0f0f
  li t1, 0x77777777   # 
  xor t0, t1, t0      # t0 = 0x78787878
  xor t0, t1, t0      # t0 = 0x0f0f0f0f
  xor t0, t1, t0      # t0 = 0x78787878
  xor t0, t1, t0      # t0 = 0x0f0f0f0f
  xor t0, t1, t0      # t0 = 0x78787878
  sw t0, 0(s0)        # Write Answer (DM[_answer + 20])
  addi s0, s0, 4
srl:
  li t0, 0xffffffff   #
  li t1, 0x75eca864   #
  srl t0, t0, t1      # t0 = 0x0fffffff
  srl t0, t0, t1      # t0 = 0x00ffffff
  srl t0, t0, t1      # t0 = 0x000fffff
  srl t0, t0, t1      # t0 = 0x0000ffff
  srl t0, t0, t1      # t0 = 0x00000fff
  li t1, 0x12345678   #
  srl t0, t1, t0      # t0 = 0x00000000
  srl t0, t1, t0      # t0 = 0x12345678
  srl t0, t1, t0      # t0 = 0x00000012
  srl t0, t1, t0      # t0 = 0x0000048d
  srl t0, t1, t0      # t0 = 0x000091a2
  sw t0, 0(s0)        # Write Answer (DM[_answer + 24])
  addi s0, s0, 4
sra:
  li t0, 0x87654321   #
  li t1, 0x00000004   #
  sra t0, t0, t1      # t0 = 0xf8765432
  sra t0, t0, t1      # t0 = 0xff876543
  sra t0, t0, t1      # t0 = 0xfff87654
  sra t0, t0, t1      # t0 = 0xffff8765
  sra t0, t0, t1      # t0 = 0xfffff876
  li t1, 0x77777777   #
  sra t0, t1, t0      # t0 = 0x000001dd
  sra t0, t1, t0      # t0 = 0x00000003
  sra t0, t1, t0      # t0 = 0x0eeeeeee
  sra t0, t1, t0      # t0 = 0x0001dddd
  sra t0, t1, t0      # t0 = 0x00000003
  sw t0, 0(s0)        # Write Answer (DM[_answer + 28])
  addi s0, s0, 4
or:
  li t0, 0x12345678   # 
  li t1, 0xfedcba98   # 
  or t0, t0, t1       # t0 = 0xfefcfef8
  or t0, t0, t1       # t0 = 0xfefcfef8
  or t0, t0, t1       # t0 = 0xfefcfef8
  or t0, t0, t1       # t0 = 0xfefcfef8
  or t0, t0, t1       # t0 = 0xfefcfef8
  li t1, 0x62400285   # 
  or t0, t1, t0       # t0 = 0xfefcfefd
  or t0, t1, t0       # t0 = 0xfefcfefd
  or t0, t1, t0       # t0 = 0xfefcfefd
  or t0, t1, t0       # t0 = 0xfefcfefd
  or t0, t1, t0       # t0 = 0xfefcfefd
  sw t0, 0(s0)        # Write Answer (DM[_answer + 32])
  addi s0, s0, 4
and:
  li t0, 0x12345678   # 
  li t1, 0xffffffff   # 
  and t0, t0, t1      # t0 = 0x12345678
  and t0, t0, t1      # t0 = 0x12345678
  and t0, t0, t1      # t0 = 0x12345678
  and t0, t0, t1      # t0 = 0x12345678
  and t0, t0, t1      # t0 = 0x12345678
  li t1, 0xf0f0f0f0   # 
  and t0, t1, t0      # t0 = 0x10305070
  and t0, t1, t0      # t0 = 0x10305070
  and t0, t1, t0      # t0 = 0x10305070
  and t0, t1, t0      # t0 = 0x10305070
  and t0, t1, t0      # t0 = 0x10305070
  sw t0, 0(s0)        # Write Answer (DM[_answer + 36])
  addi s0, s0, 4
load:
  la t1, lw_data
  lw t0, 0(t1)        # t0 = 0x66666666
  addi sp, sp, -20    # sp = _stack - 24
  sw t0, 0(sp)        # 0x66666666 -> DM[_stack - 24]
  addi t0, sp, 0      # t0 = _stack - 24
  sw t0, 4(sp)        # t0 -> DM[_stack - 20]
  addi t0, sp, 4      # t0 = _stack - 20
  sw t0, 8(sp)        # t0 -> DM[_stack - 16]
  addi t0, sp, 8      # t0 = _stack - 16
  sw t0, 12(sp)       # t0 -> DM[_stack - 12]
  addi t0, sp, 12     # t0 = _stack - 12
  sw t0, 16(sp)       # t0 -> DM[_stack - 8]
  addi t0, sp, 16     # t0 = _stack - 8
  lw t0, 0(t0)        # t0 = DM[_stack - 8] = _stack - 12
  lw t0, 0(t0)        # t0 = DM[_stack - 12] = _stack - 16
  lw t0, 0(t0)        # t0 = DM[_stack - 16] = _stack - 20
  lw t0, 0(t0)        # t0 = DM[_stack - 20] = _stack - 24
  lw t0, 0(t0)        # t0 = DM[_stack - 24] = 0x66666666
  addi sp, sp, 20     # sp = _stack - 4
  lw t1, -4(sp)       # t1 = DM[_stack - 8] = _stack - 12
  lw t2, -8(sp)       # t2 = DM[_stack - 12] = _stack - 16
  lw t3, -12(sp)      # t3 = DM[_stack - 16] = _stack - 20
  lw t4, -16(sp)      # t4 = DM[_stack - 20] = _stack - 24
  lw t5, -20(sp)      # t5 = DM[_stack - 24] = 0x66666666
  add t1, t1, t4      # t1 = (_stack - 12) + (_stack - 24)
  add t2, t2, t3      # t2 = (_stack - 16) + (_stack - 20)
  sub t1, t1, t2      # t1 = 0
  add t1, t1, t5      # t1 = 0 + 0x66666666 = 0x66666666
  add t0, t0, t1      # t0 = 0x66666666 + 0x66666666 = 0xcccccccc
  addi s0, s0, 16
  sw t0, -16(s0)      # Write Answer (DM[_answer + 40])
  lb t1, -16(s0)      # t1 = 0xffffffcc
  lh t2, -16(s0)      # t2 = 0xffffcccc
  lbu t3, -16(s0)     # t3 = 0x000000cc
  lhu t4, -16(s0)     # t4 = 0x0000cccc
  sw t1, -12(s0)      # Write Answer (DM[_answer + 44])
  sw t2, -8(s0)       # Write Answer (DM[_answer + 48])
  sw t3, -4(s0)       # Write Answer (DM[_answer + 52])
  sw t4, 0(s0)        # Write Answer (DM[_answer + 56])
  addi s0, s0, 4
addi:
  li t0, 0xffffffff   # -1
  addi t0, t0, -1     # t0 = -2
  addi t0, t0, 1893   # t0 = 0x00000763
  addi t0, t0, -1912  # t0 = 0xffffffeb
  addi t0, t0, 1074   # t0 = 0x0000041d
  addi t0, t0, -1348  # t0 = 0xfffffed9
  li t1, 0x00000521   # t1 = 1313 (0x0000_0521)
  addi t2, t1, -798   # t2 = 515  (0x0000_0203)
  addi t3, t1, 315    # t3 = 1628 (0x0000_065c)
  addi t4, t1, 1177   # t4 = 2490 (0x0000_09ba)
  addi t5, t1, -2047  # t5 = -734 (0xffff_fd22)
  addi t6, t1, -1432  # t6 = -119 (0xffff_ff89)
  add t2, t2, t3      # t2 = 2143 (0x0000_085f)
  add t4, t4, t5      # t4 = 1756 (0x0000_06dc)
  add t0, t0, t6      # t0 = -414 (0xffff_fe62)
  add t2, t2, t4      # t2 = 3899 (0x0000_0f3b)
  add t0, t0, t2      # t0 = 0x00000d9d
  sw t0, 0(s0)        # Write Answer (DM[_answer + 60])
  addi s0, s0, 4
slti:
  li t0, 0xffffffff   # -1
  slti t0, t0, -1     # t0 = 0
  slti t0, t0, 1000   # t0 = 1
  slti t0, t0, -2000  # t0 = 0
  slti t0, t0, 1      # t0 = 1
  slti t0, t0, 1111   # t0 = 1
  li t1, 0xfffffc66   # -922
  slti t2, t1, -876   # t2 = 1
  slti t3, t1, 555    # t3 = 1
  slti t4, t1, -1996  # t4 = 0
  slti t5, t1, 0      # t5 = 1
  slti t6, t1, -922   # t6 = 0
  add t2, t2, t3      # t2 = 2
  add t4, t4, t5      # t4 = 1
  add t0, t0, t6      # t0 = 1
  add t2, t2, t4      # t2 = 3
  add t0, t0, t2      # t0 = 4
  sw t0, 0(s0)        # Write Answer (DM[_answer + 64])
  addi s0, s0, 4
sltiu:
  li t0, 0xfffffffe   # large positive number
  sltiu t0, t0, -1    # t0 = 1 (< 0xffffffff)
  sltiu t0, t0, 1000  # t0 = 1
  sltiu t0, t0, -2000 # t0 = 1
  sltiu t0, t0, -255  # t0 = 1
  sltiu t0, t0, 1     # t0 = 0
  li t1, 0xaaaabbbb   # large positive number
  sltiu t2, t1, -876  # t2 = 1
  sltiu t3, t1, 555   # t3 = 0
  sltiu t4, t1, -1996 # t4 = 1
  sltiu t5, t1, 0     # t5 = 0
  sltiu t6, t1, -922  # t6 = 1
  add t2, t2, t3      # t2 = 1
  add t4, t4, t5      # t4 = 1
  add t0, t0, t6      # t0 = 1
  add t2, t2, t4      # t2 = 2
  add t0, t0, t2      # t0 = 3
  sw t0, 0(s0)        # Write Answer (DM[_answer + 68])
  addi s0, s0, 4
xori:
  li t0, 0xffffffff   #
  xori t0, t0, 123    # t0 = 0xffffff84
  xori t0, t0, -1675  # t0 = 0x000006f1
  xori t0, t0, -831   # t0 = 0xfffffa30
  xori t0, t0, 2033   # t0 = 0xfffffdc1
  xori t0, t0, 1187   # t0 = 0xfffff962
  li t1, 0x00000387   # t1 = 903
  xori t2, t1, -285   # t2 = 0xfffffd64
  xori t3, t1, 164    # t3 = 0x00000323
  xori t4, t1, 1766   # t4 = 0x00000561
  xori t5, t1, -1895  # t5 = 0xfffffb1e
  xori t6, t1, 1209   # t6 = 0x0000073e
  add t2, t2, t3      # t2 = 0x00000087
  add t4, t4, t5      # t4 = 0x0000007f
  add t0, t0, t6      # t0 = 0x000000a0
  add t2, t2, t4      # t2 = 0x00000106
  add t0, t0, t2      # t0 = 0x000001a6
  sw t0, 0(s0)        # Write Answer (DM[_answer + 72])
  addi s0, s0, 4
ori:
  li t0, 0x00000001   #
  ori t0, t0, 444     # t0 = 0x000001bd
  ori t0, t0, 1765    # t0 = 0x000007fd
  ori t0, t0, -291    # t0 = 0xfffffffd
  ori t0, t0, 156     # t0 = 0xfffffffd
  ori t0, t0, 1282    # t0 = 0xffffffff
  li t1, 0x00000783   # t1 = 1923
  ori t2, t1, 285     # t2 = 0x0000079f
  ori t3, t1, -164    # t3 = 0xffffffdf
  ori t4, t1, -1766   # t4 = 0xffffff9b
  ori t5, t1, 1895    # t5 = 0x000007e7
  ori t6, t1, -1209   # t6 = 0xffffffc7
  add t2, t2, t3      # t2 = 0x0000077e
  add t4, t4, t5      # t4 = 0x00000782
  add t0, t0, t6      # t0 = 0xffffffc6
  add t2, t2, t4      # t2 = 0x00000f00
  add t0, t0, t2      # t0 = 0x00000ec6
  sw t0, 0(s0)        # Write Answer (DM[_answer + 76])
  addi s0, s0, 4
andi:
  li t0, 0xabcdef98   #
  andi t0, t0, -333   # t0 = 0xabcdee90
  andi t0, t0, -188   # t0 = 0xabcdee00
  andi t0, t0, 521    # t0 = 0x00000200
  andi t0, t0, -377   # t0 = 0x00000200
  andi t0, t0, 853    # t0 = 0x00000200
  li t1, 0x12345678   #
  andi t2, t1, 2033   # t2 = 0x00000670
  andi t3, t1, 218    # t3 = 0x00000058
  andi t4, t1, -316   # t4 = 0x12345640
  andi t5, t1, 1199   # t5 = 0x00000428
  andi t6, t1, -775   # t6 = 0x12345478
  add t2, t2, t3      # t2 = 0x000006c8
  add t4, t4, t5      # t4 = 0x12345a68
  add t0, t0, t6      # t0 = 0x12345678
  add t2, t2, t4      # t2 = 0x12346130
  add t0, t0, t2      # t0 = 0x2468b7a8
  sw t0, 0(s0)        # Write Answer (DM[_answer + 80])
  addi s0, s0, 4
slli:
  li t0, 0x0000000a   #
  slli t0, t0, 2      # t0 = 0x00000028
  slli t0, t0, 5      # t0 = 0x00000500
  slli t0, t0, 7      # t0 = 0x00028000
  slli t0, t0, 10     # t0 = 0x0a000000
  slli t0, t0, 6      # t0 = 0x80000000
  li t1, 0x1ab23cd4   #
  slli t2, t1, 15     # t2 = 0x1e6a0000
  slli t3, t1, 6      # t3 = 0xac8f3500
  slli t4, t1, 28     # t4 = 0x40000000
  slli t5, t1, 17     # t5 = 0x79a80000
  slli t6, t1, 7      # t6 = 0x591e6a00
  add t2, t2, t3      # t2 = 0xcaf93500
  add t4, t4, t5      # t4 = 0xb9a80000
  add t0, t0, t6      # t0 = 0xd91e6a00
  add t2, t2, t4      # t2 = 0x84a13500
  add t0, t0, t2      # t0 = 0x5dbf9f00
  sw t0, 0(s0)        # Write Answer (DM[_answer + 84])
  addi s0, s0, 4
srli:
  li t0, 0xa1b2c3d4   #
  srli t0, t0, 3      # t0 = 0x1436587a
  srli t0, t0, 4      # t0 = 0x01436587
  srli t0, t0, 6      # t0 = 0x00050d96
  srli t0, t0, 11     # t0 = 0x000000a1
  srli t0, t0, 7      # t0 = 0x00000001
  li t1, 0xaabf790c   #
  srli t2, t1, 25     # t2 = 0x00000055
  srli t3, t1, 16     # t3 = 0x0000aabf
  srli t4, t1, 18     # t4 = 0x00002aaf
  srli t5, t1, 27     # t5 = 0x00000015
  srli t6, t1, 17     # t6 = 0x0000555f
  add t2, t2, t3      # t2 = 0x0000ab14
  add t4, t4, t5      # t4 = 0x00002ac4
  add t0, t0, t6      # t0 = 0x00005560
  add t2, t2, t4      # t2 = 0x0000d5d8
  add t0, t0, t2      # t0 = 0x00012b38
  sw t0, 0(s0)        # Write Answer (DM[_answer + 88])
  addi s0, s0, 4
srai:
  li t0, 0xa1b2c3d4   #
  srai t0, t0, 5      # t0 = 0xfd0d961e
  srai t0, t0, 2      # t0 = 0xff436587
  srai t0, t0, 8      # t0 = 0xffff4365
  srai t0, t0, 9      # t0 = 0xffffffa1
  srai t0, t0, 4      # t0 = 0xfffffffa
  li t1, 0xaabf790c   #
  srai t2, t1, 13     # t2 = 0xfffd55fb
  srai t3, t1, 8      # t3 = 0xffaabf79
  srai t4, t1, 9      # t4 = 0xffd55fbc
  srai t5, t1, 14     # t5 = 0xfffeaafd
  srai t6, t1, 4      # t6 = 0xfaabf790
  add t2, t2, t3      # t2 = 0xffa81574
  add t4, t4, t5      # t4 = 0xffd40ab9
  add t0, t0, t6      # t0 = 0xfaabf78a
  add t2, t2, t4      # t2 = 0xff7c202d
  add t0, t0, t2      # t0 = 0xfa2817b7
  sw t0, 0(s0)        # Write Answer (DM[_answer + 92])
  addi s0, s0, 4
jalr:
  li t0, 0xfffff000   #
  la t1, 1f           # t1 = Addr (Forward Local Label 1)
  jalr t1, t1, 0      # First jump
  ori t0, t0, 1       # t0 = 0xfffff001 // Shouldn't be execute
  jalr t1, t1, 4      # Third jump
  ori t0, t0, 4       # t0 = 0xfffff004 // Shouldn't be execute
  jalr t1, t1, 4      # Fifth jump
  ori t0, t0, 16      # t0 = 0xfffff010 // Shouldn't be execute
1:
  jalr t1, t1, 4      # Second jump
  ori t0, t0, 1       # t0 = 0xfffff002 // Shouldn't be execute
  jalr t1, t1, 4      # Fourth jump
  ori t0, t0, 8       # t0 = 0xfffff008 // Shouldn't be execute
# // ===================
  la t1, 2f           # t2 = Addr (Forward Local Label 2)
  jalr t2, t1, -32    # t2 = t1 - 36    // First jump
  ori t0, t0, 32      # t0 = 0xfffff020 // Shouldn't be execute
  jalr t3, t1, -24    # t3 = t1 - 28    // Second jump
  ori t0, t0, 64      # t0 = 0xfffff040 // Shouldn't be execute
  jalr t4, t1, -16    # t4 = t1 - 20    // Third jump
  ori t0, t0, 128     # t0 = 0xfffff080 // Shouldn't be execute
  jalr t5, t1, -8     # t5 = t1 - 12    // Fourth jump
  ori t0, t0, 256     # t0 = 0xfffff100 // Shouldn't be execute
  jalr t6, t1, 0      # t6 = t1 - 4     // Fifth jump
  ori t0, t0, 512     # t0 = 0xfffff200 // Shouldn't be execute
2:
  sub t2, t2, t3      # t2 = -8
  sub t4, t4, t5      # t4 = -8
  sub t6, t6, t1      # t6 = -4
  add t2, t2, t4      # t2 = -16
  add t1, t2, t6      # t1 = -20
  sll t0, t0, t1      # t0 = 0xfffff000 << 5'b01100 = 0xff000000
  sw t0, 0(s0)        # Write Answer (DM[_answer + 96])
  addi s0, s0, 4
store:
  li t0, 0x0000000f   #
  li t1, 0x000000f0   #
  li t2, 0x00000f00   #
  li t3, 0x0000f000   #
  li t4, 0x12345678   #
  addi s0, s0, 20
  sw t0, -4(s0)       # Write Answer (DM[_answer + 116])
  sw t1, -8(s0)       # Write Answer (DM[_answer + 112])
  sw t2, -12(s0)      # Write Answer (DM[_answer + 108])
  sw t3, -16(s0)      # Write Answer (DM[_answer + 104])
  sw t4, -20(s0)      # Write Answer (DM[_answer + 100])
# // ==================
  addi s0, s0, 20
  lw t5, -40(s0)      # t5 = 0x12345678
  lw t4, -16(s0)      # t4 = 0x0
  sw t5, -4(s0)       # Write Answer (DM[_answer + 136])
  sb t5, -8(s0)       # Write Answer (DM[_answer + 132])
  sh t5, -12(s0)      # Write Answer (DM[_answer + 128])
  sb t5, -13(s0)      # Write Answer (DM[_answer + 127])
  sh t5, -18(s0)      # Write Answer (DM[_answer + 122])
# // ==================
  lw t0 ,-16(s0)      # t0 = 0x78000000
  lw t1, -20(s0)      # t0 = 0x56780000
  add t2, t1, t0      # t2 = 0xce780000
  addi s0, s0, 4
  sw t2, -4(s0)       # Write Answer (DM[_answer + 140])
beq:
  li t0, 0xfffff000
  li t1, 0xfffff000
  li t1, 0x00000ff0
  beq t0, t1, 1f      # No jump
  beq t0, t1, 1f      # No jump
  beq t0, t1, 1f      # No jump
  beq t0, t1, 1f      # No jump
  beq t0, t1, 1f      # No jump
  li t1, 0xfffff000
  li t1, 0x00000fff
  beq t1, t0, 1f      # No jump
  beq t1, t0, 1f      # No jump
  beq t1, t0, 1f      # No jump
  beq t1, t0, 1f      # No jump
  beq t1, t0, 1f      # No jump
  j 2f                # Jump to Forward Local Label 2
1:
  ori t0, t0, 1       # t0 = 0xfffff001 // Shouldn't be execute
2:
  xori t1, t1, -1     # t1 = 0xfffff000
  beq t0, t1, 3f      # Jump to Forward Local Label 3
  ori t0, t0, 2       # t0 = 0xfffff002 // Shouldn't be execute
3:
  sw t0, 0(s0)        # Write Answer (DM[_answer + 144])
  addi s0, s0, 4
bne:
  li t0, 0xfffff000   
  li t1, 0x00000ff0
  li t1, 0xfffff000
  bne t0, t1, 1f      # No jump
  bne t0, t1, 1f      # No jump
  bne t0, t1, 1f      # No jump
  bne t0, t1, 1f      # No jump
  bne t0, t1, 1f      # No jump
  li t1, 0x00000fff
  li t1, 0xfffff000
  bne t1, t0, 1f      # No jump
  bne t1, t0, 1f      # No jump
  bne t1, t0, 1f      # No jump
  bne t1, t0, 1f      # No jump
  bne t1, t0, 1f      # No jump
  j 2f                # Jump to Forward Local Label 2
1:
  ori t0, t0, 1       # t0 = 0xfffff001 // Shouldn't be execute
2:
  xori t1, t1, -1     # t1 = 0x00000fff
  bne t0, t1, 3f      # Jump to Forward Local Label 3
  ori t0, t0, 2       # t0 = 0xfffff002 // Shouldn't be execute
3:
  sw t0, 0(s0)        # Write Answer (DM[_answer + 148])
  addi s0, s0, 4
blt:
  li t0, 0xfffff000
  li t1, 0x00000ff0
  addi t1, t0, -4     # t1 = 0xffffeffc
  blt t0, t1, 1f      # No jump
  blt t0, t1, 1f      # No jump
  blt t0, t1, 1f      # No jump
  blt t0, t1, 1f      # No jump
  blt t0, t1, 1f      # No jump
  li t1, 0x00000fff
  addi t1, t0, 4      # t1 = 0xfffff004
  blt t1, t0, 1f      # No jump
  blt t1, t0, 1f      # No jump
  blt t1, t0, 1f      # No jump
  blt t1, t0, 1f      # No jump
  blt t1, t0, 1f      # No jump
  j 2f                # Jump to Forward Local Label 2
1:
  ori t0, t0, 1       # t0 = 0xfffff001 // Shouldn't be execute
2:
  li t1, 0x00000fff
  blt t0, t1, 3f      # test '<', Jump to Forward Local Label 3
  ori t0, t0, 2       # t0 = 0xfffff002 // Shouldn't be execute
3:
  mv t1, t0
  blt t0, t1, 4f      # test '=', no jump
  j 5f                # Jump to Forward Local Label 5
4:
  ori t0, t0, 4       # t0 = 0xfffff004 // Shouldn't be execute
5:
  li t1, 0xffffeeee   # 
  blt t0, t1, 6f      # test '>', no jump
  j 7f                # Jump to Forward Local Label 7
6:
  ori t0, t0, 8       # t0 = 0xfffff008 // Shouldn't be execute
7:
  sw t0, 0(s0)        # Write Answer (DM[_answer + 152]) 
  addi s0, s0, 4
bge:
  li t0, 0xfffff000
  li t1, 0xfffff000
  addi t1, t0, 4      # t1 = 0xfffff004
  bge t0, t1, 1f      # No jump
  bge t0, t1, 1f      # No jump
  bge t0, t1, 1f      # No jump
  bge t0, t1, 1f      # No jump
  bge t0, t1, 1f      # No jump
  li t1, 0xffff0000
  addi t1, t0, -4     # t1 = 0xffffeffc
  bge t1, t0, 1f      # No jump
  bge t1, t0, 1f      # No jump
  bge t1, t0, 1f      # No jump
  bge t1, t0, 1f      # No jump
  bge t1, t0, 1f      # No jump
  j 2f                # Jump to Forward Local Label 2
1:
  ori t0, t0, 1       # t0 = 0xfffff001 // Shouldn't be execute
2:
  li t1, 0x00000fff
  bge t0, t1, 3f      # test '<', no jump
  j 4f                # Jump to Forward Local Label 4
3:
  ori t0, t0, 2       # t0 = 0xfffff002 // Shouldn't be execute
4:
  mv t1, t0
  bge t0, t1, 5f      # test '=', Jump to Forward Local Label 5
  ori t0, t0, 4       # t0 = 0xfffff004 // Shouldn't be execute
5:
  li t1, 0xffffeeee
  bge t0, t1, 6f      # test '>', Jump to Forward Local Label 6
  ori t0, t0, 8       # t0 = 0xfffff008 // Shouldn't be execute
6:
  sw t0, 0(s0)        # Write Answer (DM[_answer + 156])
  addi s0, s0, 4
bltu:
  li t0, 0xfffff000
  li t1, 0xffffff00
  addi t1, t0, -4     # t1 = 0xffffeffc
  bltu t0, t1, 1f     # No jump
  bltu t0, t1, 1f     # No jump
  bltu t0, t1, 1f     # No jump
  bltu t0, t1, 1f     # No jump
  bltu t0, t1, 1f     # No jump
  li t1, 0xffffffff
  addi t1, t0, 4      # t1 = 0xfffff004
  bltu t1, t0, 1f     # No jump
  bltu t1, t0, 1f     # No jump
  bltu t1, t0, 1f     # No jump
  bltu t1, t0, 1f     # No jump
  bltu t1, t0, 1f     # No jump
  j 2f                # Jump to Forward Local Label 2
1:
  ori t0, t0, 1       # t0 = 0xfffff001 // Shouldn't be execute
2:
  li t1, 0xffffffff 
  bltu t0, t1, 3f     # test '<', Jump to Forward Local Label 3
  ori t0, t0, 2       # t0 = 0xfffff002 // Shouldn't be execute
3:
  mv t1, t0           
  bltu t0, t1, 4f     # test '=', no jump
  j 5f                # Jump to Forward Local Label 5
4:
  ori t0, t0, 4       # t0 = 0xfffff004 // Shouldn't be execute
5:
  li t1, 0x00000fff
  bltu t0, t1, 6f     # test '>', no jump
  j 7f                # Jump to Forward Local Label 7
6:
  ori t0, t0, 8       # t0 = 0xfffff008 // Shouldn't be execute
7:
  sw t0, 0(s0)        # Write Answer (DM[_answer + 160])
  addi s0, s0, 4
bgeu:
  li t0, 0xfffff000
  li t1, 0xfffff000
  addi t1, t0, 4      # t1 = 0xfffff004
  bgeu t0, t1, 1f     # No jump
  bgeu t0, t1, 1f     # No jump
  bgeu t0, t1, 1f     # No jump
  bgeu t0, t1, 1f     # No jump
  bgeu t0, t1, 1f     # No jump
  li t1, 0x00000fff
  addi t1, t0, -4     # t1 = 0xffffeffc
  bgeu t1, t0, 1f     # No jump
  bgeu t1, t0, 1f     # No jump
  bgeu t1, t0, 1f     # No jump
  bgeu t1, t0, 1f     # No jump
  bgeu t1, t0, 1f     # No jump
  j 2f                # Jump to Forward Local Label 2
1:
  ori t0, t0, 1       # t0 = 0xfffff001 // Shouldn't be execute
2:
  li t1, 0xffffffff
  bgeu t0, t1, 3f     # test '<', no jump
  j 4f                # Jump to Forward Local Label 4
3:
  ori t0, t0, 2       # t0 = 0xfffff002 // Shouldn't be execute
4:
  mv t1, t0
  bgeu t0, t1, 5f     # test '=', Jump to Forward Local Label 5
  ori t0, t0, 4       # t0 = 0xfffff004 // Shouldn't be execute
5:
  li t1, 0x00000fff
  bgeu t0, t1, 6f     # test '>', Jump to Forward Local Label 6
  ori t0, t0, 8       # t0 = 0xfffff008 // Shouldn't be execute
6:
  sw t0, 0(s0)        # Write Answer (DM[_answer + 164])
  addi s0, s0, 4
auipc:
  auipc t0, 0x00000   # t0 = 0x0000_09d0
  auipc t1, 0xfffff   # t1 = 0xffff_f9d4
  auipc t2, 0x13579   # t2 = 0x1357_99d8
  add t1, t1, t2      # t1 = 0x1357_93ac
  add t0, t0, t1      # t0 = 0x1357_9d7c
  sw t0, 0(s0)        # Write Answer (DM[_answer + 168])
  addi s0, s0, 4
lui:
  lui t0, 0x00000     # t0 = 0x00000000
  lui t1, 0xfffff     # t1 = 0xfffff000
  lui t2, 0x13579     # t2 = 0x13579000
  add t1, t1, t2      # t1 = 0x13578000
  add t0, t0, t1      # t0 = 0x13578000
  sw t0, 0(s0)        # Write Answer (DM[_answer + 172])
  addi s0, s0, 4
jal:
  li t0, 0xfffff000   #
  jal t1, 1f          # Jump to Forward Local Label 1
  ori t0, t0, 1       # t0 = 0xfffff001 // Shouldn't be executed
1:
  la t2, 1b           # t2 = Addr (Backward Local Label 1)
  sub t1, t2, t1      # t1 = 4
  add t0, t0, t1      # t0 = 0xfffff004
  sw t0, 0(s0)        # Write Answer (DM[_answer + 176])
  addi s0, s0, 4

# ######################################


main_exit:

# ######################################
# ### Return to end the simulation
# ######################################

  lw s0, 0(sp)        # Retrieve Callee Saved
  addi sp, sp, 4
  ret

# ######################################
