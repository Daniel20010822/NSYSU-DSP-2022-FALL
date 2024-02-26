close all
clear
clc

FS = 100;
n = 0:1/FS:1;
x_n = cos(2*pi*5*n);

%% Part(a, b)
N = length(x_n);
W_N = exp(-j*2*pi/N);
% Create DFT matrix
D_N = W_N.^((0:N-1)'*(0:N-1));
% Perform DFT
X_k = D_N*x_n';
% Convert the DFT back to x_n (Inverse DFT)
x_n_hat = real(1/N * conj(D_N)*X_k);

figure(1)
subplot(3,1,1)
stem(x_n)
xlabel('n')
ylabel('x[n]')
grid on
axis([-inf inf -inf inf])

subplot(3,1,2)
stem(abs(X_k))
xlabel('k')
ylabel('X[k]')
grid on
axis([-inf inf -inf inf])

subplot(3,1,3)
stem(x_n_hat)
xlabel('n')
ylabel('x[n] hat')
grid on
axis([-inf inf -inf inf])

%% Part(c, d)
X_k = fft(x_n);
x_n_hat = ifft(X_k);

figure(2)
subplot(3,1,1)
stem(x_n)
xlabel('n')
ylabel('x[n]')
grid on
axis([-inf inf -inf inf])

subplot(3,1,2)
stem(abs(X_k))
xlabel('k')
ylabel('X[k]')
grid on
axis([-inf inf -inf inf])

subplot(3,1,3)
stem(x_n_hat)
xlabel('n')
ylabel('x[n] hat')
grid on
axis([-inf inf -inf inf])