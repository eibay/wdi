# N = ["8th", "Union Squre", "23rd on N", "28th", "34th", "Times Square"]
# L = ["1st", "3rd", "Union Square", "6th", "8th"]
# 6 = ["Astor", "Union Square", "23rd", "28th", "33rd", "Grand Central"]

# subway = {
# 	N: ["8th", "Union Squre", "23rd on N", "28th", "34th", "Times Square"],
#     L: ["1st", "3rd", "Union Square", "6th", "8th"],
#     K: ["Astor", "Union Square", "23rd", "28th", "33rd", "Grand Central"]
# }

# starting_line = subway[:N]
# starting_stop = subway[:N][1]
# ending_line = subway[:N]
# ending_stop = subway[:N][5]

# the_number_of_stops = ending_line.index(ending_stop) - starting_line.index(starting_stop)

# puts the_number_of_stops


# subway = {
# 	N: ["8th", "Union Square", "23rd on N", "28th", "34th", "Times Square"],
#     L: ["1st", "3rd", "Union Square", "6th", "8th"],
#     Six: ["Astor", "Union Square", "23rd on N", "28th", "33rd", "Grand Central"],
#     Q: ["Times Square", "Herald Square", "Union Square", "Canal St"]
# }

# puts "Enter Stating Line"
# s_l = gets.chomp
# puts "Enter Starting Stop"
# s_s = gets.chomp.to_str
# puts "Enter Ending Line"
# e_l = gets.chomp
# puts "Enter Ending Stop"
# e_s = gets.chomp.to_str

# s_s_2 = subway[:"#{s_l}"].index("#{s_s}")
# e_s_2 = subway[:"#{e_l}"].index("#{e_s}")

# starting_line = subway[:"#{s_l}"]
# starting_stop = subway[:"#{s_l}"]["#{s_s_2}".to_i]
# ending_line = subway[:"#{e_l}"]
# ending_stop = subway[:"#{e_l}"]["#{e_s_2}".to_i]

# if starting_line.include?(ending_stop)
# 	the_number_of_stops = starting_line.index(starting_stop) - ending_line.index(ending_stop)
# 	puts "#{the_number_of_stops.abs} stops"
# 	elsif subway[:L].include?(ending_stop)
# 		stops_to_union_square = starting_line.index(starting_stop) - starting_line.index("Union Square")
# 		stops_from_union_square = subway[:L].index("Union Square") - ending_line.index(ending_stop)
# 		the_number_of_stops = stops_to_union_square.abs + stops_from_union_square.abs
# 		puts "#{the_number_of_stops.abs} stops"
# 	elsif subway[:Six].include?(ending_stop)
# 		stops_to_union_square = starting_line.index(starting_stop) - starting_line.index("Union Square")
# 		stops_from_union_square = subway[:Six].index("Union Square") - ending_line.index(ending_stop)
# 		the_number_of_stops = stops_to_union_square.abs + stops_from_union_square.abs
# 		puts "#{the_number_of_stops.abs} stops"
# 	elsif subway[:N].include?(ending_stop)
# 		stops_to_union_square = starting_line.index(starting_stop) - starting_line.index("Union Square")
# 		stops_from_union_square = subway[:N].index("Union Square") - ending_line.index(ending_stop)
# 		the_number_of_stops = stops_to_union_square.abs + stops_from_union_square.abs
# 		puts "#{the_number_of_stops.abs} stops"
# 	elsif subway[:Q].include?(ending_stop)
# 		stops_to_union_square = starting_line.index(starting_stop) - starting_line.index("Union Square")
# 		stops_from_union_square = subway[:Q].index("Union Square") - ending_line.index(ending_stop)
# 		the_number_of_stops = stops_to_union_square.abs + stops_from_union_square.abs
# 		puts "#{the_number_of_stops.abs} stops"
# end

# puts starting_line.index(starting_stop).abs
# puts starting_line.index("Union Square").abs

n = {
	"8th" => 1,
	"Union" => 0,
	"23rd on N" => 1,
	"28th" => 2,
	"34th" => 3,
	"42nd" => 4
}

six = {
	"6th" => 2,
	"Astor" => 1,
	"Union" => 0,
	"23rd" => 2,
	"28th" => 3,
	"33rd" => 4
}

l = {
	"1st" => 2,
	"3rd" => 1,
	"Union" => 0,
	"6th" => 1,
	"8th" => 2
}

puts "Enter Stating Line"
starting_line = gets.chomp
puts "Enter Starting Stop"
starting_stop = gets.chomp
puts "Enter Ending Line"
ending_line = gets.chomp
puts "Enter Ending Stop"
ending_stop = gets.chomp

	totalstops = starting_line[starting_stop.to_str].to_i + ending_line[ending_stop.to_str].to_i

puts totalstops









