# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

require "tty-prompt"
prompt = TTY::Prompt.new

def add_prompt(message)
  "=> #{message}"
end

def prompt(message)
  puts add_prompt(message)
end

prompt("Welcome to Calculator!")

prompt("What's the first number?")
number1 = gets.chomp

prompt("What's the second number?")
number2 = gets.chomp

operation = prompt.select(add_prompt("What operation would you like to perform?"),
                          %w(Addition Subtraction Multiplication Division))

if operation == 'Addition'
  result = number1.to_i + number2.to_i
elsif operation == 'Subtraction'
  result = number1.to_i - number2.to_i
elsif operation == 'Multiplication'
  result = number1.to_i * number2.to_i
elsif operation == 'Division'
  result = number1.to_f / number2.to_f
end

prompt("The result is #{result}.")
