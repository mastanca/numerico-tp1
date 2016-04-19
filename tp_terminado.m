A = zeros(56,56)
# Loading lower diagonal matrix;
# Use 2 (4/2) to avoid the sum of the diagonal when transposing
A(1:57:end) = 2;
A(2:57:400) = -1;
A(515:57:914) = -1;
A(1028:57*2:2054) = -1;
A(2168:57:2567) = -1;
A(2681:57:3080) = -1;
A(917:57:2000) = -1;
A(10:57:580) = -1;
A(2063:57:2633) = -1;

# Transpose and sum to get full matrix
B = transpose(A);
A = A + B;

#v = [180,100,100,100,100,100,100,180,60,100,200,200,200,200,0,60,40,200,200,40,20,200,200,20,0,200,200,0,0,200,200,0,0,0,200,200,200,200,0,0,0,0,0,0,0,0,0,0] * (-1);
v = [180,100,100,100,100,100,100,100,180,60,0,200,200,200,200,200,0,60,40,200,200,40,20,200,200,20,0,200,200,0,0,200,200,0,0,200,200,0,0,0,200,200,200,200,200,0,0,0,0,0,0,0,0,0,0,0] * (-1);
v = transpose(v);

# Calculate by direct method
xDirecto = A\v;

tolerance = 10^(-3);

# Calculate by Jacobi method
xJacobi = zeros(columns(A));
xJacobi = jacobi(A,v,tolerance);

# Calculate by Gauss-Seidel method
xGS = zeros(columns(A));
xGS = gaussSeidel(A,v,tolerance);

A
straightSolution = transpose(xDirecto)
jacobiSolution = (xJacobi)
gaussSeidelSolution = transpose(xGS)


# Remove the ; to get the figure
M = getFinalMatrix(A, straightSolution*-1);
# Calculate matrix M and plot it with contour
contourf(M);

M = getFinalMatrix(A, jacobiSolution*-1);
# Calculate matrix M and plot it with contour
contourf(M);

M = getFinalMatrix(A, straightSolution*-1);
# Calculate matrix M and plot it with contour
contourf(M);




