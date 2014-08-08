subway_system = 
{train_lines: {
	n: ["Times Square", "34th", "W 28th", "W 23rd", "Union Square", "8th St"], 
	l: ["8th Ave", "6th", "Union Square", "3rd", "1st"],
	six: ["Grand Central", "33rd", "E 28th", "E 23rd", "Union Square", "Astor Place"],
	q: ["Times Square", "Herald Square", "Union Square", "Canal St."]
}}

puts "Here are your transportation options:"
puts "The N train stops at: Times Square, 34th, W 28th, W 23rd, Union Square, and 8th St."
puts "The L train stops at: 8th Ave, 6th, Union Square, 3rd, and 1st."
puts "The Six train stops at: Grand Central, 33rd, E 28th, E 23rd, Union Square, and Astor Place."
puts "The Q train stops at: Times Square, Herald Square, Union Square, Canal St."
puts "Which line are you taking?"
	origin_line = gets.chomp.downcase
puts "Which station are you starting at?"
	origin = gets.chomp
puts "On which line is your destination?"
	destination_line = gets.chomp.downcase
puts "What's your final stop?"
	destination = gets.chomp

number_of_stops_to_union_sq = ((subway_system[:train_lines][origin_line.to_sym].index("Union Square")) - subway_system[:train_lines][origin_line.to_sym].index(origin)).abs

number_of_stops_from_union_sq = (subway_system[:train_lines][destination_line.to_sym].index("Union Square")) - (subway_system[:train_lines][destination_line.to_sym].index(destination)).abs

total_number_of_stops = (number_of_stops_to_union_sq + number_of_stops_from_union_sq)

puts "The length of your journey is: #{total_number_of_stops} stops." 