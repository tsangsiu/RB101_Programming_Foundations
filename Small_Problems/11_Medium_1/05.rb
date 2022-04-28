=begin

# Problem
- Given an odd integer,
- Draw a diamond in an n * n grid

# Examples

diamond(1)

*

----------

diamond(3)

 *
***
 *

----------

diamond(9)

    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *

----------

# Brainstorming
1st line, 1 star
2nd line, 3 stars
3rd line, 5 stars
(n / 2)th line, n stars

So, for the n th line, there should be (2 * n - 1) starts
Given n, going from 1 to n / 2, and then back to 1
But there's an edge case, when n = 1, n / 2 gives 0, so needs special treatment for that

# Data Structure
- Input: Integer
- Intermediate: -
- Output: -

# Algorithm
- Given an integer n,
- If n equals 1,
  - Print only one star to the console
- Else,
  - Going up from `line` = 1 to n / 2 + 1,
    - The number of stars on line `line` is 2 * `line`` - 1
    - Output that number of starts to the console, but with (n - number of stars) / 2 blanks to the left
  - Going down from `line` = n / 2 to 1
    - The number of stars on line `line` is 2 * `line` - 1
    - Output that number of starts to the console, but with (n - number of stars) / 2 blanks to the left

=end

# Code
def print_diamond_layer(n, line)
  n_star = 2 * line - 1
  n_blank = (n - n_star) / 2
  puts "#{' ' * n_blank}#{'*' * n_star}"
end

def diamond(n)
  1.upto(n / 2 + 1) do |line|
    print_diamond_layer(n, line)
  end
  (n / 2).downto(1) do |line|
    print_diamond_layer(n, line)
  end
end

diamond(1)
puts
diamond(3)
puts
diamond(9)

=begin

# Further Exploration

# Problem
- Modify the above code so as to print the outline of the diamond only

# Examples

diamond(5)

  *
 * *
*   *
 * *
  *

# Brainstroming
- We just modify the `print_diamond_layer` method here

# Algorithm
- The number of stars on line `line` is 2 * `line` - 1
- If `line` equals 1,
  - Print a star in the middle
- Else, 
  - First, output the blanks to the left of the first star
    - The number of blanks is still (n - number of stars) / 2
  - Then, print a star
  - Then, print (number of stars - 2) blanks
  - Then, print the closing start on that line

=end

def print_diamond_layer(n, line)
  n_star = 2 * line - 1
  n_blank = (n - n_star) / 2
  if n_star == 1
    puts "#{' ' * ((n - 1) / 2)}*"
  else
    puts "#{' ' * n_blank}*#{' ' * (n_star - 2)}*"
  end
end

diamond(1)
puts
diamond(3)
puts
diamond(9)
