function [L, U, p] = LU_pivoting(A)
%LU_PIVOTING Computes LU factorization of the matrix A with partial
%pivoting
%   Returns three matrices U, L and P. U is an upper triangular matrix, L
%   is a lower triangular and P is a permutation matrix. They are computed
%   in order to factorize A as PA = LU

    [m, n] = size(A);

    p = 1:n;

    if n ~= m
        error("The matrix is not a square matrix");
    end

    for i = 1:n-1

        [amax, index] = max(abs( A(i:n, i)));
        index = index + i - 1;

        if index ~= i
            temp = A(i, :);

            disp(index);
    
            A(i, :) = A(index, :);
            A(index, :) = temp;

            aux = p(i);
    
            p(i) = p(index);
            p(index) = aux;
        end

        if abs(A(i, i)) < eps
            error("It's not possible to compute factorization")
        else
            A(i+1:n, i) = A(i+1:n, i)/A(i, i);
            A(i+1:n, i+1:n) = A(i+1:n, i+1:n) - A(i+1:n, i)*A(i,i+1:n);
        end

    end

    U = triu(A);
    L = (A - U) + eye(n);


end

