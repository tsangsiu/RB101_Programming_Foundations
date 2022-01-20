def crunch(string)
  output = ''
  letters = string.split('')
  letters.each do |letter|
    output << letter if output[-1] != letter
  end
  output
end

# Further Exploration
=begin
We have to do this because we need to include the last character of the string. 
If we stop iterating when index is equal to text.length, the last character is 
ignored.

We didn't use String#each_char or String#chars because we can only track the 
current character. We cannot compare the current character to the previous or 
the next one to decide if we need to include the current character.
=end

# using String#each_char
def crunch(text)
  index = 0
  output = ''
  text.each_char do |char|
    output << char if char != text[index + 1]
    index += 1
  end
  output
end

# using String#chars
def crunch(text)
  index = 0
  output = ''
  text.chars do |char|
    output << char if char != text[index + 1]
    index += 1
  end
  output
end

# using regular expression
def crunch(text)
  text.gsub(/(.)\1+/, '\1')
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
