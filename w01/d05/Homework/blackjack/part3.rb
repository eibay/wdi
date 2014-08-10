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

hand = Array.new
holding = 0
3.times do
	new_card = deck.delete_at(rand(0..(deck.length - 1) ) )
	new_card_value = 0
	if new_card[0] == "A"
		new_card_value = 1
	elsif new_card[0].to_i == 0
		new_card_value = 10
	elsif new_card[0].to_i == 1
		new_card_value = 10
	else
		new_card_value = new_card[0].to_i
	end
	hand << new_card
	holding += new_card_value
end

if holding > 21
	puts "You busted."
	puts "Here's your hand: #{hand}"
else
	puts "You've got #{holding}.  Here's your hand: #{hand}"
end
