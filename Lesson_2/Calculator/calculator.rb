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

def valid_number?(num)
  num.to_i != 0
end

def operation_to_message(operation)
  case operation
  when 'Addition'       then 'Adding'
  when 'Subtraction'    then 'Subtracting'
  when 'Multiplication' then 'Multiplying'
  when 'Division'       then 'Dividing'
  end
end

prompt("Welcome to Calculator! Enter you name:")

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt "Make sure to use a valid name."
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  number1 = ''
  loop do
    prompt("What's the first number?")
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt("Hmm... that doesn't look like a valid number.")
    end
  end

  number2 = ''
  loop do
    prompt("What's the second number?")
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt("Hmm... that doesn't look like a valid number.")
    end
  end

  # # multi-line prompt message
  # operation_prompt = <<-MSG
  #   What operation would you like to perform?
  #   1. Addition
  #   2. Subtraction
  #   3. Multiplication
  #   4. Division
  # MSG

  operation = prompt.select(add_prompt("What operation would you like to perform?"),
                            %w(Addition Subtraction Multiplication Division),
                            cycle: true)

  prompt "#{operation_to_message(operation)} the two numbers..."

  result = case operation
           when 'Addition' then number1.to_i + number2.to_i
           when 'Subtraction' then number1.to_i - number2.to_i
           when 'Multiplication' then number1.to_i * number2.to_i
           when 'Division' then number1.to_f / number2.to_f
           end

  prompt("The result is #{result}.")

  answer = prompt.select(add_prompt("Do you want to perform another calculation?"),
                         %w(Yes No),
                         cycle: true)
  break unless answer == 'Yes'
end

prompt "Thank you for using Calculator! Good bye!"
