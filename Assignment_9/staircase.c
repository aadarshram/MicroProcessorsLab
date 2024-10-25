include "LPC214x.h"
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
			while(i !=16)
			{
				value = (780 *i)/16;
				DACR |=  (0b1 << 16);
				DACR = ( 0x3FF << 6) & (value<<6);
				delay_ms(1);
				i++;
			}
			i = 0;
		}
return 0;
}
