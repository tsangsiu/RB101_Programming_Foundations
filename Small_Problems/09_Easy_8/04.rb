def leading_substrings(string)
  output = []
  0.upto(string.length - 1) do |index|
    output << string[0..index]
  end
  output
end

def substrings(string)
  output = []
  0.upto(string.length - 1) do |index|
    substring = string[index..(string.length - 1)]
    output << leading_substrings(substring)
  end
  output.flatten
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
