# valid location
# locations, NYC, San Fran, Dallas, albuquerque, Toronto 
puts "Where would you like to go?"
location = gets.chomp
case location
	when "New York"
		puts "Yes"
	when"San Francisco"
		puts "Yes"
	when "Albuquerque"
		puts "Yes"
	when "Toronto"
		puts "Yes"
	else 
		puts "No"
end