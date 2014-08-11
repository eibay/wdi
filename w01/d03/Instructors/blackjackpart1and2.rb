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


cardoneatrandom= fulldeck.sample
fulldeck.delete(cardoneatrandom)
cardtwoatrandom = fulldeck.sample
fulldeck.delete(card2random)
if(cardoneatrandom.split(" ")[0]=="Q")||(cardoneatrandom(" ")[0]=="J")||(cardoneatrandom(" ")[0]=="K")
	cardone=10
elsif (cardoneatrandom.split(" ")[0]=="A")
	cardone=1
else
	cardone=cardoneatrandom.split(" ")[0].to_i

end
if(cardtwoatrandom.split(" ")[0]=="Q")||(cardtwoatrandom.split(" ")[0]=="J")||(cardtwoatrandom.split(" ")[0]=="K")
	cardtwo=10
elsif (cardtwoatrandom.split(" ")[0]=="A")
	cardtwo=1
else
	cardtwo=cardtwoatrandom.split(" ")[0].to_i
end
puts "Your 2 cards are #{cardoneatrandom} and #{cardtwoatrandom}"
+puts cardone
+puts cardtwo
+puts cardone + cardtwo