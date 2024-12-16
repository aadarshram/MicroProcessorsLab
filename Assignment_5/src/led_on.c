#include <avr/io.h>

int main(void)
{
	DDRD = 0x01; // Direction
	PORTD = 0x01; // State
}
