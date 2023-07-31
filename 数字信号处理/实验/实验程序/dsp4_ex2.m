clear
close all
clc

wc=2*pi*1200;wr=2*pi*2000;rp=0.5;rs=40;fs=8000;
w1=2*fs*tan(wc/(2*fs)); 
w2=2*fs*tan(wr/(2*fs)); 

[Nb,wn]=buttord(w1,w2,rp,rs,'s');
[B,A]=butter(Nb,wn,'s'); 
[num1,den1]=bilinear(B,A,fs); 
[h1,w]=freqz(num1,den1); 

[Nc,wn]=cheb1ord(w1,w2,rp,rs,'s');
[B,A]=cheby1(Nc,rp,wn,'s'); 
[num2,den2]=bilinear(B,A,fs); 
[h2,w]=freqz(num2,den2); 

[Ne,wn]=ellipord(w1,w2,rp,rs,'s');
[B,A]=ellip(Ne,rp,rs,wn,'low','s'); 
[num3,den3]=bilinear(B,A,fs); 
[h3,w]=freqz(num3,den3); 

f=w/pi*4000; 
plot(f,20*log10(abs(h1)),'-',f,20*log10(abs(h2)),'--',f,20*log10(abs(h3)),'-.' ); 
axis([0,3000,-100,10]);grid; xlabel('频率/Hz'); ylabel('幅度/dB'); title('三种数字低通滤波器'); 
legend('巴特沃思数字低通滤波器','切比雪夫数字低通滤波器','椭圆数字低通滤波器');