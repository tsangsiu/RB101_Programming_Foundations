=begin

# Problem
- Given a text file, return the longest sentence and its number of word
- Any sequence of characters that are not spaces or sentence-ending character ('.', '!', '?') is treated a word

# Algorithm
- Initialize an empty Array `n_word` to store the number of word of each sentence
- Given a text, split it at '.', '!', or '?', and save the result to `sentences`
- Iterate through each sentence,
  - Split it at space
  - Count the number of words
  - Put the number of words in `n_word` at the corresponding position
- Find the maximum number in `n_word`
- Return the corresponding sentence
- Return the number of word

=end

# Code
def longest_sentence(text)
  n_word = []
  sentences = text.split(/[.!?]/)
  sentences.each_with_index do |sentence, index|
    n_word[index] = sentence.split.size
  end

  max_words = n_word.max
  longest_sentence = sentences.select { |sentence| sentence.split.length == max_words }[0].strip
  
  return longest_sentence, max_words
end

text = "Four score and seven years ago our fathers brought forth
on this continent a new nation, conceived in liberty, and
dedicated to the proposition that all men are created
equal.

Now we are engaged in a great civil war, testing whether
that nation, or any nation so conceived and so dedicated,
can long endure. We are met on a great battlefield of that
war. We have come to dedicate a portion of that field, as
a final resting place for those who here gave their lives
that that nation might live. It is altogether fitting and
proper that we should do this.

But, in a larger sense, we can not dedicate, we can not
consecrate, we can not hallow this ground. The brave
men, living and dead, who struggled here, have
consecrated it, far above our poor power to add or
detract. The world will little note, nor long remember
what we say here, but it can never forget what they
did here. It is for us the living, rather, to be dedicated
here to the unfinished work which they who fought
here have thus far so nobly advanced. It is rather for
us to be here dedicated to the great task remaining
before us -- that from these honored dead we take
increased devotion to that cause for which they gave
the last full measure of devotion -- that we here highly
resolve that these dead shall not have died in vain
-- that this nation, under God, shall have a new birth
of freedom -- and that government of the people, by
the people, for the people, shall not perish from the
earth."
p longest_sentence(text)

text = File.read('01_text.txt')
p longest_sentence(text)

=begin

# Further Exploration

# 1.
# Problem
# - Write a method that keeps the period printed (ending punctuation) at the end of each sentence

# Brainstorm
- Search the first index position of '.', '!' or '?'
- Slice the text from 0 to that position + 1, and save it to sentence

# Algorithm
- Initialize an empty Array `n_word` to store the number of word of each sentence
- Initialize an empty Array `sentences` to store the sentences
- While there is '.', '!' or '?' in `text`
  - Find the first index position of '.', '!' or '?'
  - Slice the text from 0 to that position + 1, and append it to `sentences`
  - Assign the remaining part of the String back to `text`
- Find the longest sentence in `sentences`
- Find the number of words
- Return both the longest sentence and its number of words

=end

# Code
def longest_sentence(text)
  n_word = []
  sentences = []
  while text.index(/[.!?]/)
    pos = text.index(/[.!?]/)
    sentences << text[0..pos]
    text = text[(pos + 1)..]
  end
  
  longest_sentence = sentences.max_by { |sentence| sentence.split.size }.strip
  max_words = longest_sentence.split.size

  return longest_sentence, max_words
end
p longest_sentence(text)

=begin

# Further Exploration

# 2.
# Problem
# - Find the longest paragrpah or longest word

# Brainstorm
- What defines a paragraph?
  - Maybe "\n\n"?
- For words, we have to consider those with an ending punctuation
  - For example, "Hello?" should have a length of 5

# Algorithm
- To find the longest paragraph:
  - Split the text at "\n\n", save the result to `paragraphs`
  - Find the longest paragraph in `paragraphs`
  - Find its number of words
  - Return the longest paragraph and its number of words

- To find the longest word:
  - Split the text at empty space, save the result to `words`
  - Find the longest word in `words`, ignoring non-alphabets
  - Find its number of characters
  - Return the longest word, and its number of characters 

=end

def longest_paragraph(text)
  paragraphs = text.split("\n\n")
  longest_paragraph = paragraphs.max_by { |paragraph| paragraph.split.size}
  max_words = longest_paragraph.split.size
  return longest_paragraph, max_words
end
p longest_paragraph(text)

def longest_word(text)
  words = text.split
  longest_word = words.max_by { |word| word.count("A-Za-z") }
  max_chars = longest_word.length
  return longest_word, max_chars
end
p longest_word(text)
