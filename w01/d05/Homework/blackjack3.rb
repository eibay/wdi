

array = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]

deck = ["Hearts", "Diamonds", "Spades", "Clubs"]


cards = []

array.each do |a|
	deck.each do |d|
	cards << card = a + " " + d
end
end


cards = cards.shuffle

play = "yes"

while cards.length > 2 && play == "yes"

	card100 = cards[0]
	cards.delete_at(0)
	card200 = cards[0]
	cards.delete_at(0)
	card500 = cards[0]
	cards.delete_at(0)
	card1 = card100.split(" ")
	card2 = card200.split(" ")
	card5 = card500.split(" ")

	# counter5 = rand(3)
	# card1 = cards[rand][rand(cards[counter5].length)]
	# card2 = cards[rand][rand(cards[counter5].length)]
	# card5 = cards[rand][rand(cards[counter5].length)]


	if card1.include?"A"
		card3 = 1
	elsif card1.include?"J" 
		card3 = 10
	elsif card1.include?"Q"
		card3 = 10
	elsif card1.include?"K"
		card3 = 10
	else
		card3 = card1[0].to_i
	end

	if card2.include?"A"
		card4 = 1
	elsif card2.include?"J" 
		card4 = 10
	elsif card2.include?"Q"
		card4 = 10
	elsif card2.include?"K"
		card4 = 10
	else
		card4 = card2[0].to_i
	end

	if card5.include?"A"
		card6 = 1
	elsif card5.include?"J" 
		card6 = 10
	elsif card5.include?"Q"
		card6 = 10
	elsif card5.include?"K"
		card6 = 10
	else
		card6 = card5[0].to_i
	end
	
	total = card3 + card4 + card6

	if total > 21
		puts "BUST! Your cards are #{card100}, #{card200}, #{card500} and your total is #{total}"
	else 
		puts "Your total is #{total}, and your cards are #{card100}, #{card200}, #{card500}"
	end

	if cards.length > 2
		puts "Do you want to play again?"
		play = gets.chomp.downcase
	else
		puts "You are out of cards"
	end

	if play == "no"
		puts "Thanks for playing"
	end
				
end

	