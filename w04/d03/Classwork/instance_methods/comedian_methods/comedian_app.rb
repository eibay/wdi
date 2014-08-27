require_relative './comedian.rb'
require 'pry'

inky = Comedian.new("Inky", 35, "So what's the deal with airline food...")
blinky = Comedian.new("Blinky", 35, "Why did the chicken cross the road?")
pinky = Comedian.new("Pinky", 36, "There are three guys at a bar...")
clyde = Comedian.new("Clyde", 37, "Wakka Wakka Wakka")

comedians = [inky, blinky, pinky, clyde]

comedians.each do |x|
	puts x.tell_joke
end


