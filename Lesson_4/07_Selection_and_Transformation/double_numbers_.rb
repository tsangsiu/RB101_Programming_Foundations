my_numbers = [1, 4, 3, 7, 2, 6]

def double_numbers!(number_array)
  counter = 0

  loop do
    current_number = number_array[counter]
    doubled_number = current_number * 2
    number_array[counter] = doubled_number
    counter += 1
    break if counter == number_array.size
  end

  number_array
end

p my_numbers
p my_numbers.object_id
double_numbers!(my_numbers)
p my_numbers
p my_numbers.object_id
