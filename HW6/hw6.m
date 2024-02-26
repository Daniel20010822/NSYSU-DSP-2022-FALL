close all
clear
clc

%% Part(a)
tend = 1;
t = 0:0.001:tend;
xc = sin(4*pi*t);

figure(1)
plot(t, xc);
title('Result of x_c(t)');
xlabel('t')
ylabel('x_c(t)')
grid on

%% Part(b ~ f)
sample_rates = [0.01 0.05 0.1];
MSE_sample = zeros(1,length(sample_rates));
Quantize = [2 3 4];
MSE_quantize = zeros(1,length(Quantize));

for k = 1:length(sample_rates)
    % Part(b)
    T = sample_rates(k);
    rate = T/0.001;
    n = 0:tend/T;
    xn = xc(1:rate:end);
    
    % Part(c)
    x_pad = zeros(1,length(t));
    x_pad(1:rate:end) = xn;
    tt = 0 : 1/rate : tend/T;
    yc = zeros(1,length(t));
    for l = 1:length(x_pad)
        yc = yc + x_pad(l)*sinc((-l+1) * 1/rate + tt);
    end
    
    % Part(d)
    MSE_sample(k) = mean(abs(xc-yc).^2);
    
    % Part(e)
    if k == 1
       figure(3)
       for b = 1:3
          q = Quantize(b);
          % 1. Convert the range of xn from -1 ~ 1 to 0 ~ 1
          % 2. Let this value time the level (2^q+1)
          % 3. Quantize the sequence by rounding the values
          xq = round((xn+1)/2 * (2^q+1));
          % Clamp the signal when out of bit-range
          xq(xq > 2^q) = 2^q;
          xq(xq < 1) = 1;
          % Modify the range back to -1 ~ 1
          xq = xq/(2^q+1) * 2 - 1;
          
          subplot(3,1,b)
          stem(xq)
          axis([0 length(xq)-1 -1 1]);
          title(['Level = ', num2str(2^q)]);
          xlabel('n')
          ylabel('x_q[n]')
          
          % Calculate MSE
          MSE_quantize(b) = mean(abs(xq-xn).^2);
          
       end
    end
    
    figure(2)
    subplot(3,2,2*k-1)
    stem(n, xn);
    title(sprintf('x[n] with T = %.2f', T));
    xlabel('n');
    ylabel('x[n]');
    
    subplot(3,2,2*k)
    plot(t, yc);
    title(sprintf('Reconstructed signal with T = %.2f', T));
    xlabel('t');
    ylabel('y_c(t)');
end

% Print out the MSEs
for b = 1:3
    fprintf('MSE_sample when T = %.2f is %.4f\n', sample_rates(b), MSE_sample(b));
end
for b = 1:3
    fprintf('MSE_quantize when level = %d is %.4f\n', Quantize(b), MSE_quantize(b));
end