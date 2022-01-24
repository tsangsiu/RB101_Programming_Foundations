def merge(array1, array2)
  array1.union(array2)
end

def merge(array1, array2)
  array1 | array2
end

def merge(array1, array2)
  array = array1 + array2
  array.inject([]) do |output, element|
    if !output.include?(element)
      output << element
    else
      output
    end
  end
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
