#with sean

base = %w( 2 3 4 5 6 7 8 9 10 J Q K A)
cards = []
index = 0
while index<base.length
	cards << base[index] + '♥'
	cards << base[index] + '♣'
	cards << base[index] + '♠'
	cards << base[index] + '♦'
	index += 1
end

print cards
puts ""







# blkjk_value = 0

# rank = %w[ A, 2, 3, 4, 5, 6, 7, 8, 9, 10, J, Q, K]
# suit = %w[hearts, diamonds, clubs, spades]

# deck = []
# hand = []

# #create deck
# rank.each {|rank| 
# 	suit.each {|suit|
# 		card = { rank: rank, suit: suit }
# 		deck.push(card)
# 	}
# }




# #chooses two cards from the deck at random
# deck = deck.shuffle

# some_card = deck.pop

# if some_card[:rank]


# 2.times {hand.push deck.delete_at(0)}
# puts hand

# #create blackjack values
# if rank == "J" || rank == "K" || rank == "Q"    
# 	total = 10
# if rank == "A"
# 	total = 1




# def blkjk_value 


# puts "This hand has the blackjack value of #{blkjk_value}"






# Goal: To create a program that chooses two cards from the deck at random and outputs its value in blackjack.
# To calculate the value of a hand of cards:
# 2-10 have the value of their number
# All face cards have the value of 10
# Ace is 1