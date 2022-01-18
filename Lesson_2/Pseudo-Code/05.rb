=begin

a method that takes two arrays of numbers and returns the result of merging the 
arrays. The element of the first array should become the elements at the even 
indexes of the returned array, while the elements of the second array should 
become the elements at the odd indexes.

- given two arrays of the same size
- initialise an empty array named output for output
- initialise an variable named index, and set it to 0
- while index < length of array
  - push the element at the current index from array1 to output
  - push the element at the current index from array2 to output
  - increment index by 1
- return output

START
  # given two arrays (array1 and array2) of the same size
  SET output = []
  SET index = 0
  WHILE index < length of array1
    push array1[index] to output
    push array2[index] to output
    SET index = index + 1
  RETURN output 
END

=end

def merge(array1, array2)
  output = []
  index = 0
  while index < array1.size
    output << array1[index]
    output << array2[index]
    index += 1
  end
  output
end

p merge([1, 2, 3], [4, 5, 6])
