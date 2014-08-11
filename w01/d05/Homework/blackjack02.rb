# Part 2

# Goal: To create a program that chooses two cards from the deck at random and outputs its value in blackjack.
# To calculate the value of a hand of cards:
# 2-10 have the value of their number
# All face cards have the value of 10
# Ace is 1

cards = ["two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "Jack", "Queen", "King", "Ace"]
suits = ["Hearts", "Clubs", "Spades", "Diamonds"]
full_deck = []

cards.each do |c|
  suits.each do |s|
    cards = c + s
    full_deck << cards
  end
end

#2)

index = 0

while index < full_deck.length
  puts full_deck

puts full_deck.sample(2)

# # card_value = {
# #           :two => 2,
# #           :three => 3,
# #           :four => 4,
# #           :five => 5,
# #           :six => 6,
# #           :seven => 7,
# #           :eight => 8,
# #           :nine => 9,
# #           :ten => 10,
# #           :Jack => 10,
# #           :Queen => 10,
# #           :King => 10,
# #           :Ace => 1,
# # }

# case value
#     when "two"
#       puts card_value += 2
#     when "three"
#       puts card_value += 3
#     when "four"
#       puts card_value += 4
#     when "five"
#       puts card_value += 5
#     when "six"
#       puts card_value += 6
#     when "seven"
#       puts card_value += 7
#     when "eight"
#       puts card_value += 8
#     when "nine"
#       puts card_value += 9
#     when "ten"
#       puts card_value += 10
# end


















# full_deck.shuffle
# 2.times {hand.push deck.delete_at(0)}
# puts hand

# def hand_calc
# whichcard = 0
# hand.each { |item|
# # puts "#{item}"
# case hand[whichcard].chr
# when "A"
# hand_value += 1
# when "2"
# hand_value += 2
# when "3"
# hand_value += 3
# when "4"
# hand_value += 4
# when "5"
# hand_value += 5
# when "6"
# hand_value += 6
# when "7"
# hand_value += 7
# when "8"
# hand_value += 8
# when "9"
# hand_value += 9
# else
# hand_value += 10
# end
# whichcard += 1
# }
# end

# hand_calc

# puts "This hand is #{hand_value} points."

