close all
clc

orig_SR = 2000;
load('EMG/EMG_ICA.mat');
orig_signal = fdata(:,1);
orig_axis = [1:length(orig_signal)]/orig_SR; % original timescale

%% Part(a) 2000 -> 5000 -> 2000
new_SR = 5000;
% Upsampling part
[p,q] = rat(new_SR/orig_SR);
new_signal1 = resample(orig_signal,p,q);
new_axis1 = [1:length(new_signal1)]/new_SR;
% Downsampling part
[p,q] = rat(orig_SR/new_SR);
new_signal2 = resample(new_signal1,p,q);
new_axis2 = [1:length(new_signal2)]/orig_SR;
% Plot results
figure(1)
plot(orig_axis, orig_signal,'b', 'LineWidth', 2); hold on;
plot(new_axis2, new_signal2,'r'); hold off;
axis([0 orig_axis(end) -inf inf]);

%% Part(b) 2000 -> 300 -> 2000
new_SR = 300;
% Upsampling part
[p,q] = rat(new_SR/orig_SR);
new_signal3 = resample(orig_signal,p,q);
new_axis3 = [1:length(new_signal3)]/new_SR;
% Downsampling part
[p,q] = rat(orig_SR/new_SR);
new_signal2 = resample(new_signal3,p,q);
new_axis4 = [1:length(new_signal2)]/orig_SR;
% Plot results
figure(2)
plot(orig_axis, orig_signal,'b'); hold on;
plot(new_axis4, new_signal2,'r'); hold off;
axis([0 orig_axis(end) -inf inf]);