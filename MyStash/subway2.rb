require "pry"

subway = {
:N => ["Times_sq", "34th", "28th", "23rd", "Union_sq", "8th"],
:"#{6}" => ["Grand_central", "33rd", "28th", "23rd", "Union_sq", "Astor_pl"],
:L => ["8th", "6th", "Union_sq", "3rd", "1st"],
:Q => ["Times_sq", "34th", "Union_sq", "Canal_st"]
}

# puts "\nThe only lines in service today are:"
# puts "The N Line: #{subway[:N]}"
# puts "The 6 Line: #{subway[:"#{6}"]}"
# puts "The L Line: #{subway[:L]}"
# puts "The Q Line: #{subway[:Q]}"


puts "\nAre you ending on the N, 6, L, or Q line?"
endline = gets.chomp.capitalize

puts "\nWhere on the #{endline} are you going to?"
endstop = gets.chomp.capitalize

puts "\nAre you starting on the N, 6, L, or Q line?"
begline = gets.chomp.capitalize

puts "\nWhere on the #{begline} are you now?"
begstop = gets.chomp.capitalize

binding.pry

def difference_bt_stops(subway_lines, line, startstop, endstop)
	return (subway_lines[line.to_sym].index(startstop) - subway_lines[line.to_sym].index(endstop)).abs
end

totalstops = difference_bt_stops(subway, begline, begstop, endstop)
puts totalstops


puts "You will ride a total of #{totalstops} stops"
puts "\nWe are being held indefinitely because of train traffic ahead.."