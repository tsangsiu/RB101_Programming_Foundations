def rotate_array(array)
  output = array.clone
  output << output.shift
  output
end

def rotate_rightmost_digits(number, n)
  output = number.to_s.split('')
  output = "#{output[0...-n].join('')}" +
           "#{rotate_array(output[-n..-1]).join('')}"
  output.to_i
end

def max_rotation(number)
  length = number.to_s.length
  length.downto(2) do |n|
    number = rotate_rightmost_digits(number, n)
  end
  number
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15
p max_rotation(8_703_529_146) == 7_321_609_845
# p max_rotation(100_000_000_001) # error

# Further Exploration
def max_rotation(number)
  digits = number.to_s.split('')
  length = digits.size

  length.downto(1) do |n|
    rightmost_digits = digits[-n..-1]
    digits = digits[0...-n] + (rightmost_digits << rightmost_digits.shift)
  end

  digits.join('').to_i
end

p max_rotation(735291)
p max_rotation(3)
p max_rotation(35)
p max_rotation(105) # => 15, the leading zeros are dropped
p max_rotation(8_703_529_146)
p max_rotation(100000000001) # => 1000010, multiple zeros
