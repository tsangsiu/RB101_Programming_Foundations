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

puts transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
puts transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
puts transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
puts transpose([[1]]) == [[1]]
