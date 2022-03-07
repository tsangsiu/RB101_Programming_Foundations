require 'pry'

# Constants

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals
PLAYER = 'Player'
COMPUTER = 'Computer'
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINS_NEEDED = 5

# Methods

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop: disable Metrics/AbcSize
def display_board(board)
  # system 'clear'
  puts "You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
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

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(board)
  board.keys.select { |num| board[num] == INITIAL_MARKER }
end

def joinor(array, delimiter = ', ', connector = 'or')
  if array.size <= 2
    array.join(" #{connector} ")
  elsif array.size > 2
    array[0...-1].join(delimiter) + "#{delimiter}#{connector} #{array[-1]}"
  end
end

def player_places_piece!(board)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(board))}):"
    square = gets.chomp.to_i
    break if empty_squares(board).include?(square)
    prompt "Sorry, that's not a valid choice."
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

def computer_places_piece!(board)
  square = nil

  # offense
  WINNING_LINES.each do |winning_line|
    square = find_at_risk_square(board, winning_line, COMPUTER_MARKER)
    break if square
  end

  # defense
  if square.nil?
    WINNING_LINES.each do |winning_line|
      square = find_at_risk_square(board, winning_line, PLAYER_MARKER)
      break if square
    end
  end

  if square.nil?
    if empty_squares(board).include?(5)
      square = 5
    else
      square = empty_squares(board).sample
    end
  end

  board[square] = COMPUTER_MARKER
end

def place_piece!(board, current_player)
  if current_player == PLAYER
    player_places_piece!(board)
  elsif current_player == COMPUTER
    computer_places_piece!(board)
  end
end

def alternate_player(current_player)
  current_player == PLAYER ? COMPUTER : PLAYER
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

# Main Program

loop do
  scores = { player: 0, computer: 0 }


  current_player = ''
  loop do
    prompt "Which player would you like to go first?"
    prompt "Enter 'user' (or 'u') to go first, " \
           "'computer' (or 'c') to let computer go first, " \
           "or random (or 'r') to let computer decide."
    current_player = gets.chomp

    current_player = if ['user', 'u'].include?(current_player)
      PLAYER
    elsif ['computer', 'c'].include?(current_player)
      COMPUTER
    elsif ['random', 'r'].include?(current_player)
      [PLAYER, COMPUTER].sample
    else
      ''
    end

    break if current_player != ''

    prompt "Sorry, that's not a valid choice."    
  end

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
      prompt "#{detect_winner(board)} won!"
      add_score(board, scores)
    else
      prompt "It's a tie!"
    end

    prompt "Your Score: #{scores[:player]}; " \
           "Computer Score: #{scores[:computer]}"

    break if scores.values.include?(WINS_NEEDED)
  end

  prompt "Play again? [Y/N]"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"
