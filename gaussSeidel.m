function [ res ] = gaussSeidel(A, b, tolerance)
    columnsOfA = columns(A);
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
    max(abs(eig(Tg)));
    while E > tolerance
      aux=x;
      x = (Tg*(x)) + Cg;
      E = max(abs(x-aux));
    end
    if E < tolerance
        res = x;
    end
end