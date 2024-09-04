; Assembly program to sort 5 numbers and store the final output in data memory
; We shall use bubble sort for our purposes

.cseg

.org 0x00
numbers: .db 1, 3, 4, 2, 5

.org 0x01
sorted_numbers: .db 0, 0, 0, 0, 0 ; Initialize space for output storage in SRAM

; Initialize Z pointer
ldi r30, low(numbers)
ldi r31, high(numbers)

ldi r20, 0 ; Counter for loading numbers into SRAM / and for outer loop in bubble sort
ldi r22, 0 ; Inner loop counter for the bubble sort algorithm

LOAD_NUMBERS:
    lpm r21, Z+ ; Load a number
    
    add r30, r20
    st sorted_numbers, r21 ; Store number at location using (store indirect - using pointers)
    sub r30, r20

    inc r20 
    cpi r20, 5
    brne LOAD_NUMBERS ; Keep loading until 5 numbers are fetched
    ldi r20, 0 ; Reset register with value 0

; Bubble sort
OUTER_LOOP:
    ldi r22, 0 ; Reset inner loop index to 0

INNER_LOOP:
    add
    add r30, r22 
    ldi r24, sorted_numbers ; Load number at index r22
    ldi r25, sorted_numbers + 1 ; Load next immediate number
    sub r30, r22

    cp r24, r25 ; Compare 
    brlo NO_SWAP ; If number less than next immediate- no swap

    ; Else swap
    ; Use r26 as temporary registor for swapping
    mov r26, r24 
    mov r24, r25
    mov r25, r26

    ; Store
    add r30, r22
    st sorted_numbers, r24
    st sorted_numbers + 1, r25
    sub r30, r22
    
NO_SWAP:
    inc r22
    cpi r22, 4 ; Stop if > 4
    brne INNER_LOOP ; Repeat until r22 = 4

    inc r21 ; Increment outer loop
    cpi r21, 4 ; Stop if > 4
    brne OUTER_LOOP ; Repeat until r21 = 4, ie, until all numbers are sorted

nop ; No operation

; The sorted numbers are stored in sorted_numbers in SRAM
