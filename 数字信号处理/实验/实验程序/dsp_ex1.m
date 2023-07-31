A=[1 2 3 4];
B=[3 4 5 6];
C=A+B;
D=A-B;
E=A.*B
F=A./B
F=A.^B
subplot(2,3,1)
stem(A)
subplot(2,3,2)
stem(B)
subplot(2,3,3)
stem(C)
subplot(2,3,4)
stem(D)
subplot(2,3,5)
stem(E)
subplot(2,3,6)
stem(F)
