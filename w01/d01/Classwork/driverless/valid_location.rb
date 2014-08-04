puts "Where do you want to go?"
location = gets.chomp
 

if location == "New York" || location == "San Francisco" || location == "Dallas" || location == "Albuquerque" || location == "Toronto"
	puts "ok, we are on our way"
else
	puts "sorry you are not allowd to go there"
end
puts "Happy Trails"

