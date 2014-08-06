puts "Gimme location"
location = gets.chomp

# if location == "New York" || location == "San Francisco" || location == "Dallas" || location == "Albequerque" || location == "Toronto"
# 	puts "Yes"
# else puts "No"
# end

# case location
# 	when "New York"
# 		puts "Yes we go there"
# 	when "New York"
# 		puts "Yes we go there"
# 	when "New York"
# 		puts "Yes we go there"
# 	else 
# 		puts "Nope, try again."
# end

# valid_locations = ["New York", "San Francisco", "Dallas"]
# index = 0
# found = false
# # while valid_locations[index] == location && index < 3
# # 	if location == valid_locations[index]
# # 		puts "yes we go there"
# # 	else index = index + 1
# # 		puts "try again"
# # 	end
# # end
# while index <= 2
# 	if valid_locations[0] == location
# 	found = true
# 	end
# end

# if found
# 	puts "Yes we go there"
# else
# 	puts "No try again"
# end

while (index <2 && valid_locations[index] != location)
	if location ==