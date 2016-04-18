function [ ret ] = jacobi (A, b, tolerance)
    columnsOfA = columns(A);
    # Get number of iterations to compare methods
    iterationsCounter = 0;
    for i = 1 : columnsOfA
      # We use 100 as initial estimation
      x0(i)= 100;
    end
    E = tolerance + 1;
    # First diag gets the diagonal of the matrix and the second one crates the matrix
    D = diag(diag(A));
    # Get the lower triangular matrix
    L=(tril(A)-D)*-1;
    # Get the upper triangular matrix
    U=(triu(A)-D)*-1;
    # Get jacobian T
    Tj = (D^-1)*(L + U);
    # Get jacobian C
    Cj = (D^-1)*b;
    # Iterate while error is less than tolerance
    while E > tolerance
      # Get possible solution
      x1 = (Tj*(x0')) + Cj;
      # Get new error
      E = norm((x1-x0'),inf);
      # Save the new vector in a variable
      x0 = x1';
      # ++iterationsCounter
      iterationsCounter = iterationsCounter + 1;
    end
    # If error is less than than tolerance then we found our result
    if E < tolerance
      ret = x0;		
      fprintf('Jacobi converged in %d iterations \n', iterationsCounter)
    end

endfunction
