def oddities(array)
  output = []
  array.each_with_index do |element, index|
    output << element if index.even?
  end
  output
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []

# Further Exploration
def evenities(array)
  output = []; index = 1
  while index < array.size
    output << array[index]
    index += 2
  end
  output
end

def evenities(array)
  output = []
  array.each_with_index do |index|
    output << array[index] if index.odd?
  end
  output
end

p evenities([1, 2, 3, 4, 5, 6])
