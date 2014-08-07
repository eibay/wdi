mta = {
	n: ["TSn", "34n", "28n", "23n", "USQ", "8n"],
	l: ["8", "6", "USQ", "3", "1"],
	six: ["Astor", "USQ", "23", "28", "33", "GC"],
	q: ["TSq", "Herald Square", "USQ", "Canal St."]
}

# puts "What line are you starting out on? (n, l, six, or q)"
#line = mta[gets.chomp.to_sym]
# puts "What station?"
# start_station = gets.chomp
# puts "What line are you ending up on? (n, l, six, or q)"
# destination_line = mta[gets.chomp.to_sym]
# puts "What's your final station?"
# destination_station = gets.chomp

def stopdiff(line, start_station, destination_station)
	return (line.index(start_station) - line.index(destination_station)).abs
end

numberstops = stopdiff(mta[:n], "34n", "USQ")
puts numberstops
