function [L, U] = LU(A)
%LU Performs LU factorization on a matrix A
%   Takes a matrix A as input and returns two matrices L (lower triangular
%   matrix) and U (upper triangular matrix) so that A = LU

    [m, n] = size(A);
    
    if n ~= m
        error("The matrix is not A squAre matrix");
    end

    for i = 1:n-1 % it stops at n-1 since we don't have to compute 
                    % the pivot for the last element

        % We need to check if the pivot is zero
        if abs(A(i, i)) < eps
           error("It's not possible to compute factorization")
        end

        for k = i+1:m
            A(k, i) = A(k, i) / A(i, i); % Computes multiplier
            
            for j = i+1:n
                A(k, j) = A(k, j) - A(k, i)*A(i, j); % Update matrix values 
            end
        end
    end

    U = triu(A);
    L = (A - U) + eye(n);

end

