



subway_system = 
{starting_line: {
	starting_n_stops: ["Times Square", "34th", "W 28th", "W 23rd", "Union Square", "8th"], 
	starting_l_stops: ["8th", "6th", "Union Square", "3rd", "1st"],
	starting_six_stops: ["Grand Central", "33rd", "E 28th", "E 23rd", "Union Square", "Astor Place"]
},
ending_line: {
	ending_n_stops: ["Times Square", "34th", "W 28th", "W 23rd", "Union Square", "8th"], 
	ending_l_stops: ["8th", "6th", "Union Square", "3rd", "1st"],
	ending_six_stops: ["Grand Central", "33rd", "E 28th", "E 23rd", "Union Square", "Astor Place"]
	}
}

origin = "W 28th"
pertinent_starting_line = subway_system[:starting_line].key(origin)

number_of_stops_to_union_sq = ((subway_system[:starting_line][pertinent_starting_line].index("Union Square")) - subway_system[:starting_line][pertinent_starting_line].index(origin)).abs

destination = "8th"
pertinent_ending_line = subway_system[:starting_line].key(destination)
number_of_stops_from_union_sq = ((subway_system[:ending_line][pertinent_ending_line].index(destination)) - subway_system[:ending_line][pertinent_ending_line].index("Union Square")).abs

total_number_of_stops = number_of_stops_to_union_sq + number_of_stops_from_union_sq

print total_number_of_stops

