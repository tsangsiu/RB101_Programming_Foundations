def rotate_array(array)
  output = array.clone
  output << output.shift
  output
end

def rotate_rightmost_digits(number, n)
  number_s = number.to_s.split('')
  output = "#{number_s[0...-n].join('')}" +
           "#{rotate_array(number_s[-n..-1]).join('')}"
  output.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
