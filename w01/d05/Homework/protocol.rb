require 'socket'

server = TCPServer.new 2000
client = server.accept

client.puts "Please enter one of the following: Hello, Echo, Ping, Guess "

user_input = client.gets.chomp.downcase

if user_input == "hello" then client.puts "HELLO!!!"

elsif user_input == "ping"  
	
	client.puts "pong. Play again?"
	user_answer = gets.chomp.downcase

		answer == 'yes'
		while 
			if answer
				puts "pong. Play again?"
			else 
				puts "Ok. Bye!"
			end
		end

	while user_answer == 'yes'
		play_again(user_answer)
	end


elsif user_input == "echo"
	client.puts "Gimme word"
	user_echo = client.gets.chomp
	client.puts "You said #{user_echo}. Gimme another"
	user_echo_2 = client.gets.chomp
	client.puts "L-O-L. #{user_echo_2} is soo right."

elsif user_input == "guess"
	client.puts "Guess a number through 1 and 10"
	user_guess = client.gets.chomp.to_i
	if user_guess == 5
		client.puts "Correct!"
	else 
		client.puts "Wrong!"
	end

else 
	client.puts "I don't understand"

client.close	

end
