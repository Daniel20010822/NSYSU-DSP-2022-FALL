close all
clear
clc

%% Load X
[x,Fs] = audioread('guitar4.wav');
x_len = length(x);
Ts = 1/Fs;

%% Hann Window
m = round(log2(Fs/20));
N = 2^m;
n = [0:N-1];
w = 1/2 * (1-cos(2*pi*n'/N));
M = N/4;

%% Plot Spectrogram X
X = myspectrogram(x,N,w,M);
block_num = floor((x_len-N)/M);
t = (0:block_num-1)*M/Fs;
freq_bin = Fs/N;
f = 0.001*(0:N/2-1)*Fs/N;

figure(1)
image(t,f,X(1:floor(N/2),:));
colormap(hot(256));
colorbar;
axis('xy');
xlabel('Time');
ylabel('Frequency (kHz)');

%% Plot Spectrogram X_noise
[x1,Fs] = audioread('guitar4_plusInterfer.wav');
x_len = length(x1);
Ts = 1/Fs;
X = myspectrogram(x1,N,w,M);

figure(2)
image(t,f,X(1:floor(N/2),:));
colormap(hot(256));
colorbar;
axis('xy');
xlabel('Time');
ylabel('Frequency (kHz)');

%% Create Filter
removeHz = 1000;
Wo = (2*removeHz)/Fs;
BW = 0.1;
[b,a] = iirnotch(Wo,BW);
fvtool(b,a);
fvtool(b,a,'grpdelay');

%% Plot afterFilter
x1_afterfilter = filter(b,a,x1);
X1_afterfilter_2 = myspectrogram(x1_afterfilter,N,w,M);
% sound(x1,Fs);
% pause(x_len/Fs)
sound(x1_afterfilter,Fs);

figure
image(t,f,X1_afterfilter_2(1:floor(N/2),:));
colormap(hot(256));
colorbar;
axis('xy');
xlabel('Time');
ylabel('Frequency (kHz)');