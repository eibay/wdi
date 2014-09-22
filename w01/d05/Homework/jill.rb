# Goal: To create a program that chooses 3 cards at random,
# Have it output the cards and their blackjack value or
# Also include whether that value is "bust".
# Loop this program until there are no cards left in the deck.

total_hand = 0

suits = [ "_C", "_H", "_S", "_D"]

# can you think of a way you could have 
# algorithmically generated the number cards here 
pips = [ "A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
# don't necesssary have to implement but maybe 
# worth imagining, like a meditation exercise  
deck = []
hand = []

# create deck
pips.each { |p|
	suits.each { |s|
		card = p + s 
		deck.push(card) 
	} 
} 
puts deck.length
#create hand
#choose 3 cards at random, populate hand with them, delete from deck
shuffled_deck = deck.shuffle

def deal(hand, shuffled_deck) 
	3.times {hand.push shuffled_deck.delete_at(0)}
	return hand, shuffled_deck
end

hand, shuffled_deck = deal(hand, shuffled_deck) # parallel assignment, awesome 

puts hand
puts shuffled_deck.length

#calculate total value of hand
def hand_calc(hand) 
	whichcard = 0 
	hand_value = 0  
	hand.each { |item| # You create this variable 
			  # item for the each loop but never use it, why? 
	case hand[whichcard].chr # String#char, 
	when "A" 			# would have made certain parts of my code 
		hand_value += 1 # much prettier 
	when "2"
		hand_value += 2
	when "3"
		hand_value += 3 # it may seem a little cumbersome  
	when "4"			# testing for a str for every Fixnum, no? 
		hand_value += 4 # Let me photocopy you something tho. 
	when "5"
		hand_value += 5
	when "6"
		hand_value += 6
	when "7"
		hand_value += 7
	when "8"
		hand_value += 8
	when "9"
		hand_value += 9
	else	# this else statement strikes me as very intelligent 
		hand_value += 10 
	end
	whichcard += 1 # why are you using each if you 
}					# are going to use this whichcard? 
	return hand_value
end

total_hand = hand_calc(hand)

if total_hand > 21
	puts "This hand is #{total_hand} points. BUST!"
elsif total_hand == 21
	puts "TWENTY-ONE!"
else
	puts "This hand is #{total_hand} points."
end

puts "Go again."