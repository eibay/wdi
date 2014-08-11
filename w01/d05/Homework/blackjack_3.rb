####turns the smaller suit array into a full deck of cards######
suit=["2","3","4","5","6","7","8","9","10","J","Q","K","A"]
full_deck=[]
suits=["hearts", "spades", "diamonds" , "clubs"]
i=0
while(i < suits.count)
suit.each{ |x| full_deck.push("#{x} #{suits[i]}") }
i+=1
end

while(full_deck.length > 3)
random_card1=full_deck.sample####first card from deck
full_deck.delete(random_card1)
random_card2=full_deck.sample#####second card from deck
full_deck.delete(random_card2)
random_card3=full_deck.sample#######third card from deck
full_deck.delete(random_card3)
#####assign interger value to first card#####
if(random_card1.split(" ")[0]=="K")||(random_card1.split(" ")[0]=="Q")||(random_card1.split(" ")[0]=="J")
	first_card=10
elsif (random_card1.split(" ")[0]=="A")
	first_card=1
else
	first_card=random_card1.split(" ")[0].to_i

end
#####assign interger value to second card#####
if(random_card2.split(" ")[0]=="K")||(random_card2.split(" ")[0]=="Q")||(random_card2.split(" ")[0]=="J")
	second_card=10
elsif (random_card2.split(" ")[0]=="A")
	second_card=1
else
	second_card=random_card2.split(" ")[0].to_i
end
####asssign interger value to third card#####
if(random_card3.split(" ")[0]=="K")||(random_card3.split(" ")[0]=="Q")||(random_card3.split(" ")[0]=="J")
	third_card=10
elsif (random_card3.split(" ")[0]=="A")
	third_card=1
else
	third_card=random_card3.split(" ")[0].to_i
end
#####calculate the total value of the hand#####
total_hand=first_card+second_card+third_card
puts random_card1
puts random_card2
puts random_card3
####divide cards left by 3 to see how many more hands we can deal#######
hands_left=full_deck.length/3

#####check if hand is over 21, if it is tell the user that there hand has busted#####
if(total_hand > 21)
	puts "Your hand is #{total_hand} which is over 21 so you busted"
else
	puts "Your total hand is #{total_hand}"
end
if(hands_left >= 1)
puts "You have #{hands_left} hands left"
else
	puts "That was your last hand"
end
end








