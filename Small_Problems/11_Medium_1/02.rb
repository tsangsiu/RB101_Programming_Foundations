=begin

Problem
- Input: Integers (the number, the number of digits)
- Output: Integer
- Rules:
  - Write a method to rotate the last n digits of a number

Examples
rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917

Data Structure
- Input: Integers
- Intermediate: String
- Output: Integer

Algorithm
- Convert the given Integer to a String
- Split the String into two parts:
  - The first part is the last n digits
  - The second part is the remaining digits
- Apply `rotate_array` to the first part of the String
- Append the result to the end of the second part of the String
- Convert the String back to Integer
- Return the Integer

=end

# Code

def rotate_array(arr)
  copied_arr = arr.dup
  copied_arr << copied_arr.shift
  copied_arr
end

def rotate_rightmost_digits(int, n)
  int_s = int.to_s
  int_s_last, int_s_first = [int_s[-n..-1], int_s[0...-n]]
  int_s_rotate = int_s_first + rotate_array(int_s_last.split('')).join
  int_s_rotate.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
