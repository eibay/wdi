subway_lines = {:N => ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"], 
				:L => ["8th", "6th", "Union Square", "3rd", "1st"], 
				:Q => ["Times Square", "Herald Square", "Union Square", "Canal St."],
				:"6" => ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"]}
# I struggled with using 6 as a variable. 
# I know the => is outdated but for some reason this is the only way I could make "6" work as a symbol in the hash.

stops = 0
stops_line1 = 0
stops_line2 = 0

puts " "
puts "Which subway line are you starting on?"
subway_lines.each {|x, y| puts "#{x}"}
puts " "
starting_line = gets.chomp.to_sym

puts " "
puts "Which stop?"
subway_lines[starting_line].each {|x| puts "#{x}"}
puts " "
starting_stop = gets.chomp

puts " "
puts "Which line will you end up on?"
subway_lines.each {|x, y| puts "#{x}"}
puts " "
ending_line = gets.chomp.to_sym

puts " "
puts "Which stop?"
subway_lines[ending_line].each {|x| puts "#{x}"}
puts " "
ending_stop = gets.chomp

if starting_line == ending_line
	stops = (subway_lines[starting_line].index(starting_stop) - subway_lines[ending_line].index(ending_stop)).abs
else 
	stops_line1 = (subway_lines[starting_line].index(starting_stop) - subway_lines[starting_line].index("Union Square")).abs
	stops_line2 = (subway_lines[ending_line].index(ending_stop) - subway_lines[ending_line].index("Union Square")).abs
	stops = stops_line1 + stops_line2
end 

puts " "
puts "Your ride will be #{stops} stops long."