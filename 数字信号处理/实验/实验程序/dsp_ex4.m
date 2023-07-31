function stepshift
clc;

n1=input('请输入起点： ');
n2=input('请输入终点:');
n0=input('请输入阶跃位置:');
n=n1:n2;
x=[n-n0>=0];
stem(n,x,'fill');xlabel('时间序列n');ylabel('u(n-n0)');
end
