require "tty-prompt"
prompt = TTY::Prompt.new

# Methods

def add_prompt(message)
  "=> #{message}"
end

def prompt(message)
  puts add_prompt(message)
end

def first_player_win?(first_player, second_player)
  CHOICES_TO_WIN[first_player].include?(second_player)
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

YES_NO = %w(Yes No)
CHOICES = %w(Rock Paper Scissors Spock Lizard)
CHOICES_TO_WIN = {
  'Scissors' => %w(Paper Lizard),
  'Paper' => %w(Rock Spock),
  'Rock' => %w(Lizard Scissors),
  'Lizard' => %w(Spock Paper),
  'Spock' => %w(Scissors Rock)
}

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
