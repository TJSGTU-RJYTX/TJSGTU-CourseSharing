clear
close all
clc


t=0:3;
u=stepfun(t,0);
xan=exp(-t).*u;
subplot(5,2,1);plot(t,xan,'k');axis([-2,2,0,2]);grid on;xlabel('t');title('xa(n)');

%%%FT

Xan=fft(xan,4);
T=-3:0;
Xan1(:,:)=Xan(:,end:-1:1);
subplot(5,2,2);plot(t,Xan,'k');
hold on
plot(T,Xan1,'k');
axis([-2,2,0,2]);grid on;xlabel('t');title('Xa(jw)');



