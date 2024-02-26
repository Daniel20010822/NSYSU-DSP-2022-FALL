close all
clear
clc

%% Part(a)
num = [25 -75];
den = [32 -24];

figure(1)
zplane(num, den);
title('zplane of H(z)')
grid on;

%% Part(b)
[H,W] = freqz(num,den,100);

figure(2)
subplot(2,1,1)
plot(W/pi,abs(H))
title('Magnitude of H(z)')
xlabel('Frequency normalized (rad/sec)')
ylabel('Magnitude')
grid on
subplot(2,1,2)
plot(W/pi, angle(H)/pi)
title('Phase of H(z)')
xlabel('Frequency normalized (rad/sec)')
ylabel('Phase normalized (rad)')
grid on
% axis([min(W/pi) max(W/pi) min(angle(H) * 180/pi) max(angle(H) * 180/pi)])
