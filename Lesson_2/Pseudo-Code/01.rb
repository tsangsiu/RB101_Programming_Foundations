=begin

a method that returns the sum of two integers

- get the two numbers from user
- calculate the sum of the numbers
- print the result
- return the number

START
  GET number1
  GET number2
  SET sum = number1 + number2
  PRINT "The sum is " + sum
  RETURN sum
END

=end

def sum
  print 'What is the first integer? '
  integer1 = gets.chomp.to_i

  print 'What is the second integer? '
  integer2 = gets.chomp.to_i

  sum = integer1 + integer2
  puts "The sum is #{sum}."

  sum
end

sum
