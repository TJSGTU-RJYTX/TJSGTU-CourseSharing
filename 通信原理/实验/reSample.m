clear all
close all
dt=0.01;
f0=1;
T0=1/f0;
fm = 5*f0;
Tm=1/fm;
t=-1:dt:1;
x=sin(2*pi*f0*t)+1/3*sin(8*pi*f0*t);
figure
subplot(411),plot(t,x,'linewidth',4);
ylabel('x','fontsize',16);
for i = 1:3
    fs = i * fm;
    Ts = 1 / fs;
    n = -1:Ts:1;
    x1=sin(2*pi*f0*n)+1/3*sin(8*pi*f0*n);
    subplot(4,1,i+1),stem(n,x1,'filled','linewidth',3);
    ylabel('x1','fontsize',16);
    ylim([-2 2]);
end
xlabel('n','fontsize',16);