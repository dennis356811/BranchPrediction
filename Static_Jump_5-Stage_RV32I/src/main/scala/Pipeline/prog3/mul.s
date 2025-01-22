.text
.global mul
mul:
    ####### a0: multiplier/ result  #######
    ####### a1: multiplicand        #######
    ### Callee Saved ###
    addi sp, sp, -12
    sw s0, 0(sp)
    sw s1, 4(sp)
    sw s2, 8(sp)
    ####################
    ## move arguement ##
    mv s0, a0
    mv a0, x0
    li s1, 32
    ####################
loop:
    andi s2, a1, 1    # x14 = rs2 & 1，檢查最低位是否為 1
    beqz s2, skip_add  # 如果最低位為 0，跳過加法
    add a0, a0, s0   # rd = rd + rs1
skip_add:
    slli s0, s0, 1    # rs1 左移 1 位（乘 2）
    srli a1, a1, 1    # rs2 右移 1 位
    addi s1, s1, -1   # 次數減 1
    bnez s1, loop      # 如果還有次數，跳回迴圈

    ## Callee Retrieve ##
    lw s0, 0(sp)
    lw s1, 4(sp)
    lw s2, 8(sp)
    addi sp, sp, 12
    #####################
    # 結束
    ret            # 無限跳回（模擬環境中可用）

