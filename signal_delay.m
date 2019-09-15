% signal delaying function
function result = signal_delay(signal, fs , k)
    % delay the signal
    % divided 1000 because our inputs must be ms
    result = [zeros(fs*(k./1000), 1); signal];
end