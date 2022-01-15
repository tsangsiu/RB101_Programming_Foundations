print "What is your name? "
name = gets.chomp

if name.end_with?('!')
  puts "HELLO #{name[0...-1].upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end

# Further Exploration
print "What is your name? "
name = gets.chomp!

if name.end_with?('!')
  name.chop!
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Helo #{name}."
end
