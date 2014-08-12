require 'pry'
require 'socket'


puts "How many will play?"
number_of_players = gets.chomp.to_i

server = TCPServer.new 2000
$client = []
player_generator = 1
while player_generator < number_of_players
	$client[player_generator] = server.accept
	player_generator += 1
end
def tell_everyone(str)
	puts str
	index = 1
	while index < $client.length
		$client[index].puts str
		index += 1
	end
end

tell_everyone "We're all connected!"

$client.close