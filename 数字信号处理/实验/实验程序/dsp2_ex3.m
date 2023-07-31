clear
close all
clc

%定义基本参数
f=1;%原信号频率
fs=16;%抽样信号频率
N=52;%采样点数
n=0:N-1;

%画原序列图像
xn=cos(2*pi*n*(f/fs));
subplot(3,1,1)
stem(n,xn)
title('原x(n)图像')
xlabel('n')
ylabel('幅度')

%画M=4倍抽样的x(n)
M=4;
m=0:N/M-1;%52/4=13 13-1=12 0:12有13个点
xn1=decimate(xn,M);%对序列进行抽样
subplot(3,1,2)
stem(m,xn1)%注意对上m和xn1
title('进行M=4倍抽取后的x(n)图像')
xlabel('n')
ylabel('幅度')

%画L=3倍插值的x(n)
L=3;
xn2=interp(xn,L);
p=0:N*L-1;
subplot(3,1,3)
stem(p,xn2)
title('进行L=3倍插值后的x(n)图像')
xlabel('n')
ylabel('幅度')



