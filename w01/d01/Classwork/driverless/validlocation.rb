locations = ["New York", "San Francisco", "Dallas", "Alburquerque", "Toronto"]

puts "Where do you want to go?"
location = gets.chomp

if locations.include?location
	puts "Yeah we go there!"
else
	puts "Sorry, this car does not go there."
end