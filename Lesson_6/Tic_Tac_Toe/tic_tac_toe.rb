require 'yaml'
MESSAGES = YAML.load_file('messages.yml')

# Constants

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals
PLAYER = 'Player'
COMPUTER = 'Computer'
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINS_NEEDED = 1
PAUSE_TIME = 0.8

# Methods

def prompt(msg)
  puts "=> #{msg}"
end

def display_welcome_msg
  prompt MESSAGES['welcome']
  sleep PAUSE_TIME
end

def display_rules
  loop do
    prompt MESSAGES['display_rules']
    display_rules = gets.chomp
    if display_rules == ''
      prompt format(MESSAGES['rules'], wins_needed: WINS_NEEDED)
      sleep PAUSE_TIME
      break
    elsif display_rules.downcase == 'q'
      break
    end
    prompt MESSAGES['not_valid_choice']
    sleep PAUSE_TIME
  end
end

def reset_scores
  { player: 0, computer: 0 }
end

def ask_current_player
  current_player = ''
  loop do
    prompt MESSAGES['get_current_player']
    current_player = gets.chomp
    current_player = case current_player.downcase
                     when ''              then PLAYER
                     when 'computer', 'c' then COMPUTER
                     when 'random', 'r'   then [PLAYER, COMPUTER].sample
                     end
    return current_player if current_player
    prompt MESSAGES['not_valid_choice']
    sleep PAUSE_TIME
  end
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

# rubocop: disable Metrics/AbcSize
def display_board(board)
  system 'clear'
  puts "You're '#{PLAYER_MARKER}'. Computer is '#{COMPUTER_MARKER}'."
  puts ""
  puts "     |     |"
  puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}"
  puts "     |     |"
  puts ""
end
# rubocop: enable Metrics/AbcSize

def display_winner(board)
  prompt format(
    MESSAGES['display_winner'],
    winner: detect_winner(board) == PLAYER ? 'You' : detect_winner(board)
  )
end

def display_scores(scores)
  prompt format(
    MESSAGES['display_scores'],
    player_score: scores[:player], computer_score: scores[:computer]
  )
end

def empty_squares(board)
  board.keys.select { |num| board[num] == INITIAL_MARKER }
end

def player_places_piece!(board)
  square = ''
  loop do
    prompt format(
      MESSAGES['choose_square'], empty_squares: joinor(empty_squares(board))
    )
    square = gets.chomp.to_i
    break if empty_squares(board).include?(square)
    prompt MESSAGES["not_valid_choice"]
  end
  board[square] = PLAYER_MARKER
end

def find_at_risk_square(board, winning_line, marker)
  if board.values_at(*winning_line).count(marker) == 2
    board.select do |sq, mark|
      winning_line.include?(sq) && mark == INITIAL_MARKER
    end.keys.first
  end
end

def check_each_winning_line(board, marker)
  WINNING_LINES.each do |winning_line|
    square = find_at_risk_square(board, winning_line, marker)
    return square if square
  end
  nil
end

def computer_places_piece!(board)
  # offense
  square = check_each_winning_line(board, COMPUTER_MARKER)

  # defense
  if square.nil?
    square = check_each_winning_line(board, PLAYER_MARKER)
  end

  if square.nil?
    square = empty_squares(board).include?(5) ? 5 : empty_squares(board).sample
  end

  board[square] = COMPUTER_MARKER
end

def place_piece!(board, current_player)
  case current_player
  when PLAYER   then player_places_piece!(board)
  when COMPUTER then computer_places_piece!(board)
  end
end

def alternate_player(current_player)
  current_player == PLAYER ? COMPUTER : PLAYER
end

def joinor(array, delimiter = ', ', connector = 'or')
  if array.size <= 2
    array.join(" #{connector} ")
  elsif array.size > 2
    array[0...-1].join(delimiter) + "#{delimiter}#{connector} #{array[-1]}"
  end
end

def board_full?(board)
  empty_squares(board).empty?
end

def someone_won?(board)
  !!detect_winner(board)
end

def detect_winner(board)
  WINNING_LINES.each do |line|
    if board.values_at(*line).all? { |marker| marker == PLAYER_MARKER }
      return PLAYER
    elsif board.values_at(*line).all? { |marker| marker == COMPUTER_MARKER }
      return COMPUTER
    end
  end
  nil
end

def add_score(board, scores)
  winner = detect_winner(board)
  case winner
  when PLAYER   then scores[:player] += 1
  when COMPUTER then scores[:computer] += 1
  end
end

def start_new_round
  prompt MESSAGES['start_new_round']
  gets.chomp
end

def play_again?
  prompt MESSAGES['play_again']
  play_again = gets.chomp
  play_again.downcase != 'q'
end

# Main Program

display_welcome_msg
display_rules

loop do
  scores = reset_scores
  current_player = ask_current_player

  loop do
    board = initialize_board

    loop do
      display_board(board)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)
    if someone_won?(board)
      display_winner(board)
      add_score(board, scores)
    else
      prompt MESSAGES['tie']
    end
    display_scores(scores)

    scores.values.include?(WINS_NEEDED) ? break : start_new_round
  end

  break if !play_again?
end

prompt MESSAGES['goodbye']
