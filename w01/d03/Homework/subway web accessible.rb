require 'socket'
server = TCPServer.new 2000
client = server.accept

client.puts "WELCOME TO MY SUBWAY TRIP CALCULATOR! w00t w00t!"
client.puts "Here are your transportation options:"
client.puts "The N train stops at: Times Square, 34th, W 28th, W 23rd, Union Square, and 8th St."
client.puts "The L train stops at: 8th Ave, 6th, Union Square, 3rd, and 1st."
client.puts "The Six train stops at: Grand Central, 33rd, E 28th, E 23rd, Union Square, and Astor Place."
client.puts "The Q train stops at: Times Square, Herald Square, Union Square, Canal St."

client.puts "Which line are you taking?"
	origin_line = client.gets.chomp.downcase.to_sym
client.puts "Which station are you starting at?"
	origin = client.gets.chomp
client.puts "On which line is your destination?"
	destination_line = client.gets.chomp.downcase.to_sym
client.puts "What's your final stop?"
	destination = client.gets.chomp


def stop_calculator(line, stop)
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

client.puts "The length of your journey is: #{total_number_of_stops} stops." 

client.close



