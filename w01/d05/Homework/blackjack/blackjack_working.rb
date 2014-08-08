#Week01-Day05: Friday Afternoon Lab
## Blackjack

# ###Part 1
# - Create an array with all the cards in a deck (2-10, J, Q, K A)
# - **Don't** explicitly just write out an array with 52 cards
#   - You can write out a smaller array and then generate the rest
# - Output the array of cards' 



######### Method A ARRAY #####
# values = ["A","2","3","4","5","6","7","8","9","10","J", "Q", "K"]
# values = ["A", *2..10,"J", "Q", "K"]

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

######## when need value --- take card[0] and assign value ------- "A of spade" --> A = 1, "3 of hearts" = 3
#### we can always take the first 13 cards of the array, and etc and make it into a suit if need be.



######## Mehod B HASH ######
### hash 




# ===begin
# ------

# ###Part 2
# - Goal: To create a program that chooses two cards from the deck *at random* and outputs its value in blackjack.
# - To calculate the value of a hand of cards:
#   - 2-10 have the value of their number
#   - All face cards have the value of 10
#   - Ace is 1


#### Q2 ==== method attempt
########## getting random cards
# def random_card(deck_array, qty)
#   while quantity > 0 do
#     random_card = deck_array[rand(deck_array.length)] #.sample
#     puts "\nYou picked #{random_card}"
#     deck_array.delete(random_card)
#     qty -= 1


#     return random_card
#     random_card"#{qty}" = random_card
    

#   end
  
# end

# random_card(deck, 2) 
# put random_card1




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


##### adding together




####### adding them together
# cards_value = 0
# qty_card_adding = random_card_array.length

# while qty_card_adding > 0 do
#   random_card_array.each do |card|
#     cards_value += card.split(" ")[0].to_i #"9 of ♤".split > ["9", "of", "♤"] > "9" > 9
#     qty_card_adding -= 1
#   end
# end  ####### CAUTION CAUTION REMEMBER you need to use the deck for the Q
# puts "your total value is #{cards_value}"

######### using the array[0] to determine the value



cards_value = 0
qty_card_adding = random_card_array.length

while qty_card_adding > 0 do
  random_card_array.each do |card|

    # to account for face cards equalling 10 and ace equalling 1
    if card.split(" ")[0] == "J" || card.split(" ")[0] == "Q" || card.split(" ")[0] == "K"
      cards_value += 10
    elsif card.split(" ")[0] == "A"
      cards_value += 1
    else
      cards_value += card.split(" ")[0].to_i #"9 of ♤".split > ["9", "of", "♤"] > "9" > 9
    end
    qty_card_adding -= 1
  end
end  ####### CAUTION CAUTION REMEMBER you need to use the deck for the Q
puts "\nthe total value of your cards is #{cards_value}"
# -----

# ###Part 3
# - Goal: To create a program that chooses 3 cards *at random*,
# - Have it output the cards and their blackjack value or
#   - Also include whether that value is "bust".
# - Loop this program until there are no cards left in the deck.


# -----
# ###Part 4

# - Goal: Create one sided blackjack
#   - A user is given two cards at random
#   - They can type "Hit me" or "Stay"
#   - If they type "Hit me" then draw another card, if they have gone bust tell them. Then draw another hand, which will once again give them the options "Hit Me" or "Stay".
#   - If they choose "Stay" then output the Blackjack value of their hand. Then draw another hand, , which will once again give them the options "Hit Me" or "Stay".
# - The game should end when you run out of cards

# ----
# ###Part 5
# - Goal: Create two sided blackjack over a network connection!!!!!
#   - Player 1 will be the person running the program (use puts and gets to I/O with them)
#   - Player 2 will connect through netcat (use client.puts and client.gets to I/O with them)
#       - Note that you can intersperse puts, gets, client.puts, and client.gets with no problem
#       - Also note that both gets and Client.gets will pause the program as it waits for input
#   - Deal two cards to player 1 and two cards to player 2 (cards chosen at random)
#   - Player 1 and 2 alternate turns, your program can choose who goes first.
#     - If they type "Hit me" then draw another card
#       - If they have gone bust tell both players, announce the winner for that hand and then deal another round
#       - If they have not gone bust, then move to the other player, unless the other player has chosen to stay, in which the round is done.
#     - If they choose "Stay" then output the Blackjack value of their hand.
#   - Now it is the other player's turns
#     - If they have stayed, you should announce the winner and deal another round.
# - Keep playing until you are out of cards. When a new round start output the amount of wins that each player has


# ---

# ###Super bonus extroardinare!!
#   - Can you change blackjack to handle more than 2 players? Hopefully you have enough computers!
# ===end
