# Part 1

# Create an array with all the cards in a deck (2-10, J, Q, K A)
# Don't explicitly just write out an array with 52 cards
# You can write out a smaller array and then generate the rest
# Output the array of cards

cards = ["2","3","4","5","6","7","8","9","10","J","Q","K","A"]
suits = ["hearts", "spades", "diamonds", "clubs"]
fulldeck = []

index = 0
while index < suits.count
	card.each {|x| fulldeck.push("#{suits[index]}")}
	index +=1
end
puts fulldeck

# Part 2

# Goal: To create a program that chooses two cards from the deck at random and outputs its value in blackjack.
# To calculate the value of a hand of cards:
# 2-10 have the value of their number
# All face cards have the value of 10
# Ace is 1


card1atrandom= fulldeck.sample
fulldeck.delete(card1atrandom)
card2atrandom = fulldeck.sample
fulldeck.delete(card2random)
if(card1atrandom.split(" ")[0]=="Q")||(card1atrandom(" ")[0]=="J")||(card1atrandom(" ")[0]=="K")
	card1=10
elsif (card1atrandom.split(" ")[0]=="A")
	card1=1
else
	card1=card1atrandom.split(" ")[0].to_i

end
if(card2atrandom.split(" ")[0]=="Q")||(card2atrandom.split(" ")[0]=="J")||(card2atrandom.split(" ")[0]=="K")
	card2=10
elsif (card2atrandom.split(" ")[0]=="A")
	card2=1
else
	card2=card2atrandom.split(" ")[0].to_i
end
puts "Your 2 cards are #{card1atrandom} and #{card2atrandom}"
+puts card1
+puts card2
+puts card1+card2