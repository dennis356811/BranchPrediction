# The square root routine starts with an initial approximation of the
# reciprocal of the square root based on the top four bits of the
# mantissa (potentially shifted to make the exponent even). Two
# Newton-Raphson iterations are performed, providing approximately
# 14 bits of accuracy. The reciprocal is multiplied by the original
# argument to give an approximation of the square root, also with
# around 14 bits of accuracy. The remainder is then calculated and
# multiplied by the reciprocal estimate to generate a correction term,
# resulting in an accuracy of about 28 bits. Finally, a remainder check
# ensures correct rounding if necessary. The fixed-point calculation
# carefully maintains accuracy, similar to the considerations made in
# the fast division routine. The reciprocal square root calculation has
# been thoroughly tested with all possible input mantissa values
# (potentially shifted).
.data
rsqrtapp: .byte   0xf1, 0xda, 0xc9, 0xbb, 0xb0, 0xa6, 0x9e, 0x97, 0x91, 0x8b, 0x86, 0x82
.text
.global sqrtf
sqrtf:
    # Check if the argument is negative.
    bltz    a0, sq_0         # If negative, jump to sq_0.

    # Extract mantissa (23+1 bits) without the exponent and add the
    # implied hidden bit '1' -> A1.
    slli    a1, a0, 8        # Shift mantissa left by 8 bits.
    li      t5, 0x80000000
    or      a1, a1, t5
    srli    a1, a1, 8                     # Restore mantissa to its original position.

    # Extract the exponent (8 bits, without the sign bit) -> A2.
    srli    a2, a0, 23       # Extract exponent and store it in A2.

    # Check if the number is zero.
    beqz    a2, sq_2         # If exponent is zero, jump to sq_2.

    # Check if the number is infinity.
    li      a4, 255          # Load the exponent value for infinity.
    beq     a2, a4, sq_1                     # If exponent equals 255, jump to sq_1.

    # Pre-correction for packing - add 125 to the exponent.
    addi     a2, a2, 125      # Adjust exponent for packing.

    # Halve the exponent (square root operation halves the exponent) - if
    # odd, double the mantissa.
    slli    a4, a2, 31       # Save the lowest bit of the exponent in A4.
    srai    a2, a2, 1                     # Divide the exponent by 2.
    beqz    a4, 1f           # If exponent is even, jump to label 1.
    slli    a1, a1, 1        # If exponent was odd, double the mantissa.

    # Retrieve the first approximation from the table based on the top 4
    # bits of the mantissa.
1:  lui     a4, %hi(rsqrtapp-4)  # Load the high address of the table.
    srli    a3, a1, 21           # Extract the top 4 bits of the mantissa.
    add     a4, a4, a3           # Compute the table address.
    lbu     a4, %lo(rsqrtapp-4)(a4) # Load the initial approximation.

    # Perform the first Newton-Raphson iteration.
    srli    a0, a1, 7           # Shift right to prepare for iteration.
    
    addi    sp, sp, -8
    sw      ra, 0(sp)
    sw      a1, 4(sp)
    mv      a1, a4
    jal     ra, mul
    lw      ra, 0(sp)
    lw      a1, 4(sp)
    addi    sp, sp, 8
    #mul     a0, a0, a4          # Multiply m0 by y (Q24 result). 
    #0x01758000
    addi    sp, sp, -8
    sw      ra, 0(sp)
    sw      a1, 4(sp)
    mv      a1, a4
    jal     ra, mul
    lw      ra, 0(sp)
    lw      a1, 4(sp)
    addi    sp, sp, 8
    #mul     a0, a0, a4          # Square the result (Q32). 
    #0xf2310000
    srai    a0, a0, 12                        # Scale back to Q20.

    addi    sp, sp, -8
    sw      ra, 0(sp)
    sw      a1, 4(sp)
    mv      a1, a4
    jal     ra, mul
    lw      ra, 0(sp)
    lw      a1, 4(sp)
    addi    sp, sp, 8
    #mul     a0, a0, a4          # Multiply by m0 again (dy0 Q28).
    #0xff70bc60
    srai    a0, a0, 13          # Scale back to Q15.
    slli    a4, a4, 8           # Scale m0 to Q16.
    sub     a4, a4, a0          # Subtract dy0/2 from m0 (m1 Q16).
    addi    a4, a4, 170         # Apply correction to gain ~1 bit accuracy.

    # Perform the second Newton-Raphson iteration.
    mv      a0, a4              # Prepare for the second iteration.

    addi    sp, sp, -8
    sw      ra, 0(sp)
    sw      a1, 4(sp)
    mv      a1, a0
    jal     ra, mul
    lw      ra, 0(sp)
    lw      a1, 4(sp)
    addi    sp, sp, 8
    #mul     a0, a0, a0                        # Square m1 (Q32).
    #0x726a7359
    srli    a0, a0, 15                        # Scale back to Q17.
    srli    a3, a1, 8           # Prepare y (Q15).

    addi    sp, sp, -8
    sw      ra, 0(sp)
    sw      a1, 4(sp)
    mv      a1, a3
    jal     ra, mul
    lw      ra, 0(sp)
    lw      a1, 4(sp)
    addi    sp, sp, 8
    #mul     a0, a0, a3          # Multiply m1*m1 by y (Q32).
    #0x016e8000
    srai    a0, a0, 12          # Scale back to Q20.

    addi    sp, sp, -8
    sw      ra, 0(sp)
    sw      a1, 4(sp)
    mv      a1, a4
    jal     ra, mul
    lw      ra, 0(sp)
    lw      a1, 4(sp)
    addi    sp, sp, 8
    #mul     a0, a0, a4          # Multiply by m1 again (dy1 Q36).
    #0x0f504788
    srai    a0, a0, 21                        # Scale back to Q15.
    sub     a4, a4, a0          # Subtract dy1/2 from m1 (m2 Q16).

    addi    sp, sp, -12
    sw      ra, 0(sp)
    sw      a0, 4(sp)
    sw      a1, 8(sp)
    mv      a0, a3
    mv      a1, a4
    jal     ra, mul
    mv      a3, a0
    lw      ra, 0(sp)
    lw      a0, 4(sp)
    lw      a1, 8(sp)
    addi    sp, sp, 12
    #mul     a3, a3, a4          # Multiply y by m2 (Q31).
    #0xc0006000
    srli    a3, a3, 15          # Scale back to Q16.

    # At this point, m2 is the reciprocal square root approximation, and
    # m3 is the square root approximation.

    mv      a0, a3              # Move m3 to a0.

    addi    sp, sp, -8
    sw      ra, 0(sp)
    sw      a1, 4(sp)
    mv      a1, a0
    jal     ra, mul
    lw      ra, 0(sp)
    lw      a1, 4(sp)
    addi    sp, sp, 8
    #mul     a0, a0, a0          # Square m3 (Q32).
    #0x40000000
    slli    a1, a1, 9                        # Scale y to Q32.
    sub     a0, a1, a0          # Calculate the remainder (a2 = y - m3*m3).
    srai    a0, a0, 5                        # Scale remainder to Q27.

    addi    sp, sp, -12
    sw      ra, 0(sp)
    sw      a0, 4(sp)
    sw      a1, 8(sp)
    mv      a1, a4
    jal     ra, mul
    mv      a4, a0
    lw      ra, 0(sp)
    lw      a0, 4(sp)
    lw      a1, 8(sp)
    addi    sp, sp, 12
    #mul     a4, a4, a0          # Multiply a2 by m2 (Q43).
    #0x00000000
    slli    a3, a3, 7           # Scale m3 to Q23.
    srai    a0, a4, 15          # Scale the result (a2*m2 Q28).
    addi    a0, a0, 16                         # Apply rounding to Q24.
    srai    a0, a0, 6           # Scale back to Q22.

    # Perform final rounding.
    add     a3, a3, a0          # Add the correction term to m4 (Q23).
    sltu    a4, a3, a0                        # Check for overflow.
    beqz    a4, sq_3            # If no overflow, skip rounding.

    add     a4, a4, a3          # Add 0.5 ULP to m4 (Q24).

    addi    sp, sp, -12
    sw      ra, 0(sp)
    sw      a0, 4(sp)
    sw      a1, 8(sp)
    mv      a0, a4
    mv      a1, a4
    jal     ra, mul
    mv      a4, a0
    lw      ra, 0(sp)
    lw      a0, 4(sp)
    lw      a1, 8(sp)
    addi    sp, sp, 12
    #mul     a4, a4, a4          # Square m4 (Q48).
    # no operation
    slli    a1, a1, 16                        # Scale y to Q48.
    sub     a1, a1, a4          # Calculate the remainder (Q48).
    bltz    a1, sq_3            # If negative, skip.
    addi     a3, a3, 1           # Round up.

# Pack the final result.
sq_3:
    slli    a2, a2, 23                        # Pack the exponent.
    add     a0, a2, a3          # Combine the exponent and mantissa.
sq_6:   ret                     # Return the result.

# Handle negative argument.
sq_0:
    slli    a1, a0, 1           # Clear the sign bit.
    srli    a1, a1, 24          # Check if exponent is zero.
    beqz    a1, sq_2            # If -0, return it.

    # Return -Inf for negative non-zero values.
    srai    a0, a0, 31
sq_5:
    slli    a0, a0, 23
    ret

# Return +Inf for positive infinity.
sq_1:
    srli    a0, a0, 23
    j       sq_5

# Return ±zero.
sq_2:
    srli    a0, a0, 31
    slli    a0, a0, 31
    ret


