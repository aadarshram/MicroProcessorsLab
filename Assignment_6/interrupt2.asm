.org 0
rjmp reset ; on reset, program starts here
.org 0x002 ; Interrupt vector address for INT1
rjmp int1_ISR

reset:
    ldi R16, 0x70 ; setup the stack pointer to point to address 0x0070
    out spl, ...
    ldi  ..., 0
    out sph, ...
    ldi R16, ... ; Make PB1 output
    out ..., ...
    ldi R16, ... ; Make PORTD input
    out ..., ...
    ldi R16, 0x08 ; Use pull-up resistor for PD3
    out ..., ...

    in R16, ...
    ori R16, 0x80 ; Enable INT1 interrupt
    out ..., R16

    ldi R16, ... ; Turn off LED
    out ..., ...

    ... ; Enable interrupts

indefiniteloop: ... indefiniteloop
int1_ISR: ; INT1 interrupt handler or ISR
    ... ; Clear interrupts
    in R16, ... ; Save status register SREG
    push ...

ldi R16, ... ; Blink LED 10 times
mov R0, R16

back5:
    ldi R16, 02 ; Turn on LED
    out ..., ...

delay1:
    ldi R16, 0xFF ; delay
back2:
    ldi r17, 0xFF
back1: 
    dec r7
    brne back1
    dec r16
    brne back2

ldi R16, ... ; Turn off LED
out ..., ...

delay2: 
    ldi R16, 0xFF ; delay
back3:
    ldi r17, 0xFF
back4:
    dec r17
    brne back4
    dec R16
    brne back3
    dec ...
brne ... ; Check if LED has blinked 10 times
pop ... ; Retrieve status register
out ..., ...
... ; Go back to main program
