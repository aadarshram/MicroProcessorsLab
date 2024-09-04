; Assembly program to sort 5 numbers and store the final output in data memory
; We shall use bubble sort for our purposes

.cseg

.org 0x00
numbers: .db 1, 3, 4, 2, 5

sorted_numbers: .db 0, 0, 0, 0, 0 ; Initialize space for output storage in SRAM

; Initialize Z pointer
ldi r30, low(numbers)
ldi r31, high(numbers)

ldi r20, 0 ; Counter for loading numbers into SRAM / and for outer loop in bubble sort
ldi r22, 0 ; Inner loop counter for the bubble sort algorithm

; Initialize Y pointer
ldi r28, low(sorted_numbers)
ldi r29, high(sorted_numbers)

LOAD_NUMBERS:
    lpm r21, Z+ ; Load a number
    
    st Y+, r21 ; Store number at location using (store indirect - using pointers)

    inc r20 
    cpi r20, 5
    brne LOAD_NUMBERS ; Keep loading until 5 numbers are fetched
    ldi r20, 0 ; Reset register with value 0

; Bubble sort
OUTER_LOOP:
    ldi r22, 0 ; Reset inner loop index to 0
    ; Reset Y pointer
    ldi r28, low(sorted_numbers)
    ldi r29, high(sorted_numbers)


INNER_LOOP:

    ld r24, Y ; Load number at index r22
    inc r28
    ldi r25, Y ; Load next immediate number

    cp r24, r25 ; Compare 
    brlo NO_SWAP ; If number less than next immediate- no swap

    ; Else swap
    ; Use r26 as temporary registor for swapping
    mov r26, r24 
    mov r24, r25
    mov r25, r26

    ; Store
    st Y, r25
    dec r28
    st Y, r24
    inc r28

    inc r22
    cpi r22, 4 ; Stop if > 4
    brne INNER_LOOP ; Repeat until r22 = 4
    rjmp INC_OUTER


NO_SWAP:
    inc r22
    cpi r22, 4 ; Stop if > 4
    brne INNER_LOOP ; Repeat until r22 = 4
    rjmp INC_OUTER

INC_OUTER:
    inc r21 ; Increment outer loop
    cpi r21, 4 ; Stop if > 4
    brne OUTER_LOOP ; Repeat until r21 = 4, ie, until all numbers are sorted

nop ; No operation

; The sorted numbers are stored in sorted_numbers in SRAM
