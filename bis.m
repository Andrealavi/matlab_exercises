function x = bis(f, a, b)
%BIS Implements bisection method for finding function zeros

    tau = 10^-6;

    k = ceil(1 + log2((b - a)/tau));

    a_k = a;
    b_k = b;

    for i = 1:k
        c_k = a_k + (b_k - a_k)/2;

        if f(a_k)*f(c_k) < 0
            b_k = c_k;
        else
            a_k = c_k;
        end
    end

    x = c_k;

end

