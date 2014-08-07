#!/usr/bin/ruby 

# uncomment to use pry for debugging 
# require 'pry'

# initialize the system
$subway = {
:N => ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"],
:"#{6}" => ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"],
:L => ["8th", "6th", "Union Square", "3rd", "1st"],
:Q => ["Times Square", "34th", "Union Square", "Canal Street"]
}

# describe the system to the user 
dscry = ["\nThe only lines in service today are:", 
	"The N Line:", 
	$subway[:N].join(" "), 
	"The 6 Line:", 
	$subway[:"#{6}"].join(" "), 
	"The L Line:", 
	$subway[:L].join(" "), 
	"The Q Line:", 
	$subway[:Q].join(" ")] 

puts dscry 

# get the user's input 
puts "\nAre you starting on the N, 6, L, or Q line?"
begline = gets.chomp
puts "\nWhere on the #{begline} are you now?"
begstop = gets.chomp
puts "\nAre you ending on the N, 6, L, or Q line?"
endline = gets.chomp
puts "\nWhere on the #{endline} are you going to?"
endstop = gets.chomp

# store the transfer station 
trns = "Union Square" 

# helper functions 
def get_stop l, s 
	# binding.pry 
	$subway[l.to_sym].index s 
end 

def diff a, b 
	# binding.pry 
	(a - b).abs 	
end 

# main logic  
def get_stops line1, stop1, line2, stop2
	# binding.pry 
	diff get_stop(line1, stop1), get_stop(line2, stop2) 
end 



# control structure 
if begline == endline 
	totalstops = get_stops(begline, begstop, endline, endstop) 
else 
	first_leg = get_stops begline, trns, begline, begstop  
	second_leg = get_stops endline, trns, endline, endstop  
	totalstops = first_leg + second_leg  
end 

# emit output 
puts "You will ride a total of #{totalstops} stops"
puts "\nWe are being held indefinitely because of train traffic ahead.."
