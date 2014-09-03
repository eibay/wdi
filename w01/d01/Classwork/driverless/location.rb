location = "San Francisco"

valid_locations = ["New York", "San	Francisco", "Dallas"]

# new_york = "New York"
# san_fran = "San Francisco"
# dallas = "Dallas"
# valid_locations = [new_york, san_fran, dallas]

index = 0
found = false

while (index <= 2 && valid_locations[index] != location)
	if location == valid_locations[index]
		puts "YES WE GO THERE!"
	else
		puts "umm. try again"
	end
	
	index = index + 1

# if valid_locations[index] == location
# 	found = true
# end


end

# if found
# 	puts "yes we go there!"
# else
# 	puts "no we don't go there!"
# end





#if (location == "New York") || (location == "San Francisco") || (location == "Dallas") || (location == "Albequerque") || (location =="Toronto")
#	puts "we go there"
# elsif location == "San Francisco"
# 	puts "Yes we go there!"
# elsif location == "Dallas"
# 	puts "Yes we go there!"
#else 
#	puts "we dont go there sorry!"
#end

# case location
# when "New York"
# 	puts "yes!"
# when "San Francisco"
# 	puts "yep"
# when "Dallas"
# 	puts "uh huh"
# else 
# 	puts "try again"
# end

