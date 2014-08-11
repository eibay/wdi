suit=["2","3","4","5","6","7","8","9","10","J","Q","K","A"]
full_deck=[]
suits=["hearts", "spades", "diamonds" , "clubs"]
i=0
while(i < suits.count)
suit.each{ |x| full_deck.push("#{x} #{suits[i]}") }
i+=1
end

random_card1=full_deck.sample
full_deck.delete(random_card1)
random_card2=full_deck.sample
full_deck.delete(random_card2)
if(random_card1.split(" ")[0]=="K")||(random_card1.split(" ")[0]=="Q")||(random_card1.split(" ")[0]=="J")
	first_card=10
elsif (random_card1.split(" ")[0]=="A")
	first_card=1
else
	first_card=random_card1.split(" ")[0].to_i

end
if(random_card2.split(" ")[0]=="K")||(random_card2.split(" ")[0]=="Q")||(random_card2.split(" ")[0]=="J")
	second_card=10
elsif (random_card2.split(" ")[0]=="A")
	second_card=1
else
	second_card=random_card2.split(" ")[0].to_i
end
puts "Your 2 cards are #{random_card1} and #{random_card2}"
puts first_card
puts second_card
puts first_card+second_card


