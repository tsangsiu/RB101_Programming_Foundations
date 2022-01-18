=begin

a method that takes an array of integers, and returns a new array with every 
other element from the original array, starting with the first element.

- given an array of integers
- initialise an empty array named output for output
- initialise an iterator variable, and set it to 0
- iterate the element one by one
  - if iterator is even, push the element to output
  - increment iterator by 1
- after iterating through the array, return output

START
    # given an array of integers called "numbers"
    SET output = []
    SET iterator = 0
    WHILE iterator < length of numbers
      IF iterator is even
        add the element to output
      SET iterator = iterator + 1
    RETURN output
END

=end

def everyOther(numbers)
  output = []
  iterator = 0
  while iterator < numbers.size
    output << numbers[iterator] if iterator.even?
    iterator += 1
  end
  output
end

p everyOther([1, 4, 7, 2, 5])
