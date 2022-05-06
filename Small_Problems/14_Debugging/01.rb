def decrease(counter)
  counter -= 1
end

counter = 10

10.times do
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH!'

# Further Exploration

10.downto(1) { |counter| puts counter }
puts 'LAUNCH!'
