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
