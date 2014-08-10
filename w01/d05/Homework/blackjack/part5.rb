require 'socket'
require 'pry'

server = TCPServer.new 2000
client = server.accept
client.puts "Welcome to Atlantic City!  Let's play some Blackjack!"

unshuffled_deck = []
deck = []
royals = ["J", "Q", "K", "A"]
suits = ["H", "C", "S", "D"]
unshuffled_deck_i = 0
suit_i = 0
4.times do
	2.upto(10) { |x| unshuffled_deck.push(x.to_s) }
	royals.each { |x| unshuffled_deck.push(x) }
	13.times do
		unshuffled_deck[unshuffled_deck_i] += suits[suit_i]
		unshuffled_deck_i += 1
	end
	suit_i += 1
end

card_values = {}
2.upto(9) { |x| card_values[x.to_s.to_sym] = x }
card_values[:"1"] = 10
royals.each { |x| card_values[x.to_sym] = 10 }
card_values[:"A"] = 1
	

score = [0, 0]
loop do

	deck = unshuffled_deck.shuffle
	deck_exhausted = false

	until deck_exhausted

		dealers_hand = []
		dealers_total = 0
		players_hand = []
		players_total = 0

		2.times do
			players_hand.push(deck.pop)
			players_total += card_values[players_hand[-1][0].to_sym]
			dealers_hand.push(deck.pop)
			dealers_total += card_values[dealers_hand[-1][0].to_sym]
		end	

		puts "You've been dealt #{dealers_hand[0]} and #{dealers_hand[1]}."
		puts "Your total is #{dealers_total}."
		client.puts "You've been dealt #{players_hand[0]} and #{players_hand[1]}."
		client.puts "That makes your total #{players_total}."

		play_is_over = false
		player_stands = false
		dealer_stands = false
		showdown = true

		until play_is_over

			unless player_stands || play_is_over
				puts "Let's see if your opponent hits."
				client.puts "Enter Hit or Stay."
				if client.gets.chomp.downcase[0] == "h"
					if deck.length > 0
						players_hand.push(deck.pop)
						players_total += card_values[players_hand[-1][0].to_sym]
						client.puts "You were dealt #{players_hand[-1]}."
						puts "Your opponent hit."
						if players_total > 21
							client.puts "Oh no!  You have #{players_total}.  You busted!"
							puts "Bust!  You win!"
							play_is_over, showdown = true, false
							score[0] += 1
						else
							puts "The player took one card."
							client.puts "Your total is #{players_total}."
						end
					else
						client.puts "The last card has already been dealt.  This hand is a push."
						puts "The player requested a card but all have been dealt.  This hand is a push."
						play_is_over, deck_exhausted, showdown = true, true, false
					end
				else
					client.puts "You've decided to stay with #{players_total}."
					puts "The player declined to hit."
					player_stands = true
				end
			end

			unless dealer_stands || play_is_over
				puts "Your turn.  Enter Hit or Stay."
				client.puts "Will the dealer hit?"
				if gets.chomp.downcase[0] == "h"
					if deck.length > 0
						dealers_hand.push(deck.pop)
						dealers_total += card_values[dealers_hand[-1][0].to_sym]
						puts "You were dealt #{dealers_hand[-1]}."
						client.puts "The dealer takes a card."
						if dealers_total > 21
							puts "Nope.  You have #{dealers_total}.  You busted."
							client.puts "Dealer busts.  You win!"
							play_is_over, showdown = true, false
							score[1] += 1
						else
							puts "Your total is #{dealers_total}."
							client.puts "Dealer does not bust.  Play continues."
						end
					else
						puts "The last card has already been dealt.  This hand is a push."
						client.puts "The dealer requested a card but all have been dealt.  This hand is a push."
						play_is_over, deck_exhausted, showdown = true, true, false
					end
				else
					puts "You've stood with #{dealers_total}."
					client.puts "Dealer holds."
					dealer_stands = true
				end
			end
			play_is_over = true if player_stands && dealer_stands
			deck_exhausted = true if deck.length < 4
		end

		if showdown
			if dealers_total == players_total
				puts "You tie.  It's a push"
				client.puts "You tie.  It's a push"
			elsif dealers_total > players_total
				puts "You win!  Your opponent had #{players_total}."
				client.puts "Too bad!  The dealer had #{dealers_total}.  You lose."
				score[0] += 1
			else
				client.puts "You win! Your opponent had #{dealers_total}."
				puts "Too bad!  The player had #{players_total}.  You lose."
				score[1] += 1
			end
		end

		if deck_exhausted
			puts "Here's the win tally.  Dealer: #{score[0]} and Player: #{score[1]}"
			client.puts "Here's the win tally.  Dealer: #{score[0]} and Player: #{score[1]}"
			puts "The deck reshuffles and the game resumes."
			client.puts "The deck reshuffles and the game resumes."
		else
			puts "A new game commences."
			client.puts "A new game commences."
		end
		binding.pry
	end
end

























