#DECLARATIONS
n = ["NTimesSquare", "N34", "N28", "N23", "UnionSquare", "N8"]
l = ["L8", "L6", "UnionSquare", "L3", "L1"]
six = ["SIXGrandCentral", "SIX33", "SIX28", "SIX23", "UnionSquare", "SIXAstorPlace"]

#INPUT
puts "Starting Line? (Type N, L or Six)"
starting_line = gets.chomp.upcase

puts "Ending Line? (Type N, L or Six)"
ending_line = gets.chomp.upcase.upcase

puts "Starting Stop (Type TimesSquare, 34, 28, 23, UnionSquare, 8, 6, 3, 1, GrandCentral, 33, AstorPlace)"
starting_station = gets.chomp.upcase

puts "Ending Stop (Type TimesSquare, 34, 28, 23, UnionSquare, 8, 6, 3, 1, GrandCentral, 33, AstorPlace)"
ending_station = gets.chomp.upcase

matching_element_starting = "#{starting_line}#{starting_station}" #composite data to match array elements
matching_element_ending = "#{ending_line}#{ending_station}" #composite data to match array elements

puts "Your route is the #{starting_line.upcase} train from #{starting_station} to #{ending_station} on the #{ending_line}"



#CONDITIONS
if starting_line == ending_line && starting_line == "N"
	distance = (n.index(matching_element_starting).to_i - n.index(matching_element_ending)).to_i.abs    #need to make this go to n, or l, or six; nested?
	
	elsif starting_line == ending_line && starting_line == "L"
		distance = (l.index(matching_element_starting).to_i - l.index(matching_element_ending)).to_i.abs 

		elsif starting_line == ending_line && starting_line == "SIX"
			distance = (six.index(matching_element_starting).to_i - six.index(matching_element_ending)).to_i.abs 
end
#----------------------------
# My attempts to get the multi-line trips counted aren't accurate and are super messy. Would like to know how to iterate through the multiple arrays
# to get indices for matches of response variables.

# case starting_line == "N"
# when ending_line == "L"
# 	line1_distance = ((n.index(matching_element_starting).to_i - n.index("US")).abs).to_i 
# 	line2_distance = (l.index("US").to_i - l.index(matching_element_ending ).to_i).abs.to_i
# when ending_line == "SIX"
# 	line1_distance = ((n.index(matching_element_starting).to_i - n.index("US")).abs).to_i 
# 	line2_distance = (six.index("US").to_i - six.index(matching_element_ending ).to_i).abs.to_i
# end

# case starting_line == "L"
# when ending_line == "N"
# 	line1_distance = ((l.index(matching_element_starting).to_i - l.index("US")).abs).to_i 
# 	line2_distance = (n.index("US").to_i - n.index(matching_element_ending ).to_i).abs.to_i
# when ending_line == "SIX"
# 	line1_distance = ((n.index(matching_element_starting).to_i - n.index("US")).abs).to_i 
# 	line2_distance = (six.index("US").to_i - six.index(matching_element_ending ).to_i).abs.to_i
# end

# case starting_line == "SIX"
# when ending_line == "L"
# 	line1_distance = ((n.index(matching_element_starting).to_i - n.index("US")).abs).to_i 
# 	line2_distance = (l.index("US").to_i - l.index(matching_element_ending ).to_i).abs.to_i
# when ending_line == "N"
# 	line1_distance = ((six.index(matching_element_starting).to_i - six.index("US")).abs).to_i 
# 	line2_distance = (n.index("US").to_i - n.index(matching_element_ending ).to_i).abs.to_i
# end



#distance = line1_distance + line2_distance 

	puts "Pay attention because you'll have to change trains" 
	



#-----------------------------
puts "You will stop at #{distance} stations."