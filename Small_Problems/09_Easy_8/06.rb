def fizzbuzz(starting_number, ending_number)
  output = []

  starting_number.upto(ending_number) do |num|
    if num % 3 == 0 && num % 5 == 0
      output << "FizzBuzz"
    elsif num % 3 == 0
      output << "Fizz"
    elsif num % 5 == 0
      output << "Buzz"
    else
      output << num
    end
  end

  puts output.join(', ')
end

fizzbuzz(1, 15)