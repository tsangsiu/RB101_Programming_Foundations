=begin

# Problem
- Write a method to transpose an M x N matrix
- Return a new transposed Array

# Examples
transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
transpose([[1]]) == [[1]]

# Brainstorm
- Initialize the return Array:
  - Get the #row, can get by arr.size
  - Get the #col, can get by arr[0].size
  - Initialize an empty Array with #col empty sub-Array
- The i, j element of the return Array is the j, i element of the original Array

# Algorithm
- Get the number of row of the given matrix
- Get the number of col of the given matrix
- Initialize an empty Array called `transposed_array` with #col empty sub-Array
- Iterate through each sub-Array of the given Array with index `row`
  - Iterate through each element of the current sub-Array with index `col`
    - Set the `col`, `row` element of `transposed_array` to the current element
- Return `transposed_array`

=end

def transpose(matrix)
  n_row = matrix.size
  n_col = matrix[0].size
  transposed_array = []
  n_col.times { |_| transposed_array << [] }
  matrix.each_with_index do |sub_arr, row|
    sub_arr.each_with_index do |element, col|
      transposed_array[col][row] = element
    end
  end  
  transposed_array
end

def transpose(matrix)
  transposed_matrix = []
  n_row = matrix.size
  n_col = matrix[0].size
  (0...n_col).each do |col_number|
    new_row = (0...n_row).map { |row_number| matrix[row_number][col_number] }
    transposed_matrix << new_row
  end
  transposed_matrix
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) == [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]
