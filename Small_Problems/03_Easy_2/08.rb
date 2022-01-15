puts "Please enter an integer greater than 0:"
number = gets.chomp.to_i

puts "Enter 's' to compute the sum, 'p' to compute the product."
operation = gets.chomp

if operation.downcase == 's'
  sum = (1..number).to_a.inject(:+)
  puts "The sum of the integers between 1 and #{number} is #{sum}."
elsif operation.downcase == 'p'
  product = (1..number).to_a.inject(:*)
  puts "The product of the integers between 1 and #{number} is #{product}."
end
