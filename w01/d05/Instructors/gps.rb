puts "Where do you want to go?"
requested_location = gets.chomp

locations = ["New York", "San Francisco", "Dallas"]

if locations.include?(requested_location)
  puts "YES we go here"
else
  puts "NOPE"
end