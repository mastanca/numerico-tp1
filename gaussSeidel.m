function [ res ] = gaussSeidel(A, b, tolerance)
    columnsOfA = columns(A);
    iterationCounter = 0;
    for i = 1 : columnsOfA
      # We use 100 as initial estimation
      x(i)= 100;
    end
    x=x';
    counter = 0;
    E = tolerance + 1;
    D = diag(diag(A));
    L=(tril(A)-D)*-1;
    U=(triu(A)-D)*-1;
    W = D-L;
    inv(W);
    (inv(W))*U;
    Tg = ((W)^-1)*U;
    Cg = ((W)^-1)*b;
    eig(Tg);
    abs(eig(Tg));
    norm((eig(Tg)),inf);
    while E > tolerance
      iterationCounter = iterationCounter + 1;
      aux=x;
      x = (Tg*(x)) + Cg;
      E = norm((x-aux),inf);
    end
    if E < tolerance
        res = x;
        fprintf('Gauss-Seidel converged in %d iterations \n', iterationCounter)
    end
end