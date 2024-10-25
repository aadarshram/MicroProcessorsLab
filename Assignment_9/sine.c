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
			while(i !=42)
			{
				//value = (780 *i)/16;
				//value = 385;
				//value = (int)(500 *(1+sin(PI/32 * i)));
				//uint16_t sin_wave[42] = { 512,591,665,742,808,873,926,968,998,1017,1023,1017,998,968,926,873,808,742,665,591,512,
														//436,359,282,216,211,151,97,55,25,6,0,6,25,55,97,151,211,216,282,359,436 };
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


				//value = (int)(1023);
				//DACR |=  (0b1 << 16);
				//DACR = ( 0x3FF << 6) & (value<<6);
				//delay_ms(1);
				//value = (int)(0);
				//value =1023*(32-i)/32;
				//DACR = ( 0b1111111111 << 6) & (value<<6);
				//delay_ms(1);
				i++;
			}
			i = 0;
			/*
			while(i !=32)
			{
				value = (1023 *(32-i))/32;
				//value = (int)(500 *(1+sin(3.14/16 * i)));
				//value = (int)(1023);
				DACR |=  (0b1 << 16);
				DACR = ( 0x3FF << 6) & (value<<6);
				delay_ms(1);
				//value = (int)(0);
				//value =1023*(32-i)/32;
				//DACR = ( 0b1111111111 << 6) & (value<<6);
				//delay_ms(1);
				i++;
			}
			i = 0;
			*/
		}
return 0;
}
