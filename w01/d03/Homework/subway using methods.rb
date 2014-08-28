
puts "WELCOME TO MY SUBWAY TRIP CALCULATOR! w00t w00t!"
puts "Here are your transportation options:"
puts "The N train stops at: Times Square, 34th, W 28th, W 23rd, Union Square, and 8th St."
puts "The L train stops at: 8th Ave, 6th, Union Square, 3rd, and 1st."
puts "The Six train stops at: Grand Central, 33rd, E 28th, E 23rd, Union Square, and Astor Place."
puts "The Q train stops at: Times Square, Herald Square, Union Square, Canal St."

puts "Which line are you taking?"
	origin_line = gets.chomp.downcase.to_sym
puts "Which station are you starting at?"
	origin = gets.chomp
puts "On which line is your destination?"
	destination_line = gets.chomp.downcase.to_sym
puts "What's your final stop?"
	destination = gets.chomp


def stop_calculator(line, stop)
binding.pry	
	subway_system = {
	train_lines: {
	n: ["Times Square", "34th", "W 28th", "W 23rd", "Union Square", "8th St"], 
	l: ["8th Ave", "6th", "Union Square", "3rd", "1st"],
	six: ["Grand Central", "33rd", "E 28th", "E 23rd", "Union Square", "Astor Place"],
	q: ["Times Square", "Herald Square", "Union Square", "Canal St."]
	}}
	
	distance_from_union_square = ((subway_system[:train_lines][line].index("Union Square")) - subway_system[:train_lines][line].index(stop)).abs
	return distance_from_union_square
end

number_of_stops_to_union_sq = stop_calculator(origin_line, origin)

number_of_stops_from_union_sq = stop_calculator(destination_line, destination)

total_number_of_stops = (number_of_stops_to_union_sq + number_of_stops_from_union_sq)

puts "The length of your journey is: #{total_number_of_stops} stops." 



# # Jeff's solution: 
# if origin_line == destination_line
# # def stop_calculator(line, origin, destination, subway_lines)
# # 	return (subway_lines[line].index(origin) - subway_lines[line].index(destination).abs
# # else
# # totalstops = stop_calculator(origin_line, origin, destination, subway_lines)
# first_leg = stop_calculator(origin_line, origin, "Union Square", subway_lines)
# second_leg = stop_calculator(destination_line, destination, "Union Square", subway_lines)
# total_number_of_stops = first_leg + second_leg


