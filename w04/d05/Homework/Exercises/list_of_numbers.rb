require 'pry'

array = []


loop do

puts "enter a command, add or show"

response = gets.chomp

split = response.split(" ")
#binding.pry
	if 
		split[0] == "add"
		number = split[1]
		array << number
		puts "#{number} added!"
	
	elsif 
		split[0] == "show"
			puts array.join(", ")
		
	else 
		puts "unacceptable command"	

	end



end