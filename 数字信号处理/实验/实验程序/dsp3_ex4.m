clear
close all
clc

% N=16;
% n=0:N-1;
% f1=1/16;
% f2=1/64;
% xn1=sin(2*pi*0.125*n)+cos(2*pi*(0.125+f1)*n);
% xn2=sin(2*pi*0.125*n)+cos(2*pi*(0.125+f2)*n);
% 
% yn1=fft(xn1);
% yn2=fft(xn2);
% 
% yn1=abs(yn1);
% yn2=abs(yn2);
% 
% subplot(2,2,1);
% stem(n,xn1);xlabel('n');ylabel('时域');title('f为1/16');
% subplot(2,2,2);
% stem(n,yn1);xlabel('n');ylabel('频域');title('f为1/16');
% 
% subplot(2,2,3);
% stem(n,xn2);xlabel('n');ylabel('时域');title('f为1/64');
% subplot(2,2,4);
% stem(n,yn2);xlabel('n');ylabel('频域');title('f为1/64');


N2=128;
n2=0:N2-1;
f1=1/16;
f2=1/64;

xn3=sin(2*pi*0.125*n2)+cos(2*pi*(0.125+f1)*n2);
xn4=sin(2*pi*0.125*n2)+cos(2*pi*(0.125+f2)*n2);

yn3=fft(xn3);
yn4=fft(xn4);


yn3=abs(yn3);
yn4=abs(yn4);

subplot(2,2,1);
stem(n2,xn3);xlabel('n');ylabel('时域');title('f为1/16');
subplot(2,2,2);
stem(n2,yn3);xlabel('n');ylabel('频域');title('f为1/16');

subplot(2,2,3);
stem(n2,xn4);xlabel('n');ylabel('时域');title('f为1/64');
subplot(2,2,4);
stem(n2,yn4);xlabel('n');ylabel('频域');title('f为1/64');