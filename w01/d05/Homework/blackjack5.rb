require 'socket'
server = TCPServer.new 2000
client = server.accept

client.puts "Welcome to BLACKJACK"
puts "WELCOME TO BLACKJACK"

array = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]
array1 = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]
array2 = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]
array3 = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]

array1 = array1.shuffle
array = array.shuffle
array2 = array.shuffle
array3 = array3.shuffle

cards = [array1 + array2 + array3 + array]

new_game = true
team = 0
team1 = 0


while new_game == true && cards[0].length != 0
	total = 0
	total1 = 0
	cardx1 = 0
	cardy1 = 0

	card1 = cards[0][0]
	cards[0].delete_at(0)

	card2 = cards[0][0]
	cards[0].delete_at(0)

	card3 = cards[0][0]
	cards[0].delete_at(0)

	card4 = cards[0][0]
	cards[0].delete_at(0)

	if card1 == "A"
		card11 = 1
	elsif card1 == "J" 
		card11 = 10
	elsif card1 == "Q"
		card11 = 10
	elsif card1 == "K"
		card11 = 10
	else
		card11 = card1.to_i
	end

	if card2 == "A"
		card21 = 1
	elsif card2 == "J" 
		card21 = 10
	elsif card2 == "Q"
		card21 = 10
	elsif card2 == "K"
		card21 = 10
	else
		card21 = card2.to_i
	end

	if card3 == "A"
		card31 = 1
	elsif card3 == "J" 
		card31 = 10
	elsif card3 == "Q"
		card31 = 10
	elsif card3 == "K"
		card31 = 10
	else
		card31 = card3.to_i
	end

	if card4 == "A"
		card41 = 1
	elsif card4 == "J" 
		card41 = 10
	elsif card4 == "Q"
		card41 = 10
	elsif card4 == "K"
		card41 = 10
	else
		card41 = card4.to_i
	end

	total = card11 + card21
	total1 = card31 + card41

	puts "Score is you #{team1} and other person #{team}"
	client.puts "Score is you #{team} and the other person #{team1}"
	client.puts "Your cards are #{card1} and #{card2} and the total is #{total}"
	puts "Your cards are #{card3} and #{card4} and the total is #{total1}"

	answer = "hit me"
	answer1 = "hit me"

	while (answer == "hit me") || (answer1 == "hit me")

		if cards[0].length != 0 && total < 22 && answer == "hit me"
			client.puts "Say hit me or stay"
			answer = client.gets.chomp.downcase
			if answer == "hit me"
				cardx = cards[0][0]
				cards[0].delete_at(0)
				client.puts "Your new card is #{cardx}"
			else
				client.puts "YOUR STAYING"
				answer = "stay"
			end

			if cardx == "A"
				cardx1 = 1
			elsif cardx == "J" 
				cardx1 = 10
			elsif cardx == "Q"
				cardx1 = 10
			elsif cardx == "K"
				cardx1 = 10
			else
				cardx1 = cardx.to_i
			end	

 			if answer == "hit me"
				total = total + cardx1
			end
		end

		if total > 21 
			client.puts "Your bust with a total of #{total}"
			answer = "stay"
			answer1 = "stay"
		elsif total == 21
			client.puts "YOU GOT BLACKJACK"
			answer = "stay"
		else 
			client.puts "Your total is #{total}"
		end

		if cards[0].length != 0 && total1 < 22 && answer1 == "hit me"
			puts "Say hit me or stay"
			answer1 = gets.chomp.downcase
			if answer1 == "hit me"
				cardy = cards[0][0]
				cards[0].delete_at(0)
				puts "Your new card is #{cardy}"
			else
				puts "YOUR STAYING"
				answer1 = "stay"
			end

			if cardy == "A" 
				cardy1 = 1
			elsif cardy == "J" 
				cardy1 = 10
			elsif cardy == "Q"
				cardy1 = 10
			elsif cardy == "K"
				cardy1 = 10
			else
				cardy1 = cardy.to_i
			end

			if answer1 == "hit me"
				total1 = total1 + cardy1
			end
		end

		if total1 > 21
			puts "Your bust with a total of #{total1}"
			answer1 = "stay"
			answer = "stay"
		elsif total1 == 21
			puts "YOU GOT BLACKJACK"
			answer1 = "stay"
		else
	 		puts "Your total is #{total1}"
		end
	end

	if total < total1 && total1 < 22 && total < 22
		team1 = team1 + 1
		client.puts "You lost with #{total} and the other person with #{total1}"
		puts "You win with #{total1} and the other person with #{total}"
	elsif total == total1 && total1 < 22 && total < 22
		client.puts "Its a tie with #{total}"
		puts "Its a tie with #{total1}"
	elsif total1 > 21 and total < 22
		team = team + 1
		client.puts "You win with #{total}, other person bust with #{total1}"
		puts "You lost with a total of #{total1} BUST and the other person has #{total}"
	elsif total > 21 and total1 < 22
		team1 = team1 + 1
		puts "You win with #{total1}, other person bust with #{total}"
		client.puts "You lost with a total of #{total} BUST and the other person has #{total1}"
	elsif total1 > 21 && total > 21
		puts "You both bust you had #{total1} and the other person with #{total}"
		client.puts "You both bust you had #{total} and the other person with #{total1}"
	else 
		team = team + 1
		client.puts "You win with #{total} and the other person with #{total1}"
		puts "You lost with #{total1} and the other person with #{total}"
	end

	puts "Would you like to play again?"
	play = gets.chomp.downcase
	client.puts "Would you like to play again?"
	play1 = client.gets.chomp.downcase

	if cards[0].length != 0 && play == "yes" && play1 == "yes"
		new_game = true
	elsif cards[0].length == 0 
		client.puts "Game over, we are out of cards.  You have #{team} and the other person has #{team1}"
		puts "Game over, we are out of cards.  You have #{team1} and the other person has #{team}"
		new_game = false
	else 
		puts "Thanks for playing, someone didn't want to continue.  You have #{team1} and the other person has #{team}"
		client.puts "Thanks for playing, someone didn't want to continue.  You have #{team} and the other person has #{team1}"
		new_game = false
	end
end
client.close












