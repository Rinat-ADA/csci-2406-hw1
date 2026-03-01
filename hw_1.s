.global _start
_start:
    // r0 = m, r1 = n
    // r2 will hold the sum

    mov     r2, #0          // sum = 0
    mov     r3, #4          // word size (needed by assignment)
    mov     r6, r0          // i = m

    // CHECK part (no label allowed)
    cmp     r6, r1
    movle   r4, #4          // go to BODY
    movgt   r4, #0x1C       // go to EXIT

    mov     r5, pc          // PC read gives current+8 in ARM
    add     r5, r5, r4
    mov     pc, r5          // jump

    // BODY part
    add     r2, r2, r6      // sum += i
    add     r6, r6, #1      // i++

    mov     r4, #-44        // go back to CHECK (-0x2C)
    mov     r5, pc
    add     r5, r5, r4
    mov     pc, r5

    // EXIT part
    svc     2