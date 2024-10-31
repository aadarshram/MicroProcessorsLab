// C program to generate sin waveform in DAC
#include "LPC214x.h"
#include "stdint.h"
#include "math.h"
#define PI 3.14159

// configure the DAC
void DACInit(void)
{
	PINSEL1 |= (0b1 << 19);
	PINSEL1 &= ~(0b1<<18);
	return;
}

void delay_ms(int j)
{
	int x,i;
	for(i=0;i<j;i++)
	{
		for(x=0; x<6000; x++);    /* loop to generate 1 milisecond delay with Cclk = 60MHz */
	}
}
// main routine
int main (void)
{
	int value;
	int i;
	i = 0;
	DACInit();
	while(1)
	{	
		while(i !=42) // For some reason, using value arrays or math function did not work, hence, hardcoded the assignments.
		{
			value=512;
			delay_ms(1);
			DACR |=  (0b1 << 16); 
			DACR = (0x3FF << 6) & (value << 6);
			
			value=591;
			delay_ms(1);
			DACR |=  (0b1 << 16); 
			DACR = (0x3FF << 6) & (value << 6);
			
			value=665;
			delay_ms(1);
			DACR |=  (0b1 << 16); 
			DACR = (0x3FF << 6) & (value << 6);
			
			value=742;
			delay_ms(1);
			DACR |=  (0b1 << 16); 
			DACR = (0x3FF << 6) & (value << 6);
			
			value=808;
			delay_ms(1);
			DACR |=  (0b1 << 16); 
			DACR = (0x3FF << 6) & (value << 6);
			
			value=873;
			delay_ms(1);
			DACR |=  (0b1 << 16); 
			DACR = (0x3FF << 6) & (value << 6);
			
			value=926;
			delay_ms(1);
			DACR |=  (0b1 << 16); 
			DACR = (0x3FF << 6) & (value << 6);
			
			value=968;
			delay_ms(1);
			DACR |=  (0b1 << 16); 
			DACR = (0x3FF << 6) & (value << 6);
			
			value=998;
			delay_ms(1);
			DACR |=  (0b1 << 16); 
			DACR = (0x3FF << 6) & (value << 6);
			
			value=1017;
			delay_ms(1);
			DACR |=  (0b1 << 16); 
			DACR = (0x3FF << 6) & (value << 6);
			
			value=1023;
			delay_ms(1);
			DACR |=  (0b1 << 16); 
			DACR = (0x3FF << 6) & (value << 6);
			
			value=1017;
			delay_ms(1);
			DACR |=  (0b1 << 16); 
			DACR = (0x3FF << 6) & (value << 6);
			
			value=998;
			delay_ms(1);
			DACR |=  (0b1 << 16); 
			DACR = (0x3FF << 6) & (value << 6);
			
			value=968;
			delay_ms(1);
			DACR |=  (0b1 << 16); 
			DACR = (0x3FF << 6) & (value << 6);
			
			value=926;
			delay_ms(1);
			DACR |=  (0b1 << 16); 
			DACR = (0x3FF << 6) & (value << 6);
			
			value=873;
			delay_ms(1);
			DACR |=  (0b1 << 16); 
			DACR = (0x3FF << 6) & (value << 6);
			
			value=808;
			delay_ms(1);
			DACR |=  (0b1 << 16); 
			DACR = (0x3FF << 6) & (value << 6);
			
			value=742;
			delay_ms(1);
			DACR |=  (0b1 << 16); 
			DACR = (0x3FF << 6) & (value << 6);
			
			value=665;
			delay_ms(1);
			DACR |=  (0b1 << 16); 
			DACR = (0x3FF << 6) & (value << 6);
			
			value=591;
			delay_ms(1);
			DACR |=  (0b1 << 16); 
			DACR = (0x3FF << 6) & (value << 6);
			
			value=512;
			delay_ms(1);
			DACR |=  (0b1 << 16); 
			DACR = (0x3FF << 6) & (value << 6);
			
			value=436;
			delay_ms(1);
			DACR |=  (0b1 << 16); 
			DACR = (0x3FF << 6) & (value << 6);
			
			value=359;
			delay_ms(1);
			DACR |=  (0b1 << 16); 
			DACR = (0x3FF << 6) & (value << 6);
			
			value=282;
			delay_ms(1);
			DACR |=  (0b1 << 16); 
			DACR = (0x3FF << 6) & (value << 6);
			
			value=216;
			delay_ms(1);
			DACR |=  (0b1 << 16); 
			DACR = (0x3FF << 6) & (value << 6);
			
			value=211;
			delay_ms(1);
			DACR |=  (0b1 << 16); 
			DACR = (0x3FF << 6) & (value << 6);
			
			value=151;
			delay_ms(1);
			DACR |=  (0b1 << 16); 
			DACR = (0x3FF << 6) & (value << 6);
			
			value=97;
			delay_ms(1);
			DACR |=  (0b1 << 16); 
			DACR = (0x3FF << 6) & (value << 6);
			
			value=55;
			delay_ms(1);
			DACR |=  (0b1 << 16); 
			DACR = (0x3FF << 6) & (value << 6);
			
			value=25;
			delay_ms(1);
			DACR |=  (0b1 << 16); 
			DACR = (0x3FF << 6) & (value << 6);
			
			value=6;
			delay_ms(1);
			DACR |=  (0b1 << 16); 
			DACR = (0x3FF << 6) & (value << 6);
			
			value=0;
			delay_ms(1);
			DACR |=  (0b1 << 16); 
			DACR = (0x3FF << 6) & (value << 6);
			
			value=6;
			delay_ms(1);
			DACR |=  (0b1 << 16); 
			DACR = (0x3FF << 6) & (value << 6);
			
			value=25;
			delay_ms(1);
			DACR |=  (0b1 << 16); 
			DACR = (0x3FF << 6) & (value << 6);
			
			value=55;
			delay_ms(1);
			DACR |=  (0b1 << 16); 
			DACR = (0x3FF << 6) & (value << 6);
			
			value=97;
			delay_ms(1);
			DACR |=  (0b1 << 16); 
			DACR = (0x3FF << 6) & (value << 6);
			
			value=151;
			delay_ms(1);
			DACR |=  (0b1 << 16); 
			DACR = (0x3FF << 6) & (value << 6);
			
			value=211;
			delay_ms(1);
			DACR |=  (0b1 << 16); 
			DACR = (0x3FF << 6) & (value << 6);
			
			value=216;
			delay_ms(1);
			DACR |=  (0b1 << 16); 
			DACR = (0x3FF << 6) & (value << 6);
			
			value=282;
			delay_ms(1);
			DACR |=  (0b1 << 16); 
			DACR = (0x3FF << 6) & (value << 6);
			
			value=359;
			delay_ms(1);
			DACR |=  (0b1 << 16); 
			DACR = (0x3FF << 6) & (value << 6);
			
			value=436;
			delay_ms(1);
			DACR |=  (0b1 << 16); 
			DACR = (0x3FF << 6) & (value << 6);
	
			i++;
		}
		i = 0;
				
	}
	return 0;
}
