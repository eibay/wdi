require 'pry'

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


def meth(x,y)
	return (x + y).abs
end
				
binding.pry
if begline == endline 
a = (subway[begline.to_sym].index(begstop))

b = (subway[endline.to_sym].index(endstop))
totalstops = meth(a,b * -1)


else
c = (subway[begline.to_sym].index("Union_sq") - subway[begline.to_sym].index(begstop)).abs
d = (subway[endline.to_sym].index("Union_sq") - subway[endline.to_sym].index(endstop)).abs
totalstops = meth(c,d)

end
puts "You will ride a total of #{totalstops} stops"
puts "\nWe are being held indefinitely because of train traffic ahead.."


#----------OR-----------
# def calculation(subway, begline, begstop, endline, endstop)
# travel_time = subway[begline.to_sym].index(begstop) - subway[endline.to_sym].index(endstop)
# return travel_time
# end

# if begline==endline
# distance = calculation(subway, begline, begstop, endline, endstop)
# puts distance

# else 
# distance_a = calculation(subway, begline, "Union_sq", endline, endstop) 
# distance_b = calculation(subway, begline, begstop, endline, "Union_sq")
# total_distance = distance_a + distance_b
# puts total_distance

# end

# puts "You will ride a total of #{totalstops} stops"
# puts "\nWe are being held indefinitely because of train traffic ahead.."

