clear;
close all;
clc;

na=0:4;
nb=0:3;
n=0:7;
A=[8 -2 -1 2 3];
B=[2 3 -1 -3];
subplot(3,1,1)
stem(na,A)
subplot(3,1,2)
stem(nb,B)
C=conv(A,B);
subplot(3,1,3)
stem(n,C)