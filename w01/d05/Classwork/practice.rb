

# puts "input please"

# user_said = gets.chomp

# if 









# require 'socket'

# server = TCPServer.new 2000
# client = server.accept

# puts "What's your name?"
# user_said = gets.chomp
# puts "Nice to meet you, #{user_said}. Where are you from?"
# user_location = gets.chomp
# puts "Oh, that's awesome! I'm from #{user_location} too!"

# close

require 'pry'

puts "input please"


user_said = gets.chomp
	
	if user_said == "hello" then puts "Hello!"
	end


	elsif user_said == "echo"
		puts "What word?"
		user_echo = gets.chomp
		puts "You said #{user_echo}. Do you have another word?"
		user_echo_another = gets.chomp
		puts "You said #{user_echo_another}."


	elsif user_said == "ping" then puts "Pong"

	elsif user_said == "guess"
		puts "Guess a number between 1 and 10"
		user_guess = gets.chomp
		number = 3

			if user_guess.to_i == number
				puts "Correct!"
			else 
				puts "Wrong!"
			end

	else
	puts "I do not understand." 

	
end









