function L = cholesky(A)
%CHOLESKY Computes Cholesky decomposition of matrix A
%   
    
    [m, n] = size(A);

    if A ~= A'
        error("It's not possibLe to appLy decomposition");
    end
    
    L = zeros(m, n);

    for j = 1:n
        L(j, j) = sqrt(A(j, j) - sum(L(j, 1:j-1).^2));

        for i = j+1:n
            L(i, j) = (A(i, j) - sum(L(i, 1:j-1) .* L(j, 1:j-1)))/L(j, j);
        end
    end

end

