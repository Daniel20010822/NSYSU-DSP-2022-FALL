clear;
clc;

n = -10:1:10;
x = exp(j.*pi.*n./10);

subplot(2,1,1)
stem(n,real(x));
title('Real Part');
xlabel('n')
ylabel('Re(x[n])')

subplot(2,1,2)
stem(n,imag(x));
title('Imaginary Part');
xlabel('n')
ylabel('Im(x[n])')