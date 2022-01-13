def transpose(matrix)
  n_row = matrix.size
  n_col = matrix[0].size

  new_matrix = []
  n_col.times do
    new_matrix << Array.new(n_row)
  end

  matrix.each_with_index do |row, i|
    row.each_with_index do |element, j|
      new_matrix[j][i] = matrix[i][j]
    end
  end

  new_matrix
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
