close all
clear
clc

%% Part (a)
[x, Fs] = audioread('guitar4.wav');
x_len = length(x);
Ts = 1/Fs;

%% Part (b)
m = round(log2(Fs/20));
N = 2^m;
w = 0.5*(1 - cos(2*pi/N * (0:N-1)));

figure
plot(w)
grid on;
title('Hann window');
xlabel('n')
ylabel('w[n]')
axis([-inf inf -inf inf])

M = N/4;
X = myspectrogram(x,N,w,M);

block_num = floor((x_len-N)/M);
t = (0:block_num-1)*M/Fs;

freq_bin = Fs/N;
f = 0.001*(0:N/2-1)*Fs/N;

figure
image(t,f,X(1:floor(N/2),:));
colormap(hot(256));
colorbar;
axis('xy')
xlabel('Time');
ylabel('Frequency (kHz)')
