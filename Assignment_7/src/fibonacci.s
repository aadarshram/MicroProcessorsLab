; Program to find 10th fibonacci number 
    AREA Reset, CODE, READONLY
        
        ENTRY
            LDR r0, =0 ; Initialized to fib(0). Holds fib(n-2)
            LDR r1, =1 ; Initialized to fib(1). Holds fib(n-1)
            LDR r3, =0 ; Initialized to 0. Holds fib(n)
            LDR r2, =10 ; Counter initialized to 10 since we need 10th fib number
LOOP
    ADD r3, r1, r0 ; Fib sequence. fib(n) = fib(n-1) + fib(n-2)
    MOV r0, r1 ; Update fib(n-2)
    MOV r1, r3 ; Update fib(n-1)
    SUB r2, r2, #1 ; Dec counter
    CMP r2, 2 ;  Check if counter has reached 2. 
    BNE LOOP ;  Loop until 10th number is reached
STOP
    B STOP
    END
