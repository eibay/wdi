require 'pry'

entered = []
counter = 0
puts "available commands are add, show, or end"

while counter == 0
	puts "Please enter a command"
	answer = gets.chomp

	if answer.split(" ")[0] == "add"
		entered<<answer.split(" ")[1]
		puts "#{answer.split(" ")[1]} added!"
	elsif answer == "show"
		entered = entered.join(", ")
		puts entered
	elsif answer == "end"
		counter += 1
	else puts "Sorry, I don't know that command"
	end
end