puts "What is your destination?"
location = gets.chomp

if location == "New York" || location == "San Francisco" || location == "Dallas" || location == "Alburqurque" || location == "Toronto"
	puts "Yes, we can go there."

else
	puts "No, we cannot."
end