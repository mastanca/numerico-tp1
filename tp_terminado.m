SIZE_OF_MATRIX = 48;

# Loading lower diagonal matrix
A = zeros(SIZE_OF_MATRIX,SIZE_OF_MATRIX);
A(9:SIZE_OF_MATRIX + 1:SIZE_OF_MATRIX*9+18) = -1; 
# Use 2 (4/2) to avoid the sum of the diagonal when transposing
A(1:SIZE_OF_MATRIX + 1:end) = 2; 
A(2:SIZE_OF_MATRIX + 1:SIZE_OF_MATRIX*6+8) = -1;
A(SIZE_OF_MATRIX*8+10:SIZE_OF_MATRIX + 1:SIZE_OF_MATRIX*14+16) = -1;
A(14*SIZE_OF_MATRIX+19:SIZE_OF_MATRIX + 1:29*SIZE_OF_MATRIX+34) = -1;
A(16*SIZE_OF_MATRIX+18:SIZE_OF_MATRIX + 1*2:SIZE_OF_MATRIX*30+32) = -1;
A(SIZE_OF_MATRIX*30+39:SIZE_OF_MATRIX + 1:SIZE_OF_MATRIX*40+47) = -1;
A(SIZE_OF_MATRIX*32+34:SIZE_OF_MATRIX + 1:SIZE_OF_MATRIX*38+40) = -1;
A(SIZE_OF_MATRIX*40+42:SIZE_OF_MATRIX + 1:SIZE_OF_MATRIX*47) = -1;

# Transpose and sum to get full matrix
B = transpose(A);
A = A + B;

v = [180,100,100,100,100,100,100,180,60,100,200,200,200,200,0,60,40,200,200,40,20,200,200,20,0,200,200,0,0,200,200,0,0,0,200,200,200,200,0,0,0,0,0,0,0,0,0,0] * (-1);
v = transpose(v);

# Calculate by direct method
xDirecto = A\v;

tolerance = 10^(-3);

# Calculate by Jacobi method
xJacobi = zeros(size(A,1),1);
xJacobi = Jacobi(A,v,tolerance);

# Calculate by Gauss-Seidel method
xGS = zeros(columns(A));
xGS = gaussSeidel(A,v,tolerance);


straightSolution = transpose(xDirecto)
jacobiSolution = transpose(xJacobi)
gaussSeidelSolution = transpose(xGS)