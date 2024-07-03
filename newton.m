function x = newton(f, df, x_0)
%NEWTON Computes function zeros using newton's method
%   Detailed explanation goes here
    err = 1;
    tau = 10^-6;

    x = x_0;

    while err >= tau
       
        if df(x) ~= 0
            x_new = x - f(x)/df(x);
        end

        err = abs(x - x_new)/abs(x_new);
        x = x_new;
    end

end

