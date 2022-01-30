def leading_substrings(string)
  output = []
  0.upto(string.length - 1) do |index|
    output << string[0..index]
  end
  output
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
