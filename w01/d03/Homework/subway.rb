



subway_system = 
{starting_line: {
	n: ["Times Square", "34th", "W 28th", "W 23rd", "Union Square", "8th St"], 
	l: ["8th Ave", "6th", "Union Square", "3rd", "1st"],
	six: ["Grand Central", "33rd", "E 28th", "E 23rd", "Union Square", "Astor Place"]
},
ending_line: {
	n: ["Times Square", "34th", "W 28th", "W 23rd", "Union Square", "8th St"], 
	l: ["8th Ave", "6th", "Union Square", "3rd", "1st"],
	six: ["Grand Central", "33rd", "E 28th", "E 23rd", "Union Square", "Astor Place"]
	}
}

puts "Which line are you taking?"
origin_line = gets.chomp.to_sym
puts "Which station are you starting at?"
origin = gets.chomp.to_s

number_of_stops_to_union_sq = ((subway_system[:starting_line][origin_line].index("Union Square")) - subway_system[:starting_line][origin_line].index(origin)).abs

puts = "On which line is your destination?"
destination_line = gets.chomp.to_sym
puts ="What's your final stop?"
destination = gets.chomp.to_s


number_of_stops_from_union_sq = ((subway_system[:ending_line][destination_line].index(destination)) - subway_system[:ending_line][destination_line].index("Union Square")).abs

total_number_of_stops = (number_of_stops_to_union_sq + number_of_stops_from_union_sq)

print total_number_of_stops

