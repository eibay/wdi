
n_line = ["n_8thSt", "UnionSq", "n_23rdSt", "n_28thSt", "n_34thSt", "n_timeSq"]
l_line = ["L_1stAve", "L_3rdAve", "UnionSq", "L_6thAve", "L_8thAve"]
six_line = ["6_astor", "UnionSq", "6_23rd", "6_28th", "6_33rd", "6_GrandC"]

starting_point = "L_3rdAve"
ending_point = "6_28th"
start_line = l_line
end_line = six_line


if start_line == end_line
 	number_of_stops = (start_line.index(starting_point) - end_line.index(ending_point)).abs
 	puts "Total number of stops"
	puts number_of_stops

else
	first_chunk = (start_line.index(starting_point) - start_line.index("UnionSq")).abs
	second_chunk = (end_line.index(ending_point) - end_line.index("UnionSq")).abs
	number_of_stops = first_chunk + second_chunk	
	puts "Total number of stops"
	puts number_of_stops
end

