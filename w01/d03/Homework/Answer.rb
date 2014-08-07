require 'pry'


# travel = {
# 	N:["34","28","23","union square","8"],
# 	Six:["grand central","33","28","23","union square","8"],
# 	L:["8", "6", "union square","3","1"],
# 	Q:["times square", "herald square", "union square", "canal street"]
# }

# answer=false 
# while answer == false
# 	puts "What line are you starting at?"
# 	starting_line = gets.chomp.capitalize.to_sym
# 	if travel.include?starting_line
# 	answer = true
# 	end

# end

# counter=false
# while counter == false
# 	puts "What stop are you starting at?"
# 		starting_stop = gets.chomp.downcase
# 	if travel[starting_line].include?starting_stop
# 	counter = true
# 	end

# end

# next_one=false
# while next_one == false
# 	puts "What line are you stopping at?"
# 	ending_line = gets.chomp.capitalize.to_sym
# 	if travel.include?ending_line
# 	next_one = true
# 	end
# end

# next_two=false

# while next_two == false
# 	puts "What stop are you stopping at?"
# 	ending_stop = gets.chomp.downcase
# 	if travel[ending_line].include?ending_stop
# 		next_two = true
# 	end
# end


# if starting_line==ending_line

# total_trip = travel[starting_line].index(starting_stop) - travel[ending_line].index(ending_stop)
# total_trip = total_trip.abs

# else

# 	Starting = travel[starting_line].index(starting_stop)
# 	to_union = travel[starting_line].index("union square")

# 	total_to_union = (to_union) - (Starting)

# 	end_continue = travel[ending_line].index(ending_stop)
# 	end_union = travel[ending_line].index("union square")

# 	total_end = (end_continue)-(end_union)
# 	total_trip = (total_end.abs)+(total_to_union.abs)

# end

# puts "Your total number of stops is #{total_trip}"





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
begline = gets.chomp.capitalize

puts "\nWhere on the #{begline} are you now?"
begstop = gets.chomp.capitalize


puts "\nAre you ending on the N, 6, L, or Q line?"
endline = gets.chomp.capitalize

puts "\nWhere on the #{endline} are you going to?"
endstop = gets.chomp.capitalize





# def calculation(subway, begline, begstop, endline, endstop)
def calculation(a, b, c, d, e) 
	#can use any variables 
	# travel_time = subway[begline.to_sym].index(begstop) - subway[endline.to_sym].index(endstop)
	f = (a[b.to_sym].index(c) - a[d.to_sym].index(e)).abs
	 return f 
	 binding.pry #wont work here cause after return the method stops reading!
	 #is what is used for output
	w = a + b + c + d # since after return-will not be recalled when calling calculation
end


 
 if begline==endline
	 distance=calculation(subway, begline, begstop, endline, endstop) #what you want the variables to equal
	puts distance


else 
	distance_a = calculation(subway, begline, "Union_sq", endline, endstop) 
	distance_b = calculation(subway, begline, begstop, endline, "Union_sq")
	total_distance = distance_a + distance_b
	puts total_distance
	
end






# if begline == endline 

# totalstops = (subway[begline.to_sym].index(begstop) - subway[endline.to_sym].index(endstop)).abs
#   #totalstops = hash[N or L etc, user input].to sym] .index ( user input)
#   # i call a key in the subway hash to find the associated value which is an array
#   # then i .index the array to find the associated index.

# else
# first_leg = (subway[begline.to_sym].index("Union_sq") - subway[begline.to_sym].index(begstop)).abs
# second_leg = (subway[endline.to_sym].index("Union_sq") - subway[endline.to_sym].index(endstop)).abs
# totalstops = first_leg + second_leg



# puts "You will ride a total of #{totalstops} stops"
# puts "\nWe are being held indefinitely because of train traffic ahead.."






