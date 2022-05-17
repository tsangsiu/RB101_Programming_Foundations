=begin

# Problem
- Given a positive integer n,
  - Computes the difference between:
    - the square of sum of the first n positive intgers, and
    - the sum of the square of the first n positive integers
    
# Examples
sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
sum_square_difference(10) == 2640
sum_square_difference(1) == 0
sum_square_difference(100) == 25164150

# Algorithm
- Given a positive integer `n`,
  - Initialize `square_of_sum` to the square of sum of the first n integers
  - Initialize `sum_of_square` to a Range object (1..n)
  - Convert the Range to an Array
  - Transform each element in the Array to its square
  - Sum the whole Array and save the result to `sum_of_square`
  - Return `square_of_sum` - `sum_of_square`

=end

# Code
def sum_square_difference(n)
  square_of_sum = (1..n).sum ** 2
  sum_of_square = (1..n).to_a.map { |num| num ** 2 }.sum
  square_of_sum - sum_of_square
end

p sum_square_difference(3) == 22
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
