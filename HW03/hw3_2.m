clear 
clc

n = -10:10;
xsin = cos([-5:5]*pi/5);
x = [zeros(1,5) xsin zeros(1,5)];

figure(1)
stem(n,x)
title('x[n]')
xlabel('n')
ylabel('x[n]')
axis([-10 10 -1.5 1.5])

figure(2)
ac = conv(xsin,xsin);
stem(n,ac)
title('Autocorrelation of x[n]')
xlabel('n')
ylabel('r_{xx}[n]')