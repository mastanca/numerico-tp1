function [ ret ] = jacobi (A, b, tolerance)
    columnsOfA = columns(A);
    iterationsCounter = 0;
    for i = 1 : columnsOfA
      # We use 100 as initial estimation
      x0(i)= 100;
    end
    E = tolerance + 1;
    D = diag(diag(A));
    L=(tril(A)-D)*-1;
    U=(triu(A)-D)*-1;
    Tj = (D^-1)*(L + U);
    Cj = (D^-1)*b;
    while E > tolerance
      x1 = (Tj*(x0')) + Cj;
      E = norm((x1-x0'),inf);
      x0 = x1';
      iterationsCounter = iterationsCounter + 1;
    end
    if E < tolerance
      ret = x0;		
      fprintf('Jacobi converged in %d iterations \n', iterationsCounter)
    end

endfunction
