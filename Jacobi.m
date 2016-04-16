function [x k] = Jacobi(A, b, tol)
    k = 0;
    n = size(A,1);
    x_old = zeros(n,1);
    converged = 0;

    W = A(dmperm(A), :); % dmperm permutes rows of A so that no diagonal elements are zero.
    v = b(dmperm(A),1);  % must permute b the same way so that x is unchanged.

    for i=1:n
        D_inv(i,i) = 1/W(i,i);
    end

    while ~converged
        x_new = x_old + D_inv*(v - W*x_old);
        k = k + 1;
                   
        if norm(v - W*x_new, inf)/norm(v, inf) < tol
            x = x_new;
            converged = 1;
        else
        x_old = x_new;
    end       
end