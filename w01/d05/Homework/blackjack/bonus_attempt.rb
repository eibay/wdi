require 'pry'
require 'socket'
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

def players_playing(array)
	total = 0
	array.each do |hash|
		total += 1 if hash[:playing]
	end
	total
end

card_values = {}
2.upto(9) { |x| card_values[x.to_s.to_sym] = x }
card_values[:"1"] = 10
royals.each { |x| card_values[x.to_sym] = 10 }
card_values[:"A"] = 1


puts "How many will play?"
number_of_players = gets.chomp.to_i


server = TCPServer.new 1500

$players = []

$players[0] = {
	hand: [],
	total: 0,
	playing: true,
	busted: false,
	player: "dealer"
}

client_generator = 1
while client_generator < number_of_players
	$players[client_generator] = {
		hand: [],
		total: 0,
		playing: true,
		busted: false,
		player: server.accept
	}
	client_generator += 1
end

def tell_everyone(str)
	puts str
	index = 1
	while index < $players.length
		$players[index][:player].puts str
		index += 1
	end
end

tell_everyone "We're all connected!"
tell_everyone "OK it's like this:"
tell_everyone "We're gonna play BlackJack.  It's your turn when I say it is.  Until then you're just gonna wait."
score = []
number_of_players.times{score << 0}

loop do

	deck = unshuffled_deck.shuffle

	$players.each do |player|
		2.times do
			player[:hand].push(deck.pop)
			player[:total] += card_values[player[:hand][-1][0].to_sym]
		end
	end

	while $players[0][:playing] && !$players[0][:busted]
		puts "Here's your hand: #{$players[0][:hand]}."
		puts "Your total is #{$players[0][:total]}."
		puts "Do you hit?"
		hit = gets.chomp
		if hit[0].downcase == "y"
			$players[0][:hand].push(deck.pop)
			$players[0][:total] += card_values[$players[0][:hand][-1][0].to_sym]
			puts "The #{$players[0][:hand][-1]} is dealt."
			if $players[0][:total] > 21
				puts "You busted at #{$players[0][:total]}!"
				$players[0][:busted] = true
			end
		else
			puts "Ok, you stand with #{$players[0][:total]}."
			$players[0][:playing] = false
		end
	end

	client_play_ind = 1
	while client_play_ind < $players.length
		binding.pry
		while $players[client_play_ind][:playing] && !$players[client_play_ind][:busted]
			$players[client_play_ind][:player].puts "Here's your hand: #{$players[client_play_ind][:hand]}."
			$players[client_play_ind][:player].puts "Your total is #{$players[client_play_ind][:total]}."
			$players[client_play_ind][:player].puts "Do you hit?"
			hit = $players[client_play_ind][:player].gets.chomp
			if hit[0].downcase == "y"
				$players[client_play_ind][:hand].push(deck.pop)
				$players[client_play_ind][:total] += card_values[$players[client_play_ind][:hand][-1][0].to_sym]
				$players[client_play_ind][:player].puts "The #{$players[client_play_ind][:hand][-1]} is dealt."
				if $players[client_play_ind][:total] > 21
					$players[client_play_ind][:player].puts "You busted at #{$players[client_play_ind][:total]}!"
					$players[client_play_ind][:busted] = true
				end
			else
				$players[client_play_ind][:player].puts "Ok, you stand with #{$players[client_play_ind][:total]}."
				$players[client_play_ind][:playing] = false
			end
			client_play_ind += 1
		end
	end


	binding.pry
	$players[0] = {
		hand: [],
		total: 0,
		playing: true,
		busted: false,
		player: "dealer"
	}

	client_generator = 1
	while client_generator < number_of_players
		$players[client_generator][:hand] = []
		$players[client_generator][:total] = 0
		$players[client_generator][:playing] = true
		$players[client_generator][:busted] = false
		client_generator += 1
end

	



end
























$players.each{|x| x.close}