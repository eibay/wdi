# use pry for debugging 
require 'pry'

# set suits Unicode symbol to variable names 
$spades, $clubs, $diamonds, $hearts = "\u2660", "\u2663", "\u2666", "\u2665"
$suits = [$spades, $clubs, $diamonds, $hearts]

class String 

	# ANSI color codes for strs to look like card suits 
	def red_suit
		"\033[1;31;47m" + self + "\033[0m"
	end

	def black_suit
		"\033[0;30;47m" + self + "\033[0m"
	end 
end 

# build the deck 
def mk_deck 
	deck = []
	$suits.each do |suit|
		(2..10).each do |no|
			card = "#{no} of #{suit}" 
			deck << card 
		end 
		['J', 'Q', 'K', 'A'].each do |face|
			card = "#{face} of #{suit}"
			deck << card 
		end 
	end 
	deck
end  

# test deck array 
$d = mk_deck 
# p $d 
# puts "Oh it's #{$d.length == 52}, the deck is #{$d.length}"  

class Array 

	def draw 
		self.shuffle!.pop
	end 

	def show_cards 
		puts self.collect { |c|
			suit = c[c.length-1] 
			if (suit == $hearts) || (suit == $diamonds)
				("the " + c).red_suit
			else 
				("the " + c).black_suit
			end 

		}.join(", ") + " (that's #{self.blkjak_values.sum})"
	end 

	def blkjak_values 
		self.collect { |c|
			val = c[0] 
			if val == 'J' || val == 'Q' || val == 'K'
				10 
			elsif val == 'A'
				1 
			else 
				c.to_i
			end 
		}
	end 

	def sum 
		self.inject(&:+)
	end 
end 

class Fixnum  
	def bust?
		self > 21 
	end 
end 

class Player
	attr_accessor :hand 
	def initialize 
		@hand = []
	end 

	def takes_turn 
		is_dealt_to
		@hand.show_cards 
		decides
		puts "Your score was... #{@hand.blkjak_values.sum}!\n\n" if !@hand.blkjak_values.sum.bust? 
		discards 
	end 

	def discards 
		@hand = [] 
	end 

	def hit 
		@hand << $d.draw 
		@hand.show_cards
		if !@hand.blkjak_values.sum.bust? 
			decides
		else
			puts "You went bust!\n\n"  
		end 
	end 

	def decides
		puts "hit or stay?" 
		dcsn = gets.chomp.downcase.delete '!.,?' 
		puts ''
		if dcsn == "hit" || dcsn == "hit me"
			hit 
		end 
	end 

	def is_dealt_to 
		2.times do
			@hand << $d.draw 
		end 
	end 
end 

plyr1 = Player.new
until $d.length.zero? 
	plyr1.takes_turn
end 
