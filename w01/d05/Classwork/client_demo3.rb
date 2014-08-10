require 'socket'
server = TCPServer.new 2000

while true
	client = server.accept
	puts "Connected!"

	game = [
		nil,
		"Paper covered your rock!  You lose!",
		"Scissors cut your paper!  You lose!",
		"Rock smashed your scissors!  You lose!"
	]

	client.puts "Play Dan in Rock, Paper, Scissors!  Enter 1 for Rock, 2 for Paper and 3 for Scissors!"
	answer = client.gets.chomp

	until [1, 2, 3].include?(answer.to_i)
		client.puts "Come on, play for real!"
		answer = client.gets.chomp
	end


	client.puts game[answer.to_i]
	client.puts "Too bad!  Try again!"

	client.close

end