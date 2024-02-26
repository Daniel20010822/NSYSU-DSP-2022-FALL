clear 
clc

n = 0:4;

%% (a)
y_LCCDE = 24.*2.^n + 16.*(-4).^n - 16;

figure(1)
stem(n, y_LCCDE);
axis([-1 5 -2000 6000])
title('y[n] derived from 2(a)')
xlabel('n')
ylabel('y[n]')
grid on

%% (b)
y_LOOP = zeros(1,length(n));
y_LOOP(1) = -9; % y[-2] = -9 IC
y_LOOP(2) = -8; % y[-1] = -8 IC

for i = 1:5
    y_LOOP(i+2) = -2*y_LOOP(i+1) + 8*y_LOOP(i) + 80;
end
y_LOOP = y_LOOP(3:end);

figure(2)
stem(n, y_LOOP);
axis([-1 5 -2000 6000])
title('y[n] derived from For Loop')
xlabel('n')
ylabel('y[n]')
grid on

%% (c)

a = [1 2 -8]; % coef y
b = [80];     % coef x
y0 = [-8 -9];
x0 = [1];

x = ones(1,length(n));
zi = filtic(b, a, y0, x0);
y = filter(b, a, x, zi);
figure(3)
stem(n, y);
axis([-1 5 -2000 6000])
title('y[n] derived from filter and filtic')
xlabel('n')
ylabel('y[n]')
grid on
