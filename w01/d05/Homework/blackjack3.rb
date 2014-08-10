


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

while cards[0].length > 2 && play == "yes"

	card1 = cards[0][0]
	cards[0].delete_at(0)
	card2 = cards[0][0]
	cards[0].delete_at(0)
	card5 = cards[0][0]
	cards[0].delete_at(0)

	# counter5 = rand(3)
	# card1 = cards[rand][rand(cards[counter5].length)]
	# card2 = cards[rand][rand(cards[counter5].length)]
	# card5 = cards[rand][rand(cards[counter5].length)]


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

	if card5 == "A"
		card6 = 1
	elsif card5 == "J" 
		card6 = 10
	elsif card5 == "Q"
		card6 = 10
	elsif card5 == "K"
		card6 = 10
	else
		card6 = card5.to_i
	end
	
	total = card3 + card4 + card6

	if total > 21
		puts "BUST! Your cards are #{card1}, #{card2}, #{card3} and your total is #{total}"
	else 
		puts "Your total is #{total}, and your cards are #{card1}, #{card2}, #{card5}"
	end

	if cards[0].length > 2
		puts "Do you want to play again?"
		play = gets.chomp.downcase
	else
		puts "You are out of cards"
	end

	if play == "no"
		puts "Thanks for playing"
	end
				
end

	