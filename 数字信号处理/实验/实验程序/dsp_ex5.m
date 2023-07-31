clear;
close all;
clc;

B=[1 sqrt(2) 1];
A=[1 -0.67 0.9];
[H,w]=freqz(B,A);

Hf=abs(H);  %取幅度值实部
Hx=angle(H);  %取相位值对应相位角
clf;

subplot(2,1,1)
plot(w,20*log10(Hf))  %幅值变换为分贝单位
title('离散系统幅频特性曲线')
subplot(2,1,2)
plot(w,Hx)
title('离散系统相频特性曲线')