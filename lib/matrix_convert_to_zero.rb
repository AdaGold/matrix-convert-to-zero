# Updates the input matrix based on the following rules:
# Assumption/ Given: All numbers in the matrix are 0s or 1s
# If any number is found to be 0, the method updates all the numbers in the
# corresponding row as well as the corresponding column to be 0.
# Time complexity: O(rows * columns), where rows is the number of rows and columns
#                  is the number of columns in the input matrix.
#                 rows * columns would be the number of times the nested loop
#                                      statements get executed
# Space complexity: O(1) - row_zero and column_zero are two variables used
#                          to keep track of whether the 0th row or 0th column
#                          should be converted to all zeroes.
#                          By using the 0th row and 0th column keeps track of
#                          all other cells, no additional storage is needed.
def matrix_convert_to_zero(matrix)
  return if matrix == nil
  rows = matrix.length
  return if rows == 0
  columns = matrix[0].length

  # Instead of using a separate data structure, use row 0 and column 0
  # to track which row or which column should be converted to zero
  # Therefore, explicitly account upfront for checking if the 0th row or
  # the 0th column has a zero in it
  row_zero = false # track if 0th row needs to be made all zeroes
  (columns).times do |column|
    if matrix[0][column] == 0
      row_zero = true
    end
  end

  column_zero = false # track if 0th column needs to be made all zeroes
  (rows).times do |row|
    if matrix[row][0] == 0
      column_zero = true
    end
  end

  # check all other rows and column and track them in 0th row and 0th column
  (rows - 1).times do |row|
    (columns - 1).times do |column|
      if matrix[row + 1][column + 1] == 0
        matrix[0][column + 1] = 0
        matrix[row + 1][0] = 0
      end
    end
  end

  # if the corresponding 0th row, or 0th column has value of 0, make it 0
  (rows - 1).times do |row|
    (columns - 1).times do |column|
      if matrix[0][column + 1] == 0 || matrix[row + 1][0] == 0
        matrix[row + 1][column + 1] = 0
      end
    end
  end

  if row_zero
    # convert 0th row to have all zeroes
    (columns).times do |column|
      matrix[0][column] = 0
    end
  end
  if column_zero
    # convert 0th column to have all zeroes
    (rows).times do |row|
      matrix[row][0] = 0
    end
  end
end
