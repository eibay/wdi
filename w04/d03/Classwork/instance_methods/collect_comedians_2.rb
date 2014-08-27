# ask user for first, last, email
# print to terminal all students (list all)
# repeat
require 'pry'
require_relative './comedian'

comedians = []

# ********* none of this  is here because I think it's supposed to be *********

mitch_info = { name: "mitch", age: "33", fav_joke: "A guy walks into a bar."}	
mitch = Comedian.new( mitch_info )

mo_info = { name: "mo", age: "44", fav_joke: "Knock knock."}
mo = Comedian.new( mo_info )

moms_info = { name: "moms", age: "88", fav_joke: "Ever notice how..."}
moms = Comedian.new( moms_info )

loop do


	comedians << comedian

	comedians.each do | x |
		x.putsInfo	
	end


end
