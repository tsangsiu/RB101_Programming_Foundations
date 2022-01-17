def palindrome?(string)
  string == string.reverse
end

p palindrome?('madam') == true
p palindrome?('Madam') == false
p palindrome?("madam i'm adam") == false
p palindrome?('356653') == true

# Further Exploration
def palindrome?(array)
  array == array.reverse
end

def palindrome?(array_or_string)
  array_or_string == array_or_string.reverse
end

p palindrome?([1, 2, 3, 2, 1])
p palindrome?('madam')
