# def wego
# 	locations = ["nyc", "sf", "la"]
# 	where = gets.chomp

# 	locations.each do |x|
# 	if x == where
# 		puts "we go there"
# 	else
# 		puts "we don't go there"
# 	end
# end

# wego

location = gets.chomp
found = false
valid_locations = ["nyc", "sf", "la", "dc"]

index = 0

while index < 3
	if location == valid_locations[index]
		found = true
	end 
	inded = index + 1
end

if found
	puts "we go there"
else
	puts "nah"
end

