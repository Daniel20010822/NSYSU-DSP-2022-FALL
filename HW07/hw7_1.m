close all
clear
clc

f1 = 20;
f2 = 100;
FS = 1000;
t = 0:1/FS:1;

sine1 = sin(2*pi*f1*t);
sine2 = sin(2*pi*f2*t);
mixed_sine = sine1 + sine2;

%% M = 5
M = 5;

figure(1)
subplot(4,1,1)
plot(t, sine1, 'o-');
title('Continuous signal of sin(2\pi20t)')
xlabel('t')
ylabel('x(t)')
axis([0 0.15 -2 2])
grid on

subplot(4,1,2)
plot(t, sine2, 'o-');
title('Continuous signal of sin(2\pi100t)')
xlabel('t')
ylabel('x(t)')
axis([0 0.15 -2 2])
grid on

subplot(4,1,3)
y = decimate(mixed_sine, M);
plot(t, mixed_sine, 'o-');
hold on
plot(t(1:M:end), y, 'ro-');
hold off
title(['Result using decimate and M = ', num2str(M)])
xlabel('t')
ylabel('x(t)')
axis([0 0.15 -2 2])
grid on

subplot(4,1,4)
y = downsample(mixed_sine, M);
plot(t, mixed_sine, 'o-');
hold on
plot(t(1:M:end), y, 'ro-');
hold off
title(['Result using downsample and M = ', num2str(M)])
xlabel('t')
ylabel('x(t)')
axis([0 0.15 -2 2])
grid on
%% M = 8
M = 8;

figure(2)
subplot(4,1,1)
plot(t, sine1, 'o-');
title('Continuous signal of sin(2\pi20t)')
xlabel('t')
ylabel('x(t)')
axis([0 0.15 -2 2])
grid on

subplot(4,1,2)
plot(t, sine2, 'o-');
title('Continuous signal of sin(2\pi100t)')
xlabel('t')
ylabel('x(t)')
axis([0 0.15 -2 2])
grid on

subplot(4,1,3)
y = decimate(mixed_sine, M);
plot(t, mixed_sine, 'o-');
hold on
plot(t(1:M:end), y, 'ro-');
hold off
title(['Result using decimate and M = ', num2str(M)])
xlabel('t')
ylabel('x(t)')
axis([0 0.15 -2 2])
grid on

subplot(4,1,4)
y = downsample(mixed_sine, M);
plot(t, mixed_sine, 'o-');
hold on
plot(t(1:M:end), y, 'ro-');
hold off
title(['Result using downsample and M = ', num2str(M)])
xlabel('t')
ylabel('x(t)')
axis([0 0.15 -2 2])
grid on