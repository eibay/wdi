
mta = {
	n: ["TSn", "34n", "28n", "23n", "USQ", "8n"],
	l: ["8", "6", "USQ", "3", "1"],
	six: ["Astor", "USQ", "23", "28", "33", "GC"],
	q: ["TSq", "Herald Square", "USQ", "Canal St."]
}

puts "What line are you starting out on? (n, l, six, or q)"
start_line = mta[gets.chomp.to_sym]
puts "What station?"
start_station = gets.chomp
puts "What line are you ending up on? (n, l, six, or q)"
destination_line = mta[gets.chomp.to_sym]
puts "What's your final station?"
destination_station = gets.chomp

def stopdiff(line, start, destination)
	return (line.index(start) - line.index(destination)).abs
end

if start_line != destination_line
	num_stops1 = (start_line.index(start_station) - start_line.index("USQ")).abs
	num_stops2 = (destination_line.index("USQ") - destination_line.index(destination_station)).abs

	total_num_stops = num_stops1 + num_stops2

else
	total_num_stops = stopdiff(start_line, start_station, destination_station)

end

	puts "Your trip takes #{total_num_stops} stops."


