def running_total(array)
  running_total = []
  array.each_with_index do |element, index|
    running_total << array[0..index].sum
  end
  running_total
end

# Further Exploration
def running_total(array)
  output = array.each_with_object([0]) do |element, output|
    output << output[-1] + element
  end
  output[1..]
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
