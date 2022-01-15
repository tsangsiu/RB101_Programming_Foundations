age = rand(20..200)
puts "Teddy is #{age} years old!"

# Further Exploration
puts "What is your name?"
name = gets.chomp
name = name == '' ? "Teddy" : name
age = rand(20..200)
puts "#{name} is #{age} years old!"
