def multiply_all_pairs(array1, array2)
  output = []
  array1.each do |element1|
    array2.each do |element2|
      output << element1 * element2
    end
  end
  output.sort
end

def multiply_all_pairs(array1, array2)
  array1.product(array2).map { |sub_array| sub_array.reduce(:*) }.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2])
