#include <avr/io.h>
#define NUM1 0b0100
#define NUM2 0b0010
int main(void)
{
	DDRC = 0x3F;
	PORTC = 0x00;
	uint8_t RESULT = NUM1 + NUM2;
	RESULT &= 0x3F;
	PORTC = RESULT;
}
