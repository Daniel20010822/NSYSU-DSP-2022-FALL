close all
clear
clc

w1 = 0.1; 
w2 = 0.4;
n = 0:200;

x_n = cos(w1*n) + cos(w2*n);

a = 6.76;
b = -12.46;
h = [a b a];
y_n = filter(h,1,x_n);

figure;
plot(n, x_n)
hold on
plot(n, y_n)
hold off
axis([0 length(x_n) min(x_n) max(x_n)])
legend('orininal','after')

figure;
[H,W] = freqz(h);
plot(W, 20*log(abs(H)))
axis([0 1.5 -20 40])
title('Frequency Response')
xlabel('w/rad')
ylabel('Mag(dB)')
grid on
