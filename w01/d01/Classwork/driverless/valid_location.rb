puts "Where do you want to go?"
location = gets.chomp

valid_locations = ["New York", "San Francisco", "Dallas"]

if valid_locations.include?(location)
	puts "Yes"
else 
	puts "No"
end

# case location
# when "New York"
# 	puts "Yes"
# when "San Francisco"
# 	puts "Yes"
# when "Dallas"
# 	puts "Yes"
# when "Albuquerque"
# 	puts "Yes"
# when "Toronto"
# 	puts "Yes"
# else 
# 	puts "No"
# end