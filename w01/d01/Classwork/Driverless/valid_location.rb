valid_location = ["New York", "San Francisco", "Dallas", "Albuquerque", "Toronto"]

puts "Where do you want to go?"
destination = gets.chomp

#i = valid_location.length

# while i >= 0
# 	is_valid = valid_location[i] == destination
# 	i = i - 1
# end



if valid_location.include?(destination) 
	puts "Let's go then."
else 
	puts "No way."
end  


=begin
=========

if location == "New York" || location == "San Francisco" || 

	or

	if location == "New York"
	elsif location == "San Francisco:
	elsif 


			"

			==============
=end