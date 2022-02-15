=begin

Input:
  - String, text file

Outputs:
  - String, the longest sentence
  - Integer, the number of words in the longest sentence

Problem:
  - Print the longest sentence in the file based on the the number of words
  - Sentence may end with '.', '!', '?'

Question:
  - What defines a word?
    - Any sequence of characters
    - Words are delimited by spaces
  - Do the output sentence need to include the ending punctuation?
  - How do the ouput look like?

Examples:
  - 'How are you?' is a sentence and contains 3 words
  - 'Now we are engaged in a great civil war, testing whether
    that nation, or any nation so conceived and so dedicated,
    can long endure.' is also a sentence and contains 24 words

Data Structures:
  - Input: String
  - During the algorithm, nested array,
    where an inner array represents a sentence

Algorithm:
  - Read the text file to Ruby and stored as String.
  - Initalise an empty string, say `longest_sentence` to store the longest
    sentence.
  - Break the text into sentences at '.', '!' and '?'
  - For each sentence,
    - count the number of word
    - If the sentence is longer than the stored sentence,
      - store that sentence in `longest_sentence`
  - Count the number of word in `longest_sentence`
  - return `longest_sentence` and the number of words

=end

text = File.read('text.txt')
# text.gsub!(/\n/, ' ')

def count_words(sentence)
  sentence.split.size
end

def find_the_longest_sentence_and_its_length(text)
  longest_sentence = ''
  sentences = text.split(/\.|!|\?/)
  sentences.each do |sentence|
    number_of_word = count_words(sentence)
    if number_of_word > count_words(longest_sentence)
      longest_sentence = sentence.strip
    end
  end  
  number_of_word = count_words(longest_sentence)
  return longest_sentence, number_of_word
end

longest_sentence, number_of_word = find_the_longest_sentence_and_its_length(text)

puts longest_sentence
puts "The longest sentence is #{number_of_word} words long."
