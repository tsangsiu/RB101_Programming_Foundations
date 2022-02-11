def factors(number)
  factors = []
  number.downto(1) do |divisor|
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

p factors(60)

=begin
Bonus 1
The purpose of number % divisor == 0 is to check if divisor is a factor of
number.

Bonus 2
The purpose of it is to return the array.
=end
