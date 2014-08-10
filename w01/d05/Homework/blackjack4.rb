
array = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]
array1 = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]
array2 = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]
array3 = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]

array1 = array1.shuffle
array = array.shuffle
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
			puts "Your total is #{total} and your added card was #{cardx}, say hit me or stay?"
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

	