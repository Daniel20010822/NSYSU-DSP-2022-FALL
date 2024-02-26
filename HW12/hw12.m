close all
clear
clc

%% System 1
system1 = [1 2.5 0 -2.5 -1];
[mag,w] = freqz(system1, [1 0 0 0 0], 1024);
group_delay_1 = grpdelay(system1, 1, 1024);

figure(1)
suptitle('System 1')

subplot(2,2,1);
plot(w/pi, 20*log10(abs(mag)));
grid on;
xlabel('Frequency, \omega/\pi');
ylabel('Magnitude Response (dB)');

subplot(2,2,2);
plot(w/pi, angle(mag));
grid on;
xlabel('Frequency, \omega/\pi');
ylabel('Phase Response');

subplot(2,2,3);
plot(w/pi, group_delay_1);
grid on;
xlabel('Frequency, \omega/\pi');
ylabel('Group Delay');

subplot(2,2,4);
zplane(system1,1)
grid on;

%% System 2
system2 = [1 2.5 4 -4 -2.5 -1];
[mag,w] = freqz(system2, [1 0 0 0 0], 1024);
group_delay_2 = grpdelay(system2, 1, 1024);

figure(2)
suptitle('System 2')

subplot(2,2,1);
plot(w/pi, 20*log10(abs(mag)));
grid on;
xlabel('Frequency, \omega/\pi');
ylabel('Magnitude Response (dB)');

subplot(2,2,2);
plot(w/pi, angle(mag));
grid on;
xlabel('Frequency, \omega/\pi');
ylabel('Phase Response');

subplot(2,2,3);
plot(w/pi, group_delay_2);
grid on;
xlabel('Frequency, \omega/\pi');
ylabel('Group Delay');

subplot(2,2,4);
zplane(system2,1)
grid on;