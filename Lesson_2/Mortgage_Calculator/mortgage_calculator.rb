require "tty-prompt"
prompt = TTY::Prompt.new

require 'yaml'
MESSAGES = YAML.load_file('messages.yml')

# Methods

def messages(message, language = 'English')
  MESSAGES[language][message]
end

def add_prompt(message)
  "=> #{message}"
end

def prompt(message)
  puts add_prompt(message)
end

def languages_to_choose
  ["English", "繁體中文"]
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

def valid_number?(num)
  !!(num =~ /^\+?\d*\.?\d*$/ and num != '.')
end

# Constants

RATE_TO_PERCENT = 0.01
MONTHS_PER_YEAR = 12

# Main Program

system 'clear'

language = prompt.select(add_prompt(messages('choose_language')),
                         languages_to_choose,
                         cycle: true)

prompt messages('welcome', language)

name = ''
loop do
  name = gets.chomp
  name.empty? ? (prompt messages('not_a_valid_name', language)) : break
end

prompt format(messages('greeting', language), name: name)

loop do # Main Loop
  loan_amount = ''
  loop do
    prompt messages('loan_amount', language)
    loan_amount = gets.chomp
    break if valid_number?(loan_amount)
    prompt messages('not_a_valid_number', language)
  end
  loan_amount = loan_amount.to_f

  annual_percentage_rate = ''
  loop do
    prompt messages('annual_percentage_rate', language)
    annual_percentage_rate = gets.chomp
    break if valid_number?(annual_percentage_rate)
    prompt messages('not_a_valid_number', language)
  end
  annual_percentage_rate = annual_percentage_rate.to_f

  loan_duration = ''
  loop do
    prompt messages('loan_duration', language)
    loan_duration = gets.chomp
    break if valid_number?(loan_duration)
    prompt messages('not_a_valid_number', language)
  end
  loan_duration = loan_duration.to_f

  0.upto(4) do |i|
    print "\r#{messages('calculating', language)}#{'.' * i}"
    $stdout.flush
    sleep 0.4
  end
  print "\n"

  monthly_interest_rate = annual_percentage_rate *
                          RATE_TO_PERCENT / MONTHS_PER_YEAR

  monthly_payment = loan_amount * monthly_interest_rate / (
                    1 - (1 +
                    monthly_interest_rate)**(-loan_duration * MONTHS_PER_YEAR)
                  )

  system 'clear'

  prompt format(messages('show_monthly_payment', language),
                monthly_payment: format("$%.2f", monthly_payment))

  sleep 1

  calculate_again = prompt.select(
    add_prompt(messages('calculate_again?', language)),
    language_to_yes_no(language),
    cycle: true
  )

  break unless yes_no_to_code(calculate_again, language) == 0
end

prompt messages('thank_you', language)
