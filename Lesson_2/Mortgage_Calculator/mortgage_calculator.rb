require "tty-prompt"
prompt = TTY::Prompt.new

require 'yaml'
MESSAGES = YAML.load_file('messages.yml')

# Methods

def messages(message, language = LANGUAGE)
  MESSAGES[language][message]
end

def add_prompt(message)
  "=> #{message}"
end

def prompt(message)
  puts add_prompt(message)
end

def language_to_yes_no
  case LANGUAGE
  when "English"
    ["Yes", "No"]
  when "繁體中文"
    ["是", "否"]
  end
end

def yes_no_to_code(yes_no)
  language_to_yes_no.index(yes_no)
end

def valid_number?(number)
  !!(number =~ /^\+?\d*\.?\d*$/ and number != '.')
end

def valid_non_negative_integer?(number)
  !!(number =~ /^\+?\d+$/)
end

def get_name
  loop do
    name = gets.chomp
    break name if !name.empty?
    prompt messages('not_valid_name', language)
  end
end

def get_loan_amount
  loop do
    prompt messages('loan_amount')
    loan_amount = gets.chomp
    break loan_amount.to_f if valid_number?(loan_amount) || loan_amount.empty?
    prompt messages('not_valid_number')
  end
end

def get_annual_percentage_rate
  loop do
    prompt messages('annual_percentage_rate')
    prompt messages('apr_example')
    annual_percentage_rate = gets.chomp
    if valid_number?(annual_percentage_rate) || annual_percentage_rate.empty?
      break annual_percentage_rate.to_f
    end
    prompt messages('not_valid_number')
  end
end

def get_loan_duration_year
  loop do
    prompt messages('loan_duration_year')
    loan_duration_year = gets.chomp
    if valid_non_negative_integer?(loan_duration_year) ||
       loan_duration_year.empty?
      break loan_duration_year.to_i
    end
    prompt messages('not_non_negative_integer')
  end
end

def get_loan_duration_month
  loop do
    prompt messages('loan_duration_month')
    loan_duration_month = gets.chomp
    if valid_non_negative_integer?(loan_duration_month) ||
       loan_duration_month.empty?
      break loan_duration_month.to_i
    end
    prompt messages('not_non_negative_integer')
  end
end

def get_loan_duration
  loop do
    loan_duration_year = get_loan_duration_year
    loan_duration_month = get_loan_duration_month
    loan_duration = loan_duration_year * MONTHS_PER_YEAR + loan_duration_month
    break loan_duration if loan_duration > 0
    prompt messages('not_valid_loan_duration')
  end
end

def calculating
  0.upto(4) do |i|
    print "\r#{messages('calculating')}#{'.' * i}"
    $stdout.flush
    sleep 0.4
  end
  print "\n"
end

# Constants

LANGUAGES_TO_CHOOSE = ["English", "繁體中文"]
RATE_TO_PERCENT = 0.01
MONTHS_PER_YEAR = 12

# Main Program

system 'clear'

LANGUAGE = prompt.select(add_prompt(messages('choose_language', 'English')),
                         LANGUAGES_TO_CHOOSE,
                         cycle: true)

prompt messages('welcome')

name = get_name

prompt format(messages('greeting'), name: name)

loop do # Main Loop
  loan_amount = get_loan_amount
  annual_percentage_rate = get_annual_percentage_rate
  loan_duration = get_loan_duration
  monthly_interest_rate = annual_percentage_rate *
                          RATE_TO_PERCENT / MONTHS_PER_YEAR

  calculating

  if monthly_interest_rate == 0
    monthly_payment = loan_amount / loan_duration
  else
    monthly_payment = loan_amount * monthly_interest_rate / (
                      1 - (1 +
                      monthly_interest_rate)**(-loan_duration)
                    )
  end

  system 'clear'

  prompt format(messages('show_monthly_payment'),
                monthly_payment: format("$%.2f", monthly_payment))

  sleep 1

  calculate_again = prompt.select(
    add_prompt(messages('calculate_again?')),
    language_to_yes_no,
    cycle: true
  )
  break unless yes_no_to_code(calculate_again) == 0
end

prompt messages('thank_you')
