clear all
close all
dt=0.01;
f0=1;
T0=1/f0;
fm = 5*f0;
Tm=1/fm;
t=-3:dt:3;
N = length(t);
x=sin(2*pi*f0*t)+1/3*sin(8*pi*f0*t);
wm = 2*pi*20*fm;
k = 0:N-1;
w1 = k * wm / N;
X = x * exp(-j * t' * w1) * dt;
mag = abs(X);
figure
subplot(411),plot(w1 / (2*pi),mag,'k');
ylabel('mag','fontsize',16);
xlim([0 15]);
ylim([0 4]);
for i = 1:3
    c = 0;
    fs = i * fm;
    Ts = 1 / fs;
    tn = -3 : Ts : 3;
    x1=sin(2*pi*f0*tn)+1/3*sin(8*pi*f0*tn);
    N = length(tn);
    wm = 2 * pi * fs;
    k = 0 : N -1;
    w = k * wm / N;
    X1 = x1 * exp(-j * tn' * w) * Ts;
    mag1 = abs(X1);
    subplot(4,1,i+1),plot(mag1,'linewidth',4);
    ylabel('mag1','fontsize',16);
    ylim([0 4]);
end


