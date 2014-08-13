subway = {
:N => ["Times_sq", "34th", "28th", "23rd", "Union_sq", "8th"],
:"#{6}" => ["Grand_central", "33rd", "28th", "23rd", "Union_sq", "Astor_pl"],
:L => ["8th", "6th", "Union_sq", "3rd", "1st"],
:Q => ["Times_sq", "34th", "Union_sq", "Canal_st"]
}


puts "\nThe only lines in service today are:"
puts "The N Line: #{subway[:N]}"
puts "The 6 Line: #{subway[:"#{6}"]}"
puts "The L Line: #{subway[:L]}"
puts "The Q Line: #{subway[:Q]}"


puts "\nAre you starting on the N, 6, L, or Q line?"
begline = gets.chomp.capitalize.to_sym

puts "\nWhere on the #{begline} are you now?"
begstop = gets.chomp.capitalize

puts "\nAre you ending on the N, 6, L, or Q line?"
endline = gets.chomp.capitalize.to_sym

puts "\nWhere on the #{endline} are you going to?"
endstop = gets.chomp.capitalize

def number_of_stops(line, start_stop, end_stop, subway_map)
  return ( subway_map[line].index(start_stop) - subway_map[line].index(end_stop) ).abs
end


if begline == endline 

  totalstops = number_of_stops(begline, begstop, endstop, subway)
# totalstops = (subway[begline.to_sym].index(begstop) - subway[endline.to_sym].index(endstop)).abs

else
  first_leg = number_of_stops(begline, begstop, "Union_sq", subway)
# first_leg = (subway[begline.to_sym].index("Union_sq") - subway[begline.to_sym].index(begstop)).abs
  second_leg = number_of_stops(endline, endstop, "Union_sq", subway)
# second_leg = (subway[endline.to_sym].index("Union_sq") - subway[endline.to_sym].index(endstop)).abs
  totalstops = first_leg + second_leg
end
puts "You will ride a total of #{totalstops} stops"
puts "\nWe are being held indefinitely because of train traffic ahead.."

# stops = {
# 	n: ["TS", "34", "N28", "N23", "US", "N8"],
# 	l: ["L8", "6", "US", "3", "1"],
# 	six: ["GC", "33", "628", "623", "US", "AP"]
# }

# # puts"\nThe only lines in service today are:"
# # puts "The N Line: #{subway[:n]}"
# # puts "The 6 Line: #{subway[:six]}"
# # puts "The L Line: #{subway[:l]}"

# puts "\nAre you starting on the N, 6, or L line?"
# starting_line = gets.chomp.to_sym

# puts "\nWhere on the #{starting_line} are you now?"
# starting_stop = gets.chomp


# puts "\nAre you ending on the N, 6, or L line?"
# ending_line= gets.chomp.to_sym

# puts "\nWhere on the #{ending_line} are you going to?"
# endstop = gets.chomp

# def total_stops(starting_line, starting_stop, endstop, stops)
# 	return ( stops[starting_line].index(starting_stop) - stops[ending_line].index(endstop) ).abs
# end


# if starting_line == ending_line

# 	output = total_stops(starting_line, starting_stop, endstop, stops)


# else
# 	first_leg = total_stops(starting_line, starting_stop, "US", stops) 

# 	second_leg = total_stops(ending_line, endstop, "US", stops)

# 	output = first_leg + second_leg
# end


# puts "you will ride a total of #{output} stops"



