# Further Exploration

=begin

Input:
  - String, text file

Outputs:
  - String, the longest paragraph
  - Integer, the number of words in the longest paragraph

Problem:
  - Print the longest paragraph in the file based on the the number of words

Question:
  - What defines a word?
    - Any sequence of characters
    - Words are delimited by spaces
  - What defines a paragraph?
    - I suppose at "\n\n"
  - Do the output paragraph need to include the ending punctuation?
    - Yes!
  - How do the ouput look like?

Data Structures:
  - Input: String
  - During the algorithm, nested array,
    where an inner array represents a paragraph

Algorithm:
  - Read the text file to Ruby and stored as String.
  - Initalise an empty string, say `longest_paragraph` to store the longest
    paragraph.
  - Break the text into paragraphs at "\n\n"
  - For each paragraph,
    - count the number of word
    - If the paragraph is longer than the stored paragraph,
      - store that paragraph in `longest_paragraph`
  - Count the number of word in `longest_paragraph`
  - return `longest_paragraph` and the number of words

=end

text = File.read('text.txt')
# text.gsub!(/\n/, ' ')

def count_words(paragraph)
  paragraph.split.size
end

def find_the_longest_paragraph_and_its_length(text)
  longest_paragraph = ''
  paragraphs = text.split(/\n\n/)
  paragraphs.each do |paragraph|
    number_of_word = count_words(paragraph)
    if number_of_word > count_words(longest_paragraph)
      longest_paragraph = paragraph.strip
    end
  end  
  number_of_word = count_words(longest_paragraph)
  return longest_paragraph, number_of_word
end

longest_paragraph, number_of_word = find_the_longest_paragraph_and_its_length(text)

puts longest_paragraph
puts "The longest paragraph is #{number_of_word} words long."

=begin

Input:
  - String, text file

Outputs:
  - String, the longest word
  - Integer, the number of characters in the longest word

Problem:
  - Print the longest word in the file based on the the number of characters

Question:
  - What defines a word?
    - Any sequence of characters
    - Words are delimited by spaces
  - How do the ouput look like?

Data Structures:
  - Input: String
  - During the algorithm, nested array,
    where an inner array represents a word

Algorithm:
  - Read the text file to Ruby and stored as String.
  - Initalise an empty string, say `longest_word` to store the longest word.
  - Break the text into words at space
  - For each word,
    - eliminate the ending '.', '?', '!', if any
    - count the number of character
    - If the word is longer than the stored word,
      - store that word in `longest_word`
  - Count the number of word in `longest_word`
  - return `longest_word` and the number of character

=end

text = File.read('text.txt')
# text.gsub!(/\n/, ' ')

def count_characters(word)
  word.split('').size
end

def find_the_longest_word_and_its_length(text)
  longest_word = ''
  words = text.split
  words.each do |word|
    word = word[0...-1] if word.end_with?(".", "?", "!")
    number_of_character = count_characters(word)
    if number_of_character > count_characters(longest_word)
      longest_word = word.strip
    end
  end  
  number_of_character = count_characters(longest_word)
  return longest_word, number_of_character
end

longest_word, number_of_character = find_the_longest_word_and_its_length(text)

puts "The longest word is #{longest_word}."
puts "It is #{number_of_character} characters long."
