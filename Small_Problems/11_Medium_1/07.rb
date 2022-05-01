=begin
  
# Problem
- Given a String, return the **same** String
- That convert "one", "two", "three", ... to "1", "2", "3", ..

# Examples
p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# Data Structures
- Input: String
- Intermediate: the same String, an Array to store the regex
- Output: the same String

# Brainstorm
- To use `String#gsub!`
- How to handle cases?
- Use regular expressions

# Algorithm
- Initialize an Array called `PATTERN` of regular expressions of Strings that need to be matched and replaced
- Iterate through the Array of regular expressions (with index)
  - Replace String using `String#gsub!`
  - Pattern is the element of `PATTERN`
- Return the original String

=end

PATTERN = [/\bzero\b/i, /\bone\b/i, /\btwo\b/i, /\bthree\b/i, /\bfour\b/i,
           /\bfive\b/i, /\bsix\b/i, /\bseven\b/i, /\beight\b/i, /\bnine\b/i]
def word_to_digit(words)
  PATTERN.each_with_index do |pattern, index|
    words.gsub!(pattern, index.to_s)
  end
  words
end

p word_to_digit('Please call me at five five five one two three four. Thanks.')

=begin

# Further Exploration

1. Remove the blanks between numbers
# Brainstorms
- Once we get the converted String
- Use regex again to remove the blanks between numbers
- Example:
str = 'hello hello world'
str.gsub!(/(hello) \1/, '\1') # capture group and backreference
p str # => 'hello world'

# Algorithm
- While there is a match of the pattern /[0-9] [0-9]/,
- Replace it with /[0-9][0-9]/

=end

# Code
def remove_space_between_numbers!(str)
  while /[0-9] [0-9]/.match(str)
    str.gsub!(/([0-9]) ([0-9])/, '\1\2')
  end
  str
end

def word_to_digit(words)
  PATTERN.each_with_index do |pattern, index|
    words.gsub!(pattern, index.to_s)
  end
  remove_space_between_numbers!(words)
end

p word_to_digit('Please call me at five five five one two three four. Thanks.')

=begin

2. To format a 10-digit phone number
# Problem
- Assume any 10-digit number is a phone number
- Given a 10-digit number, format it to '(123) 456-7890'

# Brainstorm
- Use the same skill just learnt: capture group and backreference
- Pattern: /([0-9]){10}/
- Replaced String: '(\1\2\3) \4\5\6-\7\8\9\10'
- Just find out that the maximum number of capture group is 9
- Maybe we can simply switch to use string interpolation

=end

# Code
def format_phone_number(str)
  str =~ /^[0-9]{10}$/ ? "(#{str[0..2]}) #{str[3..5]}-#{str[6..9]}" : str
end

def word_to_digit(words)
  PATTERN.each_with_index do |pattern, index|
    words.gsub!(pattern, index.to_s)
  end

  remove_space_between_numbers!(words)

  # format the 10-digit phone number
  if words =~ /\b[0-9]{10}\b/
    phone_number = words[words =~ /[0-9]{10}/, 10]
    formatted_phone_number = format_phone_number(phone_number)
    words.gsub!(phone_number, formatted_phone_number)
  end
end

str = 'My phone number is one two three four five six seven eight nine zero one.'
word_to_digit(str)
p str
