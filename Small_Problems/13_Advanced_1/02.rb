=begin

# Problem
- Write a method that displays an 8-pointed star in an n x n grid
- n is an odd integer
- The smallest n to be handle is 7

# Examples

star(7)

*  *  *
 * * *
  ***
*******
  ***
 * * *
*  *  *

----------

star(9)

*   *   *
 *  *  *
  * * *
   ***
*********
   ***
  * * *
 *  *  *
*   *   *

# Brainstorm
- Consider only row 1 to the middle row
- Except for the middle row, each row has 3 '*'s
- For the 1st row, there is a '*' at index position:
  - 0
  - (n - 1) / 2
  - n - 1
- For the 2nd row, there is a '*' at position:
  - 1
  - (n - 1) / 2
  - n - 2
- For the 3rd row, there is a '*' at position:
  - 2
  - (n - 1) / 2
  - n - 3
- For the i-th row, there is a '*' at position:
  - i - 1
  - (n - 1) / 2
  - n - i

# Algorithm
- Given n,
  - If n > 7 and n is odd then 
    - From row 1 to n / 2,
      - Initialize `line` to " " * n
      - Re-assign the (row - 1)-th blank to "*"
      - Re-assign the ((n - 1) / 2)-th blank to "*"
      - Re-assign the (n - row)-th blank to "*"
      - Print `line`
    - Print a line of n "*"
    - From row n / 2 back to 1,
      - Initialize `line` to " " * n
      - Re-assign the (row - 1)-th blank to "*"
      - Re-assign the ((n - 1) / 2)-th blank to "*"
      - Re-assign the (n - row)-th blank to "*"
      - Print `line`

=end

def print_star_line(n, line_number)
  line = " " * n
  line[line_number - 1] = "*"
  line[(n - 1) / 2] = "*"
  line[n - line_number] = "*"
  puts line
end

def star(n)
  if n >= 7 && n.odd?
    1.upto(n / 2) { |line_number| print_star_line(n, line_number) }
    puts "*" * n
    (n / 2).downto(1) { |line_number| print_star_line(n, line_number) }
  end
end

star(7)
puts
star(9)
