def multiply(numbers, multiplier)
  numbers_to_return = []
  counter = 0

  loop do
    current_number = numbers[counter]
    numbers_to_return << current_number * multiplier
    counter += 1
    break if counter == numbers.size
  end

  numbers_to_return
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3)
