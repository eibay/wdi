
require 'pry'


subway = {
:N => ["Times_sq", "34th", "28th", "23rd", "Union_sq", "8th"],
:"#{6}" => ["Grand_central", "33rd", "28th", "23rd", "Union_sq", "Astor_pl"],
:L => ["8th", "6th", "Union_sq", "3rd", "1st"],
:Q => ["Times_sq", "34th", "Union_sq", "Canal_st"]
}

puts "Are you starting on the N, 6, L, or Q line?"
begline = gets.chomp.capitalize.to_sym

puts "Where on the #{begline} are you now?"
begstop = gets.chomp.capitalize

puts "Are you ending on the N, 6, L, or Q line?"
endline = gets.chomp.capitalize.to_sym

puts "Where on the #{endline} are you going to?"
endstop = gets.chomp.capitalize


def number_of_stops(subway, line, stop_name_a, stop_name_b)
	stops = (subway[line].index(stop_name_a) - subway[line].index(stop_name_b)).abs
	return stops
end

if begline == endline
	stop_name_a = begstop
	stop_name_b = endstop
	totalstops = number_of_stops(subway, begline, stop_name_a, stop_name_b)

else
	stop_name_a = begstop
	stop_name_b = "Union_sq"
	first_leg = number_of_stops(subway, begline, stop_name_a, stop_name_b)

	stop_name_a = "Union_sq"
	stop_name_b = endstop
	second_leg = number_of_stops(subway, endline, stop_name_a, stop_name_b)

	totalstops = first_leg + second_leg
binding.pry

end
puts "You will ride a total of #{totalstops} stops"
puts "We are being held indefinitely because of train traffic ahead.."




# def number_of_stops(subway, line, stop_name_a, stop_name_b)
# 	stops = (subway[line.to_sym].index(stop_name_a) - subway[line.to_sym].index(stop_name_b)).abs
# 	return stops
# end

# if begline == endline
# 	line = begline
# 	stop_name_a = begstop
# 	stop_name_b = endstop
# 	totalstops = number_of_stops(subway, line, stop_name_a, stop_name_b)

# else
# 	line = begline
# 	stop_name_a = begstop
# 	stop_name_b = "Union_sq"
# 	first_leg = number_of_stops(subway, line, stop_name_a, stop_name_b)

# 	line = endline
# 	stop_name_a = "Union_sq"
# 	stop_name_b = endstop
# 	second_leg = number_of_stops(subway, line, stop_name_a, stop_name_b)

# 	totalstops = first_leg + second_leg

# end
# puts "You will ride a total of #{totalstops} stops"
# puts "We are being held indefinitely because of train traffic ahead.."













# puts "The only lines in service today are:"
# puts "The N Line: #{subway[:N]}"
# puts "The 6 Line: #{subway[:"#{6}"]}"
# puts "The L Line: #{subway[:L]}"
# puts "The Q Line: #{subway[:Q]}"
