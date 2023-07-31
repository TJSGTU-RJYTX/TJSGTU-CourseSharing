clear
close all
clc

n=0:29;
a=0.1;
f1=0.0625;
f2=0.4375;
f3=0.5625;
x1=exp(-a.*n).*sin(2*pi*f1.*n);
x2=exp(-a.*n).*sin(2*pi*f2.*n);
x3=exp(-a.*n).*sin(2*pi*f3.*n);

subplot(3,2,1);
stem(n,x1);
xlabel('n');ylabel('幅度');title('时域f=0.0625');
y1=fft(x1);
subplot(3,2,2);
stem(n,y1);
xlabel('n');ylabel('幅度');title('频域f=0.0625');

subplot(3,2,3);
stem(n,x2);
xlabel('n');ylabel('幅度');title('时域f=0.4375');
y2=fft(x2);
subplot(3,2,4);
stem(n,y2);
xlabel('n');ylabel('幅度');title('频域f=0.4375');

subplot(3,2,5);
stem(n,x3);
xlabel('n');ylabel('幅度');title('时域f=0.5625');
y3=fft(x3);
subplot(3,2,6);
stem(n,y3);
xlabel('n');ylabel('幅度');title('频域f=0.5625');



