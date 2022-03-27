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

# Constants

ACE = 'A'
FACES = ['J', 'Q', 'K']
SUITS = ['Club', 'Diamond', 'Heart', 'Spade']
RANKS = [('2'..'9').to_a, '10', FACES, ACE].flatten
WORD_TO_SUIT = { 'Club' => '♣', 'Diamond' => '♦',
                 'Heart' => '♥', 'Spade' => '♠' }

# Methods

def prompt(msg)
  puts "=> #{msg}"
end

def init_deck
  SUITS.product(RANKS).shuffle!
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

def display_cards(player_cards, dealer_cards)
  prompt "Your have #{join_and(cards_to_graphical(player_cards))}."
  prompt "Dealer has #{join_and(dealer_cards_to_graphical(dealer_cards))}."
end

def display_winner(player_cards, dealer_cards)
  if busted?(player_cards)
    prompt "Dealer won!"
  elsif busted?(dealer_cards)
    prompt "You won!"
  elsif total(player_cards) > total(dealer_cards)
    prompt "You won!"
  elsif total(dealer_cards) > total(player_cards)
    prompt "Dealer won!"
  else
    prompt "It's a tie!"
  end
end

def reveal_cards(player_cards, dealer_cards)
  prompt "Your have #{join_and(cards_to_graphical(player_cards))}."
  prompt "Dealer has #{join_and(cards_to_graphical(dealer_cards))}."
end

# Main Program

deck = init_deck
player_cards = []
dealer_cards = []
2.times do
  player_cards << deck.pop
  dealer_cards << deck.pop
end

# player's turn
hit_or_stay = nil
loop do
  display_cards(player_cards, dealer_cards)
  prompt "Press [enter] to hit, or enter 'stay' or 's' to stay."
  hit_or_stay = gets.chomp
  if hit_or_stay == ""
    prompt "You chose to hit!"
    player_cards << deck.pop
    if busted?(player_cards)
      display_winner(player_cards, dealer_cards)
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
    display_winner(player_cards, dealer_cards)
    break
  else
    prompt "Dealer chose to hit!"
    dealer_cards << deck.pop
    if busted?(dealer_cards)
      display_winner(player_cards, dealer_cards)
      break
    end
  end
end

reveal_cards(player_cards, dealer_cards)
prompt "Goodbye!"
