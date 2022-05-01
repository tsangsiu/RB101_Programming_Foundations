=begin

# Problem
- Given n,
  - Return the last digit of the n-th fibonacci number

# Examples
p fibonacci_last(15) == 0
p fibonacci_last(20) == 5
p fibonacci_last(100) == 5
p fibonacci_last(100_001) == 1
p fibonacci_last(1_000_007) == 3
p fibonacci_last(123456789) == 4

# Algorithm
- Initialize an empty Array call `sequence_last`
- Loop from 1 to n,
  - If the current number is 1 or 2,
    - Append it to `sequence_last`
  - Else,
    - Add the last two number in `sequence_last`
    - Find the last digit
    - Append that to `sequence_last`
- Return that last element in `sequence_last`

=end

def fibonacci_last(n)
  sequence_last = []
  1.upto(n) do |num|
    if [1, 2].include?(num)
      sequence_last << 1
    else
      sequence_last << (sequence_last[-1] + sequence_last[-2]) % 10
    end
  end
  sequence_last[-1]
end

# p fibonacci_last(15) == 0
# p fibonacci_last(20) == 5
# p fibonacci_last(100) == 5
# p fibonacci_last(100_001) == 1
# p fibonacci_last(1_000_007) == 3
# p fibonacci_last(123456789) == 4

=begin

# Problem
- Rewrite the above method
- It should be able to return the result almost instantly, regardless how bid the number is

# Example
p fibonacci_last(123_456_789_987_745) == 5

# Brainstorm
- Thinking if there is a recurring pattern of the last digits?
- It does!
- The pattern recurs itself every 60 numbers.
- Therefore, the last digit of the 67th fibonacci number is the same as that of the 7th fibonacci number

# Algorithm
- Initialize an empty Array call `sequence_last`
- Given n, find the modulus when divided by 60
- Loop from 1 to the modulus,
  - If the current number is 1 or 2,
    - Append it to `sequence_last`
  - Else,
    - Add the last two number in `sequence_last`
    - Find the last digit
    - Append that to `sequence_last`
- Return that last element in `sequence_last`

=end

def fibonacci_last(n)
  sequence_last = []
  1.upto(n % 60) do |num|
    if [1, 2].include?(num)
      sequence_last << 1
    else
      sequence_last << (sequence_last[-1] + sequence_last[-2]) % 10
    end
  end
  sequence_last[-1]
end

p fibonacci_last(15) == 0
p fibonacci_last(20) == 5
p fibonacci_last(100) == 5
p fibonacci_last(100_001) == 1
p fibonacci_last(1_000_007) == 3
p fibonacci_last(123456789) == 4
p fibonacci_last(123_456_789_987_745) == 5
