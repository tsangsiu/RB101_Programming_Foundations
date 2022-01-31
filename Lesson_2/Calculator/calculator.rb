# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

require "tty-prompt"
prompt = TTY::Prompt.new

require 'yaml'
MESSAGES = YAML.load_file('messages.yml')

def messages(message, language = 'English')
  MESSAGES[language][message]
end

def add_prompt(message)
  "=> #{message}"
end

def prompt(message)
  puts add_prompt(message)
end

def valid_number?(num)
  !!(num =~ /^(\+|-)?\d*\.?\d*$/ and num != '.')
end

def languages_to_choose
  ["English", "繁體中文"]
end

def language_to_operation(language = "English")
  case language
  when "English"
    ["Addition", "Subtraction", "Multiplication", "Division"]
  when "繁體中文"
    ["加法", "減法", "乘法", "除法"]
  end
end

def operation_to_code(operation, language = "English")
  language_to_operation(language).index(operation)
end

def language_to_yes_no(language = "English")
  case language
  when "English"
    ["Yes", "No"]
  when "繁體中文"
    ["是", "否"]
  end
end

def yes_no_to_code(yes_no, language = "English")
  language_to_yes_no(language).index(yes_no)
end

def operation_to_message(operation, language = "English")
  message = case language
            when "English"
              case operation
              when 'Addition'       then 'Adding'
              when 'Subtraction'    then 'Subtracting'
              when 'Multiplication' then 'Multiplying'
              when 'Division'       then 'Dividing'
              end
            when "繁體中文"
              "相#{operation[0]}"
            end
  message
end

# main program

language = prompt.select(add_prompt(messages('choose_language')),
                         languages_to_choose,
                         cycle: true)

prompt messages('welcome', language)

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt messages('valid_name', language)
  else
    break
  end
end

prompt format(messages('greeting', language), name: name)

loop do # main loop
  number1 = ''
  loop do
    prompt messages('first_number', language)
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt messages('not_valid_number', language)
    end
  end

  number2 = ''
  loop do
    prompt messages('second_number', language)
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt messages('not_valid_number', language)
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

  operation = prompt.select(add_prompt(messages('select_operation', language)),
                            language_to_operation(language),
                            cycle: true)

  0.upto(4) do |i|
    print "#{format(messages('calculating', language), operation_to_message: operation_to_message(operation, language))}#{'.' * i}"
    $stdout.flush
    sleep 0.4
  end
  print "\n"

  result = case operation_to_code(operation, language)
           when 0 then number1.to_f + number2.to_f
           when 1 then number1.to_f - number2.to_f
           when 2 then number1.to_f * number2.to_f
           when 3 then number1.to_f / number2.to_f
           end

  prompt format(messages('show_result', language), result: result)

  answer = prompt.select(add_prompt(messages('calculate_again?', language)),
                         language_to_yes_no(language),
                         cycle: true)
  break unless yes_no_to_code(answer, language) == 0
end

prompt messages('thank_you', language)
