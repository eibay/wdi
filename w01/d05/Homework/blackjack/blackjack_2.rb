#Week01-Day05: Friday Afternoon Lab
## Blackjack
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
  # cards_chosen = draw_random(deck, 2)
    # draw_random(deck, 2) # ["10 of ♤", "4 of ♡"]



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





