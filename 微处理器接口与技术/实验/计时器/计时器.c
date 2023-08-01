#include<reg51.h>
unsigned char code table[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,
                              0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71}; 
 
unsigned char count,timer;
void t0_init()
{
    TMOD = 0x01;    
    IE = 0x82;     
    TR0 = 1;        
    TH0 = 0x3c; 
    TL0 = 0xb0;     
}
void main()
{
    t0_init();
    count = 0;
    timer = 0;
    while(1);
}
void t0_func() interrupt 1
{
    TH0 = (65535 - 50000) / 256;      
    TL0 = (65535 - 50000) / 256; 
    if(timer < 20)  //50ms*20=1s
    {
        timer = timer +1;
    }
    else if(timer == 20)    
    {
        timer = 0;  
        if(count == 10)     
        {
            P0 = ~table[0];
            count = 1;
        }
        else    
        {
            P0 = ~table[count];
            count++;
        }
    }
}
 
 
 