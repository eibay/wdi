location = "Ohio"

if location == "New York" 
	puts "Let's Go!"
elsif location == "San Francisco"
	puts "Let's Go!"
elsif location == "Dallas"
	puts "Let's Go!"
elsif location == "Alburquerque"
	puts "Let's Go!"
elsif location == "Toronto"
	puts "Let's Go!"
else
	puts "Sorry we don't quite know how to get there yet!"
end


# Alternate

location = "New York" 

case location

when "New York" 
	puts "Let's Go!"

when "San fran"
	puts "Let's Go!"

when "Dallas"
	puts "Let's Go!"

when "Alburquerque"
	puts "Let's Go!"

when "Toronto"
	puts "Let's Go!"

else
	"Let's Go!"
end

#Our algorithm is to compare 1st element in the array, 
#if its true let the user know u r good to go otherwise proceed and repeat until sufficent.
#Start by comparing location == valid_locations but make sure to do it by index, 
#valid_locations[0] etc.
#Stop repeating when we are at the end of the array.

location = "San Francisco"

valid_locations = ["New York", "San Francisco", "Dallas"]

index = 0
found_location = false

while (index < 3 && valid_locations[index] != location)
	if location == valid_locations[index] 
		puts "yes we go there"
	else
	puts "Um try again"
	end
index += 1
end

# if found_location
# 	puts "YES WE GO THERE!"
# else
# 	puts "No try again"
# end
