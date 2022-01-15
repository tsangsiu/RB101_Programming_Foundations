for number in 1..99
  puts number if number.odd?
end

# Further Exploration
1.upto(99) do |number|
  puts number if number.odd?
end

numbers = (1..99).to_a.select { |number| number.odd? }
numbers.each { |number| puts number }
