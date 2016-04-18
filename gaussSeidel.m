function [ res ] = gaussSeidel(A, b, tolerance)
    columnsOfA = columns(A);
    # Count the iterations to compare with other methods
    iterationCounter = 0;
    for i = 1 : columnsOfA
      # We use 100 as initial estimation
      x(i)= 100;
    end
    x=x';
    counter = 0;
    E = tolerance + 1;
    # First diag gets the diagonal of the matrix, second one crates a diagonal matrix
    D = diag(diag(A));
    # Get lower triangular matrix
    L=(tril(A)-D)*-1;
    # Get upper triangular matrix
    U=(triu(A)-D)*-1;
    # Get W matrix (D-L for optimization)
    W = D-L;
    inv(W);
    (inv(W))*U;
    # Get T gauss matrix
    Tg = ((W)^-1)*U;
    # Get C gauss matrix
    Cg = ((W)^-1)*b;
    # Iterate while error is greater than tolerance
    while E > tolerance
      iterationCounter = iterationCounter + 1;
      aux=x;
      # Calculate new possible solution
      x = (Tg*(x)) + Cg;
      # Get the new error
      E = norm((x-aux),inf);
    end
    # If error is less than tolerance we found our solution
    if E < tolerance
        res = x;
        fprintf('Gauss-Seidel converged in %d iterations \n', iterationCounter)
    end
end