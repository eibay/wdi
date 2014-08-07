stops = {
	n: ["TS", "34", "N28", "N23", "US", "N8"],
	l: ["L8", "6", "US", "3", "1"],
	six: ["GC", "33", "628", "623", "US", "AP"]
}

puts"\nThe only lines in service today are:"
puts "The N Line: #{subway[:n]}"
puts "The 6 Line: #{subway[:six]}"
puts "The L Line: #{subway[:l]}"

puts "\nAre you starting on the N, 6, or L line?"
starting_line = gets.chomp.capitalize

puts "\nWhere on the #{starting_line} are you now?"
starting_stop = gets.chomp.capitalize


puts "\nAre you ending on the N, 6, or L, line?"
ending_line= gets.chomp.capitalize

puts "\nWhere on the #{ending_line} are you going to?"
ending_stop = gets.chomp.capitalize



#Adrian 
totalstops = (subway[begline.to_sym].index(begstop) - subway[endline.to_sym].index(endstop)).abs
  #totalstops = hash[N or L etc, user input].to sym] .index ( user input)
  # i call a key in the subway hash to find the associated value which is an array
  # then i .index the array to find the associated index.

else
first_leg = (subway[begline.to_sym].index("Union_sq") - subway[begline.to_sym].index(begstop)).abs
second_leg = (subway[endline.to_sym].index("Union_sq") - subway[endline.to_sym].index(endstop)).abs
totalstops = first_leg + second_leg


end
puts "You will ride a total of #{totalstops} stops"
puts "\nWe are being held indefinitely because of train traffic ahead.."

#Adrian end



starting_line= "N"
starting_stop= "TS"
ending_line= "N"
ending_stop= "N23"


n = ["TS", "34", "N28", "N23", "US", "N8"]

number_stops = n.index(starting_stop) - n.index(ending_stop)

puts number_stops.abs



