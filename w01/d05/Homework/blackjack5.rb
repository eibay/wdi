require 'pry'
require 'socket'
server = TCPServer.new 2000
client = server.accept
# Setting up all the variables.
cardNum = ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"]
suits = ["Diamonds", "Hearts", "Spades", "Clubs"]
deck = []
hand = []
card = []
handVal = 0 
response = "hit me"
endGame = 0
deckTotalScore = 340
p1hand = []
p2hand = []
p1handVal = 0
p2handVal = 0
p1response = "hit me"
p2response = "hit me"
p1endGame = 0
p2endGame = 0
p1turn = []
p2turn = []
p1score = 0
p2score = 0
newRound = 0

# Create the deck and shuffle it. Someone should cut the deck too, but oh well.
cardNum.each { |cardNum| suits.each { |suits| card = cardNum + " of " + suits 
	deck.push(card) } }

deck = deck.shuffle
# This method takes a card from the deck, gives it to the player, and increments their hand's total score.
def deal (deck, hand, handVal, deckTotalScore)
	hand.push(deck[0])
	deck.delete_at(0)
	thiscard = hand.length - 1

	if hand[thiscard][0] == "A" 
		cardVal = 1
	elsif (hand[thiscard][0] == "1") || (hand[thiscard][0] == "J") || (hand[thiscard][0] == "Q") || (hand[thiscard][0] == "K")
		cardVal = 10
	else cardVal = hand[thiscard][0].to_i
	end
handVal = handVal + cardVal
deckTotalScore = deckTotalScore - cardVal
return hand, handVal, deck, deckTotalScore
end

# This method allows player 1 to either hit, stay, or bust.
def p1turn (handVal, endGame, response, hand, deck, deckTotalScore, client, p2score)

	client.puts("Please wait while your opponent plays.")
if (handVal < 21) && (endGame == 0)
	puts("Your hand is now #{hand} and totals #{handVal}. What's your next move? (hit or stay)")
	response = gets.chomp.downcase
	if (response != "hit me") && (response != "hit") && (response != "stay")
		puts("Sorry, I didn't get that, please try again.")
		response = gets.chomp.downcase	
	end		
	if response == "stay"
		puts("Your hand of #{hand} totals #{handVal}.")
		client.puts("Your opponent has stayed.")
	elsif (response == "hit me") || (response == "hit")	
		hand,handVal,deck,deckTotalScore = deal(deck, hand, handVal, deckTotalScore) 
		puts("Your hand is now #{hand} and it totals #{handVal}")
		client.puts("Your opponent was dealt an additional card.")
	else
	end
	if handVal > 21
		puts("You busted!")
		client.puts("Your opponent busted; you win this hand!")
		endGame = 1
		p2score += 1
	end
end
return handVal, endGame, response, hand, deck, deckTotalScore, p2score
end

# This method allows player 2 to hit, stay, or bust.
def p2turn (handVal, endGame, response, hand, deck, deckTotalScore, client, p1score)

	puts("Please wait while your opponent plays.")
if (handVal < 21) && (endGame == 0)
	client.puts("Your hand is now #{hand} and totals #{handVal}. What's your next move? (hit or stay)")
	response = client.gets.chomp.downcase
	if (response != "hit me") && (response != "hit") && (response != "stay")
		client.puts("Sorry, I didn't get that, please try again.")
		response = client.gets.chomp.downcase
	end			
	if response == "stay"
		client.puts("Your hand of #{hand} totals #{handVal}.")
		puts("Your opponent has stayed.")
	elsif (response == "hit me") || (response == "hit")	
		hand,handVal,deck,deckTotalScore = deal(deck, hand, handVal, deckTotalScore) 
		client.puts("Your hand is now #{hand} and it totals #{handVal}")
		puts("Your opponent was dealt an additional card.")
	else
	end
	if handVal > 21
		client.puts("You busted!")
		puts("Your opponent busted; you win this hand!")
		endGame = 1
		p1score += 1
	end
end
return handVal, endGame, response, hand, deck, deckTotalScore, p1score
end



# The game itself!
while deckTotalScore >= 60 #if there are not enough points remaining in the deck for both players to hit while at 20 the game ends.
	# Initial dealing for both players.
	while newRound == 0
	2.times{hand,handVal,deck,deckTotalScore = deal(deck, hand, handVal, deckTotalScore)
	p1hand = p1hand + hand
	p1handVal = p1handVal + handVal
	handVal = 0
	hand.clear
	}
	puts("You were dealt #{p1hand}, which amounts to #{p1handVal}. Your total score is #{p1score}.")

	2.times{hand,handVal,deck,deckTotalScore = deal(deck, hand, handVal, deckTotalScore) 
	p2hand = p2hand + hand
	p2handVal = p2handVal + handVal
	handVal = 0
	hand.clear
	}
	client.puts("You were dealt #{p2hand}, which amounts to #{p2handVal}. Your total score is #{p2score}")
	newRound += 1
	end
	# Turns only commence when both players have not busted and at least one has not chosen to stay.
	while (p1handVal <= 21) && (p2handVal <= 21) && (newRound == 1)
		# Player one's turn.
		if (endGame == 0) && (p1response == "hit") || (p1response == "hit me")
		p1handVal,endGame,p1response,p1hand,deck,deckTotalScore,p2score = p1turn(p1handVal, endGame, p1response, p1hand, deck, deckTotalScore, client, p2score)
		end
		# Player two's turn
		if (endGame == 0) && (p2response == "hit") || (p2response == "hit me")
		p2handVal,endGame,p2response,p2hand,deck,deckTotalScore,p1score = p2turn(p2handVal, endGame, p2response, p2hand, deck, deckTotalScore, client, p1score)
		end
		# These are the post turn options if no one busted during their turn. 
		if endGame == 0
			# A tie at 21, needed in case someone hits to 21 during their turn.
			if (p1handVal == 21) && (p2handVal == 21)
				puts("It's a tie!\n\n")
				client.puts("It's a tie!\n\n")
				endGame = 1
			end
			if (p1response == "stay") && (p2response == "stay")
				# A tie when both players stay.
				if p1handVal == p2handVal
					puts("It's a tie!\n\n")
					client.puts("It's a tie!\n\n")
					endGame = 1
				# Player 1 victory.
				elsif p1handVal > p2handVal
					puts("You're both staying.  Your score this hand is #{p1handVal}; your opponent's score this hand is #{p2handVal}. Congratulations, you won!\n\n")
					client.puts("You're both staying.  Your score this hand is #{p2handVal}; your opponent's score this hand is #{p1handVal}. Sorry, you lost this round.\n\n")
					p1score += 1
					endGame = 1
				# Player 2 victory.
				else
					client.puts("You're both staying.  Your score this hand is #{p2handVal}; your opponent's score this hand is #{p1handVal}. Congratulations, you won!\n\n")
					puts("You're both staying.  Your score this hand is #{p1handVal}; your opponent's score this hand is #{p2handVal}. Sorry, you lost this round.\n\n")
					p2score += 1
					endGame = 1
				end
			end
		# The round is over, time to discard hands and get a score update.
		elsif endGame == 1
			endGame = 0
			newRound = 0
			p1hand.clear
			p2hand.clear
			p1handVal = 0
			p2handVal = 0
			p1response = "hit"
			p2response = "hit"
			puts("Good game! Score update time - you have #{p1score} and your opponent has #{p2score}.  Time for the next round!\n\n")
			client.puts("Good game! Score update time - you have #{p2score} and your opponent has #{p1score}.  Time for the next round!\n\n")
		else
		end
	end
end
# Once there aren't enough cards for a full game the table is cleared and there's a final score update.	
if deck.length == 1
	puts("There's only #{deck.length} card left, which isn't enough for another game.\n\n")
else puts("There's only #{deck.length} cards left, which isn't enough for another game.\n\n")
end
if p1score > p2score
	puts("Good game! Your score of #{p1score} bested your oppenet's score of #{p2score}. You won!!!")
	client.puts("Good game!  Unfortunately, your score of #{p2score} wasn't good enough to beat your opponent's score of #{p1score}. Better luck next time!")
elsif p2score > p1score
	client.puts("Good game! Your score of #{p2score} bested your oppenet's score of #{p1score}. You won!!!")
	puts("Good game!  Unfortunately, your score of #{p1score} wasn't good enough to beat your opponent's score of #{p2score}. Better luck next time!")
else
	puts("Holy smokes! You both have a final score of #{p1score}! It's a tie!")
	client.puts("Holy smokes! You both have a final score of #{p2score}! It's a tie!")
end

client.close
