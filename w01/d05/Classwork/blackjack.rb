require 'socket' 
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
		return "You're empty-handed" if self.length.zero?  
		$screen.puts self.collect { |c| 
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

# thought must keep values of hand & scores safe & seperate 
# but, in fact, as it is, could use one var for everybody's hand 
class Player
	attr_accessor :hand, :scores  
	def initialize 
		@hand = []
		@scores = []
	end 

	# most of this is bogus blackjack
	# i doubt this recursion has any rightful place in this code 
	# but found my head hurting in that special way that lets me know 
	# "i have to do something recursive here"  
	def takes_turn 
		unless $d.length.zero? 
			is_dealt_to
			@hand.show_cards  
			decides
			@scores << @hand.blkjak_values.sum
			$screen.puts "Your score was... #{@hand.blkjak_values.sum}!", '', '' unless bust? 
			@scores << 0 if bust? 
			discards 
		end 
		$screen.puts "The game is over" if $d.length.zero? 
	end 

	def discards 
		@hand = []
	end 

	def bust?
		@hand.blkjak_values.sum > 21  
	end 

	def hit 
		unless $d.length.zero? 
			@hand << $d.draw 
			@hand.show_cards
			if !bust?  
				decides
			else
				$screen.puts "You went bust!", '', ''  
			end 
		end
		puts "Can't. There are no cards" if $d.length.zero? 
	end 

	def decides
		$screen.puts "hit or stay?" 
		dcsn = $screen.gets.chomp.downcase.delete '!.,?' 
		$screen.puts ''
		if dcsn == "hit" || dcsn == "hit me"
			hit 
		end 
	end 

	def is_dealt_to 
		if $d.length < 2 
			$screen.puts "Can't deal to you, deck is empty."
		else 
			2.times do
				@hand << $d.draw 
			end 
		end 
	end 
end 

# decide which computer's screen to send to by keeping 
# the 'TCPSocket objects' in an array $connecs 
# w/ the Kernel obj, loop thru these repeatedly
# host decides how many people are in the game 
# if that many cannot join, will be a problem
# & have to start over    
players, $connecs, limit = [], [Kernel], 0
players << Player.new
puts "How many players?"; limit = gets.to_i
puts "Waiting for players to connect..."

if limit > 1 
	$host = TCPServer.new 1999
	until players.length == limit
		$connecs << $host.accept
		players << Player.new 
	end
end 


until $d.length.zero?
	$t = 0 
	players.each do |player|
		$screen = $connecs[$t]
		$screen.puts "It's your turn!"
		player.takes_turn
		$t += 1 
	end 
	players.each_with_index do |player, n|
		$connecs.each do |screen|
			screen.puts "Player ##{n+1}'s score was #{player.scores.last}"
		end 
	end 
	$connecs.each do |screen|
		screen.puts "Next round!" unless $d.length < 2  
	end 
end 

totals = []

players.each do |player|
	totals << player.scores.sum 
end 

# tells only the player who won they won 
$connecs[totals.index(totals.max)].puts "You win!"



