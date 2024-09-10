#include <avr/io.h>

int main(void)
{
	DDRC = 0x01; // Direction
	PORTC = 0x01; // State
}
