# Updates the input matrix based on the following rules:
# Assumption/ Given: All numbers in the matrix are 0s or 1s
# If any number is found to be 0, the method updates all the numbers in the
# corresponding row as well as the corresponding column to be 0.

# time complexity of below solution would be O(n*m) and space complexity would also be O(n*m)

def matrix_convert_to_0(matrix)
  # matrix.length = number of rows
  # matrix[i].length = number of cols

  i_to_change = Array.new(matrix.length)
  j_to_change = []

  i = 0
  while i < matrix.length
    j = 0
    while j < matrix[0].length
      if matrix[i][j] == 0
        i_to_change[i] = true
        j_to_change << j
        j = matrix[0].length
      else
        i_to_change[i] = false
        j += 1
      end
    end
    i += 1
  end

  i = 0
  while i < i_to_change.length
    if i_to_change[i] == true
      j = 0
      while j < matrix[i].length
        matrix[i][j] = 0
        j += 1
      end
    else # i_to_change == false
      k = 0
      while k < j_to_change.length
        matrix[i][j_to_change[k]] = 0
        k += 1
      end
    end
    i += 1
  end

  return matrix
end
