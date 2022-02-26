=begin

Description:
Tic Tac Toe is a 2 player game played on a 3x3 board. Each player takes a turn
and marks a square on the board. First player to reach 3 squares in a row,
including diagonals, wins. If all 9 squares are marked and no player has 3
squares in a row, then the game is a tie.

Sequence:
1. Display the initial empty 3x3 board.
2. Ask the user to mark a square.
3. Computer marks a square.
4. Display the updated board state.
5. If winner, display winner
6. If board is full, display tie.
7. If neither winner nor board is full, go to #2
8. Play again?
9. If yes, go to 1
10. Good bye!

=end

require 'pry'

# Constants

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

# Methods

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(board)
  system 'clear'
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

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(board)
  board.keys.select { |num| board[num] == INITIAL_MARKER }
end

def player_places_piece!(board)
  square = ''
  loop do
    prompt "Choose a square (#{empty_squares(board).join(', ')}):"
    square = gets.chomp.to_i
    break if empty_squares(board).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  board[square] = PLAYER_MARKER
end

def computer_places_piece!(board)
  square = empty_squares(board).sample
  board[square] = COMPUTER_MARKER
end

def board_full?(board)
  empty_squares(board).empty?
end

def someone_won?(board)
  false
end

# Main Program

board = initialize_board
display_board(board)

loop do
  player_places_piece!(board)
  computer_places_piece!(board)
  puts board.inspect
  display_board(board)
  break if someone_won?(board) || board_full?(board)
end

display_board(board)
