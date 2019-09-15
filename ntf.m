% n tap filtering function
function result = ntf(signal, fs, N, K, alpha)
    result = signal;
    % loop for changing tap numbers
    for i=1:N
        % delay the original signal
        signal = signal_delay(signal,fs,K);
        % multiply the delayed signal with changing alpha values
        tapped = ((-1)*alpha)^i * signal(1:length(result));
        % add all multiplied signals to the result
        result = result + tapped;
    end
end


