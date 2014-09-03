require 'pry'

numbers = []

loop do

puts "Please enter a command"
command = gets.chomp.downcase

	if command.include?('add')
		number = command.split(" ")[1]
		empty_array = numbers.push(number)
		puts "#{number} added!"

	else command.include?('show')
			puts numbers.join(", ")
	end

end