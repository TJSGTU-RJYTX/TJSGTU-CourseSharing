clear;
close all;
clc;

n=0:3;
x=[1 -1 2 -5];
x1=2*circshift(x,[0 -2])-circshift(x,[0 1])-2*x;
stem(x1)
xlabel('时间序列n')

clear;
close all;
clc;

n=0:3;
x=[1 -1 2 -5];
x1=circshift(x,[0 1]);
x2=circshift(x,[0 2]);
x3=circshift(x,[0 3]);
x4=circshift(x,[0 4]);
x5=circshift(x,[0 5]);
xn=1*x1+2*x2+3*x3+4*x4+5*x5;
stem(xn)
xlabel('时间序列n')
