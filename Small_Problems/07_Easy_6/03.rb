def find_fibonacci_index_by_length(number_of_digit)
  fibonacci = [0, 1, 1]
  while fibonacci[-1].to_s.length < number_of_digit
    fibonacci << fibonacci[-2] + fibonacci[-1]
  end
  fibonacci.length - 1
end

puts find_fibonacci_index_by_length(2)
puts find_fibonacci_index_by_length(3)
puts find_fibonacci_index_by_length(10)
puts find_fibonacci_index_by_length(100)
puts find_fibonacci_index_by_length(1000)
puts find_fibonacci_index_by_length(10000)
