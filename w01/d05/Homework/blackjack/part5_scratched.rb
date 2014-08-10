require 'socket'
require 'pry'

server = TCPServer.new 2000
client = server.accept
client.puts "Welcome to Atlantic City!  Let's play some Blackjack!"
binding.pry

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
	
dealers_hand = []
dealers_total = 0
players_hand = []
players_total = 0

score = [0, 0]

dealers_hand.push(deck.delete_at(rand(0..(deck.length - 2))))
dealers_total += card_values[dealers_hand[-1][0].to_sym]
players_hand.push(deck.delete_at(rand(0..(deck.length - 2))))
players_total += card_values[players_hand[-1][0].to_sym]
dealers_hand.push(deck.delete_at(rand(0..(deck.length - 2))))
dealers_total += card_values[dealers_hand[-1][0].to_sym]
players_hand.push(deck.delete_at(rand(0..(deck.length - 2))))
players_total += card_values[players_hand[-1][0].to_sym]

client.puts "You got dealt #{players_hand[0]} and #{players_hand[1]}.  Looks like the dealer is showing #{dealers_hand[1]}."
client.puts "By the way, the dealer can see your top card, the #{players_hand[1]}.  But you knew that; you've gambled before!"
client.puts "Your total is #{players_total}- feel like hitting?  Enter Hit or Stay."

puts "All right, let's get it on!  You're showing #{dealers_hand[1]} and you've got #{dealers_hand[0]} facedown."
puts "Your opponent has a #{players_hand[1]} up.  Let's see if he decides to hit."

blackjack_time = true
player_plays = true
dealer_plays = true
while blackjack_time
	player_hits = client.gets.chomp
	if player_hits[0].downcase == "h"
		players_hand.push(deck.delete_at(rand(0..(deck.length - 2))))
		players_total += card_values[players_hand[-1][0].to_sym]
		client.puts "You get the #{players_hand[-1]}."
		puts "He hit and got the #{players_hand[-1]}."
		if players_total > 21
			client.puts "Ha ha!  You busted!  You lose!"
			puts "Nope.  He busted.  You win!"
			score[0] += 1
			blackjack_time = false
		else
			client.puts "You're up to #{players_total}."
		end
	else
		client.puts "You're gonna stand pat with #{players_total}, huh?"
		puts "He didn't hit."
		player_plays = false
	end

	if dealer_plays && blackjack_time
		client.puts "Dealer plays."
		puts "OK, what are you going to do?  You've got #{dealers_total}- Hit or Stay?"
		dealer_hits = gets.chomp
		if dealer_hits[0].downcase == "h"
			dealers_hand.push(deck.delete_at(rand(0..(deck.length - 2))))
			dealers_total += card_values[dealers_hand[-1][0].to_sym]
			puts "You get the #{dealers_hand[-1]}."
			client.puts "He takes the #{dealers_hand[-1]}."
			if dealers_total > 21
				puts "Total's #{dealers_total}.  Crud, you busted.  That mark over there wins."
				client.puts "Hey, he got the #{dealers_hand[-1]}!  You won!  How about that!"
				score[1] += 1
				blackjack_time = false
			else
				puts "That gives you #{dealers_total}."
			end
		else
			puts "Know when to hold 'em, right?"
			client.puts "The dealer stays."
			blackjack_time = false unless player_plays
		end
	end
	blackjack_time = false unless player_plays
	puts "The other guy can have another card, if he wants one." if player_plays
	client.puts "It's you again.  Hit or stay?" if player_plays
end

puts 

		












# loop do
# 	play = true
# 	hand = []
# 	holding = 0
# 	2.times do
# 		hand.push(deck.delete_at(rand(0..(deck.length - 2))))
# 		holding += card_values[hand[-1][0].to_sym]
# 	end

# 	puts "The dealer flips you these two cards."
# 	puts hand
# 	puts "Your total is #{holding}."

# 	 while play == true
# 	 	puts "Hit?  Enter yes or no."
# 	 	hit = gets.chomp
# 	 	if hit[0].downcase == "y"
# 	 		hand.push(deck.delete_at(rand(0..(deck.length - 2))))
# 	 		holding += card_values[hand[-1][0].to_sym]
# 	 		puts "The dealer gives you #{hand[-1]}"
# 	 	else
# 	 		puts "The dealer thought you said no and moved on."
# 	 		play = false
# 	 	end
# 	 	if holding > 21
# 	 		puts "You busted, you maroon!  Your total is #{holding}."
# 	 	else
# 	 		puts "Your hand this time is #{holding}."
# 	 	end
# 	 	puts "This is Atlantic City!  Let's go again!"
# 	 	play = false
# 	 end
# end




























