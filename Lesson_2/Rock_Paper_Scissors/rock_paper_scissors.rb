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

def display_result(player_choice, computer_choice)
  if (player_choice == 'Rock' && computer_choice == 'Scissors') ||
     (player_choice == 'Paper' && computer_choice == 'Rock') ||
     (player_choice == 'Scissors' && computer_choice == 'Paper')
    prompt("You won!")
  elsif (player_choice == 'Rock' && computer_choice == 'Paper') ||
        (player_choice == 'Paper' && computer_choice == 'Scissors') ||
        (player_choice == 'Scissors' && computer_choice == 'Rock')
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

# Constants

CHOICES = ['Rock', 'Paper', 'Scissors']
YES_NO = ['Yes', 'No']

# Main Program

system 'clear'

loop do
  player_choice = prompt.select(add_prompt('Choose one:'), CHOICES, cycle: true)
  computer_choice = CHOICES.sample

  prompt("You chose #{player_choice.downcase}, " + 
         "and computer chose #{computer_choice.downcase}.")
  display_result(player_choice, computer_choice)

  play_again = prompt.select(add_prompt('Do you want to play again?'),
                             YES_NO,
                             cycle: true)
  break if play_again == 'No'
end

prompt('Thank you for playing. Good bye!')
