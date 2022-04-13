=begin

Problem
- Input: Array
- Output: New Array
- Rules:
  - Rotate an array by moving the first element to the end of the array
  - The original array should not be modified
- Requirement:
  - The method should be non-mutating

Examples
rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true

Data Structure
- Input: Array
- Intermediate: Array
- Output: Array

Algorithm
- Create a copy of the given array
- Take off the first element of the copied array
- Take that element to append to the end of the copied array
- Return the copied array

=end

# Code

def rotate_array(arr)
  copied_arr = arr.dup
  copied_arr << copied_arr.shift
  copied_arr
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]
p x == [1, 2, 3, 4]

# Further Exploration

=begin

Problem
- Input: Integer
- Output: Integer
- Rules:
  - Rotate an integer by moving the first digit to the end of the integer
- Note:
  - Integers are immutable, so the method must be non-mutating

Examples
rotate_integer(12345) == 23451
rotate_array(0) == 0

x = 54321
rotate_array(x) == 43215   # => true
x == 54321                 # => true

Data Structure
- Input: Integer
- Intermediate: Array
- Output: Integer

Algorithm
- Convert the integer into an array of digits
- Apply the `rotate_array` method to rotate the digits
- Convert the array back to integer
- Return the integer

=end

def rotate_integer(int)
  digits = int.to_s.split('')
  digits = rotate_array(digits)
  digits.join.to_i
end

p rotate_integer(12345) == 23451
p rotate_integer(0) == 0

x = 54321
p rotate_integer(x) == 43215   # => true
p x == 54321                 # => true
