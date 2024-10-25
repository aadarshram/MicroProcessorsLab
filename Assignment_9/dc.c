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
// main routine
int main (void)
{
int value;
DACInit();
while(1)
	{	
  			value = 385;	
				DACR |=  (0b1 << 16);
				DACR = ( 0x3FF << 6) & (value<<6);
		}
return 0;
}
