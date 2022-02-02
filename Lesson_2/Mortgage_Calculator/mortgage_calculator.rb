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

def valid_number?(number)
  !!(number =~ /^\+?\d*\.?\d*$/ and number != '.')
end

def valid_non_negative_integer?(number)
  number =~ /^\+?\d+$/
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
    loan_duration_year = ''
    loop do
      prompt messages('loan_duration_year', language)
      loan_duration_year = gets.chomp
      break if valid_non_negative_integer?(loan_duration_year)
      prompt messages('not_non_negative_integer', language)
    end
    loan_duration_year = loan_duration_year.to_i

    loan_duration_month = ''
    loop do
      prompt messages('loan_duration_month', language)
      loan_duration_month = gets.chomp
      break if valid_non_negative_integer?(loan_duration_month)
      prompt messages('not_non_negative_integer', language)
    end
    loan_duration_month = loan_duration_month.to_i

    loan_duration = loan_duration_year * MONTHS_PER_YEAR + loan_duration_month
    break if loan_duration > 0
    prompt messages('not_valid_loan_duration', language)
  end

  0.upto(4) do |i|
    print "\r#{messages('calculating', language)}#{'.' * i}"
    $stdout.flush
    sleep 0.4
  end
  print "\n"

  monthly_interest_rate = annual_percentage_rate *
                          RATE_TO_PERCENT / MONTHS_PER_YEAR

  if monthly_interest_rate == 0
    monthly_payment = loan_amount / loan_duration
  else
    monthly_payment = loan_amount * monthly_interest_rate / (
                      1 - (1 +
                      monthly_interest_rate)**(-loan_duration)
                    )
  end

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
