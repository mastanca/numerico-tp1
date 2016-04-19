function [ matrix ] = getProblemMatrix(originalMatrix)
  matrix = originalMatrix;
  for i = 1:columns(matrix)
    matrix(1,i) = 100;
  endfor
  matrix(2,1) = 80;
  matrix(2,11) = 80;
  for i = 2:columns(matrix)-1
    matrix(2,i) = -1;
  endfor
  matrix(3,1) = 60;
  matrix(3,11) = 60;
  for i = 2:columns(matrix)-1
    matrix(3,i) = -1;
  endfor
  matrix(4,1) = 40;
  matrix(4,11) = 40;
  for i = 2:columns(matrix)-1
    if i < 4 || i > 8
      matrix(4,i) = -1;
    else
      matrix(4,i) = 200;
    endif
  endfor
  matrix(5,1) = 20;
  matrix(5,11) = 20;
  for i = 2:columns(matrix)-1
    if i < 4 || i > 8
      matrix(5,i) = -1;
    else
      matrix(5,i) = 200;
    endif
  endfor
  matrix(6,1) = 0;
  matrix(6,11) = 0;
  for i = 2:columns(matrix)-1
    if i < 4 || i > 8
      matrix(6,i) = -1;
    else
      matrix(6,i) = 200;
    endif
  endfor
  matrix(7,1) = 0;
  matrix(7,11) = 0;
  for i = 2:columns(matrix)-1
    if i < 4 || i > 8
      matrix(7,i) = -1;
    else
      matrix(7,i) = 200;
    endif
  endfor
  matrix(8,1) = 0;
  matrix(8,11) = 0;
  for i = 2:columns(matrix)-1
    if i < 4 || i > 8
      matrix(8,i) = -1;
    else
      matrix(8,i) = 200;
    endif
  endfor
  for i = 2:columns(matrix)-1
    matrix(9,i) = -1;
  endfor
  for i = 2:columns(matrix)-1
    matrix(10,i) = -1;
  endfor

end