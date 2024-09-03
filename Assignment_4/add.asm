; Assembly code to add 10 numbers stored in flash memory and store the resultant output in a register. The numbers are assumed to be small enough that the final output is small enough to be stored in a regsiter

.cseg
.org 0x00

numbers: .db 1, 2, 3, 2, 1, 3, 1, 2, 1, 4

ldi r30, low(numbers)
ldi r31, high(numbers)

ldi r16, 0 ; Clear r16. It will hold the sum
ldi r17, 10 ; Loop counter

LOOP:
    lpm r18, Z+ ; Load a number
    add r16, r18 ; Add number to r16 (cumulative sum so far) and store final sum back in r16
    dec r17 ; Decrement loop counter
    brne LOOP ; Continue loop if counter != 0

; r16 holds the sum of the 10 numbers

nop ; No peration