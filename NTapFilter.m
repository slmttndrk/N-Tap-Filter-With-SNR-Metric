% read the audio
[y, Fs] = audioread('sample.wav');
% delay constant K in ms
K = 100;
% delay the signal 100 ms
delayed = signal_delay(y, Fs, K);
% add the delayed signal to the original one
mixed_signal = delayed(1:length(y)) + y;
% num of taps
N = 50;
% I created 25 alpha values in order to use
alps = (0:0.04:1);
% creating snr1 array
snr1 = zeros(length(alps),1);
% loop for changing alpha values
for i = 1:length(alps)
    % mixed signal passed from n_tap_filter and denoised
    denoised = ntf(mixed_signal, Fs, N, K, alps(i));
    % add the snr values to the snr1 array
    snr1(i) = signal_to_noise_ratio(y, denoised(1:length(y)));
end
% plot the first snr
figure;
plot(alps, snr1)
title('Alpha changes');

% pick a constant alpha value
alpha = 0.4;
% creating snr2 array
snr2 = zeros(N,1);
% loop for changing number of taps
for Nindex = 1:1:50
    % mixed signal passed from n_tap_filter and denoised
    denoised = ntf(mixed_signal, Fs, Nindex, K, alpha);
    % add the snr values to the snr2 array
    snr2(Nindex) = signal_to_noise_ratio(y, denoised(1:length(y)));
end
% plot the second snr
figure;
plot(1:N, snr2)
title('N changes');

% creating four different K values
Kindex = [100 200 300 400];
% creating snr3 array
snr3 = zeros(length(Kindex),1);
% loop for changing delay values
for i = 1:length(Kindex) 
   % delay the original signal according to new K values
   delayed = signal_delay(y, Fs, Kindex(i));
   % mix the original and delayed signal
   mixed_signal = delayed(1:length(y)) + y;
   % mixed signal passed from n_tap_filter and denoised
   denoised = ntf(mixed_signal, Fs, N, Kindex(i), alpha);
   % add the snr values to the snr3 array
   snr3(i) = signal_to_noise_ratio(y, denoised(1:length(y))); 
end
% plot the third snr
figure;
plot(Kindex, snr3)
title('K changes');