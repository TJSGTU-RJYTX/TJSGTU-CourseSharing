clear;
close all;
clc;

n1=0:15;
x1=0.8.^n1
subplot(2,3,1)
stem(x1)
xlabel('(1)')

n2=0:15;
x2=exp((0.2+3*i)*n2);
subplot(2,3,2)
stem(x2)
xlabel('(2)')

n3=0:15;
x3=3*cos(0.125*pi*n3+0.2*pi)+2*sin(0.25*pi*n3+0.1*pi);
subplot(2,3,3)
stem(x3)
xlabel('(3)')

n4=0:80
n44=mod(n4,16);
x4=3*cos(0.125*pi*n44+0.2*pi)+2*sin(0.25*pi*n44+0.1*pi);
subplot(2,3,4)
stem(x4)
xlabel('(4)')

n5=0:10
x5=3*cos(0.125*pi*n5+0.2*pi)+2*sin(0.25*pi*n5+0.1*pi);
subplot(2,3,5)
stem(x5)
xlabel('(5)')

n6=0:50
n66=mod(n6,10)
x6=3*cos(0.125*pi*n66+0.2*pi)+2*sin(0.25*pi*n66+0.1*pi);
subplot(2,3,6)
stem(x6)
xlabel('(6)')
