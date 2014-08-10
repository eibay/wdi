# set suits Unicode symbol to variable names 
spades, clubs, diamonds, hearts = "\u2660", "\u2663", "\u2666", "\u2665"
suits = [spades, clubs, diamonds, hearts]

class String 

	# ANSI color codes for strs to look like card suits 
	def red_suit
		"\033[1;31;47m" + self + "\033[m"
	end 

	def black_suit 
		"\033[0;30;47m" + self + "\033[0m"
	end 
end 


deck, i = [], 0 
suits.each do |suit|

	(2..10).each do |no|
		dsgn = "#{no} of #{suit}" 
		if i < 2
			deck << dsgn.black_suit
		else 
			deck << dsgn.red_suit
		end 
	end 
	['J', 'Q', 'K', 'A'].each do |face|
		dsgn = "#{face} of #{suit}"
		if i < 2
			deck << dsgn.black_suit
		else 
			deck << dsgn.red_suit
		end 
	end 
	i += 1 
end 