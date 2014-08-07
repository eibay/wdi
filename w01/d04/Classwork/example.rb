# setup the system
$subway = {
:N => ["Times_sq", "34th", "28th", "23rd", "Union_sq", "8th"],
:"#{6}" => ["Grand_central", "33rd", "28th", "23rd", "Union_sq", "Astor_pl"],
:L => ["8th", "6th", "Union_sq", "3rd", "1st"],
:Q => ["Times_sq", "34th", "Union_sq", "Canal_st"]
}

# describe the system to the user 
puts "\nThe only lines in service today are:", "The N Line: #{$subway[:N]}", "The 6 Line: #{$subway[:"#{6}"]}", "The L Line: #{$subway[:L]}", "The Q Line: #{$subway[:Q]}"

# get the user's input 
puts "\nAre you starting on the N, 6, L, or Q line?"
begline = gets.chomp.capitalize
puts "\nWhere on the #{begline} are you now?"
begstop = gets.chomp.capitalize
puts "\nAre you ending on the N, 6, L, or Q line?"
endline = gets.chomp.capitalize
puts "\nWhere on the #{endline} are you going to?"
endstop = gets.chomp.capitalize

# store the transfer station 
trns = "Union_sq" 

# helper functions 
def get_stop l, s 
	$subway[l.to_sym].index s 
end 

def diff a, b 
	(a - b).abs 
end 

# main logic  
def get_stops line1, stop1, line2, stop2
	diff get_stop(line1, stop1), get_stop(line2, stop2)
end 

# control structure 
if begline == endline 
	totalstops = get_stops begline, begstop, endline, endstop 
else 
	first_leg = get_stops begline, trns, begline, begstop 
	second_leg = get_stops endline, trns, endline, endstop 
	totalstops = first_leg + second_leg 
end 

# emit output 
puts "You will ride a total of #{totalstops} stops"
puts "\nWe are being held indefinitely because of train traffic ahead.."
