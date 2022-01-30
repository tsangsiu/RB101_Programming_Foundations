# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

require "tty-prompt"
prompt = TTY::Prompt.new

require 'yaml'
MESSAGES = YAML.load_file('messages.yml')

def add_prompt(message)
  "=> #{message}"
end

def prompt(message)
  puts add_prompt(message)
end

def valid_number?(num)
  !!(num =~ /^(\+|-)?\d*\.?\d*$/ and num != '.')
end

def operation_to_message(operation)
  message = case operation
            when 'Addition'       then 'Adding'
            when 'Subtraction'    then 'Subtracting'
            when 'Multiplication' then 'Multiplying'
            when 'Division'       then 'Dividing'
            end
  message
end

prompt MESSAGES['welcome']

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt MESSAGES['valid_name']
  else
    break
  end
end

prompt format(MESSAGES['greeting'], name: name)

loop do # main loop
  number1 = ''
  loop do
    prompt MESSAGES['first_number']
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt MESSAGES['not_valid_number']
    end
  end

  number2 = ''
  loop do
    prompt MESSAGES['second_number']
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt MESSAGES['not_valid_number']
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

  operation = prompt.select(add_prompt(MESSAGES['select_oepration']),
                            %w(Addition Subtraction Multiplication Division),
                            cycle: true)

  1.upto(5) do |i|
    print (format(MESSAGES['calculating'], operation_to_message: operation_to_message(operation)) + "#{'.' * i}")
    # print "\r#{add_prompt("#{operation_to_message(operation)} the two numbers")}#{'.' * i}"
    $stdout.flush
    sleep 0.4
  end
  print "\n"

  result = case operation
           when 'Addition' then number1.to_i + number2.to_i
           when 'Subtraction' then number1.to_i - number2.to_i
           when 'Multiplication' then number1.to_i * number2.to_i
           when 'Division' then number1.to_f / number2.to_f
           end

  prompt format(MESSAGES['show_result'], result: result)

  answer = prompt.select(add_prompt(MESSAGES['calculate_again?']),
                         %w(Yes No),
                         cycle: true)
  break unless answer == 'Yes'
end

prompt MESSAGES['thank_you']
