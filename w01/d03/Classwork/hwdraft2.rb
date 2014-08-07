#DECLARATIONS

    points = {
      n: {
        stations: ["NTimesSquare", "N34", "N28", "N23", "US", "N8"]
      },
      l: {
        stations: ["L8", "L6", "US", "L3", "L1"]
      },
      six: {
        stations: ["SIXGrandCentral", "SIX33", "SIX28", "SIX23", "US", "SIXAstor"]
      }
    }


#INPUT
puts "Starting Line?"
starting_line = gets.chomp.upcase

puts "Ending Line?"
ending_line = gets.chomp.upcase.upcase

puts "Starting Stop"
starting_station = gets.chomp.upcase

puts "Ending Stop"
ending_station = gets.chomp.upcase

matching_element_starting = "#{starting_line}#{starting_station}" #composite data to match array elements
matching_element_ending = "#{ending_line}#{ending_station}" #composite data to match array elements

puts "Your route is the #{starting_line.upcase} train from #{starting_station} to #{ending_station} on the #{ending_line}"



#CONDITIONS
if starting_line == ending_line 
	distance = (n.index(matching_element_starting) - n.index(matching_element_ending)).abs    #need to make this go to n, or l, or six; nested?
	

end

else #lines different
	puts "Pay attention because you'll have to change trains" 
	
if starting_line != ending_line 
	distance = (n.index(matching_element_starting) - n.index(matching_element_ending)).abs 
	
	elsif starting_line != ending_line 
		distance = (l.index(matching_element_starting) - l.index(matching_element_ending)).abs 

		elsif starting_line != ending_line 
			distance = (six.index(matching_element_starting) - six.index(matching_element_ending)).abs 




#need to make the array to be used be selected based on user input; otherwise too unwieldy; if done here, can simplify rule 1; iterate?


	line1_distance = ((n.index(matching_element_starting) - n.index("US")).abs).to_i 
	line2_distance = (l.index("US").to_i - l.index(matching_element_ending ).to_i).abs.to_i



	distance = line1_distance + line2_distance 
end

puts "You will stop at #{distance} stations."





