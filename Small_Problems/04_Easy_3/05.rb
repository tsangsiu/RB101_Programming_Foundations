def multiply(number1, number2)
  number1 * number2
end

def square(number)
  multiply(number, number)
end

puts square(5)
puts square(-8)

# Further Exploration
def power_to_n(number, power)
  output = 1
  power.times do
    output = multiply(output, number)
  end
  output
end

def power_to_n(number, power)
  ([number] * power).reduce(:*)
end

puts power_to_n(5, 2)
puts power_to_n(5, 3)
puts power_to_n(5, 4)
