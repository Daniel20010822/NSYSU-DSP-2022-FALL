close all
clear 
clc

n = -10:10;
xsin = cos([-5:5]*pi/5);
x = [zeros(1,5) xsin zeros(1,5)];

for i = 1:length(n)
    subplot(3,1,1)
    stem(n,x)
    title('x[n]')
    xlabel('n')
    ylabel('x[n]')
    axis([-10 10 -1.5 1.5])

    subplot(3,1,2)
    x_pad = [zeros(1,15) xsin zeros(1,15)];
    x_shift = x_pad(21-i+1:length(x_pad)-i+1);
    stem(n,x_shift)
    title(sprintf('x[n] shifted'))
    xlabel('n')
    ylabel('x[n]')
    axis([-10 10 -1.5 1.5])
    
    subplot(3,1,3)
    ac = zeros(1,21);
    ac(i) = sum(x.*x_shift);
    stem(n,ac)
    

%     pause;
end