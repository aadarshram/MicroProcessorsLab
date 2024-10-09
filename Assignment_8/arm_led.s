; ARM Assebly code to interface LED with ARM microcontroller to display a number

; Defining the PORT addresses

    AREA LED, CODE, READONLY
    ENTRY
    EXPORT SystemInit
    EXPORT __main
; Fill corresponding addresses based on the LPC2378 manual
PINSEL10 EQU 0xE002C028
FIO2DIR EQU 0x3FFFC040
PINSEL4 EQU 0xE002C010
FIO2PIN EQU 0x3FFFC054

; Set up PINSEL10 by disabling ETM function in FIO2
SystemInit
LDR R0, =PINSEL10
LDR R2, [R0] ; why this if using mov hardcode??
BIC R2, R2, #0x00000008 ; do using MOV hardcode
STR R2, [R0]

; Set lower 8-bits of FIO2 as I/O by making 8 -pairs of PINSEL4 to 00 since we r using only 8 leds
LDR R0, =PINSEL4
LDR R2, [R0]
BIC R2, R2, #0x0000FFFF; MOV R2, 0xFFFFF # Hardcode value by pyttting last 16 bits as 0
STR R2, [R0]

; Set up FIO2DIR for the output pins
LDR R0, =FIO2DIR
MOV R2, #0x000000FF ; Set everything as output to allow any number input
STR R2, [R0]


__main
; Display a number on LED
    LDR R0, =FIO2PIN
    MOV R2, #0x00000003 ; Display number 3
    STR R2, [R0] ; sir gave R1 i think wrong

forever b forever
    END


