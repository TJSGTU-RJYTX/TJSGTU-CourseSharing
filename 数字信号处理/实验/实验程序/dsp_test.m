clear
close all
clc

x1=0:4;
y1=0:4;
a1=double(x1==2);
b1=double(y1>2);
c1=conv(a1,b1);