#include "LPC214x.h"
#include "stdint.h"
#include "math.h"

// configure the DAC
void DACInit(void)
{
PINSEL1 = 0x00080000;
return;
}

void delay_ms(uint16_t j)
{
  uint16_t x,i;
	for(i=0;i<j;i++)
	{
    for(x=0; x<60000; x++);    /* loop to generate 1 milisecond delay with Cclk = 60MHz */
	}
}
// main routine
int main (void)
{
uint16_t value;
uint8_t i;
i = 0;
// Put values below for 32 samples
// note DACR bits 0-5 are reserved so need to multip by 64
//unsigned int a[42]={512,591,665,742,808,873,926,968,998,1017,1023,1017,998,968,926,873,808,742,665,591,512,
//													436,359,282,216,211,151,97,55,25,6,0,6,25,55,97,151,211,216,282,359,436};
DACInit();
while(1)
	{	
			while(i !=32)
			{
				value = (uint8_t)(1023*sin(3.14*i/16));
				DACR = ( 0b1111111111 << 6) & (value<<6);
				delay_ms(1);
				i++;
			}
			i = 0;
		}
return 0;
}
