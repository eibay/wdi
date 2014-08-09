#Week01-Day05: Friday Afternoon Lab
___

## Blackjack

# ###Part 1
# - Create an array with all the cards in a deck (2-10, J, Q, K A)
# - **Don't** explicitly just write out an array with 52 cards
#   - You can write out a smaller array and then generate the rest
# - Output the array of cards
# ------

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
