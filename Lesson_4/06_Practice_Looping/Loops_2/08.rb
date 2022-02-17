number = 0

until number == 10
  number += 1
  next if number.odd?
  puts number
end

=begin

# Further Exploration

If next is not put after the incrementation of number, number will always be 0.
The loop will be an infinite loop because the until condition will never be
satisfied.

And, we want to put next before #puts, because we only want to output even 
numbers. To whether or not output the number, we want to  check the number 
first. If the number is odd, we don't output the number, we go to the next 
iteration.

=end
