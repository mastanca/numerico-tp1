function [ matrix ] = getFinalMatrix(originalMatrix, vector)
  matrix = originalMatrix;
  # k is the vector position
  k = 1;
  for i = 1:rows(originalMatrix)
    for j = 1:columns(originalMatrix)
      if ((originalMatrix(i, j) == -1) && (k < columns(vector)))
        matrix(i, j) = vector(k);
        k = k + 1;
      endif
    endfor
  endfor
end