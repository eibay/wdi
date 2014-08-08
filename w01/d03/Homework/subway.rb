require 'pry'

subway = {
	

	"N" => {
		"Times Square" => 4,
		"34th" => 3,
		"28th" => 2,
		"23rd" => 1,
		"Union Square" => 0,
		"8th" => -1
	},

	
	"6" => {
		"Grand Central" => 4,
		"33rd" => 3,
		"28th" => 2,
		"23rd" => 1,
		"Union Square" => 0,
		"Astor Place" => -1
	},

	
	"L" => {
		"1st" => 2,
		"3rd" => 1,
		"Union Square" => 0,
		"6th" => -1,
		"8th" => -2
	},

	"Q" => {
		"Times Square" => 2,
		"Herald Square" => 1,
		"Union Square" => 0,
		"Canal Street" => -1

	}


}


puts "Enter Start Line"
start_line = gets.chomp.capitalize.to_s

puts "Enter Start Stop"
start_stop = gets.chomp.capitalize.to_s

puts "Enter End Line"
end_line = gets.chomp.capitalize.to_s

if end_line	== start_line 
	puts "Enter End Stop"
	end_stop = gets.chomp.capitalize.to_s

	number_of_stops = subway[start_line][start_stop] - subway[end_line][end_stop]

	puts "You have #{number_of_stops.abs} stops."

else
	
	puts "Enter End Stop"
	end_stop = gets.chomp.to_s
binding.pry
	number_of_stops = (subway[start_line][start_stop]).abs + (subway[end_line][end_stop]).abs

	puts "You have #{number_of_stops} stops."

end



# ADRIAN CODE

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
#   #totalstops = hash[N or L etc, user input].to sym] .index ( user input)
#   # i call a key in the subway hash to find the associated value which is an array
#   # then i .index the array to find the associated index.

# else
# first_leg = (subway[begline.to_sym].index("Union_sq") - subway[begline.to_sym].index(begstop)).abs
# second_leg = (subway[endline.to_sym].index("Union_sq") - subway[endline.to_sym].index(endstop)).abs
# totalstops = first_leg + second_leg


# end
# puts "You will ride a total of #{totalstops} stops"
# puts "\nWe are being held indefinitely because of train traffic ahead.."



# subway = {
# :N => ["Times_sq", "34th", "28th", "23rd", "Union_sq", "8th"],
# :"#{6}" => ["Grand_central", "33rd", "28th", "23rd", "Union_sq", "Astor_pl"],
# :L => ["8th", "6th", "Union_sq", "3rd", "1st"],
# :Q => ["Times_sq", "34th", "Union_sq", "Canal_st"]
# }



# puts "Begin line?"
# begline = gets.chomp.capitalize

# puts "Begin stop?"
# begstop = gets.chomp.capitalize


# puts "End line?"
# endline = gets.chomp.capitalize

# puts "End Stop?"
# endstop = gets.chomp.capitalize



# how do i define subway[begline.to_sym].index(begstop)

#def number_of_stops()


# first_leg = stops()


# first_leg = begin(begline, begstop) - end(endline, endstop)

# puts first_leg.abs

# if begline != endline
# 	first_leg = stops(subway[begline.to_sym].index("Union_sq"), subway[begline.to_sym].index(begstop))
# 	second_leg = stops(subway[endline.to_sym].index("Union_sq"), subway[endline.to_sym].index(endstop))
# 	puts (first_leg + second_leg)

# else 
# 	first_leg = stops(subway[begline.to_sym].index(begstop), subway[endline.to_sym].index(endstop))
# 	puts first_leg
# end



















