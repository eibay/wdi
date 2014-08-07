require 'pry'

def calc_stop(start_line, start_stop, end_line, end_stop)
	subway = {
	:N => ["Times_sq", "34th", "28th", "23rd", "Union_sq", "8th"],
	:"#{6}" => ["Grand_central", "33rd", "28th", "23rd", "Union_sq", "Astor_pl"],
	:L => ["8th", "6th", "Union_sq", "3rd", "1st"],
	:Q => ["Times_sq", "34th", "Union_sq", "Canal_st"]
	}
	totalstops = (subway[start_line].index(start_stop) - subway[end_line].index(end_stop)).abs
end

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
begline = gets.chomp.capitalize.to_sym

puts "\nWhere on the #{begline} are you now?"
begstop = gets.chomp.capitalize


puts "\nAre you ending on the N, 6, L, or Q line?"
endline = gets.chomp.capitalize.to_sym

puts "\nWhere on the #{endline} are you going to?"
endstop = gets.chomp.capitalize

puts "------"
puts begline.class


# if begline == endline 

# # totalstops = (subway[begline.to_sym].index(begstop) - subway[endline.to_sym].index(endstop)).abs
# totalstops = calc_stop(begline.to_sym, )
#   #totalstops = hash[N or L etc, user input].to sym] .index ( user input)
#   # i call a key in the subway hash to find the associated value which is an array
#   # then i .index the array to find the associated index.

# else
# first_leg = (subway[begline.to_sym].index("Union_sq") - subway[begline.to_sym].index(begstop)).abs
# second_leg = (subway[endline.to_sym].index("Union_sq") - subway[endline.to_sym].index(endstop)).abs
# totalstops = first_leg + second_leg


if begline == endline
	total = calc_stop(begline, begstop, endline, endstop)
	puts total
else
	total = calc_stop(begline, begstop, begline, "Union_sq") + calc_stop(endline, "Union_sq", endline, endstop)
	puts total
end
binding.pry
# puts "You will ride a total of #{totalstops} stops"
# puts "\nWe are being held indefinitely because of train traffic ahead.."