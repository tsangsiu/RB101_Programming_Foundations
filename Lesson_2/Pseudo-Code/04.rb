=begin

a method that determines the index of the 3rd occurrence of a given character in
a string. For instance, if the given character is 'x' and the string is 
'axbxcdxex', the method should return 6 (the index of the 3rd 'x'). If the given
character does not occur at least 3 times, return nil.

- given a string and a character
- turn the string into an array of letters and save it to letters
- initialise a variable named count, and set it to 0
- initialise a variable named index, and set it to 0
- iterate the elements in letters one by one
  - if the element is the character, increment count by 1
  - if count = 3, return index
  - increment index by 1
- return nil

START
  # given a string and a character
  SET letters = an array of letters in string
  SET count = 0
  SET index = 0
  WHILE index < length of letters
    SET current_letter = the letter at space 'index'
    IF current_letter = character
      SET count = count + 1
      IF count = 3, return index
    SET index = index + 1
  RETURN nil
END

=end

def index_of_third_occurrence(string, character)
  letters = string.chars
  count = 0
  index = 0
  while index < letters.size
    current_letter = letters[index]
    if current_letter == character
      count += 1
      return index if count == 3
    end
    index += 1
  end
  return nil
end

p index_of_third_occurrence('axbxcdxex', 'x')
p index_of_third_occurrence('abcde', 'x')
