function y = allpassfilter(L, a, x, fs)

    % L = delay length (in ms)
    % a = all-pass coefficient (0. - 1.)
    % x = input signal
    
    % before creating IR
    x = x - mean(x);            % get rid of DC
    z = zeros(1, fs*2);         % zero-padding
    
    % avoid inconsistent dims of arrays
    if isequal(x, z)
        x = x';
    end
    
    % IR
    x = x - mean(x);            % get rid of DC
    x = [x zeros(1, fs*2)];     % zero-padding to create actual impulse
    
    % filter signal via all-pass filter to make reverb
    y = filter([a zeros(1, L), 1], ...
               [1, zeros(1, L), a], ...
               x);
    
    % there you go!

end