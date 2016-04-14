# Loading lower diagonal matrix
A = zeros(48,48);
A(9:49:450) = -1; 
# Use 2 (4/2) to avoid the sum of the diagonal when transposing
A(1:49:end) = 2; 
A(2:49:296) = -1;
A(48*8+10:49:48*14+16) = -1;
A(14*48+19:49:29*48+34) = -1;
A(16*48+18:49*2:48*30+32) = -1;
A(48*30+39:49:48*40+47) = -1;
A(48*32+34:49:48*38+40) = -1;
A(48*40+42:49:48*47) = -1;

# Transpose and sum to get full matrix

B = transpose(A);
A = A + B;

v = [180,100,100,100,100,100,100,180,60,100,200,200,200,200,0,60,40,200,200,40,20,200,200,20,0,200,200,0,0,200,200,0,0,0,200,200,200,200,0,0,0,0,0,0,0,0,0,0] * (-1);
v = transpose(v);
xDirecto = A\v;

xJacobi = zeros(size(A,1),1);
xJacobi = Jacobi(A,v,0.000000001);

transpose(xDirecto)
transpose(xJacobi)

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