function x = gauss_seidel(A, b)
%GAUSS_SEIDEL Solves linear system using Gauss-Seidel iterative method
%   Detailed explanation goes here

    tau = 10^-16;

    n = length(b);
    x = b;
    x_new = zeros(n, 1);

    err = 1;

    while err >= tau
        for i = 1:n
            s = 0;
    
            for j = 1:i-1
                s = s + A(i, j)*x_new(j);
            end
    
            t = 0;
    
            for j = i+1:n
                t = t + A(i, j)*x(j);
            end

            x_new(i) = (b(i) -s -t)/A(i, i);
        end
        
        err = norm(x - x_new)/norm(x_new);
        x = x_new;
    end

end

