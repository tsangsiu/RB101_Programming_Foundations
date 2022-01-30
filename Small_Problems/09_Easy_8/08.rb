def double_consonants(string)
  output = ''
  string.split('').each do |letter|
    output << letter
    output << letter if letter =~ /[a-z]/i && letter =~ /[^aeiou]/i
  end
  output
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
