require 'pry'

begline = 0
begstop = 0

endline = 0
endstop = 0

totalstops = 0



subway = {
:N => ["Times_sq", "34th", "28th", "23rd", "Union_sq", "8th"],
:"#{6}" => ["Grand_central", "33rd", "28th", "23rd", "Union_sq", "Astor_pl"],
#Formatting needed to make an integer a symbol - string interpolation #{integer}

:L => ["8th", "6th", "Union_sq", "3rd", "1st"],
:Q => ["Times_sq", "34th", "Union_sq", "Canal_st"]
}


puts " "
puts "The only lines in service today are:"
puts "The N Line: #{subway[:N]}"
puts "The 6 Line: #{subway[:"#{6}"]}"
puts "The L Line: #{subway[:L]}"
puts "The Q Line: #{subway[:Q]}"


puts "\nAre you starting on the N, 6, L, or Q line?"
begline = gets.chomp.capitalize.to_sym
#adding to_sym so that we can use it in our hash directly

#\n creates a new line before the text

puts "\nWhere on the #{begline} are you now?"
begstop = gets.chomp.capitalize


puts "\nAre you ending on the N, 6, L, or Q line?"
endline = gets.chomp.capitalize.to_sym

puts "\nWhere on the #{endline} are you going to?"
endstop = gets.chomp.capitalize


if begline == endline 

totalstops = (subway[begline.to_sym].index(begstop) - subway[endline.to_sym].index(endstop)).abs
#We use this hash setup: subway[begline.to_sym]

else
binding.pry
first_leg = (subway[begline.to_sym].index("Union_sq") - subway[begline.to_sym].index(begstop)).abs
		#We have to change begline TO SYMBOL because as a user input it is a string. But in our hash it's a symbol
		#Also - even if we used an array-the name of the array would be a variable. even a string and 
		#a variable can't match. A string is just a piece of information. A variable/hash point to something.

		#So we use: [begline.to_sym]

#binding.pry
second_leg = (subway[endline.to_sym].index("Union_sq") - subway[endline.to_sym].index(endstop)).abs
totalstops = first_leg + second_leg

end
puts "You will ride a total of #{totalstops} stops"



#METHOD WORK - TEACHER'S EXAMPLE

# def number_of_stops(subway, line, begstop, endstop)

# # def Subway_Ride(subway, line, ending_stop)
# # if begline !== endline
# # then line = begline

# return (subway[line].index(starting_stop) - subway[line].index(ending_stop))
# end


# #the part of the code this replaces = the if statement

# if begline == endline
# 	totalstops = number_of_stops(subway, begline, begstop, endstop)
# 	#we call the 'number_of_stops' method here (above)

# else
# 	first_leg = number_of_stops(begline, begstop, "Union_sq"#this stop is on beg line, so we can keep it a string)
# 	second_leg = number_of_stops(endline, endstop, "Union_sq")
# 	totalstops = first_leg + second_leg


#What i had
# totalstops = (subway[begline.to_sym].index(begstop) - subway[endline.to_sym].index(endstop)).abs
# return totalstops

# totalstops = (subway[begline.to_sym].index(begstop) - subway[endline.to_sym].index(endstop)).abs
# return totalstops

# "union square" = subway[endline.to_sym].index(ENDSTOP???)).abs

# first_leg = (subway[begline.to_sym].index(begstop) - subway[endline.to_sym].index(endstop)).abs


#starting_line = subway.key(starting_stop) 

#useful to put 'return' in the end of the method for it to put out something
#*** anything inside of the method needs to be sent in to the method

