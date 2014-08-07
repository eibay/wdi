loc = ["NYC", "San"]

puts("where?")
destination = gets.chomp

# loc.each {
# 	|loc| if loc == destination
# 		puts("yep")
# 	next
# 	puts("nope")
# end
# }
index = 0
found_location = false
while x < 3 && found_location
if destination == loc[index]
	puts("yep")
	found_location = true
else
	puts("nope")
	index += 1
end

