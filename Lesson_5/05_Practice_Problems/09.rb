arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

new_arr = arr.map do |array|
  array.sort do |a, b|
    b <=> a
  end
end

p new_arr
