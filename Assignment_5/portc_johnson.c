#include <avr/io.h>
#include <util/delay.h>
//use pins 3,4,5 of PORTC
//DDRC = 0b00111000, shifted 0x07 by 3 
//DDRC = 0x38
int main(void)
{
	DDRC = 0b00111000;
	while(1){
		PORTC = 0b00000000;
		_delay_ms(1000);
		PORTC = 0b00100000;
		_delay_ms(1000);
		PORTC = 0b00110000;
		_delay_ms(1000);
		PORTC = 0b00111000;
		_delay_ms(1000);
		PORTC = 0b00011000;
		_delay_ms(1000);
		PORTC = 0b00001000;
		_delay_ms(1000);
	}
}
