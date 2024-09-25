; Program to divide a 32-bit binary number by a 16-bit binary number and store the quotient as well as the reminder.
AREA Program, CODE, READONLY
    ENTRY
        LDR R0, =Num2 ; Load Divisor
        LDR R1, =Num1 ; Load Dividend
        MOV R2, #0 ; Initialize quotient to zero
    
Loop 
    CMP R0, #0 ; Test division by 0
    BEQ Error1 ; Throw error if so
    CMP R1, R0 ; Compare Dividend and Divisor
    BLO Result ; If Dividend is less than Divisor, show result
    ADD R2, R2, #1 ; Else, inc Quotient by 1
    SUB R1, R1, R0 ; Subtract Divisor from Dividend
    B loop

Error1
    MOV R3, #0xFFFFFF ; Error flag (-1)

Result
    LDR R4, = Remainder ; Get address to store Remainder
    STR R4, R1 ; Store the Remainder (= The value of remaining Dividend)
    LDR R5, = Quotient ; Get address to store Quotient
    STR R5, R2 ; Store the Quotient
    SWI &11

Num1 DCD &12345678 ; 32-bit Num1 - Dividend
Num2 DCW &1234 ; 16-bit Num2 - Divisor
ALIGN

AREA Data2, DATA, READWRITE ;  Write memory
Quotient DCD 0
Remainder DCD 0