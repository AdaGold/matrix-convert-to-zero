# Updates the input matrix based on the following rules:
# Assumption/ Given: All numbers in the matrix are 0s or 1s
# If any number is found to be 0, the method updates all the numbers in the
# corresponding row as well as the corresponding column to be 0.

# time complexity of below solution would be O(n*m) and space complexity would also be O(n+m)

def matrix_convert_to_0(matrix)
  # matrix.length = number of rows
  # matrix[i].length = number of cols

  rows_to_change = Array.new(matrix.length)
  cols_to_change = Array.new(matrix[0].length)

  i = 0
  while i < matrix.length
    j = 0
    while j < matrix[0].length
      if matrix[i][j] == 0
        rows_to_change[i] =  true
        cols_to_change[j] = true
      end
      j += 1
    end
    i += 1
  end

  i = 0
  while i < rows_to_change.length
    j = 0
    if rows_to_change[i] == true
      while j < matrix[i].length
        matrix[i][j] = 0
        j += 1
      end
    else # rows_to_change == false
      while j < cols_to_change.length
        matrix[i][j] = 0 if cols_to_change[j] == true
        j+= 1
      end
    end
    i += 1
  end

  return matrix
end
