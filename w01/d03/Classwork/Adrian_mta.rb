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

	return(subway_map[line].index(start_stop) - subway_map[line].index(end_stop)).abs
end

if begline == endline

	totalstops = number_of_stops(begline, begstop, endstop, subway)

else
	first_leg = number_of_stops(begline, begstop, "Union_sq", subway)
	second_leg = number_of_stops(endline, endstop, "Union_sq", subyway)

	totalstops = first_leg + second_leg






# def number_of_stops = (subyway, line, stop_name _a, stop_name_b)
#           stops = subway[line.to_sym].index(stop_name_a) - subway[line.to_sym].index(stop_name_b)).abs
# 		return stops
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




# totalstops = first_leg + second_leg


  #totalstops = hash[N or L etc, user input].to sym] .index ( user input)
  # i call a key in the subway hash to find the associated value which is an array
  # then i .index the array to find the associated index.


end
puts "You will ride a total of #{totalstops} stops"
puts "We are being held indefinitely because of train traffic ahead.."



# def add(a ,b)
# return a + b
# end

# def add(a, b)
# 	a + b
# 	return "hahaha"
# end

# 	sub (a, b)
# 	return a - b
#     number of stops = (a - b) + (b - c)


# subway = {
# :N => ["Times_sq", "34th", "28th", "23rd", "Union_sq", "8th"],
# :"#{6}" => ["Grand_central", "33rd", "28th", "23rd", "Union_sq", "Astor_pl"],
# :L => ["8th", "6th", "Union_sq", "3rd", "1st"],
# :Q => ["Times_sq", "34th", "Union_sq", "Canal_st"]
# }



# puts "\nThe only lines in service today are:"
# puts "The N Line: #{subway[:N]}"
# puts "The 6 Line: #{subway[:"#{6}"]}"
# puts "The L Line: #{subway[:L]}"
# puts "The Q Line: #{subway[:Q]}"


# puts "\nAre you starting on the N, 6, L, or Q line?"
# begline = gets.chomp.capitalize

# puts "\nWhere on the #{begline} are you now?"
# begstop = gets.chomp.capitalize


# puts "\nAre you ending on the N, 6, L, or Q line?"
# endline = gets.chomp.capitalize

# puts "\nWhere on the #{endline} are you going to?"
# endstop = gets.chomp.capitalize




# if begline == endline 

# totalstops = (subway[begline.to_sym].index(begstop) - subway[endline.to_sym].index(endstop)).abs
#   #totalstops = hash[N or L etc, user input].to sym] .index ( user input)
#   # i call a key in the subway hash to find the associated value which is an array
#   # then i .index the array to find the associated index.

# else
# first_leg = (subway[begline.to_sym].index("Union_sq") - subway[begline.to_sym].index(begstop)).abs
# second_leg = (subway[endline.to_sym].index("Union_sq") - subway[endline.to_sym].index(endstop)).abs
# totalstops = first_leg + second_leg


# end
# puts "You will ride a total of #{totalstops} stops"
# puts "\nWe are being held indefinitely because of train traffic ahead.."



#totalstops = (subway[begline.to_sym].index(begstop) - subway[endline.to_sym].index(endstop)).abs