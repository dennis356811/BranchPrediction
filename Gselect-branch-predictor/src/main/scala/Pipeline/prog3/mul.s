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
    andi s2, a1, 1      # check LSB is 1
    beqz s2, skip_add   # if LSB is 0, skip add
    add a0, a0, s0      # add multiplier to result
skip_add:
    slli s0, s0, 1      # shift left multiplier by 1
    srli a1, a1, 1      # shift right multiplicand by 1
    addi s1, s1, -1     # iteration time -1
    bnez s1, loop       # if not iterate 32 times, loop again

    ## Callee Retrieve ##
    lw s0, 0(sp)
    lw s1, 4(sp)
    lw s2, 8(sp)
    addi sp, sp, 12
    #####################
    # return
    ret            

