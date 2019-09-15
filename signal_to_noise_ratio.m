% snr function
function result = signal_to_noise_ratio(y, denoised)
    % doing SNR computation
    result = 10 * log10(sum(y.^2) ./ sum((denoised-y).^2));
end