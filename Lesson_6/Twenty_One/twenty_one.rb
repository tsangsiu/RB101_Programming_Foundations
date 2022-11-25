=begin
High-Level Flow:
1. Initialize deck
2. Deal cards to player and dealer
3. Player turn: hit or stay
  - repeat until bust or "stay"
4. If player bust, dealer wins.
5. Dealer turn: hit or stay
  - repeat until total >= 17
6. If dealer bust, player wins.
7. Compare cards and declare winner.
=end

require "yaml"
MESSAGES = YAML.load_file('messages.yml')

# Constants

ACE = 'A'
FACES = ['J', 'Q', 'K']
SUITS = ['Club', 'Diamond', 'Heart', 'Spade']
RANKS = [*('2'..'9').to_a, '10', *FACES, ACE]
WORD_TO_SUIT = { 'Club' => '♣', 'Diamond' => '♦',
                 'Heart' => '♥', 'Spade' => '♠' }
PROMPT = "=>"
SLEEP_TIME = 0.4

# Methods

def prompt(msg, loading = false, number_of_dots = 4)
  if loading
    0.upto(number_of_dots) do |i|
      print "\r#{PROMPT} #{msg}#{'.' * i}"
      $stdout.flush
      sleep SLEEP_TIME
    end
    print "\n"
  else
    puts "#{PROMPT} #{msg}"
  end
end

def press_enter_to_continue
  prompt "Press [enter] to continue."
  gets
end

def init_deck
  SUITS.product(RANKS).shuffle!
end

def init_deal_cards(deck, player_cards, dealer_cards)
  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end
end

def deal_cards(deck, cards)
  cards << deck.pop
end

def hit_or_stay
  loop do
    prompt "Press [enter] to hit, or enter 'stay' or 's' to stay."
    hit_or_stay = gets.chomp.strip
    break hit_or_stay if ["", "stay", "s"].include?(hit_or_stay.downcase)
    prompt "Sorry, that's not a valid choice."
  end
end

def total(cards)
  ranks = cards.map { |card| card.last }

  total = 0
  ranks.each do |rank|
    total += if rank == ACE
               11
             elsif FACES.include?(rank)
               10
             else
               rank.to_i
             end
  end
  ranks.count(ACE).times do
    total -= 10 if total > 21
  end

  total
end

def busted?(cards)
  total(cards) > 21
end

def cards_to_graphical(cards)
  cards.map { |card| "[#{WORD_TO_SUIT[card.first]} #{card.last}]" }
end

def dealer_cards_to_graphical(dealer_cards)
  dealer_cards.map.with_index do |card, index|
    if index == 0
      "[#{WORD_TO_SUIT[card.first]} #{card.last}]"
    else
      "[?]"
    end
  end
end

def join_and(array, delimiter = ', ', connector = 'and')
  if array.size <= 2
    array.join(" #{connector} ")
  elsif array.size > 2
    array[0...-1].join(delimiter) + " #{connector} #{array[-1]}"
  end
end

def msg_cards(player_cards, dealer_cards, reveal)
  msg_player_cards = "You have #{join_and(cards_to_graphical(player_cards))}."
  if reveal
    msg_dealer_cards = "Dealer has #{join_and(cards_to_graphical(dealer_cards))}."
  else
    msg_dealer_cards = "Dealer has #{join_and(dealer_cards_to_graphical(dealer_cards))}."
  end
  [msg_player_cards, msg_dealer_cards]
end

def display_cards(player_cards, dealer_cards, reveal)
  msg_cards = msg_cards(player_cards, dealer_cards, reveal)
  bannerise(msg_cards)
end

def winner(player_cards, dealer_cards)
  if busted?(player_cards)
    "Dealer won!"
  elsif busted?(dealer_cards)
    "You won!"
  elsif total(player_cards) > total(dealer_cards)
    "You won!"
  elsif total(dealer_cards) > total(player_cards)
    "Dealer won!"
  else
    "It's a tie!"
  end
end

def msg_results(player_cards, dealer_cards, reveal)
  winner = winner(player_cards, dealer_cards)
  msg_cards = msg_cards(player_cards, dealer_cards, reveal)
  [winner] + [" "] + msg_cards
end

def display_results(player_cards, dealer_cards, reveal = true)
  msg_results = msg_results(player_cards, dealer_cards, reveal)
  bannerise(msg_results)
end

def bannerise(msg_array, divider = '-', margin = 2)
  divider_length = msg_array.max { |msg| msg.length }.length
  puts divider * (divider_length + margin * 2)
  msg_array.each do |msg|
    puts " " * margin + msg
  end
  puts divider * (divider_length + margin * 2)
end

def play_again?
  loop do
    prompt "Press [enter] to play again, or enter 'quit' or 'q' to quit."
    play_again = gets.chomp.strip
    if play_again == ''
      return true
    elsif ['quit', 'q'].include?(play_again.downcase)
      return false
    end
    prompt "Sorry, that's not a valid choice."
  end
end

# Main Program

system "clear"
prompt MESSAGES["welcome"]
sleep SLEEP_TIME
press_enter_to_continue

loop do
  system 'clear'

  deck = init_deck
  player_cards = []; dealer_cards = []
  prompt(MESSAGES["dealing_cards"], loading = true)
  init_deal_cards(deck, player_cards, dealer_cards)

  # player's turn
  loop do
    system 'clear'
    display_cards(player_cards, dealer_cards, reveal = false)
    hit_or_stay = hit_or_stay()
    if hit_or_stay == ""
      system 'clear'
      prompt 'You chose to hit!'
      prompt(MESSAGES["player_asking_another_card"], loading = true)
      deal_cards(deck, player_cards)
      sleep SLEEP_TIME
      if busted?(player_cards)
        system 'clear'
        display_results(player_cards, dealer_cards)
        break
      end
    elsif ['stay', 's'].include?(hit_or_stay.downcase)
      break  
    end
  end

  # dealer's turn
  loop do
    break if busted?(player_cards)
    if total(dealer_cards) >= 17
      system 'clear'
      display_results(player_cards, dealer_cards)
      break
    else
      system 'clear'
      prompt "Dealer chose to hit!"
      prompt(MESSAGES["dealer_asking_another_card"], loading = true)
      deal_cards(deck, dealer_cards)
      if busted?(dealer_cards)
        system 'clear'
        display_results(player_cards, dealer_cards)
        break
      end
    end
  end

  break unless play_again?
end

prompt "Goodbye!"
