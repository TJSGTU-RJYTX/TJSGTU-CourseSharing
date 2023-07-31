clear
close all
clc

N=45;wn=[0.3,0.5];
window=hanning(N+1); %计算长度为N的汉宁窗
b=fir1(N,wn,window); %N是阶数,wn是截止频率
[H,w]=freqz(b); 

subplot(2,1,1);plot(w/pi,20*log10(abs(H)));grid; xlabel('归一化频率');ylabel('幅度');title('幅频响应'); 
subplot(2,1,2);plot(w/pi,angle(H));grid; xlabel('归一化频率');ylabel('相位');title('相位响应');