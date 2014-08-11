

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

while play == "yes" && cards.length > 1

	card100 = cards[0]
	cards.delete_at(0)
	card200 = cards[0]
	cards.delete_at(0)

	card1 = card100.split(" ")
	card2 = card200.split(" ")

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

	total = card3 + card4
	counter = 0

	puts "Your cards are #{card100} and #{card200} and your total is #{total}, say hit me or stay?"
	answer = gets.chomp.downcase

	if answer == "stay"
		puts "Your total is #{total}, do you want to play again?"
		play = gets.chomp.downcase
	end
	

	while total < 21 && answer == "hit me"	
		if cards.length == 0 then
		break
		end
		
		cardx00 = cards[0]
		cards.delete_at(0)
		cardx = cardx00.split(" ")


		if cardx.include?"A"
			cardy = 1
		elsif cardx.include?"J" 
			cardy = 10
		elsif cardx.include?"Q"
			cardy = 10
		elsif cardx.include? "K"
			cardy = 10
		else
			cardy = cardx[0].to_i
		end

		total = total + cardy

		if total > 21
			puts "BUST! and your total is #{total} and your added card was #{cardx00}"
		elsif total == 21
			puts "BLACKJACK! Card was #{cardx00}"
			puts "Do you want to play again?"
			play = gets.chomp.downcase
		else total < 21 
			puts "Your total is #{total} and your added card was #{cardx00}, say hit me or stay?"
			answer = gets.chomp
		end

		if answer == "stay"
			puts "Your total is #{total}"
			puts "Do you want to play again?"
			play = gets.chomp.downcase
		elsif total > 21
			puts "Do you want to play again?"
			play = gets.chomp.downcase
		end

	


		counter += 1
	end	
	
end

puts "Goodbye"

	