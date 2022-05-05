=begin

# Problem
- Given several blocks of 2 letters
- If a word contains 2 letters in the same block, return false, else return true
- Each block can only be used once
- Case-insensitive

# Examples
p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true

# Algorithm
- Make a copy of the blocks
- Given a word, iterate through each letter (considering uppercase letters only),
  - Look for the corresponding block containing the current letter
  - If the other letter in the block appears in the given word or there is no such block,
    - Return false
  - Else,
    - Delete the block
- Return true

=end

BLOCKS = [
  ['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'],
  ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'],
  ['V', 'I'], ['L', 'Y'], ['Z', 'M']
]

def block_word?(word)
  blocks = BLOCKS.dup
  word.each_char do |letter|
    block = blocks.select { |block| block.include?(letter.upcase) }.flatten
    if block.all? { |letter| word.upcase.split('').include?(letter) } || block.empty?
      return false
    else
      blocks.delete(block)
    end
  end
  true  
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
