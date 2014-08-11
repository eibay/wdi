require 'socket'
server= TCPServer.new 2000
client=server.accept

suit=["2","3","4","5","6","7","8","9","10","J","Q","K","A"]
full_deck=[]
suits=["hearts", "spades", "diamonds" , "clubs"]
i=0
while(i < suits.count)
suit.each{ |x| full_deck.push("#{x} #{suits[i]}") }
i+=1
end

team1=0
team2=0
hit_or_stay2=false
bust1=false
bust2=false
while(full_deck.length >= 4)
random_card1=full_deck.sample
full_deck.delete(random_card1)
random_card2=full_deck.sample
full_deck.delete(random_card2)
random_card3=full_deck.sample
full_deck.delete(random_card2)
random_card4=full_deck.sample
full_deck.delete(random_card4)
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
if(random_card3.split(" ")[0]=="K")||(random_card3.split(" ")[0]=="Q")||(random_card3.split(" ")[0]=="J")
	third_card=10
elsif (random_card3.split(" ")[0]=="A")
	third_card=1
else
	third_card=random_card3.split(" ")[0].to_i

end
if(random_card4.split(" ")[0]=="K")||(random_card4.split(" ")[0]=="Q")||(random_card4.split(" ")[0]=="J")
	fourth_card=10
elsif (random_card4.split(" ")[0]=="A")
	fourth_card=1
else
	fourth_card=random_card4.split(" ")[0].to_i
end
dealt_hand1=first_card+second_card

dealt_hand2=third_card+fourth_card
client.puts "You have been dealt #{random_card1} and #{random_card2}."
client.puts "The total of that is #{dealt_hand1}"
puts "You have been dealt and of #{random_card3} and #{random_card4}"
puts "The total of that is #{dealt_hand2}"
puts "Your opponent has been dealt a hand of #{random_card1} and #{random_card2}"
puts "The value of your opponents hand is #{dealt_hand1}"
client.puts "Your opponent has been dealt a hand of #{random_card3} and #{random_card4}
with a value of #{dealt_hand2} Would you like to hit or stay"
hit_or_stay1=client.gets.chomp
while (hit_or_stay1=="hit")

   new_card1=full_deck.sample
	full_deck.delete(new_card1)
	if(new_card1.split(" ")[0]=="K")||(new_card1.split(" ")[0]=="Q")||(new_card1.split(" ")[0]=="J")
	new_card_value1=10
	new_hand_total1=dealt_hand1+new_card_value1
elsif (new_card1.split(" ")[0]=="A")
	new_card_value1=1
	new_hand_total1=dealt_hand1+new_card_value1
else
	new_card_value1=new_card1.split(" ")[0].to_i
	new_hand_total1=dealt_hand1+new_card_value1

end
dealt_hand1=new_hand_total1
if(new_hand_total1 > 21)

client.puts "You have been dealt a #{new_card1}"
client.puts "Your new hand total is #{new_hand_total1} which means you have busted"
puts "Your opponent has busted and you have won the hand"
bust1=true
hit_or_stay1="stay"

elsif(new_hand_total1==21)
	client.puts "You have been dealt a #{new_card1}"
	client.puts "Blackjack! You win"
	puts "Your opponent has hit Blackjack and won the hand"
	hit_or_stay1="stay"
	blackjack1=true
else
	client.puts "You have been dealt a #{new_card1}"
    client.puts "Your new hand total is #{new_hand_total1}"
    if(hit_or_stay2=="stay")
	client.puts "Would you like to hit again?"
	hit_or_stay1=client.gets.chomp

    elsif (hit_or_stay2 != "stay")
    	puts"Your opponents current hand total is now #{new_hand_total1} Would you like
    to hit or stay"
    hit_or_stay2=gets.chomp
end
end
if (hit_or_stay2=="stay")&&(hit_or_stay1 == "hit")
	"Do you want to hit again?"
	hit_or_stay1=="gets.chomp"
end
end####ends client loop
if(hit_or_stay1=="stay")&&(hit_or_stay2 !="hit")&&(bust2==false)
	puts"Your opponent has stayed at #{dealt_hand1} Would you like
    to hit or stay"
    hit_or_stay2=gets.chomp
end

	
while (hit_or_stay2=="hit")

   new_card2=full_deck.sample
	full_deck.delete(new_card1)
	if(new_card2.split(" ")[0]=="K")||(new_card2.split(" ")[0]=="Q")||(new_card2.split(" ")[0]=="J")
	new_card_value2=10
	new_hand_total2=dealt_hand2+new_card_value2
elsif (new_card2.split(" ")[0]=="A")
	new_card_value2=1
	new_hand_total2=dealt_hand2+new_card_value2
else
	new_card_value2=new_card2.split(" ")[0].to_i
	new_hand_total2=dealt_hand2+new_card_value2

end
dealt_hand2=new_hand_total2
if(new_hand_total2 > 21)

puts "You have been dealt a #{new_card2}"
puts "Your new hand total is #{new_hand_total2} which means you have busted"
client.puts "Your opponent has busted and you have won the hand"
bust2=true
hit_or_stay2="stay"

elsif(new_hand_total2==21)
	puts "You have been dealt a #{new_card2}"
	puts "Blackjack! You win"
	client.puts "Your opponent has hit Blackjack and won the hand"
	hit_or_stay2="stay"
	blackjack2=true
else
	puts "You have been dealt a #{new_card2}"
    puts "Your new hand total is #{new_hand_total2}"
    if (hit_or_stay1=="hit")&&(bust2==false)
    	puts"Your opponents current hand total is now #{new_hand_total2} Would you like
    to hit or stay"
    hit_or_stay1=gets.chomp
end
end
if (hit_or_stay1=="stay")&&(hit_or_stay2 == "hit")
	"Do you want to hit again?"
	hit_or_stay2=="gets.chomp"
end
end######ends server loop
if(hit_or_stay2=="stay")
	puts"Your opponent has stayed at #{new_hand_total1} Would you like
    to hit or stay"
    hit_or_stay1=gets.chomp
    
elsif(hit_or_stay1=="stay")
	puts "Would you like to hit again?"
	hit_or_stay2=gets.chomp
end
if(hit_or_stay2=="stay")&&(hit_or_stay1=="stay")
	if(bust1==true)
		team2+=1
	elsif(bust2==true)
		team1+=1
	elsif blackjack2==true
		team2+=1
	elsif blackjack1==true
		team1 +=1
	elsif dealt_hand1==dealt_hand2
		puts "you tied"
		client.puts "you tied"
	elsif dealt_hand1 > dealt_hand2
		team1+=1
		puts "You lost"
		client.puts "You won"
	elsif dealt_hand1 < dealt_hand2
		team2+=1
		puts "You won"
		client.puts "You lost"
		end
end
		





end#####end first while loop while(play_again==yes)&&(full_deck.length >= 4)









client.close


















