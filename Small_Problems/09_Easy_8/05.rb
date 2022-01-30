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

def palindromes(string)
  output = substrings(string)
  output.select do |substring|
    substring.reverse == substring && substring.length != 1
  end
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
