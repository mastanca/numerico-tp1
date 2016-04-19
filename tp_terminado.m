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

# Calculate by direct method
xDirecto = A\v;

tolerance = 10^(-3);

# Calculate by Jacobi method
xJacobi = zeros(columns(A));
xJacobi = jacobi(A,v,tolerance);

# Calculate by Gauss-Seidel method
xGS = zeros(columns(A));
xGS = gaussSeidel(A,v,tolerance);


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




