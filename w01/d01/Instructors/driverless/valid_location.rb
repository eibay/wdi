# location = "San Fisco"

# if (location == "New York")
#   puts "Yes we go there!"
# elsif location == "San Francisco"
#   puts "Yes we go there!"
# elsif location == "Dallas"
#     puts "Yes we go there!"
# else
#   puts "Um...try again"
# end

# case location
# 	when "New York"
# 		puts "yes we go there"
# 	when "San Francisco"
# 		puts "yes there too"
# 	when "Dallas"
# 		puts "sure"
# 	else
# 		puts "try again"
# end
# # this is the same algorithm as above, but with case, it's more streamlined)
# # could also do a method for the puts statement affirming if same text


# # or you could do it with an array, as below, which is less cumbersome

# Using index to access particular items in arrays
# foods = ["cake", "cookies", "shark"] 
# puts foods [2] #will return shark=end



location = "San Francisco"
valid_locations = ["New York", "San Francisco", "Dallas"] 
index = 0
found = false   #this operates like a switch; to be turned off when valid_location == location
while index <= 2
	if valid_locations[index] == location
	found = true  #here's where the switch is turned off
end
	index = index + 1 # this is the iteration through the positions on the index of the array
end
if found
	puts "Yes we go there"
else
	puts "No try again"
end

