require 'pry'
cardNum = ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"]
suits = ["Diamonds", "Hearts", "Spades", "Clubs"]
deck = []
hand = []
card = []
handVal = 0
inhand = []
response = "hit me"
emptyHand = 0
deckTotalScore = 340
cardNum.each { |cardNum| suits.each { |suits| card = cardNum + " of " + suits 
	deck.push(card) } }

deck = deck.shuffle

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

while deckTotalScore >= 22
	if (response != "hit me") && (response != "hit") && (response != "stay")
		puts("Sorry, I didn't get that, please try again.")
		response = gets.chomp.downcase			
	end
	if (response == "hit me") || (response == "hit")
		inhand,handVal,deck,deckTotalScore = deal(deck, hand, handVal, deckTotalScore) 
		if hand.length < 2
			inhand,handVal,deck,deckTotalScore = deal(deck, hand, handVal, deckTotalScore)
		end
		if (handVal > 21) && (emptyHand == 0)
			puts("Your hand is now #{hand} and totals #{handVal}. You busted!")
			emptyHand = 1
		end
		if (handVal == 21) && (emptyHand == 0)
			puts("Your hand is now #{hand}. Wow, you've got 21!")
			emptyHand = 1
		end
		if (handVal < 21) && (emptyHand == 0)
			puts("Your hand is now #{hand} and totals #{handVal}. What's your next move? (hit or stay)")
			response = gets.chomp.downcase
			if response == "stay"
				puts("Your hand of #{hand} totals #{handVal}.")
				if handVal < 22
					puts("Alright!")
					emptyHand = 1
					response = "hit"
				else
					puts("Busted.")
					emptyHand = 1
					response = "hit"
				end
			end
		end
	end
	if emptyHand == 1
		hand.length.times { hand.delete_at(0) }
		handVal = 0
		emptyHand = 0
		reponse = "hit"
	end
end
if deck.length == 1
	puts("There's only #{deck.length} card left, which isn't enough for another game.  Good game!")
else puts("There's only #{deck.length} cards left, which isn't enough for another game.  Good game!")
end







