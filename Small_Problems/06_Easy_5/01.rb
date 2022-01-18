=begin
- initialise a variable named output for output, and set it to 0
- given a string, turn it into an array of letters
- iterate through the array of letters
  - find the ASCII value of each value
  - add the value to output
- return output
=end

def ascii_value(string)
  output = 0
  letters = string.chars
  letters.each do |letter|
    output += letter.ord
  end
  output
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

# Further Exploration
p 'A'.ord.chr # => 'A'

=begin
If a longer string is called on instead of a single character, only the first 
character is considered.
=end
