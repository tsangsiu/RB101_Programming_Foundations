=begin

# Problem
- Use recursion to find the n-th fibonacci number, where
- fibonacci(n) = fibonacci(n - 1) + fibonacci(n - 2) if n > 2, and
- fibonacci(1) = fibonacci(2) = 1

# Examples
fibonacci(1) == 1
fibonacci(2) == 1
fibonacci(3) == 2
fibonacci(4) == 3
fibonacci(5) == 5
fibonacci(12) == 144
fibonacci(20) == 6765

# Data Structure
- Input: Integer
- Outpu: Integer

# Algorithm
- Pretty straight-forward here
- Given n,
  - If n equals 1 or 2, return 1
  - Else return fibonacci(n - 1) + fibonacci(n - 2)

=end

# Code
def fibonacci(n)
  if n.class == Integer
    [1, 2].include?(n) ? 1 : fibonacci(n - 1) + fibonacci(n - 2)
  end
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
