require 'yaml'
MESSAGES = YAML.load_file('messages.yml')

# Constants

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]
PLAYER = 'You'
COMPUTER = 'Computer'
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINS_NEEDED = 2
BOARD_WIDTH = 50
IDENT = 4

# Methods

def prompt(msg)
  puts "=> #{msg}"
end

def add_ident(msg, ident = IDENT)
  "#{' ' * ident}#{msg}"
end

def display_welcome_msg
  puts '-' * BOARD_WIDTH
  puts ""
  puts add_ident(MESSAGES['welcome'])
  puts ""
  puts '-' * BOARD_WIDTH
  puts ""
end

def press_enter_to_continue
  prompt MESSAGES['press_enter_to_continue']
  gets.chomp
end

def display_rules
  loop do
    prompt MESSAGES['display_rules']
    display_rules = gets.chomp
    if ['help', 'h'].include?(display_rules.downcase)
      system 'clear'
      prompt format(
        MESSAGES['rules'],
        wins_needed: WINS_NEEDED, round: WINS_NEEDED > 1 ? 'rounds' : 'round'
      )
      press_enter_to_continue
    end
    break if ['help', 'h', ''].include?(display_rules.downcase)
    prompt MESSAGES['not_valid_choice']
  end
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
  end
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def display_round(round)
  puts add_ident(format(MESSAGES['round']['heading'], round: round))
end

def display_scores(scores)
  puts add_ident(format(MESSAGES['score']['heading']))
  puts add_ident(
    format(
      MESSAGES['score']['display'],
      player_score: scores[:player], computer_score: scores[:computer]
    )
  )
  puts add_ident(
    format(
      MESSAGES['wins_needed']['display'],
      wins_needed: WINS_NEEDED, round: WINS_NEEDED > 1 ? 'rounds' : 'round'
    )
  )
end

def display_legend
  puts add_ident(MESSAGES['legend']['heading'])
  puts add_ident(
    format(
      MESSAGES['legend']['display'],
      player_marker: PLAYER_MARKER, computer_marker: COMPUTER_MARKER
    )
  )
end

def display_status(round, scores)
  puts '-' * BOARD_WIDTH
  display_round(round)
  puts ""
  display_scores(scores)
  puts ""
  display_legend
  puts '-' * BOARD_WIDTH
end

# rubocop: disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
def display_board(board)
  puts ""
  puts "     |     |          " \
       "     |     |          "
  puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}       " \
       "  #{empty_squares(board).include?(1) ? 1 : ' '}  |" \
       "  #{empty_squares(board).include?(2) ? 2 : ' '}  |" \
       "  #{empty_squares(board).include?(3) ? 3 : ' '}"
  puts "     |     |          " \
       "     |     |          "
  puts "-----+-----+-----     " \
       "-----+-----+-----"
  puts "     |     |          " \
       "     |     |          "
  puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}       " \
       "  #{empty_squares(board).include?(4) ? 4 : ' '}  |" \
       "  #{empty_squares(board).include?(5) ? 5 : ' '}  |" \
       "  #{empty_squares(board).include?(6) ? 6 : ' '}"
  puts "     |     |          " \
       "     |     |          "
  puts "-----+-----+-----     " \
       "-----+-----+-----"
  puts "     |     |          " \
       "     |     |          "
  puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}       " \
       "  #{empty_squares(board).include?(7) ? 7 : ' '}  |" \
       "  #{empty_squares(board).include?(8) ? 8 : ' '}  |" \
       "  #{empty_squares(board).include?(9) ? 9 : ' '}"
  puts "     |     |          " \
       "     |     |          "
  puts ""
end
# rubocop: enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity

def joinor(array, delimiter = ', ', connector = 'or')
  if array.size <= 2
    array.join(" #{connector} ")
  elsif array.size > 2
    array[0...-1].join(delimiter) + "#{delimiter}#{connector} #{array[-1]}"
  end
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

def someone_won?(board)
  !!detect_winner(board)
end

def board_full?(board)
  empty_squares(board).empty?
end

def add_score(board, scores)
  winner = detect_winner(board)
  case winner
  when PLAYER   then scores[:player] += 1
  when COMPUTER then scores[:computer] += 1
  end
end

def display_round_winner(board, scores)
  puts '-' * BOARD_WIDTH
  puts ""
  puts add_ident(
    format(
      MESSAGES['display_round_winner'],
      winner: detect_winner(board)
    )
  )
  puts ""
  display_scores(scores)
  puts ""
  puts '-' * BOARD_WIDTH
end

def display_tie
  puts '-' * BOARD_WIDTH
  puts ""
  puts add_ident(MESSAGES['tie'])
  puts ""
  puts '-' * BOARD_WIDTH
end

def display_grand_winner(board)
  puts '*' * BOARD_WIDTH
  puts '*' * BOARD_WIDTH
  puts ""
  puts add_ident(
    format(
      MESSAGES['display_grand_winner'],
      winner: detect_winner(board),
      verb: detect_winner(board) == PLAYER ? 'are' : 'is'
    )
  )
  puts ""
  puts '*' * BOARD_WIDTH
  puts '*' * BOARD_WIDTH
end

def start_new_round
  prompt MESSAGES['start_new_round']
  gets.chomp
end

def play_again?
  loop do
    prompt MESSAGES['play_again']
    play_again = gets.chomp
    if play_again == ''
      return true
    elsif play_again.downcase == 'q'
      return false
    end
    prompt MESSAGES['not_valid_choice']
  end
end

def display_goodbye_msg
  puts '-' * BOARD_WIDTH
  puts ""
  puts add_ident(MESSAGES['goodbye'])
  puts ""
  puts '-' * BOARD_WIDTH
  puts ""
end

# Main Program

system 'clear'
display_welcome_msg
display_rules

# loop for each game
loop do
  round = 0
  scores = { player: 0, computer: 0 }
  system 'clear'
  current_player = ask_current_player

  # loop for each round
  loop do
    round += 1
    board = initialize_board

    # loop for each player's turn
    loop do
      system 'clear'
      display_status(round, scores)
      display_board(board)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    system 'clear'
    if someone_won?(board)
      add_score(board, scores)
      display_round_winner(board, scores)
    else
      display_tie
    end
    display_board(board)

    if scores.values.include?(WINS_NEEDED)
      system 'clear'
      display_grand_winner(board)
      display_board(board)
      break
    else
      start_new_round
    end
  end

  break if !play_again?
end

system 'clear'
display_goodbye_msg
