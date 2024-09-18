// C Program to transfer control from a white LED turned on to a red LED that's blinking upon a key press.
#define F_CPU 8000000UL // 8 MHz unsigned long
#include <avr/io.h>     // Include necessary libraries
#include <util/delay.h>
#include <avr/interrupt.h>

int main(void)
{
    DDRB = 0x03;  // Two outputs on PORT B (Red and White LED)
    DDRD = 0x00;  // One input on PORT D (switch)
    GICR = 0x40;  // Enable INT0 interrupt in the General Interrupt Control Register (INT0 is associated with 0x40)
    SREG = 0x80;  // Set the Global Interrupt enable in Status Register
    PORTB = 0x01; // Keep White LED on
}

ISR(INT0_vect) // INT0_vect is identifier for interrupt INT0 in the Interrupt Service Routine
{
    cli(); // Clear interrupt
    // Blink Red LED
    PORTB = 0x02;
    _delay_ms(100);
    PORTB = 0x00;
    _delay_ms(100);
    sei(); // Set interrupt
}
