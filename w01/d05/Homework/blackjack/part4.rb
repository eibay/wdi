	require 'pry'

deck = []
royals = ["J", "Q", "K", "A"]
suits = ["H", "C", "S", "D"]
deck_i = 0
suit_i = 0
4.times do
	2.upto(10) { |x| deck.push(x.to_s) }
	royals.each { |x| deck.push(x) }
	13.times do
		deck[deck_i] += suits[suit_i]
		deck_i += 1
	end
	suit_i += 1
end

card_values = {}
2.upto(9) { |x| card_values[x.to_s.to_sym] = x }
card_values[:"1"] = 10
royals.each { |x| card_values[x.to_sym] = 10 }
card_values[:"A"] = 1
	# card_values = {}
	# index = 0
	# while index < 52
	# 	if deck[index][0] == "A"
	# 		card_value = 1
	# 	elsif deck[index][0].to_i == 0
	# 		card_value = 10
	# 	elsif deck[index][0].to_i == 1
	# 		card_value = 10
	# 	else
	# 		card_value = deck[index][0].to_i
	# 	end
	# 	card_values[deck[index].to_sym] = card_value
	# 	index += 1
	# end
loop do

	puts "There aren't enough cards for another hand.  Go home." if deck.length < 3
	break if deck.length < 3
	play = true
	hand = []
	holding = 0
	2.times do
		hand.push(deck.delete_at(rand(0..(deck.length - 2))))
		holding += card_values[hand[-1][0].to_sym]
	end

	puts "The dealer flips you these two cards."
	puts hand
	puts "Your total is #{holding}."



	 while play == true
	 	puts "Hit?  Enter yes or no."
	 	hit = gets.chomp
	 	if hit[0].downcase == "y"
	 		hand.push(deck.delete_at(rand(0..(deck.length - 2))))
	 		holding += card_values[hand[-1][0].to_sym]
	 		puts "The dealer gives you #{hand[-1]}"
	 	else
	 		puts "The dealer thought you said no and moved on."
	 		play = false
	 	end
	 	if holding > 21
	 		puts "You busted, you maroon!  Your total is #{holding}."
	 	else
	 		puts "Your hand this time is #{holding}."
	 	end
	 	puts "This is Atlantic City!  Let's go again!"
	 	play = false
	 end
end


























