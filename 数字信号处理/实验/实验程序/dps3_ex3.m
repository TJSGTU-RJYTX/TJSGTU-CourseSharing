clear
close all
clc

N=8;
n=0:7;
x1=zeros(size(n));
x2=zeros(size(n));

xa=(n>=0)&(n<=3);
x1(xa)=n(xa);
x2(xa)=4-n(xa);

xa=(n>=4)&(n<=7);
x1(xa)=8-n(xa);
x2(xa)=n(xa)-4;
% 
% fp1=fft(x1);
% fp1=abs(fp1); 
% fp2=fft(x2);
% fp2=abs(fp2);

% subplot(2,2,1);stem(n,x1);xlabel('n');ylabel('时域特性');title('三角波序列'); 
% subplot(2,2,2);stem(n,fp1);xlabel('n');ylabel('幅频特性');title('三角波序列'); 
% subplot(2,2,3);stem(n,x2);xlabel('n');ylabel('时域特性');title('反三角波序列'); 
% subplot(2,2,4);stem(n,fp2);xlabel('n');ylabel('幅频特性');title('反三角波序列');


N2=32;
n2=0:31;
tempx1=zeros(1,24);
x11=[x1,tempx1];
tempx2=zeros(1,24);
x22=[x2,tempx2];

fp11=fft(x11);
fp11=abs(fp11); 
fp22=fft(x22);
fp22=abs(fp22);

subplot(2,2,1);stem(n2,x11);xlabel('n');ylabel('时域特性');title('补0后三角波序列'); 
subplot(2,2,2);stem(n2,fp11);xlabel('n');ylabel('幅频特性');title('补0后三角波序列'); 
subplot(2,2,3);stem(n2,x22);xlabel('n');ylabel('时域特性');title('补0后反三角波序列'); 
subplot(2,2,4);stem(n2,fp22);xlabel('n');ylabel('幅频特性');title('补0后反三角波序列');
