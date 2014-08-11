#Week01-Day05: Friday Afternoon Lab

## Blackjack

###Part 1
#   - Create an array with all the cards in a deck (2-10, J, Q, K A)
#   - **Don't** explicitly just write out an array with 52 cards
#     - You can write out a smaller array and then generate the rest
#     - Output the array of cards
# ------

# ###Part 2
# - Goal: To create a program that chooses two cards from the deck *at random* and outputs its value in blackjack.
# - To calculate the value of a hand of cards:
#   - 2-10 have the value of their number
#   - All face cards have the value of 10
#   - Ace is 1

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


# Parts 1 and 2
# array = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]

# cards = []
# counter = 0

# while counter < 4
#   cards << array
#   counter += 1
# end

# #result of the counter
# cards = [array, array, array, array]

# counter5 = rand(3)

# #NOT SURE WHAT THIS DOES. FROM USE BELOW, IT SEEMS TO CREATE AN INDEX NUMBER FOR THE SUB-ARRAY
# #BUT NOT SURE WHY THE LENGTH OF IT IS THREE - ASK!

# # rand(max) → number
# # When max is an Integer, rand returns a random integer greater than or equal to zero and less than max. 
# # Unlike Kernel#rand, when max is a negative integer or zero, rand raises an ArgumentError.


# card1 = cards[rand][rand(cards[counter5].length)]
# card2 = cards[rand][rand(cards[counter5].length)]

# if card1 == "A"
#   card3 = 1
# elsif card1 == "J" 
#   card3 = 10
# elsif card1 == "Q"
#   card3 = 10
# elsif card1 == "K"
#   card3 = 10
# else
#   card3 = card1.to_i
# end

# if card2 == "A"
#   card4 = 1
# elsif card2 == "J" 
#   card4 = 10
# elsif card2 == "Q"
#   card4 = 10
# elsif card2 == "K"
#   card4 = 10
# else
#   card4 = card2.to_i
# end

# total = card3 + card4
# puts "Your cards are #{card1} and #{card2} and your total value is #{total}"



#Part 3

array = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]
array1 = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]
array2 = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]
array3 = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]

array = array.shuffle
array1 = array1.shuffle
array2 = array.shuffle
array3 = array3.shuffle

cards = [array1 + array2 + array3 + array]
play = "yes"

while cards[0].length > 2 && play == "yes"

  card1 = cards[0][0]
  cards[0].delete_at(0)
  card2 = cards[0][0]
  cards[0].delete_at(0)
  card5 = cards[0][0]
  cards[0].delete_at(0)

  if card1 == "A"
    card3 = 1

  elsif card1 == "J" 
    card3 = 10
  elsif card1 == "Q"
    card3 = 10
  elsif card1 == "K"
    card3 = 10
  
# could we also make the face value calculations into one elsif statement

# elsif card1 == "A" || card1 == "J" || card1 == "Q" || card1 == "K"
#     card3 = 10

  else
    card3 = card1.to_i
  end


  if card2 == "A"
    card4 = 1
  elsif card2 == "J" 
    card4 = 10
  elsif card2 == "Q"
    card4 = 10
  elsif card2 == "K"
    card4 = 10
  else
    card4 = card2.to_i
  end

  if card5 == "A"
    card6 = 1
  elsif card5 == "J" 
    card6 = 10
  elsif card5 == "Q"
    card6 = 10
  elsif card5 == "K"
    card6 = 10
  else
    card6 = card5.to_i
  end
  
  total = card3 + card4 + card6 


  if total > 21
    puts "BUST! Your cards are #{card1}, #{card2}, #{card3} and your total is #{total}"
  
  elsif total == 21
    puts "BLACKJACK! Your cards are #{card1}, #{card2}, #{card3} and your total is #{total}"
      
  else 
    puts "Your total is #{total}, and your cards are #{card1}, #{card2}, #{card5}"
  end

  if cards[0].length > 2
    puts "Do you want to play again?"
    play = gets.chomp.downcase
  else
    puts "You are out of cards"
  end

  if play == "no"
    puts "Thanks for playing"
  end
        
end
