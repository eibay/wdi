
N = ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"]
L = ["8th", "6th", "Union Square", "3rd", "1st"]
Six = ["Grand Central", "33rd", "28th", "East 23rd", "Union Square", "Astor Place"]


# puts 'What train line are you starting'
# start_line = gets.chomp

# puts 'What\'s train line are you ending your trip'
# destination_line = gets.chomp

# puts 'What station are you starting from?'
# start_station = gets.chomp

# puts 'What station getting off?'
# destination_station = gets.chomp

start_line = N
start_station = "34th"
destination_line = N
destination_station = "Union Square"

if start_line != destination_line
num_stops1 = (start_line.index(start_station) - start_line.index("Union Square")).abs
num_stops2 = (destination_line.index("Union Square") - destination_line.index(destination_station)).abs

# num_stops1 = num_stops1.abs
# num_stops2 = num_stops2.abs

total_num_stops = num_stops1 + num_stops2

else
total_num_stops = (start_line.index(start_station) - destination_line.index(destination_station)).abs

# total_num_stops = total_num_stops.abs

end

puts "Your trip takes #{total_num_stops} stops."






# find the difference between the index numbers in the arrays of subway num_stops
# break each line into 2 parts, at USQ
# find the difference between the start and USQ
# find the difference between USQ and the destination
# add the 2 together for total stops

# IF the train goes through USQ, I need Start to USQ
  # plus USQ to destination

# IF the train doesn't go that far, I don't need the second part
