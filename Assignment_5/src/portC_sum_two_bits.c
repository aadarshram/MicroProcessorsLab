#include <avr/io.h>
#define NUM1 0b11
#define NUM2 0b10
//DDRC must turn on pins 3,4,5 
//DDRC = 0b00111000
int main(void)
{
	DDRC = 0b00111000;
	PORTC = 0x00;
	uint8_t RESULT = NUM1 + NUM2;
	RESULT<<=3;
	RESULT &= 0x38;
	PORTC = RESULT;
}
