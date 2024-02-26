close all
clear
clc

DEGREE = pi/180;
z = [exp(j*2*36*DEGREE); exp(j*3*36*DEGREE)];
p = [exp(j*1*36*DEGREE); exp(j*4*36*DEGREE)];
z = [z;conj(z)];
p = [p;conj(p)];
[num,den] = zp2tf(z,p,1);
[H,W] = freqz(num,den,100);

subplot(1,2,1)
plot(W/pi,20*log(abs(H)))
title('Magnitude of H(z)')
xlabel('Frequency normalized (rad/sec)')
ylabel('Magnitude')
grid on

subplot(1,2,2)
zplane(z,p);