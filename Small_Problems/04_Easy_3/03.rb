print "Please write word or multiple words: "
words = gets.chomp

n_characters = 0
words.split('').each do |word|
  n_characters += 1 if word != ' '
end

puts "There are #{n_characters} characters in \"#{words}\"."
