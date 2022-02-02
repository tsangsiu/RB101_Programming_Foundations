def rotate_array(array)
  output = array.clone
  output << output.shift
  output
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]
p x == [1, 2, 3, 4]

# Further Exploration
def rotate_string(string)
  rotate_array(string.split('')).join('')
end

p rotate_string('abcde')
