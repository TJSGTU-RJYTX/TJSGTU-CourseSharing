clear
close all
clc

n=0:3;
x=[4 3 2 6];
subplot(1,2,1);
stem(n,x)
xlabel('n');ylabel('幅度');title('原序列');
y=fft(x);
subplot(1,2,2);
stem(n,y);
xlabel('n');ylabel('幅度');title('频谱序列');