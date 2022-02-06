require "tty-prompt"
prompt = TTY::Prompt.new

# Methods

def add_prompt(message)
  "=> #{message}"
end

def prompt(message)
  puts add_prompt(message)
end

def win?(player_choice, computer_choice)
  CHOICES_TO_WIN[player_choice].include?(computer_choice)
end

def add_score(scores, player_choice, computer_choice)
  if win?(player_choice, computer_choice)
    scores[:player] += 1
  elsif win?(computer_choice, player_choice)
    scores[:computer] += 1
  end
end

def display_round_result(player_choice, computer_choice)
  if win?(player_choice, computer_choice)
    prompt("You win this round!")
  elsif win?(computer_choice, player_choice)
    prompt("Computer wins this round!")
  else
    prompt("It's a tie!")
  end
end

def display_grand_result(scores)
  if scores[:player] == WINS_NEEDED
    message = "You win the game! Congulations!"
    prompt("*" * message.length)
    prompt(message)
    prompt("*" * message.length)
  elsif scores[:computer] == WINS_NEEDED
    message = "Computer wins the game!"
    prompt("*" * message.length)
    prompt(message)
    prompt("*" * message.length)
  end
end

# Constants

YES_NO = %w(Yes No)
WINS_NEEDED = 3
CHOICES = %w(Rock Paper Scissors Spock Lizard)
CHOICES_TO_WIN = {
  'Scissors' => %w(Paper Lizard),
  'Paper' => %w(Rock Spock),
  'Rock' => %w(Lizard Scissors),
  'Lizard' => %w(Spock Paper),
  'Spock' => %w(Scissors Rock)
}

# Main Program

loop do
  system 'clear'

  scores = { player: 0, computer: 0 }

  loop do
    player_choice = prompt.select(add_prompt('Choose one:'),
                                  CHOICES,
                                  cycle: true)
    computer_choice = CHOICES.sample

    system 'clear'

    prompt("You chose #{player_choice.downcase}, " \
           "and computer chose #{computer_choice.downcase}.")
    display_round_result(player_choice, computer_choice)

    add_score(scores, player_choice, computer_choice)
    prompt("Your Score: #{scores[:player]}; " \
           "Computer Score: #{scores[:computer]}")

    if scores.values.include?(WINS_NEEDED)
      display_grand_result(scores)
      break
    end
  end

  play_again = prompt.select(add_prompt('Do you want to play again?'),
                             YES_NO,
                             cycle: true)
  break if play_again == 'No'
end

prompt('Thank you for playing. Good bye!')
