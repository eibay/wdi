# puts("Where do you want to go?")

# locations= ["NEW YORK", "SAN FRANCISCO", "DALLAS", "ALBUQUERQUE" , "TORONTO"]
# location= gets.chomp.upcase
# if locations.include? location
# 	puts ("yes, we can go there")
# else
# 	puts("invalid location")
# end
puts("Where do you want to go?")

locations= ["NEW YORK", "SAN FRANCISCO", "DALLAS", "ALBUQUERQUE" , "TORONTO"]
location= gets.chomp.upcase
count= locations.count
index=0
found = false
while  index < count 
	if location == locations[index]
    found = true
		end

	index += 1
	end

if found
	puts "yes"
else 
	puts "no"
end
