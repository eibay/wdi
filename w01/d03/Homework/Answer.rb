travel = {
	N:["34","28","23","union square","8"],
	Six:["grand central","33","28","23","union square","8"],
	L:["8", "6", "union square","3","1"],
	Q:["times square", "herald square", "union square", "canal street"]
}

answer=false 
while answer == false
	puts "What line are you starting at?"
	starting_line = gets.chomp.capitalize.to_sym
	if travel.include?starting_line
	answer = true
	end

end

counter=false
while counter == false
	puts "What stop are you starting at?"
		starting_stop = gets.chomp.downcase
	if travel[starting_line].include?starting_stop
	counter = true
	end

end

next_one=false
while next_one == false
	puts "What line are you stopping at?"
	ending_line = gets.chomp.capitalize.to_sym
	if travel.include?ending_line
	next_one = true
	end
end

next_two=false

while next_two == false
	puts "What stop are you stopping at?"
	ending_stop = gets.chomp.downcase
	if travel[ending_line].include?ending_stop
		next_two = true
	end
end


if starting_line==ending_line
total_trip = travel[starting_line].index(starting_stop) - travel[ending_line].index(ending_stop)
total_trip = total_trip.abs

else

	Starting = travel[starting_line].index(starting_stop)
	to_union = travel[starting_line].index("union square")

	total_to_union = (to_union) - (Starting)

	end_continue = travel[ending_line].index(ending_stop)
	end_union = travel[ending_line].index("union square")

	total_end = (end_continue)-(end_union)
	total_trip = (total_end.abs)+(total_to_union.abs)

end

puts "Your total number of stops is #{total_trip}"









	

	




