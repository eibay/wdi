#require "pry"

#My way of doing it below

# cards = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
# suits = ["Hearts", "Clubs", "Spades", "Diamonds"]
# full_deck = []


# #binding.pry

# cards.each do |c|
#   suits.each do |s|
#     cards = c + s
#     full_deck << cards
#   end
# end

# puts full_deck

#Instructor way of doing it below


base = %w(2 3 4)
cards = []

index = 0
while index < base.length
  cards << base[index] + " heart"
  cards << base[index] + " spades"
  cards << base[index] + " diamonds"
  cards << base[index] + " clubs"
  index += 1

end

print cards

# base = %w(2 3 4 5 6 7 8 9 10 J Q K A)
# cards = []

# index = 0
# while index<base.length
#   cards << base[index] + ' ♥'
#   cards << base[index] + ' ♣'
#   cards << base[index] + ' ♠'
#   cards << base[index] + ' ♦'
#   index += 1
# end


# print cards
# puts ""


# card = cards.last
