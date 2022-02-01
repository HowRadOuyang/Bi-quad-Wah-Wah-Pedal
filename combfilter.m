function y = combfilter(L, c, x)

    % L = delay length (in ms)
    % c = dampening coefficient
    % x = input signal
    
    % make x mono
    x = x(:,1);
    
    % avoid inconsistent dims of arrays
    x = x';
    
    b = [1 zeros(1, round(L-1)) c];
    
    y = filter(1, b, x);

end