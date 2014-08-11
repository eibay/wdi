#Week01-Day05: Friday Afternoon Lab
## Blackjack
require 'pry'


   
def make_deck(suits, values) # this doesnt seem to work, deck doesn't get defined
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
  puts "\nYour deck is  #{deck}"
  return deck # do i need this?
end

values = [*1..13,] # i originally didn't make it all integers, but i decided doing so and 
suits = ["♤", "♡", "♢", "♧"] # converting it while pushing into deck created less complexity later on

deck = make_deck(suits, values)

  
    #random draw method
    def draw_random(deck_array, qty_drawn)
      cards_chosen = []
      while qty_drawn > 0 do
        # puts "\n\n"
        random_card = deck_array[rand(deck_array.length)]
        # puts "You picked #{random_card}."
        deck_array.delete(random_card)
        qty_drawn -= 1
        cards_chosen << random_card
      end
      puts "\nyour random cards are #{cards_chosen}"
      return cards_chosen
    end

    cards_chosen = draw_random(deck, 3)


    def add_cards(drawn_card_array)
      cards_value = 0
      qty_drawn = drawn_card_array.length

      while qty_drawn > 0 do
        drawn_card_array.each do |card_name| 
          if card_name.split(" ")[0] == "J" || card_name.split(" ")[0] == "Q" || card_name.split(" ")[0] == "K"
            cards_value += 10
          elsif card_name.split(" ")[0] == "A"
            cards_value += 1
          else
            cards_value += card_name.split(" ")[0].to_i #"10 of ♤".split(" ") > ["10", "of", "♤"][0] > "10".to_i > 9
          end
          qty_drawn -= 1
        end
      end
      puts "\nthe total value of your cards is #{cards_value}"
      return cards_value
    end

   # cards_added = add_cards(draw_random(deck, 2)) # "string" and return cards_value # 13


    cards_added = add_cards(cards_chosen) # "string" and return cards_value # 13


def boom_and_bust(deck, cards_chosen, cards_added)
  qty_deck = deck.length
  while qty_deck / 3 > 1 do

    if cards_added > 21
      puts "Your card value is #{cards_added}, you went BUST!"
    else
      puts "Your card value is #{cards_added}, you are safe... for now.."
    end

# binding.pry ################################################################
  qty_deck -= cards_chosen.length  
  end
end


boom_and_bust(deck, cards_chosen, cards_added)


#### random card array of 3
# random_card_array_3 = []
# qty_drawn_random_cards_3 = 3
# # puts "\n\n"
# while qty_drawn_random_cards_3 > 0 do
#   random_card = deck[rand(deck.length)]
#   # puts "You picked #{random_card}."
#   deck.delete(random_card)

#   qty_drawn_random_cards_3 -= 1 
#   random_card_array_3 << random_card
# end

# print "\nyour random cards are #{random_card_array_3}"



#### adding them together 3 cards
# cards_value_3 = 0
# qty_drawn_card_adding_3 = random_card_array_3.length

# while qty_drawn_card_adding_3 > 0 do
#   random_card_array_3.each do |card|

#     # to account for face cards equalling 10 and ace equalling 1
#     if card.split(" ")[0] == "J" || card.split(" ")[0] == "Q" || card.split(" ")[0] == "K"
#       cards_value_3 += 10
#     elsif card.split(" ")[0] == "A"
#       cards_value_3 += 1
#     else
#       cards_value_3 += card.split(" ")[0].to_i #"10 of ♤".split(" ") > ["10", "of", "♤"][0] > "10".to_i > 9
#     end
#     qty_drawn_card_adding_3 -= 1
#   end
# end  
# puts "\nthe total value of your cards is #{cards_value_3}"






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