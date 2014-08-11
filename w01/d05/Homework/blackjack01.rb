#require "pry"

cards = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
suits = ["Hearts", "Clubs", "Spades", "Diamonds"]
full_deck = []


#binding.pry

cards.each do |c|
  suits.each do |s|
    cards = c + s
    full_deck << cards
  end
end

puts full_deck