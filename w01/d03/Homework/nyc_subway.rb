# given starting line "L" and starting stop "6th" and ending line "L" and ending stop "3rd" the program should output 2
# given starting line "L" and starting stop "6th" and ending line "N" and ending stop "28th" the program should output 3




n_line = ["n_8thSt", "UnionSq", "n_23rdSt", "n_28thSt", "n_34thSt", "n_timeSq"]
l_line = ["L_1stAve", "L_3rdAve", "UnionSq", "L_6thAve", "L_8thAve"]
six_line = ["6_astor", "UnionSq", "6_23rd", "6_28th", "6_33rd", "6_GrandC"]

starting_point = "L_3rdAve"
ending_point = "6_28th"
start_line = l_line
end_line = six_line


if start_line == end_line
 	number_of_stops = (start_line.index(starting_point) - end_line.index(ending_point)).abs

else
	first_chunk = (start_line.index(starting_point) - start_line.index("UnionSq")).abs
	second_chunk = (end_line.index(ending_point) - end_line.index("UnionSq")).abs
	number_of_stops = first_chunk + second_chunk
end

puts "Total number of stops"
puts number_of_stops

