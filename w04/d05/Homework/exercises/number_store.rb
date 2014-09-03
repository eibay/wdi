require 'pry'

numbers = []


loop do

	puts "Please enter in a command"
	command = gets.chomp

	if command.split(" ")[0].downcase == "add"
		numbers << command.split(" ")[1]
		puts "#{command.split(" ")[1]} added!"
	elsif command.split(" ")[0] == "show"
		puts numbers.join(", ")
	else
		puts "Invalid command"
	end


end

