subway = {
:N => ["Times_sq", "34th", "28th", "23rd", "Union_sq", "8th"],
:"#{6}" => ["Grand_central", "33rd", "28th", "23rd", "Union_sq", "Astor_pl"],
:L => ["8th", "6th", "Union_sq", "3rd", "1st"],
:Q => ["Times_sq", "34th", "Union_sq", "Canal_st"]
}

# puts "\nThe only lines in service today are:"
# puts "The N Line: #{subway[:N]}"
# puts "The 6 Line: #{subway[:"#{6}"]}"
# puts "The L Line: #{subway[:L]}"
# puts "The Q Line: #{subway[:Q]}"


puts "\nAre you starting on the N, 6, L, or Q line?"
begline = gets.chomp.capitalize

puts "\nWhere on the #{begline} are you now?"
begstop = gets.chomp.capitalize


puts "\nAre you ending on the N, 6, L, or Q line?"
endline = gets.chomp.capitalize

puts "\nWhere on the #{endline} are you going to?"
endstop = gets.chomp.capitalize



# def index_of_stop(subway_lines, line, stop)					#this is Jeff's example of method, the arg structure
# 	return subway_lines[line.to_sym].index(stop)			#
# end


# index_of_stop(subway, begline, begstop)						# then here is where you see what it looks to invoke;
# 															#and this is when it's made to correlate with your declared values 

def difference_bt_stops(subway_lines, line, startstop, endstop)
	return (subway_lines[line.to_sym].index(startstop) - subway_lines[line.to_sym].index(endstop)).abs
end

	# KEY: the method arguments (orange) are slots/framework, for the info that will be passed when invoked. Tells the variables where they need to be when you invoke.


totalstops = difference_bt_stops(subway, begline, begstop, endstop)
puts totalstops

	#or could use: 
	# => puts method(variables), i.e.,
	# => puts difference_bt_stops(subway, begline, begstop, endstop)



#if begline == endline 

#difference_bt_stops

#totalstops = (subway[begline.to_sym].index(begstop) - subway[endline.to_sym].index(endstop)).abs
  #totalstops = hash[N or L etc, user input].to sym] .index ( user input)
  # i call a key in the subway hash to find the associated value which is an array
  # then i .index the array to find the associated index.

#else


# first_leg = (subway[begline.to_sym].index("Union_sq") - subway[begline.to_sym].index(begstop)).abs
# second_leg = (subway[endline.to_sym].index("Union_sq") - subway[endline.to_sym].index(endstop)).abs
# totalstops = first_leg + second_leg


#end




puts "You will ride a total of #{totalstops} stops"
puts "\nWe are being held indefinitely because of train traffic ahead.."