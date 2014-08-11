require 'colorize'
suit=["2","3","4","5","6","7","8","9","10","J","Q","K","A"]
full_deck=[]
suits=["hearts", "spades", "diamonds" , "clubs"]
i=0
while(i < suits.count)
suit.each{ |x| full_deck.push("#{x} #{suits[i]}") }
i+=1
end
while(full_deck.length > 2)
bust=false
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
dealt_hand=first_card+second_card

puts "You have been dealt #{random_card1} and #{random_card2}.".blue
puts "The total of that is #{dealt_hand} Would you like to hit or stay?"
hit_or_stay=gets.chomp


while hit_or_stay=="hit" 

    new_card=full_deck.sample
	full_deck.delete(new_card)
	if(new_card.split(" ")[0]=="K")||(new_card.split(" ")[0]=="Q")||(new_card.split(" ")[0]=="J")
	new_card_value=10
elsif (new_card.split(" ")[0]=="A")
	new_card_value=1
else
	new_card_value=new_card.split(" ")[0].to_i

end
new_hand_total=dealt_hand+new_card_value
dealt_hand=new_hand_total

if(new_hand_total > 21)
puts "You have been dealt a #{new_card}".blue
puts "Your new hand total is #{new_hand_total} which means you have busted".red
hit_or_stay="stay"
bust=true
elsif(new_hand_total==21)
	puts "You have been dealt a #{new_card}".blue
	puts "Blackjack! You win".red.blink
	hit_or_stay="stay"
	
	bust=true

else
	puts "You have been dealt a #{new_card}".blue
puts "Your new hand total is #{new_hand_total} would you like to stay or hit again?"
hit_or_stay=gets.chomp
end
end
if hit_or_stay=="stay"&&bust==false
	puts"You have stayed, your final hand value is #{dealt_hand}".red
end
end
puts"We are out of cards and can no longer play".green















