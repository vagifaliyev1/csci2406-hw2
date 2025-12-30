.global _start
_start:

    mov     r1, #0      @ Initialize R1 to 0 (not used later in control flow)
    mov     r2, #10     @ Load constant value 10 into R2 (used for accumulation)
    mov     r3, #0      @ Initialize R3 to 0 (loop counter)
    mov     r4, #5      @ Load value 5 into R4 (loop limit)

loop:
    subs    r5, r3, r4  @ Subtract R4 from R3 and store result in R5,
                        @ update condition flags for comparison (R3 < R4)

    addlt   r0, r0, r2  @ If R3 < R4, add 10 (R2) to R0
                        @ conditional execution based on LT flag

    addlt   r3, r3, #1  @ If R3 < R4, increment loop counter R3 by 1

    blt     loop        @ If LT condition is true, branch back to loop label

    bl      func        @ Branch to function 'func' and save return address in LR
	
func:
    str     lr, [sp, #-4]!  @ Decrement stack pointer and save return address (LR)
                            @ onto the stack (function prologue)

    mov     r4, #15     @ Load value 15 into R4 for arithmetic operations
    mov     r5, #10     @ Load value 10 into R5

    add     r6, r5, r4  @ Add R5 and R4 and store the result (25) in R6

    subs    r5, r3, r4  @ Subtract R4 from R3 and update flags
                        @ flags are set but not used afterward

    b       func        @ Unconditional branch back to start of function
                        @ creates an infinite loop and prevents return
