def interleave(array1, array2)
  output = []
  index = 0
  while index < array1.size
    output << array1[index]
    output << array2[index]
    index += 1
  end
  output
end

# Further Exploration
def interleave(array1, array2)
  array1.zip(array2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
