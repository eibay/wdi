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

card_values = {}
2.upto(9) { |x| card_values[x.to_s.to_sym] = x }
card_values[:"1"] = 10
royals.each { |x| card_values[x.to_sym] = 10 }
card_values[:"A"] = 1


puts "How many will play?"
number_of_players = gets.chomp.to_i


server = TCPServer.new 1500

$players = []

$players << ["dealer", ["", 0, true]]

client_generator = 1
while client_generator < number_of_players
	$players[client_generator] = [server.accept, ["", 0, true]]
	client_generator += 1
end

def tell_everyone(str)
	puts str
	index = 1
	while index < $players.length
		$players[index][0].puts str
		index += 1
	end
end

tell_everyone "We're all connected!"
tell_everyone "OK it's like this:"
tell_everyone "We're gonna play BlackJack.  It's your turn when I say it is.  Until then you're just gonna wait."
score = []
number_of_players.times{score << 0}

binding.pry


























$players.each{|x| x.close}