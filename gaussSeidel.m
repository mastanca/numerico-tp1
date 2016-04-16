function [ res ] = gaussSeidel(A, b, tolerance)
    columnsOfA = columns(A);
    for i = 1 : columnsOfA
      # We use 100 as initial estmation
      x(i)= 100;
    end
    x=x';
    iterations = input('Type the Number of Iterations:');
    counter = 0;
    E = tolerance + 1;
    D = diag(diag(A));
    L=(tril(A)-D)*-1;
    U=(triu(A)-D)*-1;
    D - L
    inv(D-L)
    (inv(D-L))*U
    Tg = ((D-L)^-1)*U;
    Cg = ((D-L)^-1)*b;
    eig(Tg)
    abs(eig(Tg))
    max(abs(eig(Tg)))
    while E > tolerance && counter < iterations
      aux=x;
      x = (Tg*(x)) + Cg;
      E = max(abs(x-aux));
      counter = counter + 1;
      tabla(counter,1)= counter;
      for i = 1:columnsOfA
        tabla(counter,i+1)= x(i);
      end
      tabla(counter,columnsOfA + 2)= E;
    end
    if E < tolerance
        res = x;
    end
end