puts "Where would you like to go?"
location = gets.chomp

valid_location = ["New York", "San Francisco", "Dallas"]
valid_location.each { |place| if place == location puts "we go there"}  
end