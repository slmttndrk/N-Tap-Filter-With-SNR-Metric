# N-Tap Filter With SNR Metric

<br />

  * In this repository, I designed an N-Tap Filter. This filter is used for alleviating the effects of
delayed versions of the sound. I implemented a MATLAB script that combines
“sample.wav” and with its K miliseconds delayed version. K is 100 miliseconds by default.
I splitted my “NTapFilter.m” script into a main script and functions because of
using R2015a version of Matlab. Before the R2016 version, It is not allowed to write the
scripts and functions in the same Matlab file. So, in this project, I had four files which are
NTapFilter.m (main script), ntf.m (n tap filtering function), signal_delay.m (delaying
function) and signal_to_noise_ratio.m (snr calculation function).

<br />

  * In the “NTapFilter.m” script, at first, I read the “sample.wav” file and sent it to the
signal_delay function (delays the signal given amount of time) in order to delay the original
signal with 100 ms. And then, I added the delayed version to the original one to obtain the
mixed signal. Because of delaying the original file, the length of the delayed version became
grater than the original file. So, I took the original file length of the delayed
version. And then, I created some alpha values. After that, to evaluate the SNR value with 
changing alphas, first I created a vector and filled it with zeros. Then, I calculated the
SNR1 values.

<br />

  * After that, I sent the mixed signal and required parameters to the ntf function
(n tap filtering). And, I sent the result of the filtering operation to the signal_to_noise_ratio
function (calculates the SNR). Then, I plotted the SNR1 values with respect to the
changing alpha values.

<br />

  * In part two, this time, I stabilized the alpha value to an arbitrary value of 0.4 and to
evaluate the SNR value with changing number of taps, first I created a vector and filled it
with zeros. Then, I calculated the SNR2 values. In the loop body, I sent the mixed
signal and required parameters to the ntf function (n tap filtering). And I sent the result of
the filtering operation to the signal_to_noise_ratio function (calculates the SNR). Then, 
I plotted the SNR2 values with respect to the changing number of taps.

<br />

  * In part three, I created an array for the delay times which are 100, 200, 300 and 400
miliseconds and to evaluate the SNR value with changing delay times, first I created a vector
and filled it with zeros. Then, I calculated the SNR3 values. In the loop body, I sent
the original signal to the signal_delay function (delays the signal given amount of time) in
order to delay the original signal according to the delay value and then added the result of it
to the original signal in order to create a mixed signal. Then, I sent the mixed signal with
required parameters to the ntf function (n tap filtering). And I sent the result of the filtering
operation to the signal_to_noise_ratio function (calculates the SNR). In the end, I
plotted the SNR3 values with respect to the changing number of delay times. 

<br />

  * In the “ntf.m”, there is an n tap filtering function. This function takes parameters like
(signal, fs, N, K, alpha) and returns a filtered signal. To filter a signal first of all, it assigns the
signal to a variable result and starts N times looping in order to calculate the filter operation.
In the loop body, it sends the original signal to the signal_delay function (delays the signal given
amount of time) and multiplies the delayed signal with alpha to the power of loop index
value. By the way, the alpha value also changes from negative to the positive when the loop
index is even. There is an important point in here. I multiply the delayed signal with respect
to the size of the original signal because of adding the equal size of arrays issue. And then, I
added the operated signal to the result which was the original signal. The loop iterates N times and 
finally creates the filtered signal. 

<br />

  * In the “signal_delay.m”, there is an signal delaying function. This function takes
parameters like (signal, fs, K) and returns a delayed signal. To delay a signal, It uses a matrix
which includes two parts. One of them includes some number of zeros and the other one includes the
original signal. The meaning of delay is to shift a signal at some amount of samples and put
some zeros over there. So, the zeros are calculated by the given delay value and the rest is
still the original signal. And also, the delay times must be converted to the milisecond so, it
divides the delay value by 1000 and multiplies it with the Fs in order to evaluate how
many zeros should be put to the original signal. In the end, it returns a shifted which means
delayed version of the original signal.

<br />

  * In the “signal_to_noise_ratio.m”, there is an SNR calculation function. This function
takes parameters like (y, denoised) and return the SNR value of these two given signal.

