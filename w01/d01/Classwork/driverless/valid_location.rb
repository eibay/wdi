# puts "Where do you want to go?"
# location = gets.chomp

# if location == [ "New York", "San Francisco", "Dallas", "Albaquerque", "Toronto" ]
# 	puts "Yes, we go there!"
#  else
#  	puts "No, we don't go there!"
# end

# location = "San Franciso"

# valid_locations = ["New York", "San Franciso", "Dallas"]

# index = 0
# found = false

# while index <= 2
# if location == valid_locations[index]
# found_location = true
# puts "YES, WE GO THERE!" 

# else
# puts "Nope."
# end

# index = index + 1

# if valid_locations[index] ==  location
# 	found = true
# end

# end

# if found
# 	puts "Yes we go there!"
# 	else
# 		puts "No try again"
# 	end

# new_york = "New York"
# san_fran = "San Franciso"
# valid_locations = [new_york, san_fran]


location = "San Franciso"

valid_locations = ["New York", "San Franciso", "Dallas"]

index = 0
found = false

while (index <= 2 && valid_locations[index] != location)

index = index + 1

if valid_locations[index] ==  location
	found = true
end

end

if found
	puts "Yes we go there!"
	else
		puts "No try again"
	end