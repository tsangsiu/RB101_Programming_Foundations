=begin

# Problem
- Re-do the last problem, but without using recursion

# Examples
fibonacci(20) == 6765
fibonacci(100) == 354224848179261915075
fibonacci(100_001) # => 4202692702.....8285979669707537501

# Algorithm
- Initialize an empty Array called `sequence`
- Loop from 1 to the given number,
  - If the number is either 1 or 2,
    - Append 1 to `sequence`
  - Else,
    - Calculate the sum of the last two numbers
    - Append that number to the Array
- Return the last number in the Array

=end

# Code
def fibonacci(n)
  sequence = []
  1.upto(n) do |num|
    if [1, 2].include?(num)
      sequence << 1
    else
      sequence << sequence[-1] + sequence[-2]
    end
  end
  sequence[-1]
end

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501
