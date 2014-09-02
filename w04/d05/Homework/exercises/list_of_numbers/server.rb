#####################
###List of Numbers###
#####################

list = []

loop do
	puts "Please enter in a command"
	user_input = gets.chomp
	
	puts 
	if user_input == "show"
		print list
	else
		number = user_input.split(' ')[1].to_i
		list << number
		puts "#{number} added!"	
	end
end