def penultimate(string)
  string.split(' ')[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

# Further Exploration
# He is handsome. => is
# Hello! => Hello!
# edge case: I am a man. => nil
# edge case: empty string => nil
def middle(string)
  words = string.split
  if words.size.even?
    nil
  else
    middle_point = (words.size - 1) / 2
    words[middle_point]
  end
end

p middle('He is handsome.')
p middle('Hello!')
p middle('I am a man.')
p middle('')
