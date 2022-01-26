def multiply_list(array1, array2)
  output = []
  array1.each_with_index do |element, index|
    output[index] = array1[index] * array2[index]
  end
  output
end

# Further Exploration
def multiply_list(array1, array2)
  array1.zip(array2).map { |sub_array| sub_array.reduce(:*) }
end

p multiply_list([3, 5, 7], [9, 10, 11])
