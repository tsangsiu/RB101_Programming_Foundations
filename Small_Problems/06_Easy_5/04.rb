def swap(string)
  words = string.split
  words.map! do |word|
    letters = word.split('')
    letters[0], letters[-1] = letters[-1], letters[0]
    letters.join('')
  end
  words.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

# Further Exploration
=begin
The method wouldn't work. As the method returns an array of the last and the 
first letters, which is also the return value of #map, the letters in between 
would be missing.
=end
