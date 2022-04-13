=begin

Problem
- Input: Integer
- Output: Integer
- Rules
  - Write a method that takes an integer, and returns the maximum rotation of it
  - Maximum rotation is like this:
    - Given an integer like 735291
    - 1. rotate it -> 352917
    - 2. keep the first digit fixed, rotate the remaining -> 329175
    - 3. keep the first two digits fixed, rotate the remaining -> 321759
    - 4. keep the first three digits fixed, rotate the remaining -> 321597
    - 5. keep the first four digits fixed, rotate the remaining -> 321579

Examples
max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845

Data Structures
- Input: Integer
- Intermediate: Array
- Output: Integer

Algorithm
- Initialize a counter (called `counter`) to the number of digits of the integer
- Iterate the following process while `counter` is positive
  - Call `rotate_rightmost_digits` on the integer where `n` = `counter`
  - Assign the result above back to the same variable for the integer
  - Decrement `counter` by 1
- Return the integer

=end

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

def max_rotation(int)
  counter = int.to_s.length
  while counter > 0
    int = rotate_rightmost_digits(int, counter)
    counter -= 1
  end
  int  
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15
p max_rotation(8_703_529_146) == 7_321_609_845

# Further Exploration

=begin

Problem
- Input: Integer
- Output: Integer
- Rules
  - Write a method that takes an integer, and returns the maximum rotation of it
  - Maximum rotation is like this:
    - Given an integer like 735291
    - 1. rotate it -> 352917
    - 2. keep the first digit fixed, rotate the remaining -> 329175
    - 3. keep the first two digits fixed, rotate the remaining -> 321759
    - 4. keep the first three digits fixed, rotate the remaining -> 321597
    - 5. keep the first four digits fixed, rotate the remaining -> 321579
  - The program should be above the handle integers with multiple consecutive zeros

Examples
max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845
max_rotation(100000000001) == 1000010 # multiple zeros

Data Structures
- Input: Integer
- Intermediate: Array
- Output: Integer

Algorithm
- `rotate_array(arr)`
  - Create a copy of the given array
  - Take off the first element of the copied array
  - Take that element to append to the end of the copied array
  - Return the copied array

- `rotate_rightmost_chars(str, n)`
  - Split the String into two parts:
    - The first part is the last n characters
    - The second part is the remaining characters
  - Convert the first part of string into an array of character
  - Apply `rotate_array` to the result above
  - Append the result above to the end of the second part of the String
  - Return the result string

- The main method `max_rotation_2`
  - Initialize a counter (called `counter`) to the number of digits of the given integer
  - Convert the integer to string
  - Iterate the following process while `counter` is positive
    - Call `rotate_rightmost_chars` on the converted string where `n` = `counter`
    - Assign the result above back to the same variable for the string
    - Decrement `counter` by 1
  - Convert the string back to integer
  - Return the integer

=end

def rotate_array(arr)
  copied_arr = arr.dup
  copied_arr << copied_arr.shift
  copied_arr
end

def rotate_rightmost_chars(str, n)
  str_last, str_first = [str[-n..-1], str[0...-n]]
  str_rotate = str_first + rotate_array(str_last.chars).join
  str_rotate
end

def max_rotation_2(int)
  counter = int.to_s.length
  int_s = int.to_s
  while counter > 0
    int_s = rotate_rightmost_chars(int_s, counter)
    counter -= 1
  end
  int_s.to_i
end

p max_rotation_2(735291) == 321579
p max_rotation_2(3) == 3
p max_rotation_2(35) == 53
p max_rotation_2(105) == 15 # the leading zero gets dropped
p max_rotation_2(8_703_529_146) == 7_321_609_845
p max_rotation_2(100000000001) == 1000010 # multiple zeros
