n: ["TSn", "34n", "28n", "23n", "USQ", "8n"]
l = ["8", "6", "USQ", "3", "1"]
six = ["Astor", "USQ", "23", "28", "33", "GC"]
q = ["TSq", "Herald Square", "USQ", "Canal St."]

puts "What line are you starting out on? (n, l, six, or q)"
start_line = MTA[gets.chomp.to_sym]
puts "What station?"
start_station = gets.chomp
puts "What line are you ending up on? (n, l, six, or q)"
destination_line = gets.chomp
puts "What's your final station?"
destination_station = gets.chomp

if start_line != destination_line
	num_stops1 = (start_line.index(start_station) - start_line.index("USQ")).abs
	num_stops2 = (destination_line.index("USQ") - destination_line.index(destination_station)).abs

#	num_stops1 = num_stops1.abs
#	num_stops2 = num_stops2.abs

	total_num_stops = num_stops1 + num_stops2

else
	total_num_stops = (start_line.index(start_station) - destination_line.index(destination_station)).abs

#	total_num_stops = total_num_stops.abs

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