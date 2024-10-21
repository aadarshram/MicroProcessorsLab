#include <avr/io.h>

int main(void)
{
	while(1){
		
		DDRD = 0x01; // Direction
		PORTD = 0x01; // State
	}
}
