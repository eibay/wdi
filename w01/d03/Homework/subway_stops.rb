subways = {
	n: {
		"Time Square" => 0, 
		"34th" => 1, 
		"28th" => 2, 
		"23rd" => 3, 
		"Union Square" => 4, 
		"8th" => 5
	},
	l: {
		"8th" => 0,
		"6th" => 1,
		"Union Square" => 2,
		"3rd" => 3,
		"1st" => 4
	},
	six: {
		"Grand Central" => 0,
		"33rd" => 1,
		"28th" => 2,
		"23rd" => 3,
		"Union Square" => 4,
		"Astor Pl." => 5
	},
	q: {
		"Time Square" => 0,
		"Herald Square" => 1,
		"Union Square" => 2,
		"Canal St." => 3,
	}
}

puts "What is your current location?"
starting_stop = gets.chomp.to_s

if (subways[:n].include?(starting_stop) || subways[:l].include?(starting_stop) || 
		subways[:six].include?(starting_stop) || subways[:q].include?(starting_stop))	

	puts "Okay,what is your destination?"
	
else 
	puts "Sorry, don't know what #{ending_stop} is.  Run again." 
	Process.exit(0)
end

ending_stop = gets.chomp.to_s

if (subways[:n].include?(ending_stop) || subways[:l].include?(ending_stop) || 
	subways[:six].include?(ending_stop) || subways[:q].include?(ending_stop))	

	puts "These are your available lines"
else
	puts "Sorry, don't know what #{ending_stop} is.  Run again." 
	Process.exit(0)	
end


if subways[:n].include?(starting_stop)
	puts "N"
elsif subways[:l].include?(starting_stop)
	puts "L"
elsif subways[:six].include?(starting_stop)
	puts "Six"
elsif subways[:q].include?(starting_stop)
	puts "Q"
end

# if subways[:n].include?(ending_stop)
# 	puts "N"
# elsif subways[:l].include?(ending_stop)
# 	puts "L"
# elsif subways[:six].include?(ending_stop)
# 	puts "Six"
# elsif subways[:q].include?(ending_stop)
# 	puts "Q"
# end

puts "What train would you like to take?"
starting_line = gets.chomp.to_sym.downcase

puts "These are your available lines to get to #{ending_stop}."

if subways[:n].include?(ending_stop)
	puts "N"
elsif subways[:l].include?(ending_stop)
	puts "L"
elsif subways[:six].include?(ending_stop)
	puts "Six"
elsif subways[:q].include?(ending_stop)
	puts "Q"
end

puts "What line would you like to take?"
ending_line = gets.chomp.to_sym.downcase


# starting_line = subways[:l]
# starting_stop = subways[:l]["8th"]

# ending_line = subways[:six]
# ending_stop = subways[:six]["33rd"]

st_ln = subways[starting_line]
en_ln = subways[ending_line]
st_st = subways[starting_line][starting_stop]
en_st = subways[ending_line][ending_stop]

if starting_line == ending_line
	stops_total = (en_st - st_st).abs
else 
	stops_total = (st_ln["Union Square"] - st_st).abs + (en_ln["Union Square"] - en_st).abs
end

if stops_total == 1
	puts "It will take you #{stops_total} stop to reach your destination.  Thank you."
else 
	puts "It will take you #{stops_total} stops to reach your destination.  Thank you."
end



