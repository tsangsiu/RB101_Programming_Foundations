=begin

# Problem
- Write a method to transpose a 3 x 3 matrix
- The original matrix should be unaltered
- Return a new transposed matrix

# Example
matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]
new_matrix = transpose(matrix)
p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# Brainstorm
- For transposed matrix,
  - The i,j element of it is the j,i element of the original matrix

# Algorithm
- Initialize `transposed_matrix` to an Array with 3 empty sub-Arrays
- Iterate through the given Array with index `row`,
  - For each sub-Array, iterate through each element with index `col`,
    - Set the [col, row] element of `transposed_matrix` to the current element
- Return `transposed_matrix`

=end

def transpose(matrix)
  transposed_matrix = [[], [], []]
  matrix.each_with_index do |sub_arr, row|
    sub_arr.each_with_index do |element, col|
      transposed_matrix[col][row] = element
    end
  end
  transposed_matrix
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

=begin

# Further Exploration

# Problem
- Write a destructive transpose! method

# Algorithm
- Iterate through each sub-Array with index `i`
  - For the i-th sub-Array, iterate through the (i + 1)-th element till the end with index `j`
    - Swap the element at i, j with j, i
- Return the original matrix

=end

def transpose!(matrix)
  matrix.each_with_index do |sub_arr, row|
    (row + 1).upto(sub_arr.size - 1) do |col|
      matrix[row][col], matrix[col][row] = matrix[col][row], matrix[row][col]
    end
  end
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

transpose!(matrix)
p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
