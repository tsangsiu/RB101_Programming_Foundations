REGEX = [
  /\bzero\b/, /\bone\b/, /\btwo\b/, /\bthree\b/, /\bfour\b/,
  /\bfive\b/, /\bsix\b/, /\bseven\b/, /\beight\b/, /\bnine\b/,
]

def word_to_digit(string)
  REGEX.each_with_index do |regex, digit|
    string.gsub!(regex, digit.to_s)
  end
  string
end

p word_to_digit('Please call me at five five five one two three four. Thanks.')
