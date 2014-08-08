
###Part 2
- Goal: To create a program that chooses two cards from the deck *at random* and outputs its value in blackjack.
- To calculate the value of a hand of cards:
  - 2-10 have the value of their number
  - All face cards have the value of 10
  - Ace is 1

#part1
values = [*1..13,]
suits = ["♤", "♡", "♢", "♧"]

deck = [] 

suits.each do |suit|
  values.each do |value|
    case value
    when 1
      value = "A"
    when 11
      value = "J"
    when 12
      value = "Q"
    when 13
      value = "K"
    end
    card = "#{value} of #{suit}"
    deck << card
  end
end
print "\nYour deck is  #{deck}"



##### Q2 non-method attempt
########## getting random cards
random_card_array = []
qty_random_cards = 2
puts "\n\n"
while qty_random_cards > 0 do
  random_card = deck[rand(deck.length)]
  # puts "You picked #{random_card}."
  deck.delete(random_card)

  qty_random_cards -= 1 
  random_card_array << random_card
end

print "\nyour random cards are #{random_card_array}"

