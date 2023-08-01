#include <reg51.h>
unsigned char code shumaguan_mfj[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
unsigned char key_value;
void delay(uchar i)
{
	while(i--);
}
 
void keyscan()//æÿ’Ûº¸≈Ã…®√Ë
{
	P1=0x0f;
	if(P1!=0x0f)
	{
		delay(1000);
		if(P1!=0x0f)
		{
			P1=0x0f;
			switch(P1)
			{
				case(0x07):key_value=0;break;
				case(0x0b):key_value=1;break;
				case(0x0d):key_value=2;break;
				case(0x0e):key_value=3;break;
			}
		  P1=0xf0;
		  switch(P1)
		  {
				case(0x70):key_value=key_value;break;
				case(0xb0):key_value=key_value+4;break;
				case(0xd0):key_value=key_value+8;break;
				case(0xe0):key_value=key_value+12;break;
			}
			while(P1!=0xf0);
		}
	}
}
 
void main()
{
	while(1)
	{
		keyscan();
		P0=shumaguan_mfj[key_value];
		P2=0x00;
	}
}