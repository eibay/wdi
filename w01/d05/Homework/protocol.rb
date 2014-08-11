require 'socket'
server = TCPServer.new 3000
client = server.accept
while true 
	
client.puts "Welcome to my program, hooman. Choose your adventure!"
client.puts "Press 'Enter' to continue."
client.gets
client.puts "You can choose: 'hello', 'echo', 'ping', 'guess', or 'marry, boff, kill.'"
choice = client.gets.chomp.downcase

case 
	when choice == "hello"
		client.puts "HELLO!"
	when choice == "echo"
		client.puts "Gimme a word!"
		word = client.gets.chomp
		client.puts "You said #{word}. Now gimme another word."
		another_word = client.gets.chomp
		client.puts "You said #{another_word}. Gooood job."
	when choice == "ping"
		client.puts "pong!"
	when choice == "guess"
		client.puts "Guess a number between 1 and 10."
		number = client.gets.chomp.to_i
			if number == 7
				client.puts "Correct! 100 points to Gryffindor!"
			else
				client.puts "Wrong! Ha! Ha!"
			end
	when choice == "marry, boff, kill"
		client.puts "Who would you marry?"
		marry = client.gets.chomp

		client.puts "Who would you boff?"
		boff = client.gets.chomp

		client.puts "Who would you kill?"
		kill = client.gets.chomp

		client.puts "You said you would marry #{marry}, boff #{boff}, and kill #{kill}."
		client.puts "You are desperate, horny, and homicidal. Seek help."
	else
		client.puts "Read the goddam instructions!"
	end

client.close
end

