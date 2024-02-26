close all
clear 
clc

%% Part (a)
n = 0:99;
x = [2 -2/3 zeros(1, length(n)-2)];
h = (1/3).^n;

figure(1)
subplot(2,1,1)
stem(n,x)
title('Result of x[n]')
xlabel('n')
ylabel('x[n]')
axis([-5 100 -1 2.5])
grid on

subplot(2,1,2)
stem(n,h)
title('Result of h[n]')
xlabel('n')
ylabel('h[n]')
axis([-5 100 0 1.2])
grid on

%% Part (b)
w = 0:pi/100:6*pi;
X = x*exp(-j * n' * w);
H = h*exp(-j * n' * w);

%% Part (c)
Y = X.*H;

figure(2)
subplot(3,2,1)
plot(w/(2*pi), abs(X))
title('Magnitude of X(e^{j\omega})')
xlabel('\omega (rad/s)')
ylabel('|X(e^{j\omega})|')

subplot(3,2,2)
plot(w/(2*pi), angle(X))
title('Angle of X(e^{j\omega})')
xlabel('\omega (rad/s)')
ylabel('\angleX(e^{j\omega})')

subplot(3,2,3)
plot(w/(2*pi), abs(H))
title('Magnitude of H(e^{j\omega})')
xlabel('\omega (rad/s)')
ylabel('|H(e^{j\omega})|')

subplot(3,2,4)
plot(w/(2*pi), angle(H))
title('Angle of H(e^{j\omega})')
xlabel('\omega (rad/s)')
ylabel('\angleH(e^{j\omega})')

subplot(3,2,5)
plot(w/(2*pi), abs(Y))
title('Magnitude of Y(e^{j\omega})')
xlabel('\omega (rad/s)')
ylabel('|Y(e^{j\omega})|')
axis([0 3 1.9 2.1])

subplot(3,2,6)
plot(w/(2*pi), angle(Y))
title('Angle of Y(e^{j\omega})')
xlabel('\omega (rad/s)')
ylabel('\angleY(e^{j\omega})')
axis([-inf inf -1 1])

%% Part (d)
y = conv(x,h);
dw = 2*pi/length(w);
y_hat = real(Y*exp(j * w' * n)*dw/(2*pi));

figure(3)
subplot(2,1,1)
stem(n,y(1:100))
title('Result of y from conv')
xlabel('n')
ylabel('y[n]')
axis([-5 100 0 max(y)])

subplot(2,1,2)
stem(n,y_hat(1:100))
title('Result of y hat from IDTFT')
xlabel('n')
ylabel('y hat[n]')
axis([-5 100 0 max(y_hat)])
