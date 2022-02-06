# the user makes a choice
# the computer makes a choice
# the winner is displayed

require "tty-prompt"
prompt = TTY::Prompt.new

# Methods

def add_prompt(message)
  "=> #{message}"
end

def prompt(message)
  puts add_prompt(message)
end

# def first_player_win?(first_player, second_player)
#   (first_player == 'Rock' && second_player == 'Scissors') ||
#     (first_player == 'Paper' && second_player == 'Rock') ||
#     (first_player == 'Scissors' && second_player == 'Paper')
# end

def first_player_win?(first_player, second_player)
  (first_player == 'Scissors' && second_player == 'Paper') ||
    (first_player == 'Paper' && second_player == 'Rock') ||
    (first_player == 'Rock' && second_player == 'Lizard') ||
    (first_player == 'Lizard' && second_player == 'Spock') ||
    (first_player == 'Spock' && second_player == 'Scissors') ||
    (first_player == 'Scissors' && second_player == 'Lizard') ||
    (first_player == 'Lizard' && second_player == 'Paper') ||
    (first_player == 'Paper' && second_player == 'Spock') ||
    (first_player == 'Spock' && second_player == 'Rock') ||
    (first_player == 'Rock' && second_player == 'Scissors')
end

def display_result(player_choice, computer_choice)
  if first_player_win?(player_choice, computer_choice)
    prompt("You won!")
  elsif first_player_win?(computer_choice, player_choice)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

# Constants

CHOICES = %w(Rock Paper Scissors Spock Lizard)
YES_NO = %w(Yes No)

# Main Program

system 'clear'

loop do
  player_choice = prompt.select(add_prompt('Choose one:'), CHOICES, cycle: true)
  computer_choice = CHOICES.sample

  prompt("You chose #{player_choice.downcase}, " \
         "and computer chose #{computer_choice.downcase}.")
  display_result(player_choice, computer_choice)

  play_again = prompt.select(add_prompt('Do you want to play again?'),
                             YES_NO,
                             cycle: true)
  break if play_again == 'No'
end

prompt('Thank you for playing. Good bye!')
