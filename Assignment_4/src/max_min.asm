; Program to find maximum and minimum of 10 numbers stored in a flash and store the resulting output in some registors

; Code segment
.cseg
; Start address for the 10 numbers
.org 0x00
; Store in flash memory
numbers: .db 5, 12, 7, 9, 18, 4, 15, 11, 8, 6 ; .db tells directive to define byte. Used for storage

; Initialize Z pointer to number
ldi r30, low(numbers) ; Load the low byte of the number's address into ZL
ldi r31, high(numbers) ; Load the high byte of the number's address into ZH
; We use two registers, low() and high() to allow storage of 16-bit addresses in our 8-bit registers
; Z is like a pointer to the program memory

; We use r18 for storage of all accessed numbers, r19 for storage of the maximum and r20 for storage of the minimum
lpm r18, Z+ ; Load the first number into r18 registor and increment Z pointer
mov r19, r18 ; Set the initial maxmimum as the first number
mov r20, r18 ; Same with minimum
ldi r21, 9 ; We store the loop counter in r20 to fetch sequentially all 10 numbers. Initialize with 9 since 1 number already fetched.

LOOP:
    lpm r18, Z+ ; Load next number
    cp r18, r19 ; Compare with current maximum and modify carry flag in status register
    brlo SKIP_MAX ; If r18 < r19, then don't update maximum. Go to label SKIP_MAX (conditional branching)
    mov r19, r18 ; If no skip, then r18>r19. Update maximum in r19

SKIP_MAX:
    cp r18, r20 ; Compare for minimum
    brsh SKIP_MIN ; Branch if same or higher
    mov r20, r18 ; Update minimum in r20

SKIP_MIN:
    dec r21 ; Decrement loop counter and modify the zero flag in status register
    brne LOOP ; If counter != 0 continue the loop (conditional branching)

nop ; No operation

; r19 holds the maximum value and r20 holds the minimum


