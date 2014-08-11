require 'socket'

server = TCPServer.new 2000
while true	

	client = server.accept

	puts "Client connected."
	client.puts "You have connected to the server!"
	while true
		client.puts
		client.puts "Type 'echo' in front of anything you type to have it said back to you!"
		client.puts "Type ping to play ping pong!"
		client.puts "Type guess to play a number guessing game!"
		client.puts
		client.puts "Please type something:"
		choice = client.gets.chomp

		if choice.include? "echo"
			output = choice
			output[0..4] = ''
			client.puts "You said #{output}"
		end

		if choice == "ping"
			client.puts "pong"
			w = client.gets.chomp

			while w == "ping"
				client.puts "pong"
				w = client.gets.chomp
			end
		end

		if choice == "guess"

			server_num = rand(10)
			client.puts "Guess a number between 1 and 10"
			user_guess = client.gets.chomp.to_i
			unless (1..10).include?(user_guess)
				client.puts "Your guess must be from 1 to 10. Try again."
				user_guess = client.gets.chomp.to_i
				end
				if user_guess != server_num
					client.puts "Wrong! Guess again!"
					user_guess = gets.chomp.to_i
					unless (1..10).include?(user_guess)
						
				else
					client.puts "CORRECT!"	
				
				end
		end
	end
	client.close
end