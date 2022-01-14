def average(array)
  array.sum / array.size
end

puts average([1, 6]) == 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

# Further Exploration
def average(array)
  array.reduce(:+).to_f / array.size
end

puts average([1, 6])
puts average([1, 5, 87, 45, 8, 8])
puts average([9, 47, 23, 95, 16, 52])

# Play Around
array = [1, 2, 3]
sum = array.reduce do |sum, number|
  sum + number
end
puts sum
