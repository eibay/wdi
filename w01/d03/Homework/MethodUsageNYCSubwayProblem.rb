require 'pry'

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
	return (subway_map[line].index(start_stop) - subway_map[line].index(end_stop)).abs
end

if begline == endline
binding.pry
totalstops = number_of_stops(begline, begstop, endstop, subway)

else
first_leg = number_of_stops(begline, begstop, "Union_sq", subway)
second_leg = number_of_stops(endline, endstop, "Union_sq", subway)
totalstops = first_leg + second_leg

end
puts "You will ride a total of #{totalstops} stops"
