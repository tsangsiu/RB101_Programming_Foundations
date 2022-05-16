=begin

# Problem
- Write a method to rotate a matrix 90 degree clockwise
- Return a new matrix

# Examples

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2

# Brainstorm
- Similar to transposing, the first column will become the first row
- Just that the elements are reversed

# Algorithm
- Initialize `rotated_matrix` to an empty Array
- Iterate through column index from `0` to the end
  - Initialize `new_row` to an empty Array
  - Iterate through row index from `0` to the end
    - Prepend the current element to `new_row`
  - Append `new_row` to `rotated_matrix`
- Return `rotated_matrix`

=end

def rotate90(matrix)
  rotated_matrix = []
  n_row = matrix.size
  n_col = matrix[0].size
  (0...n_col).each do |col_index|
    new_row = []
    (0...n_row).each do |row_index|
      new_row.prepend(matrix[row_index][col_index])
    end
    rotated_matrix << new_row
  end
  rotated_matrix
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2

=begin

# Further Exploration

# Problem
- Modify the above solution to rotate 90, 180, 270, 360 degree based on the argument given

# Algorithm
- Given the degree, divide it by 90. That will be the number of times to invoke rotate90
- Invoke the rotate90 method that number of times

=end

def rotate(matrix, degree)
  rotate_times = degree / 90
  rotated_matrix = matrix
  rotate_times.times do
    rotated_matrix = rotate90(rotated_matrix)
  end
  rotated_matrix
end

matrix = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

=begin

Original Matrix
3 7 4 2
5 1 0 8

5 3
1 7
0 4
8 2

8 0 1 5
2 4 7 3

2 8
4 0
7 1
3 5

3 7 4 2
5 1 0 8

=end

p rotate(matrix, 90)
p rotate(matrix, 180)
p rotate(matrix, 270)
p rotate(matrix, 360)
