puts "List of Numbers"

numbers =  []

loop do 
	puts "Please enter a command"
	input = gets.chomp
	input = input.split(" ")
	
	if input[0] == "add"
		numbers << input[1]
	elsif input[0] == "show"
		puts "All numbers currently in list:"
		numbers.each {|number| puts "#{number}"}
	else
		puts "Please enter 'add + [number]' to add a number to the list, or 'show' to see all numbers currently in the list."		
	end
end