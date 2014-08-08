
puts "What line are you starting from?"
starting_line = gets.chomp.to_sym

puts "What startion are you starting from?"
starting_station= gets.chomp

puts "what line are you ending on?"
ending_line = gets.chomp.to_sym

puts "what station are you ending on?"
ending_station = gets.chomp


MTA = {

	N: ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"],
	L: ["8th", "6th", "Union Square", "3rd", "1st"],
	Six: ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"],
	Q: ["Times Square", "Herald Square", "Union Square", "Canal St"]
	}


def stops_1_line(a,b,c,subway)
return ((subway[a.to_sym].index(b))-(subway[c.to_sym].index("Union Square"))).abs
end


if starting_line == ending_line

puts stops_1_line(starting_line, starting_station, ending_station)

else

puts (stops_1_line(starting_line, starting_station, starting_line, MTA) + stops_1_line(ending_line, ending_station, ending_line, MTA))
end
# def number_of_stops(lines, start_stop, end_stop, subway_map)
# 	return (subway_map[line].index(start_stop) - subway_map[line].index(endstop)).abs
# end

# it's good practice to have the hash you are calling from to be passed as a parameter so it can work universally
# would create a new parameter "subway" and replace it for MTA in method