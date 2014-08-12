require 'pry'

puts "Welcome to Blackjack, what is your name?"
name = gets.chomp
puts "Let's get this show on the road #{name}, shall we?"
	

def play_game (name) #creating the deck

deck = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K"]
suits = ["spades", "clubs", "hearts", "diamonds"]

player_hand = []
dealer_hand = []

shuffled_deck = deck.shuffle!

2.times do  #distributing the cards to player/dealer
    player_hand << shuffled_deck.pop
    dealer_hand << shuffled_deck.pop
end

  player_total = calculate_total (player_hand) #total of hand = player cards
  dealer_total = calculate_total (dealer_hand)

if player_total == 21
    display_cards player_hand, dealer_hand
    puts "Winner winner, chicken dinner! You just hit Blackjack!"
elsif dealer_total == 21
    display_cards player_hand, dealer_hand
    puts "You lost! Dealer has Blackjack."
end

puts "Your hand: #{player_hand}"
puts "Select 'H' for 'Hit' or 'S' for 'Stay'"
hit_or_stay = gets.chomp

while hit_or_stay.upcase != "S" do

if hit_or_stay.upcase == "H"
    player_hand << shuffled_deck.pop
    player_total = calculate_total (player_hand)
    
if player_total > 21
    display_cards player_hand, dealer_hand
    puts "BUST! You lost!"
	end
elsif hit_or_stay.upcase != "S"
    puts "Select 'H' for 'Hit' or 'S' for 'Stay'."
end
    puts "Your hand: #{player_hand}"
    puts "Select 'H' for 'Hit' or 'S' for 'Stay'."
   	hit_or_stay = gets.chomp
end

while dealer_total < 17 do
   dealer_hand << shuffled_deck.pop
   dealer_total = calculate_total (dealer_hand)

if dealer_total > 21
    puts "Dealer busts, you win!"
    display_cards dealer_hand
end
end

if player_total > dealer_total
    puts "Congratulations, #{name}! You won!"
elsif dealer_total > player_total
    puts "Dealer wins. Better luck next time!"
    display_cards player_hand, dealer_hand
else
    puts "Push, it's a tie!"
    display_cards player_hand, dealer_hand
end
end

def calculate_total (hand) 
  total = 0
  hand.collect {|ind| ind[0]}.each do |val|
  
if val == "J" || val == "Q" || val == "K"
	total += 10
elsif val == 1
total += 11

else
total += val
end
end

hand.collect {|ind| ind[0]}.each do |val|
if total > 21 && val == 1
total -= 10
end
end

return total
end

#dealer hand ?
#dealer total ?
#player hands ? 
#player total ?

def display_cards (player_hand, dealer_hand)
  puts "Dealer hand: #{dealer_hand}"
  puts "Dealer total: #{calculate_total(dealer_hand)}"
  puts "Your cards: #{player_hand}"
  puts "Your total: #{calculate_total(player_hand)}"
end

play_again = play_game name # restarting game and back to the loop

play_again = "Y"
	puts "Would you like to play again? Please type in 'Y' for 'Yes' and 'N' for 'No'."
play_again = gets.chomp

until ["Y", "N"].include?(play_again.upcase) do
    puts "Oops! Please type in 'Y' for 'Yes' and 'N' for 'No'."
    play_again = gets.chomp
end

if play_again.upcase == "N"
    puts "Thanks for playing Blackjack!"
end



