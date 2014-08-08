puts "What line are you starting from?"
starting_line = gets.chomp.to_sym

puts "What startion are you starting from?"
starting_station= gets.chomp

puts "what line are you end on?"
ending_line = gets.chomp.to_sym

puts "what stating are you ending on?"
ending_station = gets.chomp

MTA = {
	N: ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"],
	L: ["8th", "6th", "Union Square", "3rd", "1st"],
	Six: ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"],
	Q: ["Times Square", "Herald Square", "Union Square", "Canal St"]
	}

if starting_line == ending_line
	puts (MTA[starting_line].index("Union Square")  - MTA[starting_line].index(starting_station)).abs

else 

to_union_square = (MTA[starting_line].index("Union Square")  - MTA[starting_line].index(starting_station)).abs

from_union_square = (MTA[ending_line].index("Union Square") - MTA[ending_line].index(ending_station)).abs

puts (to_union_square.to_i + from_union_square.to_i)


