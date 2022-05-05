=begin

# Problem
- Given a number,
  - Return the next featured number that is greater than the argument
  - Return an error message if there is no next featured number
- A featured number is a number that:
  - is a multiple of 7,
  - an odd number, and
  - has no repeated digits

# Examples
featured(12) == 21
featured(20) == 21
featured(21) == 35
featured(997) == 1029
featured(1029) == 1043
featured(999_999) == 1_023_547
featured(999_999_987) == 1_023_456_987
featured(9_999_999_999) # => There is no possible number that fulfills those requirements

# Brainstorm
- How to tell if the next feature is not available?
  - The maximum possible number is 9_999_999_999_999
  - Because a 11-digit number must have repeated digits

# Algorithm
- A method to check if a number is a featured number:
  - If the number is divisible by 7 and has no repeated digits,
    - Return true
  - Else,
    - Return false

- `featured`
  - Increment the given number by 1
  - Loop
    - If the current number is a featured number
      - Return the current number
      - Break the loop
    - Else if the current number >= 9_999_999_999
      - Return "There is no possible number that fulfills those requirements"
      - Break the loop
    - Else,
      - Increment the current number by 1

=end

def featured?(num)
  num % 7 == 0 && num.odd? && num.to_s.split('').uniq == num.to_s.split('')
end

def featured(num)
  num += 1
  loop do
    if featured?(num)
      break num
    elsif num >= 9_999_999_999
      break "There is no possible number that fulfills those requirements"
    else
      num += 1
    end
  end
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987
p featured(9_999_999_999)
