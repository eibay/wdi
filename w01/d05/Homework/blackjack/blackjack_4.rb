
# -----
# ###Part 4

# - Goal: Create one sided blackjack
#   - A user is given two cards at random
#   - They can type "Hit me" or "Stay"
#   - If they type "Hit me" then draw another card, if they have gone bust tell them. Then draw another hand, which will once again give them the options "Hit Me" or "Stay".
#   - If they choose "Stay" then output the Blackjack value of their hand. Then draw another hand, , which will once again give them the options "Hit Me" or "Stay".
# - The game should end when you run out of cards

#Week01-Day05: Friday Afternoon Lab
## Blackjack
require 'pry'

#### THIS IS for problem 4

#############################
##### BEGIN DEFINITIONS #####
def single_player_blackjack

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



  def boom_and_bust(deck)
    qty_deck = deck.length

    while qty_deck / 3 > 0 do # i originally did 3 > 1, but it only did 16 draws = 48 cards, leaving 4 cards, instead of 17 draws. not sure why

      def draw_random(deck_array, qty_to_draw)
        hand = []
        puts "\nyou draw #{qty_to_draw} cards!"
        while qty_to_draw > 0 do

          random_card = deck_array[rand(deck_array.length)]
          # puts "You picked #{random_card}."
          # deck_array = deck_array.delete(random_card)
          deck_array.delete(random_card)
          qty_to_draw -= 1
          hand << random_card
        end

        puts "your random cards are #{hand}"
        return hand
      end

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
        # puts "\nthe total value of your cards is #{cards_value}"
        return cards_value
      end
      ##### END DEFINITIONS #####
      ###########################

      ###################################
      #### USER DRAWS HIS FIRST HAND ####
      ###################################
      hand = draw_random(deck, 2) # draw_random(deck, 2) # ["10 of ♤", "4 of ♡"]
      # puts "You drew #{hand}"
      # add_cards(hand)


      ###################################
      #### Ask user for their choice ####
      ###################################
      puts "Make your choice: "
      puts "  H: 'Hit me!'"
      puts "  S: 'Stay!'"

      choice = gets.chomp.upcase

      ###################################
      #### Did they Hit or Stay?     ####
      ###################################
      

      if choice == "H"
        extra_card = draw_random(deck, 1)
        value = add_cards(hand) + add_cards(extra_card)
        puts "The total value of your cards is #{value}"
        if value > 21
          puts "<<<<<<< BUST! >>>>>>>>" 
        end
      elsif choice == "S"
        value = add_cards(hand)
        puts "The total value of your cards is #{value}"
        puts "Phewf..."
      end


  


    qty_deck -= hand.length  
    end
  end
  boom_and_bust(deck)
end
single_player_blackjack

