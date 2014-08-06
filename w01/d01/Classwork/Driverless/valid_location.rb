# valid_location = ["New York", "San Francisco", "Dallas", "Albuquerque", "Toronto"]

# puts "Where do you want to go?"
# destination = gets.chomp


# if valid_location.include?(destination) 
# 	puts "Let's go then."
# else 
# 	puts "No way."
# end  

#============

#i = valid_location.length

# while i >= 0
# 	is_valid = valid_location[i] == destination
# 	i = i - 1
# end

#======================

location = "San Francisco"
found_location = false
valid_location = ["New York", "San Francisco", "Dallas", "Albuquerque", "Toronto"]

index = 0

while index < 6 && found_location
if location == valid_location[index]
	found_location = true
	puts "Yes"
else
	puts "No"
end
	index += 1
end
