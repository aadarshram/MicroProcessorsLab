#include <avr/io.h>
#define NUM1 0b11
#define NUM2 0b10

int main(void)
{
	DDRD = 0x07;
	PORTD = 0x00;
	uint8_t RESULT = NUM1 + NUM2;
	RESULT &= 0x07;
	PORTD = RESULT;
}
