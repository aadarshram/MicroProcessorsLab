; Program to divide a 32-bit binary number by a 16-bit binary number and store the quotient as well as the reminder.
	AREA Program, CODE, READONLY
		ENTRY
			LDR R0, Num2 ; Load Divisor
			LDR R1, Num1 ; Load Dividend
			MOV R2, #0 ; Initialize quotient to zero
    
Loop 
    CMP R0, #0 ; Test division by 0
    BEQ Error1 ; Throw error if so
    CMP R1, R0 ; Compare Dividend and Divisor
    BLO Result ; If Dividend is less than Divisor, show result
    ADD R2, R2, #1 ; Else, inc Quotient by 1
    SUB R1, R1, R0 ; Subtract Divisor from Dividend
    B Loop

Error1
    MOV R3, #0xFFFFFF ; Error flag (-1)

Result
    LDR R4, = Remainder ; Get address to store Remainder
    STR R1, [R4] ; Store the Remainder (= The value of remaining Dividend)
    LDR R5, = Quotient ; Get address to store Quotient
    STR R2, [R5] ; Store the Quotient
    SWI &11

Num1 DCD &00000008 ; 32-bit Num1 - Dividend
Num2 DCW &0004 ; 16-bit Num2 - Divisor
	ALIGN

	AREA Data2, DATA, READWRITE ;  Write memory
Quotient DCD 0
Remainder DCD 0
