def word_cap(string)
  string.split.map(&:capitalize).join(' ')
end

# Further Exploration
def word_cap(string)
  output = []
  string.split.each do |word|
    word[0] = word[0].upcase
    word[1..] = word[1..].downcase
    output << word
  end
  output.join(' ').chomp
end

def word_cap(string)
  words = string.split(' ')
  (words.map do |word|
    word[0].upcase + word[1..].downcase
  end).join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
