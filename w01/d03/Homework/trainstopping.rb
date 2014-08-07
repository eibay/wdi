
begline = 0
begstop = 0

endline = 0
endstop = 0

totalstops = 0



subway = {
	:N => ["Times_sq", "34th", "28th", "23rd", "Union_sq", "8th"],
	:"#{6}" => ["Grand_central", "33rd", "28th", "23rd", "Union_sq", "Astor_pl"],
	:L => ["8th", "6th", "Union_sq", "3rd", "1st"]
}


puts " "
puts "The only lines in service today are:"
puts "The N Line: #{subway[:N]}"
puts "The 6 Line: #{subway[:"#{6}"]}"
puts "The L Line: #{subway[:L]}"


puts "\nAre you starting on the N, 6, or L line?"
begline = gets.chomp.capitalize

puts "\nWhere on the #{begline} are you now?"
begstop = gets.chomp.capitalize


puts "\nAre you ending on the N, 6, or L line?"
endline = gets.chomp.capitalize

puts "\nWhere on the #{endline} are you going to?"
endstop = gets.chomp.capitalize


### if single line ##

if begline == endline 

	totalstops = (subway[begline.to_sym].index(begstop) - subway[endline.to_sym].index(endstop)).abs

else
	first_leg = (subway[begline.to_sym].index("Union_sq") - subway[begline.to_sym].index(begstop)).abs
	puts first_leg
	second_leg = (subway[endline.to_sym].index("Union_sq") - subway[endline.to_sym].index(endstop)).abs
	puts second_leg
	totalstops = first_leg + second_leg

	
end
puts "You will ride a total of #{totalstops} stops"



##################################

# n - m the indices

# totalstops = 6_line.index["Times_sq"]

# menu = ["Soda", "Fries", "Milkshake", "Chicken Tenders", "Hot Dog", "Hamburger", "Chicken Sandwich", "Double Cheeseburger", "Pizza"]

# order = ["Soda", "Pizza", "Hamburger"]

# total_completion_time = 0

# # This index is used to loop through the order array
# order_index = 0

# while order_index < order.length
# 	item = order[order_index]
# 	item_completion_time = menu.index(item) + 1
# 	total_completion_time += item_completion_time

# 	puts total_completion_time	

# 	order_index += 1
# end

#