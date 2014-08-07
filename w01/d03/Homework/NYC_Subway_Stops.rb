# MTA - The NYC Subway System
# There are 3 subway lines:
# The N line has the following stops: Times Square, 34th, 28th, 23rd, Union Square, and 8th
# The L line has the following stops: 8th, 6th, Union Square, 3rd, and 1st
# The 6 line has the following stops: Grand Central, 33rd, 28th, 23rd, Union Square, and Astor Place.
# All 3 subway lines intersect at Union Square, but there are NO other intersection points.
# The program uses the starting line and starting stop and the ending line and the ending stop to calculate the total number of stops.
# Declare these variables at the top of your ruby code.
# Get the program to work for a single line before trying to tackle multiple lines
# Make sure the stops that are the same for different lines have different names (i.e. 23rd on the N and on the 6 need to be differentiated)

# Part 1
# Diagram the lines by sketching out the subway lines and their stops and intersection.
# Write the algorithm out in plain English.
# What are the steps? How does the program flow?
# Use pen and paper or you can type it up

# Part 2
# Implement!

# Bonus
# Add the following line without making major modifications to your code:
# The Q line has the following stops: Times Square, Herald Square, Union Square, Canal St.
# Implement a user interface.

#what to initialize these as? for now whatever we choose.
# starting_line
# starting_stop
# ending_line
# ending_stop

# #as individual arrays
# n_line = ["N_Times Square", "N_34", "N_28", "N_23", "N_Union Square", "N_8"]
# six_line = ["S_Grand Central", "S_33", "S_28", "S_23", "S_Union Square", "S_Astor Place"]
# l_line = ["L_8", "L_6", "L_Union Square", "L_3", "L_1"]

#as Subway hash
#Subway = {N_line: ("N_Times Square", "N_34", "N_28", "N_23", "N_Union Square", "N_8")}

# another thought - could change the stops to variables and then write the real names
# as strings and assign them to these stop variables....

# Question Reference:
# 	n_line = ["N_Times Square", "N_34", "N_28", "N_23", "N_Union Square", "N_8"]

# question: how to return the item at a specific index number in an array?

# 	n_line[index position which we know] = item at this index number, for ex.
# 		n_line[0] => "N_Times Square"

# question: how to return the index number of an item in an array?
# 		n_line.index("item at this index number - which we know"), for ex.

# 		n_line.index("N_Times Square")=> 0

# item = order[index] #this gets the item at this index number in the order
# 	item_completion_time = menu[item] #for each 'item', lets FIND its value in menu
# 	total_completion_time = total_completion_time + item_completion_time

#for just one train line

# n_line = ["N_Times Square", "N_34", "N_28", "N_23", "N_Union Square", "N_8"]
# six_line = ["S_Grand Central", "S_33", "S_28", "S_23", "S_Union Square", "S_Astor Place"]
# l_line = ["L_8", "L_6", "L_Union Square", "L_3", "L_1"]


# CANT USE ABOVE VERSION WITH DIFFERENT 'union_squares' because we have to access union square
# across multiple lines

#SO USING THIS VERSION OF THE ARRAYS WITH "UNION SQUARE" IDENTICAL IN EACH ONE
#FOR SINGLE LEG TRIP (NO TRAIN CHANGES)
			# n_line = ["N_Times Square", "N_34", "N_28", "N_23", "Union Square", "N_8"]
			# six_line = ["S_Grand Central", "S_33", "S_28", "S_23", "Union Square", "S_Astor Place"]
			# l_line = ["L_8", "L_6", "Union Square", "L_3", "L_1"]


			# starting_line = n_line
			# starting_stop = "N_Times Square"

			# ending_line = n_line
			# ending_stop = "N_23"

			# total_num_stops = ending_line.index(ending_stop) - starting_line.index(starting_stop)
			# total_num_stops.abs

			# #alternate:
			# total_num_stops = (n_line.index(ending_stop) - n_line.index(starting_stop)).abs


### For multi-leg trip

	N = ["N_Times Square", "N_34", "N_28", "N_23", "Union Square", "N_8"]
	Six = ["S_Grand Central", "S_33", "S_28", "S_23", "Union Square", "S_Astor Place"]
	L = ["L_8", "L_6", "Union Square", "L_3", "L_1"]
	Q = ["Q_Times Square", "Q_Herald Square", "Union Square", "Q_Canal"]

	#if we declare the stops ourselves
	starting_line = Q
	starting_stop = "Q_Herald Square"

	ending_line = Six
	ending_stop = "S_33"

	#if we get this from the user instead of declaring it ourselves
	#I TRIED TO RUN THIS AND IT DIDN'T WORK, LISA ALSO HAD ISSUE W/THIS
	# puts "What train line are you starting on?"
	# puts "Train options are: N, Six, L, Q"
	# starting_line = gets.chomp
	# puts starting_line
	# puts "What train station are you starting at?"
		#puts "Train stops on this line are: #{starting_line}" 
		#if we wanted to use line above to tell them the train stops on this line, what could work?
		#can't just say the starting_line and expect it to return that array, because it returns gets chomp
		#is this where you would use a hash?
	# starting_stop = gets.chomp

	# puts "What train line are you ending on?"
	# puts "Train options are: N, Six, L, Q"
	# ending_line = gets.chomp
	# puts "What train station are you ending at?"
	# ending_stop = gets.chomp

if starting_line != ending_line
		leg_1 = starting_line.index(starting_stop) - starting_line.index("Union Square")
		#leg_1.abs #why doesn't this work? I get a negative number after adding the two legs together
		#maybe because addition code is just using the first instance of leg_1, which is the neg number
		#leg_1.abs! doesn't work either, confused b/c I thought this would override it
		leg_1 = leg_1.abs #why this works = it's explicit. '!' doesn't always work the way you think
		leg_2 = ending_line.index(ending_stop) - ending_line.index("Union Square") 
		leg_2 = leg_2.abs
		total_num_stops = leg_1 + leg_2
	else
		total_num_stops = starting_line.index(starting_stop) - ending_line.index(ending_stop)
		#total_num_stops.abs
		total_num_stops = total_num_stops.abs
end

puts "Your total number of trip stops is #{total_num_stops}."


#if I use a Hash (not sure if this is right)
#subway_lines[starting_line] ==> the entire array of the train line

#subway_lines[starting_line].index(starting_stop) ==> the starting stop on that train line

#stops = subway_lines[starting_line]



