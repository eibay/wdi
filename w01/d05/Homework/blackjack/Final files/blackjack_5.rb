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
#   - Now it is the other players turn
#     - If they have stayed, you should announce the winner and deal another round.
# - Keep playing until you are out of cards. When a new round start output the amount of wins that each player has


# ---

# ###Super bonus extroardinare!!
#   - Can you change blackjack to handle more than 2 players? Hopefully you have enough computers!




require 'socket'

server = TCPServer.new 2000
client = server.accept

############################
#### BEGIN DEFINITIONS #####
def two_player_blackjack 

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

    while qty_deck > 5 do # i originally did 3 > 1, but it only did 16 draws = 48 cards, leaving 4 cards, instead of 17 draws. not sure why

      def draw_random(deck_array, qty_to_draw)
        hand = []
        while qty_to_draw > 0 do

          random_card = deck_array[rand(deck_array.length)]
          # puts "You picked #{random_card}."
          # deck_array = deck_array.delete(random_card)
          deck_array.delete(random_card)
          qty_to_draw -= 1
          hand << random_card
        end

        puts "you drew #{hand}"
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
      #### PLAYERS DRAW THEIR HANDS  ####
      ###################################
      hand_S = draw_random(deck, 2)
      puts "\nyou draw #{hand_S} cards!"


      hand_C = draw_random(deck, 2) # draw_random(deck, 2) # ["10 of ♤", "4 of ♡"]
      client.puts "\nyou draw #{hand_C} cards!"
      # puts "You drew #{hand}"
      # add_cards(hand)


      ###################################
      #### Ask SERVER for their choice ##
      ###################################
      puts "Make your choice: "
      puts "  H: 'Hit me!'"
      puts "  S: 'Stay!'"

      choice_S = gets.chomp.upcase

      ###################################
      #### Did they Hit or Stay?     ####
      ###################################
      

      if choice_S == "H"
        extra_card_S = draw_random(deck, 1)
        value_S = add_cards(hand) + add_cards(extra_card)
        puts "The total value of your cards is #{value}"
        if value > 21
          puts "<<<<<<< BUST! >>>>>>>>" 
        end
      elsif choice_S == "S"
        value_S = add_cards(hand)
        puts "The total value of your cards is #{value}"
        puts "Phewf..."
      end

      ###################################
      #### Ask CLIENT for their choice ##
      ###################################
      client.puts "Make your choice: "
      client.puts "  H: 'Hit me!'"
      client.puts "  S: 'Stay!'"

      choice_C = client.gets.chomp.upcase

      ###################################
      #### Did they Hit or Stay?     ####
      ###################################
      

      if choice_C == "H"
        extra_card_C = draw_random(deck, 1)
        value_C = add_cards(hand) + add_cards(extra_card)
        client.puts "The total value of your cards is #{value}"
        if value_C > 21
          client.puts "<<<<<<< BUST! >>>>>>>>" 
        end
      elsif choice_C == "S"
        value_C = add_cards(hand)
        client.puts "The total value of your cards is #{value}"
        client.puts "Phewf..."
      end


  


    qty_deck -= hand.length  
    end
  end
  boom_and_bust(deck)
end
two_player_blackjack

client.close

