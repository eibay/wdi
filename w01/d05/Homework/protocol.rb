require 'pry'
require 'socket'
server = TCPServer.new 2000
client = server.accept

puts "CONNECTION HAS HAPPENED"

client.puts "YOU ARE CONNECTED.  THE PROTOCOL HAS BEGUN."
exit = false
while !exit

	input = client.gets.chomp

	client.puts "HELLO!" if input.include?("hello")

	client.puts "You said " + input.split(" ")[1..-1].join(" ") if input.split(" ")[0] == "echo"

	exit = true if input.downcase == "exit"

	client.puts "pong" if input == "ping"

	if input == "guess"
		client.puts "guess a number between 1 and 10"
		answer = rand(1..5)
		guess = client.gets.chomp
		if guess == answer
			client.puts "correct!"
		else
			client.puts "wrong!  the answer was #{answer}"
		end
		
	end

end

client.close

