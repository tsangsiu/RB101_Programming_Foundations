=begin

# Problem
- Given a rational number,
  - Return an array of denominators of the unit fractions that sums to that rational number
- Note that every rational number can be expressed as sum of unit fractions in an infinite number of ways

- Write also a method to turn the denominators of unit fractions back to a rational number

# Examples
egyptian(Rational(2, 1)) # => [1, 2, 3, 6]
egyptian(Rational(137, 60)) # => [1, 2, 3, 4, 5]
egyptian(Rational(3, 1)) # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)

# Algorithm
- The `egyptian` method
  - Initialize `rational` to the given rational number
  - Initialize `denominator` to 1
  - Initialize `output` to an empty Array
  - Until `rational` == 0,
    - If `rational` >= Rational(1, denominator),
      - Decrement `rational` by Rational(1, denominator) 
      - Push `denominator` to `output`
    - Increment `denominator` by 1
  - Return `output`

- The `unegyptian` method
  - Given an Array of denominators,
    - Initialize `rational` to 0
    - Iterate through the Array of denominators,
      - Increment `rational` by `Rational(1, denominator)`
    - Return `rational`

=end

def egyptian(rational)
  denominator = 1
  output = []
  until rational == 0
    if rational >= Rational(1, denominator)
      output << denominator
      rational -= Rational(1, denominator)
    end
    denominator += 1
  end
  output
end

def unegyptian(denominator_arr)
  rational = 0
  denominator_arr.each do |denominator|
    rational += Rational(1, denominator)
  end
  rational
end

def unegyptian(denominator_arr)
  denominator_arr.inject(0) { |rational, denominator| rational + Rational(1, denominator) }
end

p egyptian(Rational(2, 1)) # => [1, 2, 3, 6]
p egyptian(Rational(137, 60)) # => [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1)) # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)
