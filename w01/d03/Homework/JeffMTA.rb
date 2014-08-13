begline = 0
begstop = 0

endline = 0
endstop = 0

totalstops = 0

#declaring variables as stated by the instructions, but was not needed

subway = {
	:N => ["Times_sq", "34th", "28th", "23rd", "Union_sq", "8th"],
	:"#{6}" => ["Grand_central", "33rd", "28th", "23rd", "Union_sq", "Astor_pl"],
	:L => ["8th", "6th", "Union_sq", "3rd", "1st"],
	:Q => ["Times_sq", "34th", "Union_sq", "Canal_st"]
}
#hash for subway lines

puts "The only lines in service today are:"
puts "The N Line: #{subway[:N]}"
puts "The 6 Line: #{subway[:"#{6}"]}"
puts "The L Line: #{subway[:L]}"
puts "The Q Line: #{subway[:Q]}"
#user sees whats lines are in service

puts "\nAre you starting on the N, 6, L, or Q line?"
begline = gets.chomp.capitalize.to_sym
#prompting user to choose a line

puts "\nWhere on the #{begline} are you now?"
begstop = gets.chomp.capitalize.to_sym
#prompting user to say where they are starting from

puts "\nAre you ending on the N, 6, L, or Q line?"
endline = gets.chomp.capitalize.to_sym
#prompting user to say where they are ending 


puts "\nWhere on the #{endline} are you going to?"
endstop = gets.chomp.capitalize.to_sym
#prompting user to say where they are going



def number_of_stops(line, startstop, endstop, subway_map)
	return (subway_map[line].index(startstop) - (subway_map[line].index(end_stop).abs
end

if begline == endline 
	totalstops = number_of_stops(begline, begstop, endstop, subway)
else
	first_leg = number_of_stops(begline, begstop, "Union_sq", subway)
	second_leg = number_of_stops(endline, endstop, "Union_sq", subway)
end 
## calling the method in this line
# referencing Union Sq as it is where everyone transfers to get to a new line
