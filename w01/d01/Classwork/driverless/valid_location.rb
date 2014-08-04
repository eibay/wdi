puts "Where do you want to go?"
location = gets.chomp

if location == [ "New York", "San Francisco", "Dallas", "Albaquerque", "Toronto" ]
	puts "Yes, we go there!"
else
	puts "No, we don't go there!"
end