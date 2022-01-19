def cleanup(string)
  string.gsub(/[^a-z]+/i, ' ')
end

# not using regular expression
def cleanup(string)
  (letters = string.split('').map do |letter|
    letter.downcase != letter.upcase ? letter : ' '
  end).join.squeeze(' ')
end

p cleanup("---what's my +*& line?")
