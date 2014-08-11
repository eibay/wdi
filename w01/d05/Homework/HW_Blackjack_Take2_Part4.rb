
# Part 4

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

while cards[0].length != 0 && play == "yes"

  card1 = cards[0][0]
  cards[0].delete_at(0)
  card2 = cards[0][0]
  cards[0].delete_at(0)

  if card1 == "A"
    card3 = 1
  elsif card1 == "J" 
    card3 = 10
  elsif card1 == "Q"
    card3 = 10
  elsif card1 == "K"
    card3 = 10
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

  total = card3 + card4

  counter = 0

  puts "Your cards are #{card1} and #{card2} and your total is #{total}, say hit me or stay?"
  answer = gets.chomp.downcase

  if answer == "stay"
    puts "Your total is #{total}, do you want to play again?"
    play = gets.chomp.downcase
  end
  

  while total < 21 && answer == "hit me"  
    if cards[0].length == 0 then
    break
    end
    cardx = cards[0][0]
    cards[0].delete_at(0)

    if cardx == "A"
      cardy = 1
    elsif cardx == "J" 
      cardy = 10
    elsif cardx == "Q"
      cardy = 10
    elsif cardx == "K"
      cardy = 10
    else
      cardy = cardx.to_i
    end

    total = total + cardy

    if total > 21
      puts "BUST! and your total is #{total} and your added card was #{cardx}"
    else total < 21 
      puts "Your added card was #{cardx} and your total is #{total}. Say hit me or stay."
      answer = gets.chomp
    end

    if answer == "stay"
      puts "Your total is #{total}"
    end

    puts "Do you want to play again?"
    play = gets.chomp.downcase


    counter += 1
  end 

end

puts "Goodbye"


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
#   - Now it is the other player's turn
#     - If they have stayed, you should announce the winner and deal another round.
# - Keep playing until you are out of cards. When a new round start output the amount of wins that each player has


# ---

# ###Super bonus extroardinare!!
#   - Can you change blackjack to handle more than 2 players? Hopefully you have enough computers!