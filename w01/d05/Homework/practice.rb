require'pry'

puts "User Input please"
user_input = gets.chomp.downcase

if user_input == "hello" then puts "HELLO!!!"

elsif user_input == "ping" then puts "pong"

elsif user_input == "echo"
	puts "Gimme word"
	user_echo = gets.chomp
	puts "You said #{user_echo}. Gimme another"
	user_echo_2 = gets.chomp
	puts "Lol. #{user_echo_2} is soo right."

elsif user_input == "guess"
	puts "Guess a number through 1 and 10"
	user_guess = gets.chomp.to_i
	if user_guess == 3
		puts "Correct!"
	else 
		puts "Wrong!"
	end

else 
	puts "I don't understand"
end




