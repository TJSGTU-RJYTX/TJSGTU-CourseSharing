clear
close all
clc

wc=[2*pi*2000,2*pi*3000];wr=[2*pi*1500,2*pi*6000];rp=3;rs=20;fs=30000; 
[N,wn]=buttord(wc,wr,rp,rs,'s'); 
[B,A]=butter(N,wn,'s'); 
[num1,den1]=impinvar(B,A,fs); 
[h1,w]=freqz(num1,den1); 
w1=2*fs*tan(2*pi*2000/(2*fs)); 
w2=2*fs*tan(2*pi*3000/(2*fs)); 
wr1=2*fs*tan(2*pi*1500/(2*fs)); 
wr2=2*fs*tan(2*pi*6000/(2*fs)); 
[N,wn]=buttord([w1,w2],[wr1,wr2],rp,rs,'s'); 
[B,A]=butter(N,wn,'s'); 
[num2,den2]=bilinear(B,A,fs); 
[h2,w]=freqz(num2,den2); 
f=w/pi*15000; 
plot(f,20*log10(abs(h1)),'-.',f,20*log10(abs(h2)),'-'); 
axis([500,7000,-30,10]);
grid; 
xlabel('频率/Hz');
ylabel('幅度/dB'); 
title('巴特沃思数字低通滤波器'); 
legend('脉冲响应不变法','双线性变换法');