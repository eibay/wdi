subway_lines = {:N => ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"], 
				:L => ["8th", "6th", "Union Square", "3rd", "1st"], 
				:Q => ["Times Square", "Herald Square", "Union Square", "Canal St."],
				:"6" => ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"]}

puts "\nWhich subway line are you starting on?"
subway_lines.each {|x, y| puts "#{x}"}
starting_line = gets.chomp.to_sym

puts "\nWhich stop?"
subway_lines[starting_line].each {|x| puts "#{x}"}
starting_stop = gets.chomp

puts "\nWhich line will you end up on?"
subway_lines.each {|x, y| puts "#{x}"}
ending_line = gets.chomp.to_sym

puts "\nWhich stop?"
subway_lines[ending_line].each {|x| puts "#{x}"}
ending_stop = gets.chomp

def get_stops(lines, line, stop1, stop2)
	stops = (lines[line].index(stop1) - lines[line].index(stop2)).abs
	return stops
end

if starting_line == ending_line
	total_stops = get_stops(subway_lines, starting_line, starting_stop, ending_stop)
else 
	stops_line1 = get_stops(subway_lines, starting_line, starting_stop, "Union Square")
	stops_line2 = get_stops(subway_lines, ending_line, "Union Square", ending_stop)
	total_stops = stops_line1 + stops_line2
end 

puts "\nYour ride will be #{total_stops} stops long."