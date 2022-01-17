def palindromic_number?(number)
  number.to_s == number.to_s.reverse
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true

# Further Exploration
=begin
If a number begins with one or more 0s is passed into palindromic_number?, 
it doesn't work. Becase a leading 0 is a number literal in Ruby. The number
after the leading 0 is interpreted as an octal number.
=end
