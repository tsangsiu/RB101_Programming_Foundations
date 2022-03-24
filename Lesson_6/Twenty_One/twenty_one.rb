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

def init_deck
  deck = []
  SUITS.each do |suit|
    RANKS.each do |rank|
      deck << [suit, rank]
    end
  end
  deck
end

=begin
Algorithm for calculate_total:
- Get the ranks of the cards
- Note the number of ace, save it to `number_of_ace`
- Calculate the total of the ranks using the following rules:
  - The numbers 2 through 10 are worth their face value
  - The jack, queen, and king are each worth 10
  - The ace is worth 11
- If the total is over 21,
  - for at most `number_of_ace` times,
    - minus 10 until the total is less than 21
- Return the total
=end
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

# Main Program

deck = init_deck
# deck = [["Heart", "2"], ["Heart", "A"], ["Heart", "5"], ["Club", "A"]]
p calculate_total(deck)
