close all
clear
clc

x1 = [2 1 2 -3];
x2 = [-3 2 1 -5];

%% Part (a)
x3 = conv(x1,x2);

figure(1)
stem(x3)
title('Result of x3[n]')
xlabel('n')
ylabel('x3[n]')
axis([0 length(x3)+1 min(x3)-1 max(x3)+1])

%% Part (b)
X3_fft = fft(x3);

%% Part (c)
X1 = fft(x1);
X2 = fft(x2);
X3_mul = X1 .* X2;

%% Part (d)
figure(2)
subplot(2,2,1)
stem(abs(X3_fft))
title('FFT - Magnitude')
xlabel('k')
ylabel('|X3[k]|')

subplot(2,2,2)
stem(angle(X3_fft))
title('FFT - Phase')
xlabel('k')
ylabel('\angleX3[k]')

subplot(2,2,3)
stem(abs(X3_mul))
title('Multiplication - Magnitude')
xlabel('k')
ylabel('|X\prime[k]|')

subplot(2,2,4)
stem(angle(X3_mul))
title('Multiplication - Phase')
xlabel('k')
ylabel('\angleX\prime[k]')

%% Part (e)
N = 4;
x1_pad = [x1 zeros(1, N - length(x1))];
x2_pad = [x2 zeros(1, N - length(x2))];
x4 = zeros(1,N);
for ii = 1:N
    x4 = x4 + x1_pad(ii) .* circshift(x2_pad, ii-1, 2);
end

%% Part (f)
X4_fft = fft(x4);

%% Part (g)
figure(3)
subplot(2,2,1)
stem(abs(X4_fft))
title('FFT - Magnitude')
xlabel('k')
ylabel('|X4[k]|')

subplot(2,2,2)
stem(angle(X4_fft))
title('FFT - Phase')
xlabel('k')
ylabel('\angleX4[k]')

subplot(2,2,3)
stem(abs(X3_mul))
title('Multiplication - Magnitude')
xlabel('k')
ylabel('|X\prime[k]|')

subplot(2,2,4)
stem(angle(X3_mul))
title('Multiplication - Phase')
xlabel('k')
ylabel('\angleX\prime[k]')