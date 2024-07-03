function x = jacobi(A, b)
%JACOBI Solves a linear system using Jacobi iterative method

    tau = 10^-6;

    n = length(b);
    x = b;

    err = 1;

    while err >= tau
        for i = 1:n
            s = 0;
            for j = 1:n
                if j ~= i
                    s = s + A(i, j)*x(j);
                end
            end
            
            x_new(i) = (b(i) - s)/A(i,i);
        end

        err = norm(x_new - x);
        x = x_new;
    end
    

end

