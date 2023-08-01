#include<reg51.h>
#include<intrins.h>
#include<string.h>
#define DATA P0
uchar code name[]={"Meng fan jun"};
uchar code number[]={"20434020109"};
/**********************************************LCD 1602******************************************************/
sbit rs = P2^6;	  //位变量
sbit rw = P2^5;	  //位变量
sbit en = P2^7;	  //位变量
void check_BF()//检测忙标志
{
   uchar x;    
  do   
  {  x=0xff;
     en=0;
     rs=0;    
     rw=1;
     en=1;
     x=DATA;    
  }while(x&0x80);
   en=0;      
}
void write_command(uchar cmd)  //写命令函数
{
	check_BF();
	en=0;
	rs = 0;
	rw = 0;
	DATA = cmd;
	en = 1;
  _nop_();
	en = 0;
	delay_ms(1);
}
void write_data(uchar dat)//写数据函数
{
	check_BF();
	en=0;
	rs = 1;
	rw = 0;
	DATA = dat;
	en = 1;
    _nop_();
	en = 0;
	delay_ms(1);
}
void write_init(){
	en = 0;
	write_command(0x38);
	write_command(0x0c);
	write_command(0x06);
	write_command(0x01);
	write_command(0x80);
}

void main()
{
	
	uchar i;
	write_init();
	
	while(1)
	{
	write_command(0x82);//设置指针起点
	for(i=0;i<strlen(name);i++)
	{
		write_data(name[i]);
		delay_ms(5);
	}
	write_command(0x82+0x40);  
	for(i=0;i<strlen(number);i++)
	{
		write_data(number[i]);
		delay_ms(1);
	}
}


}