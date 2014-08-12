## Blackjack

# ###Part 1
#   - Create an array with all the cards in a deck (2-10, J, Q, K A)
#   - **Don't** explicitly just write out an array with 52 cards
#     - You can write out a smaller array and then generate the rest
#     - Output the array of cards
# ------

# ###Part 2
# - Goal: To create a program that chooses two cards from the deck *at random* and outputs its value in blackjack.
# - To calculate the value of a hand of cards:
#   - 2-10 have the value of their number
#   - All face cards have the value of 10
#   - Ace is 1


#PART 1 - Create an array with all the cards in a deck (2-10, J, Q, K A)


# push cards with values 2-10 into this array
# add suit cards into this array
#single_suit_deck = counter ....


#trying a more simple way than populating it with push and a counter
single_suit_deck = ["2","3","4","5","6","7","8","9","10","J","Q","K","A"]

hearts = 0
diamonds = 0
clubs = 0
spades = 0

the_four_suits = ["hearts", "diamonds", "clubs", "spades"]
single_suit_deck = ["2","3","4","5","6","7","8","9","10","J","Q","K","A"]
#is there a way I could create a new array at position [0] - called hearts


#question trying to solve: how to populate a new array full_card_deck


x=0
y=0

single_deck = ["2","3","4","5","6","7","8","9","10","J","Q","K","A"]

				#Array.new(3) - to create a new array with 3 placeholders 

				# Array.new(10) {"hi"}
				# ["hi", "hi", "hi", "hi", "hi", "hi", "hi", "hi", "hi", "hi"]

				# single_suit_deck = Array.new(10) {"hi"} 
				# when i call: single_suit_deck
				# => ["hi", "hi", "hi", "hi", "hi", "hi", "hi", "hi", "hi", "hi"]


				# single_deck = ["2","3"]
				# single_suit_deck = Array.new(single_deck.length) {"hi"} 
				# => ["hi", "hi"]

				# single_suit_deck = Array.new(single_deck.length*2) {"hi"} 

				# => ["hi", "hi", "hi", "hi"]


single_deck = ["2","3","4","5","6","7","8","9","10","J","Q","K","A"]
the_four_suits = ["hearts", "diamonds", "clubs", "spades"]


goal = use a counter to populate single_suit_deck with the number of items in single_deck
		then, use another counter to populate a new variable with all cards in the 4 decks
single_suit_deck = [the_four_suits[y]+single_deck[x]]


		# single_deck = ["2","3"]
		# the_four_suits = ["hearts", "diamonds", "clubs", "spades"]


		# x=0 
		#  	single_suit_deck = Array.new(single_deck.length) {the_four_suits[1]+"_"+single_deck[x]} 
		# because x = 0 and 2 is in the 0 position, this gives us
		# => ["diamonds_2", "diamonds_2"]


# goal = use a counter to populate single_suit_deck 
# 		then, use another counter to populate a new variable with all cards in the 4 decks
#could we use this?
 #  x=0 
 #  while x < single_deck.length
 # 	single_suit_deck = Array.new(single_deck.length) {the_four_suits[1]+"_"+single_deck[x]} 
 #  	x += 1
 # end 


# smaller example to test
# single_deck = ["2","3"]
# x=0 
#   while x < single_deck.length
#  	single_suit_deck = Array.new(single_deck.length) {single_deck[x]} 
#   	x += 1
#  end 
#it doesnt like this equation. why? looks like we're only giving it one value to fill for two spots, which is fine
#but in a loop, it's not going to work, because it's already filled both allotted spaces on the first iteration

		# my guess: =>
		# [diamonds_2,
		# diamonds_2,
		# diamonds_3,
		# diamonds_3]


#other examples below thru yellow

single_suit_deck = Array.new(single_deck.length) {"hi"} 
#this gives me hi '13' times because that is the number of items in single_deck array

single_suit_deck = Array.new(single_deck.length) {the_four_suits[1]+"_"+single_deck[1]} 
(diamonds 3 = my guess)
=> gave 'diamonds_3 13 according to single_deck.length
["diamonds_3",
 "diamonds_3",
 "diamonds_3",
 "diamonds_3",
 "diamonds_3",
 "diamonds_3",
 "diamonds_3",
 "diamonds_3",
 "diamonds_3",
 "diamonds_3",
 "diamonds_3",
 "diamonds_3",
 "diamonds_3"]'


single_suit_deck = [the_four_suits[y]+single_deck[x]]
#why does my code turn yellow?
(because i copied the return values from pry)

# **** just leftover yellow text here. kept it b/c keeping it here keeps text below from turning yellow
BUT WHEN WOULD IT BE USEFUL TO PUT A HASH INSIDE AN ARRAY ESP. IF YOU CAN'T REF THE INDEX OF IT?

# could we create the deck with a hash? what is the syntax for that? why might we want
# to create the full deck with a hash instead of an array?
# full_card_deck = {[hearts: single_suit_deck],[diamonds: single_suit_deck], [clubs: single_suit_deck], [spades: single_suit_deck]}

full_card_deck = [single_suit_deck, single_suit_deck, single_suit_deck, single_suit_deck] 
#creates an array 

full_card_deck = {[hearts: single_suit_deck], [diamonds: single_suit_deck], [clubs: single_suit_deck], [spades: single_suit_deck]} 
#this version gave me a syntax error. i think the square brackets were unecessary.

full_card_deck = [[hearts: single_suit_deck], [diamonds: single_suit_deck], [clubs: single_suit_deck], [spades: single_suit_deck]] 
#this version returned a hash inside an array, inside a hash
#BUT I WAS ABLE TO DO full_card_deck[1] => AND GOT THE DIAMONDS HASH!
BUT full_card_deck[1][1] => nil :( 


full_card_deck = [hearts: single_suit_deck, diamonds: single_suit_deck, clubs: single_suit_deck, spades: single_suit_deck] 
# this put a hash inside the array. but if i do full_card_deck[1]it returns nil. Don't know if it can 'read'
# 	index positions in this structure. (side bar full_card_deck[0] returns the whole set.)
# **** I WOULD USE THIS STRUCTURE NEXT TIME I NEED TO PUT A HASH INSIDE OF AN ARRAY. 
# **** BUT WHEN WOULD IT BE USEFUL TO PUT A HASH INSIDE AN ARRAY ESP. IF YOU CAN'T REF THE INDEX OF IT?


#this is what i tried first in class on Friday. it gives us the right number of cards, 
#but they're just value only, without suit
# full_card_deck = [single_suit_deck, single_suit_deck, single_suit_deck, single_suit_deck] 
# #creates an array 

# puts full_card_deck



goal = use a counter to populate single_suit_deck 
		then, use another counter to populate a new variable with all cards in the 4 decks

#Now we try using .push method

single_deck = ["2","3"]
single_deck.push("4")
# ==> ["2","3","4"]

to populate single_suit_deck

#test 1
 # x=0 
 # basic_deck = ["2","3"]
 # the_four_suits = ["hearts", "diamonds", "clubs", "spades"]
 # single_suit_deck = []
 # single_suit_deck.push(the_four_suits[1]+"_"+basic_deck[1])
#i think i'll get => [diamonds_3] - yup i did!

#test 2 
x=0 
basic_deck = ["2","3"]
the_four_suits = ["hearts", "diamonds", "clubs", "spades"]
single_suit_deck = []

while x < basic_deck.length do
 	single_suit_deck.push(the_four_suits[1]+"_"+basic_deck[x]) 
  	x += 1
end 

#i think i'll get => [diamonds_2, diamonds_3] NOPE - i got nil :(

#test 2 
x=0 
basic_deck = ["2","3"]
the_four_suits = ["hearts", "diamonds", "clubs", "spades"]
single_suit_deck = []

while x < basic_deck.length do
 	single_suit_deck.push(basic_deck[x]) 
  	x += 1
end 

got => nil :(



#test 3
x=0 
basic_deck = ["2","3"]
the_four_suits = ["hearts", "diamonds", "clubs", "spades"]
single_suit_deck = []

while x < 3 do
 	single_suit_deck.push(basic_deck[x]) 
  	x += 1
end 

got => nil again

#Question to ask = would this .push approach actually work

#NEXT THING = CHECK WHAT LISA DID FOR PART 2, SEE IF THERE ARE CLUES FOR THIS (it was confusing :()
#NEXT NEXT THING - try the 'each' enumerator

			#How .each works

			# stooges = ['Larry', 'Curly', 'Moe']

			# stooges.each { |stooge| print stooge + "\n" }

			# This will produce the following output:
			#  Larry Curly Moe

			# test = stooges.each { |stooge| print stooge + "\n" }
			# this just returns the original array - WHY?	
# Test 1

basic_deck = [2, 3]
basic_deck.each { |new_num| new_num + 1}
just returnd [2, 3] :(

# Test 2
basic_deck = [2, 3]
basic_deck.each { |new_num| puts new_num+1 }
#this version works because it output using puts
#returned => 3, 4 - yay!

# Test 3
#what if instead of print we assign result to a variable?

basic_deck = [2, 3]
new_deck = basic_deck.each { |new_num| new_num+1 }
this gave me just original array [2,3], not [3, 4]

# Test 4
new_deck = basic_deck.each { |new_num| puts new_num+1 }
this returns [3, 4]
BUT when I call new_deck - it just retuns original array [2,3] not [3, 4]


# Test 5 
# not sure why the variable assigning isn't working, 
# but here's what i think some version of my full suit equation would look like

basic_deck = ["2", "3"]
the_four_suits = ["hearts", "diamonds", "clubs", "spades"]

diamond_deck = basic_deck.each { |unique_diamond| the_four_suits[1]+"_"+unique_diamond }
this gave me => just original array [2,3] :(

# Test 6
# going to try the other .each structure

basic_deck = ["2", "3"]
the_four_suits = ["hearts", "diamonds", "clubs", "spades"]

basic_deck.each do |unique_diamond| 
	puts the_four_suits[1]+"_"+unique_diamond
end

this actually gave me the right answer, so part of my issue above = syntax
but can I assign it to a variable?

diamond_deck = basic_deck.each do |unique_diamond| 
	puts the_four_suits[1]+"_"+unique_diamond
end

this does the calculation, giving ["3","4"]
but when I call diamond_deck by itself, i just get the original array ["2", "3"]


#PART 2 - 
###Part 2
- Goal: To create a program that chooses two cards from 
the deck *at random* and outputs its value in blackjack.
- To calculate the value of a hand of cards:
  - 2-10 have the value of their number
  - All face cards have the value of 10
  - Ace is 1

full_card_deck.sample(4)
#tried this on a simple array and it worked. didn't work on a nested array.
#if i have to make this work on a complex array, 
#i would get it to pull out a single element using an index, but if i specify 
#the index, then it won't be random.
#so - QUESTION = HOW TO PULL RANDOM NUMBERS OUT OF NESTED ARRAY AND KEEP PROCESS RANDOM?



spades = full_card_deck[0] # I THINK THIS ACTUALLY ASSIGNS THE NAME SPADES TO THIS SPOT
#TRY AND SEE
clubs = full_card_deck[1]
hearts = full_card_deck[2]
diamonds = full_card_deck[3]


#later - could we do a while loop to fill indexes 2 = 10?
single_suit_deck[0] = 2
single_suit_deck[1] = 3
single_suit_deck[2] = 4
single_suit_deck[3] = 5
single_suit_deck[4] = 6
single_suit_deck[5] = 7
single_suit_deck[6] = 8
single_suit_deck[7] = 9
single_suit_deck[8] = 10
single_suit_deck[9] = 10
single_suit_deck[10] = 10
single_suit_deck[11] = 10
single_suit_deck[12] = 10




