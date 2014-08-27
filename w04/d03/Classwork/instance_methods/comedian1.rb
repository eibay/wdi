require 'pry'
require_relative './comedian'


com1 = Comedian.new("Joe Blow", 8, "Why didn’t the lifeguard save the hippie? Because he was too far out man!")
com2 = Comedian.new("Big Whoop", 24 "What’s the best part about living in Switzerland? Not sure, but the flag is a big plus.")
com3 = Comedian.new("Shecky Green", 130, "Pampered cows produce spoiled milk.")

comedians = [ com1, com2, com3 ]

comedians.each do | com |
	com.tell_joke
end