def repeater(string)
  output = ''
  string.split('').each do |letter|
    output << letter << letter
  end
  output
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
