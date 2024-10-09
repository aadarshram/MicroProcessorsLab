; Program to blink white LED on interrupt

.org 0 
rjmp reset ; start program
.org 0x002 ; Interrupt vector address for INT1
rjmp int1_ISR

reset:
    ldi R16, 0x70 ; Setup the stack pointer to point to address 0x0070
    out spl, R16 ; Set low
    ldi  R16, 0x00
    out sph, R16 ; Set high
    ldi R16, 0x01 ; Set PB1 to output in DDR
    out DDRB, R16
    ldi R16, 0x00 ; Set PORTD to input in DDR
    out DDRD, R16
    ldi R16, 0x08 ; Use pull-up resistor for PD3
    out PORTD, R16 ; Enable pin3  pull-up resistor

    in R16, GICR
    ori R16, 0x80 ; Enable INT1 interrupt in General Interrupt Control Register
    out GICR, R16

    ldi R16, 0x00 ; Turn off LED
    out PORTB, R16

    sei ; Enable interrupts in SREG

indefiniteloop: 
    rjmp indefiniteloop ; Main program -  do nothing (unless interrupt)

int1_ISR: ; INT1 interrupt handler or ISR
    cli ; Clear interrupts
    in R16, SREG ; Save status register SREG
    push R16 ; Push SREG contents onto stack

ldi R16, 10 
mov R0, R16 ;  Counter for LED blinks - no. = 10

back5:
    ldi R16, 0x02 ; Turn on LED
    out PORTB, R16

delay1:
    ldi R16, 0xFF ; counter for delay
back2:
    ldi r17, 0xFF ;  counter for more delay
back1: 
    dec r17
    brne back1
    dec r16
    brne back2

; Above block - delay in nested loop

ldi R16, 0x00 ; Turn off LED
out PORTB, R16

; Delay block - agin
delay2: 
    ldi R16, 0xFF ; delay
back3:
    ldi r17, 0xFF
back4:
    dec r17
    brne back4
    dec R16
    brne back3
    dec R0 ; Dec blink count
brne back5 ; Check if LED has blinked 10 times
pop R16 ; Retrieve status register from stack to R16
out SREG, R16 ; Restore SREG
rjmp indefiniteloop ; Go back to main program
