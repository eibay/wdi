# location = "Boston"

# if (location == "New York")
#   puts "Yes we go there!"
# elsif location == "San Francisco"
#   puts "Yes we go there!"
# elsif location == "Dallas"
#     puts "Yes we go there!"
# else
#   puts "Um...try again"
# end

# location = "Boston"

# case location
# when (location == "New York") || (location == "Dallas") || (location == "San Francisco")
# 	puts "Yes we go there!"
# else
# 	puts "Try again... :("
# end

# new_york = "New York"
# san_fran = "San Francisco"
# dallas = "Dallas"
# valid_location = [new_york, san_fran, dallas]

location = "San Francisco"

valid_locations = ["New York" , "San Francisco", "Dallas"]

i = 0

while (i < valid_locations.length && valid_locations[i] != location)
	if location == valid_locations[i]
		puts "Good to go"
	else
		puts "Umm... Try again."
	end
	i += 1
end


