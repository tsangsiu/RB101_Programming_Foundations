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

# Methods

def prompt(msg)
  puts "=> #{msg}"
end

def init_deck
  deck = []
  SUITS.each do |suit|
    RANKS.each do |rank|
      deck << [suit, rank]
    end
  end
  deck
end

def calculate_total(cards)
  ranks = cards.flatten.select { |rank| RANKS.include?(rank) }

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
  calculate_total(cards) > 21
end

# Main Program

deck = init_deck
player_cards = [["Heart", "2"], ["Heart", "A"], ["Heart", "5"], ["Club", "A"]]

# player's turn
hit_or_stay = nil
loop do
  prompt "Press [enter] to hit, or enter 'stay' or 's' to stay."
  hit_or_stay = gets.chomp
  break if ['stay', 's'].include?(hit_or_stay.downcase) || busted?(player_cards)
end
if busted?(player_cards)
  prompt "Computer won!"
else
  prompt "You chose to stay!"
end

# dealer's turn
# dealer hits until the total is at least 17
loop do
  break if calculate_total(dealer_cards) >= 17
end
if busted?(dealer_cards)
  prompt "You won!"
else
  prompt "Computer chose to stay!"
end
