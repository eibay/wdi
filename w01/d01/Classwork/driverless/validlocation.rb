locations = ["New York", "San Francisco", "Dallas", "Alburquerque", "Toronto"]

puts "Where do you want to go?"
location = gets.chomp

if locations.include?location
	puts "Yeah we go there!"
else
	puts "Sorry, this car does not go there."
end

#Using case statement to achieve the same functionality

# location = "Dallas"
# case location
# when "New York"
# 	puts "Yes, we go there!"
# when "San Francisco"
# 	puts "Yes, there too!"
# when "Dallas"
# 	puts "Sure."
# else
# 	puts "Umm... try again :("
# end

# Using while loops 
# Compare location to each element in the array