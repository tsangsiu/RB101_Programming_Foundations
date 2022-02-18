def double_odd_indices(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    current_number = numbers[counter]
    if counter.odd?
      doubled_numbers << current_number * 2
    else
      doubled_numbers << current_number
    end
    counter += 1
    break if counter == numbers.size
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_odd_indices(my_numbers)
